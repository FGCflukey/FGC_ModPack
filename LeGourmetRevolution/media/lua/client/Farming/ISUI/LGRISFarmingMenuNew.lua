require "Farming/ISUI/ISFarmingMenu"
ISFarmingMenu.GardeningSprayAphids = nil;
ISFarmingMenu.Compost = nil;

local function predicateDrainableUsesInt2(item, count)
	return item:getDrainableUsesInt() >= count
end

ISFarmingMenu.doFarmingMenu2 = function(player, context, worldobjects, test)
	local playerObj = getSpecificPlayer(player)
	local playerInv = playerObj:getInventory()

	ISFarmingMenu.GardeningSprayMilk = nil;
	ISFarmingMenu.GardeningSprayCigarettes = nil;
	ISFarmingMenu.GardeningSprayAphids = nil;
	ISFarmingMenu.Compost = nil;

	local fertilizer = false;
	local shovel = ISFarmingMenu.getShovel(playerObj)
	local handItem = playerObj:getPrimaryHandItem();
	local canSeed = false;
	local canWater = false;
	local cureMildew = false;
	local cureFlies = false;
	local cureAphids = false;
	local info = false;
	local canHarvest = false;
    local sq = nil;
    local player = playerObj;
	local currentPlant = nil;
	for i,v in ipairs(worldobjects) do
		local plant = CFarmingSystem.instance:getLuaObjectOnSquare(v:getSquare())
		if plant then
			if playerInv:containsTypeRecurse("CompostBag") or playerInv:containsTypeRecurse("Fertilizer") then -- fertilizer
				fertilizer = true;
			end
			if plant.state == "plow" then -- sow seed
				canSeed = true;
			end
			if plant.state == "seeded" then -- water the plant
				canWater = true;
			end
			if plant.state ~= "plow" then -- info
				info = true;
			end
			-- disease
			if plant.mildewLvl > 0 then -- mildew
				cureMildew = true;
			end
			if plant.fliesLvl > 0 then -- flies
				cureFlies = true;
			end
			if plant.aphidLvl > 0 then -- aphids
				cureAphids = true;
			end
			-- harvest
			if plant:canHarvest() then
				canHarvest = true;
			end
			currentPlant = plant
			sq = v:getSquare();
			break
		end
	end

    if not JoypadState.players[player:getPlayerNum()+1] and ISFarmingMenu.canDigHere(worldobjects) and not player:getVehicle() then
        if shovel then
            if test then return ISWorldObjectContextMenu.setTest() end
            context:addOption(getText("ContextMenu_Dig"), worldobjects, ISFarmingMenu.onPlow, player, shovel);
        else
            if(not player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):HasInjury() and not player:getBodyDamage():getBodyPart(BodyPartType.Hand_R):HasInjury()) then
                if test then return ISWorldObjectContextMenu.setTest() end
                local option = context:addOption(getText("ContextMenu_DigWithHands"), worldobjects, ISFarmingMenu.onPlow, player, nil)
                local tooltip = ISWorldObjectContextMenu.addToolTip();
                tooltip.description = getText("ContextMenu_DigWithHandsTT");
                option.toolTip = tooltip;
            else
                if test then return ISWorldObjectContextMenu.setTest() end
                local option = context:addOption(getText("ContextMenu_DigWithHands"), worldobjects, ISFarmingMenu.onPlow, player, nil)
                option.notAvailable = true;
                local tooltip = ISWorldObjectContextMenu.addToolTip();
                tooltip.description = getText("ContextMenu_DamagedHands");
                option.toolTip = tooltip;
            end
        end
    end

	if fertilizer then
		--player:Say("Fertilizer OK")
		if (not handItem or handItem:getType() ~= "CompostBag" or (handItem:getDrainableUsesInt() == 0)) or 
		   (not handItem or handItem:getType() ~= "Fertilizer" or (handItem:getDrainableUsesInt() == 0)) then
			if playerInv:containsTypeRecurse("CompostBag") then
				ISFarmingMenu.Compost = playerInv:getFirstTypeEvalArgRecurse("CompostBag", predicateDrainableUsesInt2, 1)
			else
				ISFarmingMenu.Compost = playerInv:getFirstTypeEvalArgRecurse("Fertilizer", predicateDrainableUsesInt2, 1)
			end
			--player:Say("Compost Search OK")
		else
			ISFarmingMenu.Compost = handItem;
		end
		if test then return ISWorldObjectContextMenu.setTest() end
		--player:Say(tostring(ISFarmingMenu.Compost))
		if ISFarmingMenu.Compost then
			local use = ISFarmingMenu.Compost:getDrainableUsesInt()
			if use > 0 then
				context:addOption(getText("ContextMenu_Fertilize"), worldobjects, ISFarmingMenu.onFertilize, handItem, currentPlant, sq, player);
			end
		end
	end
	if shovel and currentPlant then
		if test then return ISWorldObjectContextMenu.setTest() end
        context:addOption(getText("ContextMenu_Remove"), worldobjects, ISFarmingMenu.onShovel, currentPlant, player, sq);
    end
	if info then
		if test then return ISWorldObjectContextMenu.setTest() end
		context:addOption(getText("ContextMenu_Info"), worldobjects, ISFarmingMenu.onInfo, currentPlant, sq, player);
	end
	if canHarvest then
		if test then return ISWorldObjectContextMenu.setTest() end
		context:addOption(getText("ContextMenu_Harvest"), worldobjects, ISFarmingMenu.onHarvest, currentPlant, sq, player);
	end
	-- plant seed subMenu
	if canSeed then
		if test then return ISWorldObjectContextMenu.setTest() end
		ISFarmingMenu.doSeedMenu(context, currentPlant, sq, player)
	end
	-- water your plant
	if canWater and currentPlant.waterLvl < 100 then
		local waterSources = {}
		if handItem and handItem:isWaterSource() and math.floor(handItem:getUsedDelta()/handItem:getUseDelta()) > 0 then
			table.insert(waterSources, handItem)
		else
			for i = 0, playerInv:getItems():size() - 1 do
				local item = playerInv:getItems():get(i);
				if item:isWaterSource() and math.floor(item:getUsedDelta()/item:getUseDelta()) > 0 then
					table.insert(waterSources, item)
				end
			end
		end
		-- we get how many use we can do on our item
		if #waterSources > 0 then
			if test then return ISWorldObjectContextMenu.setTest() end
			local waterOption = context:addOption(getText("ContextMenu_Water"), worldobjects, nil);
			local subMenuWater = context
			if #waterSources > 1 then
				subMenuWater = context:getNew(context);
				context:addSubMenu(waterOption, subMenuWater);
				table.sort(waterSources, ISFarmingMenu.itemSortByName)
			end
			for index,handItem in ipairs(waterSources) do
				local use = math.floor(handItem:getUsedDelta()/handItem:getUseDelta());
				-- prepare subMenu for water (we make a submenu for every lvl 5 by 5)
				local subMenu = context:getNew(subMenuWater);
				-- if waterLvl missing is below the max use of the water plant (so we can't have the option for 40 water if the plant have 80)
				local missingWaterUse = math.ceil((100 - currentPlant.waterLvl) / 5);
				if missingWaterUse < use then
					use = missingWaterUse;
				end
				subMenu:addOption(getText("ContextMenu_Full", use * 5), worldobjects, ISFarmingMenu.onWater, use, handItem, player, currentPlant, sq);
				if use > 10 then
					use = 10
				else
					use = use - 1
				end
				for i=use,1,-1 do
					subMenu:addOption(tostring(i * 5), worldobjects, ISFarmingMenu.onWater, i, handItem, player, currentPlant, sq);
				end
				if #waterSources > 1 then
					waterOption = subMenuWater:addOption(handItem:getName(), worldobjects, nil);
				end
				-- we add the subMenu to our current option (Water)
				context:addSubMenu(waterOption, subMenu);
			end
		end
	end
	-- disease
	if cureMildew or cureFlies or cureAphids then
		-- we try to get the cure for mildew
		if not handItem or handItem:getType() ~= "GardeningSprayMilk" or (handItem:getDrainableUsesInt() == 0) then
			ISFarmingMenu.GardeningSprayMilk = playerInv:getFirstTypeEvalArgRecurse("GardeningSprayMilk", predicateDrainableUsesInt2, 1)
		else
			ISFarmingMenu.GardeningSprayMilk = handItem;
		end
		-- we try to get the cure for flies
		if not handItem or handItem:getType() ~= "GardeningSprayCigarettes" or (handItem:getDrainableUsesInt() == 0) then
			ISFarmingMenu.GardeningSprayCigarettes = playerInv:getFirstTypeEvalArgRecurse("GardeningSprayCigarettes", predicateDrainableUsesInt2, 1)
		else
			ISFarmingMenu.GardeningSprayCigarettes = handItem;
		end
		-- we try to get the cure for aphids
		if not handItem or handItem:getType() ~= "GardeningSprayAphids" or (handItem:getDrainableUsesInt() == 0) then
			ISFarmingMenu.GardeningSprayAphids = playerInv:getFirstTypeEvalArgRecurse("GardeningSprayAphids", predicateDrainableUsesInt2, 1)
		else
			ISFarmingMenu.GardeningSprayAphids = handItem;
		end
		--if ISFarmingMenu.GardeningSprayMilk or ISFarmingMenu.GardeningSprayCigarettes or ISFarmingMenu.GardeningSprayAphids then
		if test then return ISWorldObjectContextMenu.setTest() end
		local diseaseOption = context:addOption(getText("ContextMenu_Treat_Problem"), worldobjects, nil);
		local subMenuCure = context:getNew(context);
		context:addSubMenu(diseaseOption, subMenuCure);
		if currentPlant.mildewLvl > 0 then
			if ISFarmingMenu.GardeningSprayMilk then
				-- we get how many use we can do on our item
				local use = ISFarmingMenu.GardeningSprayMilk:getDrainableUsesInt()
				if use > 0 then
					-- prepare subMenu for mildew
					local mildewMenu = subMenuCure:addOption(getText("Farming_Mildew"), worldobjects, nil);
					-- now submenu for lvl of mildew you want to cure (5 by 5)
					local subMenuMildew = context:getNew(subMenuCure);
					if use > 10 then
						use = 10;
					end
					local mildewLvl = 0;
					for i=1, use do
						mildewLvl = i * 5;
						subMenuMildew:addOption(mildewLvl .. "", worldobjects, ISFarmingMenu.onMildewCure, i, sq, player);
					end
					context:addSubMenu(mildewMenu, subMenuMildew);
				end
			else
				local mildewMenu = subMenuCure:addOption(getText("Farming_Mildew"), worldobjects, nil);
				mildewMenu.notAvailable = true;
				local tooltip = ISWorldObjectContextMenu.addToolTip();
				local spray = getScriptManager():FindItem("farming.GardeningSprayMilk"):getDisplayName();--InventoryItemFactory.CreateItem("GardeningSprayMilk"):getDisplayName();
				tooltip.description = getText("Farming_MissingItem", spray);
				mildewMenu.toolTip = tooltip;
			end
		end
		if currentPlant.fliesLvl > 0  then
			if ISFarmingMenu.GardeningSprayCigarettes then
				-- we get how many use we can do on our item
				local use = ISFarmingMenu.GardeningSprayCigarettes:getDrainableUsesInt()
				if use > 0 then
					-- prepare subMenu for mildew
					local flieMenu = subMenuCure:addOption(getText("Farming_Pest_Flies"), worldobjects, nil);
					-- now submenu for lvl of flies you want to cure (5 by 5)
					local subMenuFlie = context:getNew(subMenuCure);
					if use > 10 then
						use = 10;
					end
					local fliesLvl = 0;
					for i=1, use do
						fliesLvl = i * 5;
						subMenuFlie:addOption(fliesLvl .. "", worldobjects, ISFarmingMenu.onFliesCure, i, sq, player);
					end
					context:addSubMenu(flieMenu, subMenuFlie);
				end
			else
				local flieMenu = subMenuCure:addOption(getText("Farming_Pest_Flies"), worldobjects, nil);
				flieMenu.notAvailable = true;
				local tooltip = ISWorldObjectContextMenu.addToolTip();
				local spray = getScriptManager():FindItem("farming.GardeningSprayCigarettes"):getDisplayName();
				tooltip.description = getText("Farming_MissingItem", spray);
				flieMenu.toolTip = tooltip;
			end
		end
	
		if currentPlant.aphidLvl > 0  then
			if ISFarmingMenu.GardeningSprayAphids then
				-- we get how many use we can do on our item
				local use = ISFarmingMenu.GardeningSprayAphids:getDrainableUsesInt()
				if use > 0 then
					-- prepare subMenu for mildew
					local aphidMenu = subMenuCure:addOption(getText("Farming_Devil_Water_Fungi"), worldobjects, nil);
					-- now submenu for lvl of flies you want to cure (5 by 5)
					local subMenuAphi = context:getNew(subMenuCure);
					if use > 10 then
						use = 10;
					end
					local aphidLvl = 0;
					for i=1, use do
						aphidLvl = i * 5;
						subMenuAphi:addOption(aphidLvl .. "", worldobjects, ISFarmingMenu.onAphidsCure, i, sq, player);
					end
					context:addSubMenu(aphidMenu, subMenuAphi);
				end
			else
				local aphidMenu = subMenuCure:addOption(getText("Farming_Devil_Water_Fungi"), worldobjects, nil);
				aphidMenu.notAvailable = true;
				local tooltip = ISWorldObjectContextMenu.addToolTip();
				local spray = getScriptManager():FindItem("legourmetfarming.GardeningSprayAphids"):getDisplayName();
				tooltip.description = getText("Farming_MissingItem", spray);
				aphidMenu.toolTip = tooltip;
			end
		end
		--end
	end
	if ISFarmingMenu.cheat and currentPlant then
		if test then return ISWorldObjectContextMenu.setTest() end
		local option = context:addOption("Cheat", worldobjects, nil);
		local subMenu = context:getNew(context);
		context:addSubMenu(option, subMenu);
		subMenu:addOption("Grow", worldobjects, ISFarmingMenu.onCheatGrow, currentPlant);
		subMenu:addOption("Water To Max", worldobjects, ISFarmingMenu.onCheatWater, currentPlant);
		subMenu:addOption("Zero Water", worldobjects, ISFarmingMenu.onCheat, currentPlant, { var = 'waterLvl', count = -currentPlant.waterLvl });
		subMenu:addOption("Flies +5", worldobjects, ISFarmingMenu.onCheat, currentPlant, { var = 'fliesLvl', count = 5 });
		subMenu:addOption("Flies -5", worldobjects, ISFarmingMenu.onCheat, currentPlant, { var = 'fliesLvl', count = -5 });
		subMenu:addOption("Mildew +5", worldobjects, ISFarmingMenu.onCheat, currentPlant, { var = 'mildewLvl', count = 5 });
		subMenu:addOption("Mildew -5", worldobjects, ISFarmingMenu.onCheat, currentPlant, { var = 'mildewLvl', count = -5 });
		subMenu:addOption("Aphids +5", worldobjects, ISFarmingMenu.onCheat, currentPlant, { var = 'aphidLvl', count = 5 });
		subMenu:addOption("Aphids -5", worldobjects, ISFarmingMenu.onCheat, currentPlant, { var = 'aphidLvl', count = -5 });
	end
end

ISFarmingMenu.canPlow = function(seedAvailable, typeOfSeed, option, sticksAvailable, sheetropeAvailable, perklvl, prof)
	local tooltip = ISToolTip:new();
	tooltip:initialise();
	tooltip:setVisible(false);
	option.toolTip = tooltip;
	tooltip:setName(getText("Farming_" .. typeOfSeed));
	local result = true;
	local rgb = "";

	if farming_vegetableconf.props[typeOfSeed].requiredskill ~= nil then
		if prof == nil then
			if perklvl < farming_vegetableconf.props[typeOfSeed].requiredskill then
				result = false;
				rgb = "<RGB:1,0,0>";
			elseif perklvl >= farming_vegetableconf.props[typeOfSeed].requiredskill then
				rgb = "<RGB:1,1,1>";
			end
			tooltip.description = rgb .. getText("Farming_Tooltip_SkillRequired") .. perklvl .. "/" .. farming_vegetableconf.props[typeOfSeed].requiredskill .. ""  .. " <LINE> " ;
		else
			tooltip.description = "";
		end
	else
		tooltip.description = "";
	end
	tooltip.description = tooltip.description .. "<RGB:1,1,1> " .. getText("Farming_Tooltip_MinWater") .. farming_vegetableconf.props[typeOfSeed].waterLvl .. "";
	if farming_vegetableconf.props[typeOfSeed].waterLvlMax then
		tooltip.description = tooltip.description .. " <LINE> " .. getText("Farming_Tooltip_MaxWater") ..  farming_vegetableconf.props[typeOfSeed].waterLvlMax;
	end
	tooltip.description = tooltip.description .. " <LINE> " .. getText("Farming_Tooltip_TimeOfGrow") .. math.floor((farming_vegetableconf.props[typeOfSeed].timeToGrow * 7) / 24) .. " " .. getText("IGUI_Gametime_days");
    local waterPlus = "";
    if farming_vegetableconf.props[typeOfSeed].waterLvlMax then
        waterPlus = "-" .. farming_vegetableconf.props[typeOfSeed].waterLvlMax;
    end
    tooltip.description = tooltip.description .. " <LINE> " .. getText("Farming_Tooltip_AverageWater") .. farming_vegetableconf.props[typeOfSeed].waterLvl .. waterPlus;
	if seedAvailable < farming_vegetableconf.props[typeOfSeed].seedsRequired then
		result = false;
		rgb = "<RGB:1,0,0>";
	else
		rgb = "<RGB:1,1,1>";
	end
	tooltip.description = tooltip.description .. " <LINE> " .. rgb .. getText("Farming_Tooltip_RequiredSeeds") .. seedAvailable .. "/" .. farming_vegetableconf.props[typeOfSeed].seedsRequired;
	if farming_vegetableconf.props[typeOfSeed].sticksRequired > 0 then
		if sticksAvailable < farming_vegetableconf.props[typeOfSeed].sticksRequired then
			result = false;
			rgb = "<RGB:1,0,0>";
		elseif sticksAvailable >= farming_vegetableconf.props[typeOfSeed].sticksRequired then
			rgb = "<RGB:1,1,1>";
		end
		tooltip.description = tooltip.description .. " <LINE> " .. rgb .. getText("Farming_Tooltip_WoodenStickRequired") .. sticksAvailable .. "/" .. farming_vegetableconf.props[typeOfSeed].sticksRequired;
	end
	if farming_vegetableconf.props[typeOfSeed].sheetropeRequired > 0 then
		if sheetropeAvailable < farming_vegetableconf.props[typeOfSeed].sheetropeRequired then
			result = false;
			rgb = "<RGB:1,0,0>";
		elseif sheetropeAvailable >= farming_vegetableconf.props[typeOfSeed].sheetropeRequired then
			rgb = "<RGB:1,1,1>";
		end
		tooltip.description = tooltip.description .. " <LINE> " .. rgb .. getText("Farming_Tooltip_SheetRopeRequired") .. sheetropeAvailable .. "/" .. farming_vegetableconf.props[typeOfSeed].sheetropeRequired;
	end	
	tooltip:setTexture(farming_vegetableconf.props[typeOfSeed].texture);
	if not result then
		option.onSelect = nil;
		option.notAvailable = true;
    end
    tooltip:setWidth(170);
end

ISFarmingMenu.onMildewCure = function(worldobjects, uses, sq, playerObj)
	if not ISFarmingMenu.walkToPlant(playerObj, sq) then
		return;
	end
	ISWorldObjectContextMenu.equip(playerObj, playerObj:getPrimaryHandItem(), ISFarmingMenu.GardeningSprayMilk, true)
	ISTimedActionQueue.add(ISCureMildewAction:new(playerObj, ISFarmingMenu.GardeningSprayMilk, uses, CFarmingSystem.instance:getLuaObjectOnSquare(sq), 10 * (uses * 5)));
	if playerObj:getJoypadBind() ~= -1 then
		return
	end
	ISFarmingMenu.cursor = ISFarmingCursorMouse:new(playerObj, ISFarmingMenu.onMildewSquareSelected, ISFarmingMenu.isMildewValid)
	getCell():setDrag(ISFarmingMenu.cursor, playerObj:getPlayerNum())
	ISFarmingMenu.cursor.uses = uses;
end

function ISFarmingMenu:isMildewValid()
	if not ISFarmingMenu.cursor then return false; end
	local valid = true
	local cursor = ISFarmingMenu.cursor
	local playerObj = cursor.character
	local playerInv = playerObj:getInventory()
	local plant = CFarmingSystem.instance:getLuaObjectOnSquare(cursor.sq)
	local plantName = ISFarmingMenu.getPlantName(plant)
	local handItem = playerObj:getPrimaryHandItem()
	local spray = nil;
	
	if not ISFarmingMenu.isValidPlant(plant) then
		cursor.tooltipTxt = "<RGB:1,0,0> " .. getText("Farming_Tooltip_NotAPlant")
		return false
	end

	if plant and plant.state ~= "seeded" then
		cursor.tooltipTxt = "<RGB:1,0,0> " .. getText("Farming_Tooltip_NotAPlant");
		return false;
	end

	local farmingLevel = CFarmingSystem.instance:getXp(playerObj)

	cursor.tooltipTxt = plantName .. " <LINE> ";
	local label = getText("Farming_Disease")
	local value = getText("UI_No")
	if plant.mildewLvl > 0 then
		if farmingLevel >= 4 then
			label = getText("Farming_Mildew")
			if farmingLevel >= 6 then
				value = plant.mildewLvl .. " / 100"
			else
				value = getText("UI_FriendState_Unknown") .. " / 100"
			end
		else
			value = getText("UI_Yes")
		end
		if not handItem or handItem:getType() ~= "GardeningSprayMilk" or (handItem:getDrainableUsesInt() == 0) then
			ISFarmingMenu.GardeningSprayMilk = playerInv:getFirstTypeEvalArgRecurse("GardeningSprayMilk", predicateDrainableUsesInt2, 1)
		else
			ISFarmingMenu.GardeningSprayMilk = handItem
		end
	end

	cursor.tooltipTxt = cursor.tooltipTxt .. label .. " : " .. value
	if plant.mildewLvl <= 0 then return false; end
	if ISFarmingMenu.GardeningSprayMilk then
		local item = playerInv:getFirstTypeEvalArgRecurse("GardeningSprayMilk", predicateDrainableUsesInt2, 1)
		local use = ISFarmingMenu.GardeningSprayMilk:getDrainableUsesInt()
		if item and use > 0 then
			return true;
		end
	
	
		if not item then
			return false
		end
	end

	return false
end

function ISFarmingMenu:onMildewSquareSelected()
	local cursor = ISFarmingMenu.cursor
	local plant = CFarmingSystem.instance:getLuaObjectOnSquare(cursor.sq)
	if plant.mildewLvl > 0 and ISFarmingMenu.GardeningSprayMilk then
		local playerObj = cursor.character
		if not ISFarmingMenu.walkToPlant(playerObj, cursor.sq) then
			return
		end
		ISWorldObjectContextMenu.equip(playerObj, playerObj:getPrimaryHandItem(), ISFarmingMenu.GardeningSprayMilk, true)
		ISTimedActionQueue.add(ISCureMildewAction:new(playerObj, ISFarmingMenu.GardeningSprayMilk, cursor.uses, plant, 10 * (cursor.uses * 5)));
	end

end

ISFarmingMenu.onFliesCure = function(worldobjects, uses, sq, playerObj)
	if not ISFarmingMenu.walkToPlant(playerObj, sq) then
		return;
	end
	ISWorldObjectContextMenu.equip(playerObj, playerObj:getPrimaryHandItem(), ISFarmingMenu.GardeningSprayCigarettes, true)
	ISTimedActionQueue.add(ISCureFliesAction:new(playerObj, ISFarmingMenu.GardeningSprayCigarettes, uses, CFarmingSystem.instance:getLuaObjectOnSquare(sq), 10 * (uses * 5)));
	if playerObj:getJoypadBind() ~= -1 then
		return
	end
	ISFarmingMenu.cursor = ISFarmingCursorMouse:new(playerObj, ISFarmingMenu.onFliesSquareSelected, ISFarmingMenu.isFliesValid)
	getCell():setDrag(ISFarmingMenu.cursor, playerObj:getPlayerNum())
	ISFarmingMenu.cursor.uses = uses;
end

function ISFarmingMenu:isFliesValid()
	if not ISFarmingMenu.cursor then return false; end
	local valid = true
	local cursor = ISFarmingMenu.cursor
	local playerObj = cursor.character
	local playerInv = playerObj:getInventory()
	local plant = CFarmingSystem.instance:getLuaObjectOnSquare(cursor.sq)
	local plantName = ISFarmingMenu.getPlantName(plant)
	local handItem = playerObj:getPrimaryHandItem()
	local spray = nil;
	
	if not ISFarmingMenu.isValidPlant(plant) then
		cursor.tooltipTxt = "<RGB:1,0,0> " .. getText("Farming_Tooltip_NotAPlant")
		return false
	end

	if plant and plant.state ~= "seeded" then
		cursor.tooltipTxt = "<RGB:1,0,0> " .. getText("Farming_Tooltip_NotAPlant");
		return false;
	end

	local farmingLevel = CFarmingSystem.instance:getXp(playerObj)

	cursor.tooltipTxt = plantName .. " <LINE> ";
	local label = getText("Farming_Disease")
	local value = getText("UI_No")
	if plant.fliesLvl > 0 then
		if farmingLevel >= 4 then
			label = getText("Farming_Pest_Flies")
			if farmingLevel >= 6 then
				value = plant.fliesLvl .. " / 100"
			else
				value = getText("UI_FriendState_Unknown") .. " / 100"
			end
		else
			value = getText("UI_Yes")
		end
		if not handItem or handItem:getType() ~= "GardeningSprayCigarettes" or (handItem:getDrainableUsesInt() == 0) then
			ISFarmingMenu.GardeningSprayCigarettes = playerInv:getFirstTypeEvalArgRecurse("GardeningSprayCigarettes", predicateDrainableUsesInt2, 1)
		else
			ISFarmingMenu.GardeningSprayCigarettes = handItem
		end
	end

	cursor.tooltipTxt = cursor.tooltipTxt .. label .. " : " .. value
	if plant.fliesLvl <= 0 then return false; end
	if ISFarmingMenu.GardeningSprayCigarettes then
		local item = playerInv:getFirstTypeEvalArgRecurse("GardeningSprayCigarettes", predicateDrainableUsesInt2, 1)
		local use = ISFarmingMenu.GardeningSprayCigarettes:getDrainableUsesInt()
		if item and use > 0 then
			return true;
		end
	
	
		if not item then
			return false
		end
	end

	return false
end

function ISFarmingMenu:onFliesSquareSelected()
	local cursor = ISFarmingMenu.cursor
	local plant = CFarmingSystem.instance:getLuaObjectOnSquare(cursor.sq)
	if plant.fliesLvl > 0 and ISFarmingMenu.GardeningSprayCigarettes then
		local playerObj = cursor.character
		if not ISFarmingMenu.walkToPlant(playerObj, cursor.sq) then
			return
		end
		ISWorldObjectContextMenu.equip(playerObj, playerObj:getPrimaryHandItem(), ISFarmingMenu.GardeningSprayCigarettes, true)
		ISTimedActionQueue.add(ISCureFliesAction:new(playerObj, ISFarmingMenu.GardeningSprayCigarettes, cursor.uses, plant, 10 * (cursor.uses * 5)));
	end
end

ISFarmingMenu.onAphidsCure = function(worldobjects, uses, sq, playerObj)
	if not ISFarmingMenu.walkToPlant(playerObj, sq) then
		return;
	end
	ISWorldObjectContextMenu.equip(playerObj, playerObj:getPrimaryHandItem(), ISFarmingMenu.GardeningSprayAphids, true)
	ISTimedActionQueue.add(ISCureAphidsAction:new(playerObj, ISFarmingMenu.GardeningSprayAphids, uses, CFarmingSystem.instance:getLuaObjectOnSquare(sq), 10 * (uses * 5)));
	if playerObj:getJoypadBind() ~= -1 then
		return
	end
	ISFarmingMenu.cursor = ISFarmingCursorMouse:new(playerObj, ISFarmingMenu.onAphidSquareSelected, ISFarmingMenu.isAphidValid)
	getCell():setDrag(ISFarmingMenu.cursor, playerObj:getPlayerNum())
	ISFarmingMenu.cursor.uses = uses;
end

function ISFarmingMenu:isAphidValid()
	if not ISFarmingMenu.cursor then return false; end
	local valid = true
	local cursor = ISFarmingMenu.cursor
	local playerObj = cursor.character
	local playerInv = playerObj:getInventory()
	local plant = CFarmingSystem.instance:getLuaObjectOnSquare(cursor.sq)
	local plantName = ISFarmingMenu.getPlantName(plant)
	local handItem = playerObj:getPrimaryHandItem()
	local spray = nil;
	
	if not ISFarmingMenu.isValidPlant(plant) then
		cursor.tooltipTxt = "<RGB:1,0,0> " .. getText("Farming_Tooltip_NotAPlant")
		return false
	end

	if plant and plant.state ~= "seeded" then
		cursor.tooltipTxt = "<RGB:1,0,0> " .. getText("Farming_Tooltip_NotAPlant");
		return false;
	end

	local farmingLevel = CFarmingSystem.instance:getXp(playerObj)

	cursor.tooltipTxt = plantName .. " <LINE> ";
	local label = getText("Farming_Disease")
	local value = getText("UI_No")
	if plant.aphidLvl > 0 then
		if farmingLevel >= 4 then
			label = getText("Farming_Devil_Water_Fungi")
			if farmingLevel >= 6 then
				value = plant.aphidLvl .. " / 100"
			else
				value = getText("UI_FriendState_Unknown") .. " / 100"
			end
		else
			value = getText("UI_Yes")
		end
		if not handItem or handItem:getType() ~= "GardeningSprayAphids" or (handItem:getDrainableUsesInt() == 0) then
			ISFarmingMenu.GardeningSprayAphids = playerInv:getFirstTypeEvalArgRecurse("GardeningSprayAphids", predicateDrainableUsesInt2, 1)
		else
			ISFarmingMenu.GardeningSprayAphids = handItem
		end
	end

	cursor.tooltipTxt = cursor.tooltipTxt .. label .. " : " .. value
	if plant.aphidLvl <= 0 then return false; end
	if ISFarmingMenu.GardeningSprayAphids then
		local item = playerInv:getFirstTypeEvalArgRecurse("GardeningSprayAphids", predicateDrainableUsesInt2, 1)
		local use = ISFarmingMenu.GardeningSprayAphids:getDrainableUsesInt()
		if item and use > 0 then
			return true;
		end
	
	
		if not item then
			return false
		end
	end

	return false
end

function ISFarmingMenu:onAphidSquareSelected()
	local cursor = ISFarmingMenu.cursor
	local plant = CFarmingSystem.instance:getLuaObjectOnSquare(cursor.sq)
	if plant.aphidLvl > 0 and ISFarmingMenu.GardeningSprayAphids then
		local playerObj = cursor.character
		if not ISFarmingMenu.walkToPlant(playerObj, cursor.sq) then
			return
		end
		ISWorldObjectContextMenu.equip(playerObj, playerObj:getPrimaryHandItem(), ISFarmingMenu.GardeningSprayAphids, true)
		ISTimedActionQueue.add(ISCureAphidsAction:new(playerObj, ISFarmingMenu.GardeningSprayAphids, cursor.uses, plant, 10 * (cursor.uses * 5)));
	end
end

ISFarmingMenu.onFertilize = function(worldobjects, handItem, plant, sq, playerObj)
    -- close the farming info window to avoid concurrent gorwing phase problem
	local playerInv = playerObj:getInventory()
	--player:Say("Fertilizer OK")
	if ISFarmingMenu.walkToPlant(playerObj, sq) then
		if (not handItem or handItem:getType() ~= "CompostBag" or (handItem:getDrainableUsesInt() == 0)) or 
		   (not handItem or handItem:getType() ~= "Fertilizer" or (handItem:getDrainableUsesInt() == 0)) then
			if playerInv:containsTypeRecurse("CompostBag") then
				ISFarmingMenu.Compost = playerInv:getFirstTypeEvalArgRecurse("CompostBag", predicateDrainableUsesInt2, 1)
			else
				ISFarmingMenu.Compost = playerInv:getFirstTypeEvalArgRecurse("Fertilizer", predicateDrainableUsesInt2, 1)
			end
			--player:Say("Compost Search OK")
		else
			ISFarmingMenu.Compost = handItem;
		end
		if ISFarmingMenu.Compost then
			if not ISFarmingMenu.walkToPlant(playerObj, sq) then
				return;
			end
			local hItem = ISWorldObjectContextMenu.equip(playerObj, playerObj:getPrimaryHandItem(), ISFarmingMenu.Compost, true)
			ISTimedActionQueue.add(ISFertilizeAction:new(playerObj, hItem, plant, 40));

			if playerObj:getJoypadBind() ~= -1 then
				return
			end

			ISFarmingMenu.cursor = ISFarmingCursorMouse:new(playerObj, ISFarmingMenu.onFertilizeSquareSelected, ISFarmingMenu.isFertilizeValid)
			getCell():setDrag(ISFarmingMenu.cursor, playerObj:getPlayerNum())
		end
	end
end

function ISFarmingMenu:isFertilizeValid()
	if not ISFarmingMenu.cursor then return false; end
	local valid = true
	local cursor = ISFarmingMenu.cursor
	local playerObj = cursor.character
	local playerInv = playerObj:getInventory()
	local plant = CFarmingSystem.instance:getLuaObjectOnSquare(cursor.sq)
	local plantName = ISFarmingMenu.getPlantName(plant)
	local handItem = playerObj:getPrimaryHandItem()
	local farmingLevel = CFarmingSystem.instance:getXp(playerObj)
	
	if not ISFarmingMenu.isValidPlant(plant) then
		cursor.tooltipTxt = "<RGB:1,0,0> " .. getText("Farming_Tooltip_NotAPlant")
		return false
	end

	if plant and plant.state ~= "seeded" then
		cursor.tooltipTxt = "<RGB:1,0,0> " .. getText("Farming_Tooltip_NotAPlant");
		return false;
	end

	if (not handItem or handItem:getType() ~= "CompostBag" or (handItem:getDrainableUsesInt() == 0)) or 
	   (not handItem or handItem:getType() ~= "Fertilizer" or (handItem:getDrainableUsesInt() == 0)) then
		if playerInv:containsTypeRecurse("CompostBag") then
			ISFarmingMenu.Compost = playerInv:getFirstTypeEvalArgRecurse("CompostBag", predicateDrainableUsesInt2, 1)
		else
			ISFarmingMenu.Compost = playerInv:getFirstTypeEvalArgRecurse("Fertilizer", predicateDrainableUsesInt2, 1)
		end
		--player:Say("Compost Search OK")
	else
		ISFarmingMenu.Compost = handItem;
	end

	cursor.tooltipTxt = plantName .. " <LINE> ";
	cursor.tooltipTxt = cursor.tooltipTxt .. getText("Farming_Fertilized") .. " : " .. plant.fertilizer

	if ISFarmingMenu.Compost then
		local itemA = false;
		local itemB = false;
		if playerInv:containsTypeRecurse("CompostBag") then
			itemA = playerInv:getFirstTypeEvalArgRecurse("CompostBag", predicateDrainableUsesInt2, 1);
			return true;
		end
		if playerInv:containsTypeRecurse("Fertilizer") then
			itemB = playerInv:getFirstTypeEvalArgRecurse("Fertilizer", predicateDrainableUsesInt2, 1);
			return true;
		end
	
		if not itemA and not ItemB then
			return false
		end
	end

	return false
end

function ISFarmingMenu:onFertilizeSquareSelected()
	local cursor = ISFarmingMenu.cursor
	local plant = CFarmingSystem.instance:getLuaObjectOnSquare(cursor.sq)
	if ISFarmingMenu.Compost then
		local playerObj = cursor.character
		if not ISFarmingMenu.walkToPlant(playerObj, cursor.sq) then
			return
		end
		local handItem = ISWorldObjectContextMenu.equip(playerObj, playerObj:getPrimaryHandItem(), ISFarmingMenu.Compost, true)
		ISTimedActionQueue.add(ISFertilizeAction:new(playerObj, handItem, plant, 40))
	end
end

ISFarmingMenu.doSeedMenu = function(context, plant, sq, playerObj)
	local playerrcp = playerObj:getKnownRecipes();
	local menu1 = nil;
	local menu2 = nil;
	local menu3 = nil;
	local seedOption;
	local subMenu;
	local WoodenStickseedOption;
	local subMenu2;
	local TreeseedOption;
	local subMenu3;
	-- Sort seed types by display name.
	local typeOfSeedList = {}
	for typeOfSeed,props in pairs(farming_vegetableconf.props) do
		table.insert(typeOfSeedList, { typeOfSeed = typeOfSeed, props = props, text = getText("Farming_" .. typeOfSeed) })
	end
	table.sort(typeOfSeedList, function(a,b) return not string.sort(a.text, b.text) end)
	for _,tos in ipairs(typeOfSeedList) do
		local typeOfSeed = tos.typeOfSeed
		if tos.props.plantType == 1 and playerrcp:contains("Sow " .. typeOfSeed) then
			menu1 = true
		end
		if tos.props.plantType == 2 and playerrcp:contains("Sow " .. typeOfSeed) then
			menu2 = true
		end
		if tos.props.plantType == 3 and playerObj:getInventory():getCountTypeRecurse(tos.props.seedName) > 0 then
			menu3 = true
		end
	end
	if menu1 then
		--Plantas normales
		seedOption = context:addOption(getText("ContextMenu_Sow_Seed"), nil, nil)
		subMenu = context:getNew(context)
		context:addSubMenu(seedOption, subMenu)
	end
	if menu2 then
		-- Soporte
		WoodenStickseedOption = context:addOption(getText("ContextMenu_Sow_WoodenStick_Seed"), nil, nil);
		subMenu2 = context:getNew(context);
		context:addSubMenu(WoodenStickseedOption, subMenu2);
	end
	if menu3 then
		-- Arboles Frutales
		TreeseedOption = context:addOption(getText("ContextMenu_Sow_tree_Seed"), nil, nil);
		subMenu3 = context:getNew(context);
		context:addSubMenu(TreeseedOption, subMenu3);	
	end

	for _,tos in ipairs(typeOfSeedList) do
		local typeOfSeed = tos.typeOfSeed
		local option = nil;
		if tos.props.plantType == 1 then
			if playerrcp:contains("Sow " .. typeOfSeed) and menu1 then
				option = subMenu:addActionsOption(tos.text, ISFarmingMenu.onSeed, typeOfSeed, plant, sq)
			end
		end
		if tos.props.plantType == 2 then
			if playerrcp:contains("Sow " .. typeOfSeed) and menu2 then
				option = subMenu2:addActionsOption(tos.text, ISFarmingMenu.onSeed, typeOfSeed, plant, sq)
			end
		end
		if tos.props.plantType == 3 then
			if playerObj:getInventory():getCountTypeRecurse(tos.props.seedName) > 0 and menu3 then
				option = subMenu3:addActionsOption(tos.text, ISFarmingMenu.onSeed, typeOfSeed, plant, sq)
			end
		end
		if option ~= nil then
			local nbOfSeed = playerObj:getInventory():getCountTypeRecurse(tos.props.seedName)
			local nbOfSticks = playerObj:getInventory():getCountTypeRecurse("Base.WoodenStick")
			local nbOfSheet = playerObj:getInventory():getCountTypeRecurse("Base.SheetRope")
			local perkFarming = playerObj:getPerkLevel(Perks.Farming)
			local prof = nil;
			if playerObj:getDescriptor():getProfession() == "farmer" then
				prof = true;
			end
			ISFarmingMenu.canPlow(nbOfSeed, typeOfSeed, option, nbOfSticks, nbOfSheet, perkFarming, prof)
		end
	end
end

function ISFarmingMenu.onSeed(playerObj, typeOfSeed, plant, sq)
	if ISFarmingMenu.walkToPlant(playerObj, sq) then
		local playerInv = playerObj:getInventory()
		local props = farming_vegetableconf.props[typeOfSeed]
		local items = playerInv:getSomeTypeRecurse(props.seedName, props.seedsRequired)
		ISInventoryPaneContextMenu.transferIfNeeded(playerObj, items)
		local seeds = {}
		for i=1,items:size() do
			local item = items:get(i-1)
			table.insert(seeds, items:get(i-1))
		end
		if props.sticksRequired > 0 then
			items = playerInv:getSomeTypeRecurse("Base.WoodenStick", props.sticksRequired)
			ISInventoryPaneContextMenu.transferIfNeeded(playerObj, items)
		end
		if props.sheetropeRequired > 0 then
			items = playerInv:getSomeTypeRecurse("Base.SheetRope", props.sheetropeRequired)
			ISInventoryPaneContextMenu.transferIfNeeded(playerObj, items)
		end
		ISTimedActionQueue.add(ISSeedAction:new(playerObj, seeds, props.seedsRequired, typeOfSeed, plant, 40))	
	end
	if playerObj:getJoypadBind() ~= -1 then
		return
	end
	ISFarmingMenu.cursor = ISFarmingCursorMouse:new(playerObj, ISFarmingMenu.onSeedSquareSelected, ISFarmingMenu.isSeedValid)
	getCell():setDrag(ISFarmingMenu.cursor, playerObj:getPlayerNum())
	ISFarmingMenu.cursor.typeOfSeed = typeOfSeed;
end

ISFarmingMenu.haveItems = function(player)
    local itemList = {};
    itemList.WoodenStick = {};
	itemList.SheetRope = {};

	for i = 0, player:getInventory():getItems():size() - 1 do
		local item = player:getInventory():getItems():get(i);
		if item:getType() == "WoodenStick" then
			table.insert(itemList.WoodenStick, item);
		end
		if item:getType() == "SheetRope" then
			table.insert(itemList.SheetRope, item);
		end
	end
	return itemList;
end