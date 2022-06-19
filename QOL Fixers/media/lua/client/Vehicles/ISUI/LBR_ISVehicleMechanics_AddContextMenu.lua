require "Vehicles/ISUI/ISVehicleMechanics"

local old_ISVehicleMechanics_doPartContextMenu = ISVehicleMechanics.doPartContextMenu

function ISVehicleMechanics:doPartContextMenu(part, x,y)
	-- TEST
	-- Everything needed to have a recipe to repair the vehicle GloveBox is in vanilla, but the vanilla vehicle templates don't 
	--   mark the GloveBox as repairable. The following line will programatically mark a GloveBox as repairable in a non-permanent 
	--   way. This allows for GloveBoxes to be repaired successfully. However, this may or may not be the best way to enable 
	--   repairs for the GloveBox. So I am leaving it commented out for now.
	--if part:getId() == "GloveBox" and not part:getScriptPart():isRepairMechanic() then part:getScriptPart():setRepairMechanic(true) end

	-- Call the old version of this function to handle other actions and items. Note that we must call this before we do our 
	--   code because the vanilla version of this function handles creating the context menu and has no code to handle the case 
	--   where we create the context menu instead. So it will always destroy our context menu and create a new one. So we 
	--   have the old version of this function create the context menu, and then we add to that.
	old_ISVehicleMechanics_doPartContextMenu(self, part, x, y)
	
	-- If the game is paused we should skip creating our context menu
	if UIManager.getSpeedControls():getCurrentGameSpeed() == 0 then return end
	
	-- It's most likely that the old version of this function has already created an instance of the context menu, but for robustness 
	--   we should check to ensure it exists, and if it doesn't we create a new one.
	local playerObj = getSpecificPlayer(self.playerNum)
	if not self.context then self.context = ISContextMenu.get(self.playerNum, x + self:getAbsoluteX(), y + self:getAbsoluteY()) end
	
	local option

	-- Add the option for repairing the lightbar to the context menu.

	-- Conditions:

	if part:getId() == "lightbar" then
		-- Get the Mechanics skill level that is required to perform engine repair actions on this vehicle type and interpret that 
		--   as the Electricity skill level that will be required to repair the lightbar. We do this so we keep things simple and 
		--   don't have to worry about adding additional information to vehicle scripts to support different skill levels for 
		--   different vehicle types.
		-- Set the maximum skill level needed for repairs where condition > 0 at 6. We set the maximum skill level needed to repair the lightbar from condition 0 
		--   to be 7, so the skill level needed for all other repairs should be lower than that.
		local requiredSkillLevel = 3
		local currentCondition = part:getCondition()

		local requiredParts = { ["Base.ElectronicsScrap"] = 30, ["Base.LightBulb"] = 2}


		local targetCondition = math.min(100, currentCondition + 50)
		
		local allPartsPresent = true
		
		for neededPart,numberNeeded in pairs(requiredParts) do
			if self.chr:getInventory():getNumberOfItem(neededPart, false, true) < numberNeeded then
				allPartsPresent = false
				break
			end
		end
		

		if currentCondition < 100 and allPartsPresent and self.chr:getPerkLevel(Perks.Electricity) >= requiredSkillLevel and self.chr:getInventory():contains("Screwdriver") then
			option = self.context:addOption(getText("ContextMenu_Repair"), playerObj, ISVehicleMechanics.LBR_onRepairLightbar, part, requiredParts, targetCondition, requiredSkillLevel)
			self:LBR_doMenuTooltip(part, option, "LBR_repairlightbar", requiredParts, requiredSkillLevel, targetCondition)
		else
			option = self.context:addOption(getText("ContextMenu_Repair"), nil, nil)
			option.notAvailable = true
			self:LBR_doMenuTooltip(part, option, "LBR_repairlightbar", requiredParts, requiredSkillLevel, targetCondition)
		end
	end
	
	-- Since the old version of this function may have set the context menu to not be visible we must handle the case where 
	--   we have added an option to the menu and now have to make the menu visible.
	if self.context.numOptions == 1 then
		self.context:setVisible(false)
	else
		self.context:setVisible(true)
	end
	
	if JoypadState.players[self.playerNum+1] and self.context:getIsVisible() then
		self.context.mouseOver = 1
		self.context.origin = self
		JoypadState.players[self.playerNum+1].focus = self.context
		updateJoypadFocus(JoypadState.players[self.playerNum+1])
	end
end

function ISVehicleMechanics:LBR_doMenuTooltip(part, option, lua, requiredParts, requiredSkillLevel, targetCondition)
	local vehicle = part:getVehicle()
	local tooltip = ISToolTip:new()
	tooltip:initialise()
	tooltip:setVisible(false)
	tooltip.description = getText("Tooltip_craft_Needs") .. " : <LINE>"
	option.toolTip = tooltip
	local keyvalues = part:getTable(lua)

	-- Repair lightbar tooltip
	if lua == "LBR_repairlightbar" then
		local rgb = " <RGB:1,1,1>"
		local addedTxt = ""
		
		if self.chr:getPerkLevel(Perks.Electricity) < requiredSkillLevel then
			rgb = " <RGB:1,0,0>"
		end
		tooltip.description = tooltip.description .. rgb .. getText("IGUI_perks_Electricity") .. " " .. self.chr:getPerkLevel(Perks.Electricity) .. "/" .. requiredSkillLevel .. " <LINE>"
		rgb = " <RGB:1,1,1>"
		
		local item = InventoryItemFactory.CreateItem("Base.Screwdriver")
		if not self.chr:getInventory():contains("Screwdriver") then
			tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. item:getDisplayName() .. " 0/1 <LINE>"
		else
			tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. item:getDisplayName() .. " 1/1 <LINE>"
		end

		for neededPart,numberNeeded in pairs(requiredParts) do
			local item = InventoryItemFactory.CreateItem(neededPart)
			local numberOfPart = self.chr:getInventory():getNumberOfItem(neededPart, false, true)

			if numberNeeded > 0 then
				if numberOfPart < numberNeeded then
					tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. item:getDisplayName() .. " " .. numberOfPart .. "/" .. numberNeeded .. " <LINE>"
				else
					tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. item:getDisplayName() .. " " .. numberOfPart .. "/" .. numberNeeded .. " <LINE>"
				end
			end
		end
	end
end

function ISVehicleMechanics.LBR_onRepairLightbar(playerObj, part, requiredParts, targetCondition, requiredSkillLevel)
	if playerObj:getVehicle() then
		ISVehicleMenu.onExit(playerObj)
	end
	
	local typeToItem = VehicleUtils.getItems(playerObj:getPlayerNum())
	local item = typeToItem["Base.Screwdriver"][1]
	ISVehiclePartMenu.toPlayerInventory(playerObj, item)

	local timeToRepair = math.max(50, 170 - math.max(0, (10 * (playerObj:getPerkLevel(Perks.Electricity) - requiredSkillLevel))))
	
	-- Have the character walk to the vehicle's driver door
	ISTimedActionQueue.add(ISPathFindAction:pathToVehicleArea(playerObj, part:getVehicle(), "SeatFrontLeft"))


--[[

	************************************************************************************************************************************ 
		The below code adds some additional animation to have the player character get into the vehicle to turn off the lightbar 
		   if it is on when beginning to repair it. This introduces a lot of potential edge cases of trying to determine which 
		   door the player can open to enter the vehicle. This is a fun exercise to learn more about PZ modding, but it's getting more 
		   complex than may be warranted for an "easy" vehicle repair mod. So I'll leave it commented out for the time being 
		   and possibly revisit it in the future. If you are reading this and would like to use this additional animation code 
		   be aware that it works if the driver's door can be opened by the player, but will potentially cause issues if the 
		   driver's door can not be unlocked (e.g. that door's lock is broken). It will also only attempt to have the player enter 
		   the driver's door. If that door is locked, but another door is unlocked it will not attempt to enter through that other 
		   door, it will simply try to open the driver's door, fail, and end the repair attempt.
	************************************************************************************************************************************ 
--]]

--[[		   
	-- If the lightbar is turned on, turn it off before beginning the repair
	if (part:getVehicle():getLightbarLightsMode() ~= 0) or (part:getVehicle():getLightbarSirenMode() ~= 0) then
		local vehicleDoorPart = part:getVehicle():getPartById("DoorFrontLeft")
		local vehicleDoor = nil
		
		if vehicleDoorPart then vehicleDoor = vehicleDoorPart:getDoor() end
		
		-- If the door is locked, attempt to unlock it. If the player is unable to unlock the door, then the door will remain locked.
		if vehicleDoor and vehicleDoor:isLocked() then
			ISTimedActionQueue.add(ISUnlockVehicleDoor:new(playerObj, vehicleDoorPart, nil))
		end
		
		-- If the door is unlocked, then enter the vehicle, turn off the lightbar, get back out, and then perform the repair. If the 
		--   door is locked then we stop here and do nothing further (the repair will not take place).
		if not vehicleDoor:isLocked() then
			-- Have the character enter the driver's seat
			ISTimedActionQueue.add(ISOpenVehicleDoor:new(playerObj, part:getVehicle(), vehicleDoorPart))
			ISTimedActionQueue.add(ISEnterVehicle:new(playerObj, part:getVehicle(), 0))
				
			-- Turn off the lightbar
			ISTimedActionQueue.add(LBRTurnOffLightbar:new(playerObj), false, vehicle)
		
			-- Have the character exit the vehicle
			--ISTimedActionQueue.add(ISOpenVehicleDoor:new(playerObj, part:getVehicle(), part:getVehicle():getPartById("DoorFrontLeft")))
			ISTimedActionQueue.add(ISExitVehicle:new(playerObj))
		
			
			-- Queue our custom TimedAction to repair the lightbar
			ISTimedActionQueue.add(LBRRepairLightbar:new(playerObj, part, item, timeToRepair, repairBlocks, requiredParts, targetCondition))
		end
		
		-- Return here just in case the commented out animation code becomes uncommented
		return
	end
--]]


		local timeToRepair = math.max(50, 170 - math.max(0, (10 * (playerObj:getPerkLevel(Perks.Electricity) - requiredSkillLevel))))

	if (part:getVehicle():getLightbarLightsMode() ~= 0) or (part:getVehicle():getLightbarSirenMode() ~= 0) then
		-- Turn off the lightbar from outside of the vehicle
		ISTimedActionQueue.add(LBRTurnOffLightbar:new(playerObj, true, part:getVehicle():getId()))
	end
		
	-- Queue our custom TimedAction to repair the lightbar
	ISTimedActionQueue.add(LBRRepairLightbar:new(playerObj, part, item, timeToRepair, requiredParts, targetCondition))
end