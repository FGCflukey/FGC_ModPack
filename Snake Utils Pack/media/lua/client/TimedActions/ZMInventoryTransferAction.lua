require "TimedActions/ISInventoryTransferAction"
function ISInventoryTransferAction:isValid()
	self.dontAdd = false;
	if not self.destContainer or not self.srcContainer then return false; end
	if self.allowMissingItems and not self.srcContainer:contains(self.item) then -- if the item is destroyed before, for example when crafting something, we want to transfer the items left back to their original position, but some might be destroyed by the recipe (like molotov, the gas can will be returned, but the ripped sheet is destroyed)
--		self:stop();
		self.dontAdd = true;
		return true;
	end
	if (not self.destContainer:isExistYet()) or (not self.srcContainer:isExistYet()) then
		return false
	end

	local parent = self.srcContainer:getParent()
	-- Duplication exploit: drag items from a corpse to another container while pickup up the corpse.
	-- ItemContainer:isExistYet() would detect this if SystemDisabler.doWorldSyncEnable was true.
	if instanceof(parent, "IsoDeadBody") and parent:getStaticMovingObjectIndex() == -1 then
		return false
	end

	-- Don't fail if the item was transferred by a previous action.
	if self:isAlreadyTransferred(self.item) then
		return true
	end

	-- Limit items per container in MP
	if isClient() then
		if not isItemTransactionConsistent(self.item, self.srcContainer, self.destContainer) then
			return false
		end
		local limit = getServerOptions():getInteger("ItemNumbersLimitPerContainer");
		if limit > 0 and (not instanceof(self.destContainer:getParent(), "IsoGameCharacter")) then
			--allow dropping full bags on an empty square or put full container in an empty container
			if not self.destContainer:getItems():isEmpty() then
				local destRoot = self:findRootInventory(self.destContainer);
				local srcRoot = self:findRootInventory(self.srcContainer);
				--total count remains the same if the same root container
				if srcRoot ~= destRoot then
					local tranferItemsNum = 1;
					if self.item:getCategory() == "Container" then
						tranferItemsNum = self:countItemsRecursive({self.item:getInventory()}, 1);
					end;
					--count items from the root container
					local destContainerItemsNum = self:countItemsRecursive({destRoot}, 0);
					--if destination is an item then add 1
					if destRoot:getContainingItem() then destContainerItemsNum = destContainerItemsNum + 1; end;
					--total items must not exceed the server limit
					if destContainerItemsNum + tranferItemsNum > limit then
						return false;
					end;
				end;
			end;
		end;
	end;

    if ISTradingUI.instance and ISTradingUI.instance:isVisible() then
        return false;
    end
	if not self.srcContainer:contains(self.item) then
		return false;
    end
    if self.srcContainer == self.destContainer then return false; end

    if self.destContainer:getType()=="floor" then
        if instanceof(self.item, "Moveable") and self.item:getSpriteGrid()==nil then
            if not self.item:CanBeDroppedOnFloor() then
                return false;
            end
        end
        if self:getNotFullFloorSquare(self.item) == nil then
            return false;
        end
    elseif not self.destContainer:hasRoomFor(self.character, self.item) then
        return false;
    end

    if not self.srcContainer:isRemoveItemAllowed(self.item) then
        return false;
    end
    if not self.destContainer:isItemAllowed(self.item) then
        return false;
    end
	------------------------------------------Nuevo Contenido del Mod-----------------
	if self.destContainer:getType() == "tiremachine" then
		local tire = false;
		if self.item:getType() == "OldTire1" or
		  self.item:getType() == "OldTire2" or
		  self.item:getType() == "OldTire3" or
		  self.item:getType() == "NormalTire1" or
		  self.item:getType() == "NormalTire2" or
		  self.item:getType() == "NormalTire3" or
		  self.item:getType() == "ModernTire1" or
		  self.item:getType() == "ModernTire2" or
		  self.item:getType() == "ModernTire3" then
		  tire = true;
		end
		if tire then
			if self.destContainer:getContentsWeight() ~= 0 then
				return false;
			else
				return true;
			end
			return false;
		end
		if not tire then
			if self.item:getType() == "DismountedTire" then
				if self.destContainer:getContentsWeight() ~= 0 then
					if self.destContainer:contains("CarRim") and (not self.destContainer:contains("DismountedTire")) then
						return true;
					else
						return false;
					end
				else
					return true;
				end
			end
			if self.item:getType() == "CarRim" then
				if self.destContainer:getContentsWeight() ~= 0 then
					if self.destContainer:contains("DismountedTire") and (not self.destContainer:contains("CarRim")) then
						return true;
					else
						return false;
					end
				else
					return true;
				end
			end
			return false;
		end
		return false;
	end
	if self.destContainer:getType() == "coffee_grinder" then
		if self.item:getType() == "ToastedCafeSeeds" then
			if self.destContainer:getContentsWeight() ~= 0 then
				return false;
			else
				return true;
			end
		else
			return false;
		end
	end
	if self.destContainer:getType() == "eg_displaycase" then
		if self.item:getType() == "GoldenSkull" then
			local data = self.item:getModData();
			if not data.original then
				self.character:Say("Cheating is not allowed!");
				return false;
			else
				if self.destContainer:getContentsWeight() ~= 0 then
					return false;
				else
					return true;
				end
			end
		else
			return false;
		end
	end
	if self.destContainer:getType() == "extinguishers_shelves" then
		if self.item:getType() == "Extinguisher" then
			return true;
		else
			return false;
		end
	end
	if self.destContainer:getType() == "Quiver" then
		if self.item:getType() == "BowArrow" then
			return true;
		else
			return false;
		end
	end
	if self.destContainer:getType() == "furframe" then
		if self.item:getType() == "CowSkin" or self.item:getType() == "DeerSkin" or self.item:getType() == "BearSkin" then
			if self.destContainer:getContentsWeight() ~= 0 then
				return false;
			else
				return true
			end
		else
			return false;
		end
	end
	if self.destContainer:getType() == "cane_support" then
		if self.item:getType() == "SugarcanePile" then
			return true;
		else
			return false;
		end
	end
	if self.destContainer:getType() == "brickpallet" then
		if self.item:getType() == "ZAWBrick" 
		  or self.item:getType() == "ZAWConcreteBrick"
		  or self.item:getType() == "ZAWBrickPack" then
			return true;
		else
			return false;
		end
	end
	if self.destContainer:getType() == "cheese_table" then
		if self.item:getType() == "CheeseMoldFull" 
		  or self.item:getType() == "CheeseMoldFull2"
		  or self.item:getType() == "CheeseMoldFull3" then
			return true;
		else
			return false;
		end
	end
	
	if self.destContainer:getType() == "SeatFrontRight" or
		self.destContainer:getType() == "SeatFrontLeft" or
		self.destContainer:getType() == "SeatRearRight" or
		self.destContainer:getType() == "SeatRearLeft" or
		self.destContainer:getType() == "SeatMiddleLeft" or
		self.destContainer:getType() == "SeatMiddleRight" then
		local value = 1;
		if self.character:HasTrait("Organized") then
			value = 1.3;
		elseif self.character:HasTrait("Disorganized") then
			value = 0.7;
		else
		end
		if instanceof(self.item, "InventoryContainer") then
			if (self.destContainer:getContentsWeight() + self.item:getContentsWeight()) > (self.destContainer:getCapacity() * value) then
				return false;
			end
		end
		if self.destContainer:getType() == "SeatFrontRight" or self.destContainer:getType() == "SeatFrontLeft" then
			if (self.item:getActualWeight() > (self.destContainer:getCapacity() * value)) or (self.destContainer:getContentsWeight() + self.item:getActualWeight() > (self.destContainer:getCapacity() * value))  then
				if self.item:getType() == "Generator" and self.destContainer:getContentsWeight() == 0 and (self.destContainer:getCapacity() * value) >= 26 then
					return true;
				else
					return false;
				end
			end
		end
		--self.character:Say("SI");
	end
	-----------------------------------------------------------------------------------

    if self.item:getContainer() == self.srcContainer and not self.destContainer:isInside(self.item) then
        return true;
    end
    if isClient() and self.srcContainer:getSourceGrid() and SafeHouse.isSafeHouse(self.srcContainer:getSourceGrid(), self.character:getUsername(), true) then
        return false;
	end
    return false;
end

-- TODO: function to remove a list of items on server
function ISInventoryTransferAction:transferItem(item)
	if self:isAlreadyTransferred(item) then
		return
	end

	if isItemTransactionConsistent(self.item, self.srcContainer, self.destContainer) then
		removeItemTransaction(self.item, self.srcContainer, self.destContainer)
		for index,transaction in ipairs(self.transactions) do
			if transaction[1] == self.item and transaction[2] == self.srcContainer and transaction[3] == self.destContainer then
				table.remove(self.transactions, index)
				break
			end
		end
	else
		self.queueList = {}
		return
	end

	if self.dontAdd then
		-- Crafting ingredient was destroyed and can't be put back into the container it came from.
		return
	end

--	print("transfering ", item)
	self.item = item;
	--self.character:ClearVariable("LootPosition");
	self.item:setJobDelta(0.0);
	if self.item:isFavorite() and not self.destContainer:isInCharacterInventory(self.character) then
--		ISBaseTimedAction.perform(self);
		return;
	end

	if self.srcContainer:getType() ~= "TradeUI" and isClient() and not self.destContainer:isInCharacterInventory(self.character) and self.destContainer:getType()~="floor" then
		self.destContainer:addItemOnServer(self.item);
	end
	if self.srcContainer:getType() ~= "TradeUI" and isClient() and not self.srcContainer:isInCharacterInventory(self.character) and self.srcContainer:getType()~="floor" then
		self.srcContainer:removeItemOnServer(self.item);
	end

	if self.destContainer:getType() ~= "TradeUI" then
		self.srcContainer:DoRemoveItem(self.item);
	end
	-- clear it from the queue.
	self.srcContainer:setDrawDirty(true);
	self.srcContainer:setHasBeenLooted(true);
	self.destContainer:setDrawDirty(true);

	----------------------------- Contenido del Mod-------------------
	if self.destContainer:getType() == "eg_displaycase" then
		self:checkitemputin(self.item);
	elseif self.srcContainer:getType() == "eg_displaycase" then
		self:checkitemtakeit(self.item);
	end
	if self.destContainer:getType() == "furframe" then
		self:checkskintimeputin(self.item);
	elseif self.srcContainer:getType() == "furframe" then
		self:checkskintimetakeit(self.item);
	end
	if self.destContainer:getType() == "cane_support" then
		self:checkskintimeputin(self.item);
	elseif self.srcContainer:getType() == "cane_support" then
		self:checkskintimetakeit(self.item);
	end
	if self.destContainer:getType() == "brickpallet" then
		self:reduceweightonputin(self.item);
	elseif self.srcContainer:getType() == "brickpallet" then
		self:restoreweightontake(self.item);
	end
	if self.destContainer:getType() == "cheese_table" then
		self:checkskintimeputin(self.item);
	elseif self.srcContainer:getType() == "cheese_table" then
		self:checkskintimetakeit(self.item);
	end
	-------------------------------------------------------------------
	
	-- deal with containers that are floor
	if self.destContainer:getType()=="floor" then
		local square = self:getNotFullFloorSquare(item)
		if square then
			local addToWorld = self:removeItemOnCharacter();
			-- might have been added by the masking system (if you have a bag equipped and drop it on ground for example)
			if addToWorld then
				self.destContainer:DoAddItemBlind(self.item);
				local dropX,dropY,dropZ = ISInventoryTransferAction.GetDropItemOffset(self.character, square, self.item)
				square:AddWorldInventoryItem(item, dropX, dropY, dropZ)

				if instanceof(item, "Radio") then
					local _obj = IsoRadio.new(getCell(), square, nil)
					local deviceData = item:getDeviceData();
					if deviceData then
						_obj:setDeviceData(deviceData);
					end

					_obj:getModData().RadioItemID = item:getID()
					square:AddSpecialObject(_obj, square:getObjects():size())
					if isClient() then _obj:transmitCompleteItemToServer(); end
					_obj:transmitModData()
					triggerEvent("OnObjectAdded", _obj)
					square:RecalcProperties()
					square:RecalcAllWithNeighbours(true)
				end
			end
		else
			error "no square to drop item on"
		end
	elseif self.srcContainer:getType()=="floor" and self.item:getWorldItem() ~= nil then
		if instanceof(self.item, "Radio") then
			local square = self.item:getWorldItem():getSquare()
			local _obj = nil
			for i=0, square:getObjects():size()-1 do
				local tObj = square:getObjects():get(i)
				if instanceof(tObj, "IsoRadio") then
					if tObj:getModData().RadioItemID == self.item:getID() then
						_obj = tObj
						break
					end
				end
			end
			if _obj ~= nil then
				local deviceData = _obj:getDeviceData();
				if deviceData then
					self.item:setDeviceData(deviceData);
				end
				square:transmitRemoveItemFromSquare(_obj)
				square:RecalcProperties();
				square:RecalcAllWithNeighbours(true);
			end
		end
	
		self.item:getWorldItem():getSquare():transmitRemoveItemFromSquare(self.item:getWorldItem());
		self.item:getWorldItem():getSquare():removeWorldObject(self.item:getWorldItem());
		--        self.item:getWorldItem():getSquare():getObjects():remove(self.item:getWorldItem());
		self.item:setWorldItem(nil);
		self.destContainer:AddItem(self.item);
	else
		if self.srcContainer:getType() ~= "TradeUI" then
			self.destContainer:AddItem(self.item);
		end
		if self.character:getInventory() ~= self.destContainer then
			self:removeItemOnCharacter();
		end
		if self.item:getType() == "CandleLit" then
			local candle = self.destContainer:AddItem("Base.Candle");
			candle:setUsedDelta(self.item:getUsedDelta());
			candle:setCondition(self.item:getCondition());
			candle:setFavorite(self.item:isFavorite());
			self.destContainer:Remove(self.item)
			self.item = candle;
		end
	end

	if self.destContainer:getParent() and instanceof(self.destContainer:getParent(), "BaseVehicle") and self.destContainer:getParent():getPartById(self.destContainer:getType()) then
		local part = self.destContainer:getParent():getPartById(self.destContainer:getType());
		part:setContainerContentAmount(part:getItemContainer():getCapacityWeight());
	end

	if self.srcContainer:getParent() and instanceof(self.srcContainer:getParent(), "BaseVehicle") and self.srcContainer:getParent():getPartById(self.srcContainer:getType()) then
		local part = self.srcContainer:getParent():getPartById(self.srcContainer:getType());
		part:setContainerContentAmount(part:getItemContainer():getCapacityWeight());
	end

	if instanceof(self.srcContainer:getParent(), "IsoDeadBody") then
		self.item:setAttachedSlot(-1);
		self.item:setAttachedSlotType(nil);
		self.item:setAttachedToModel(nil);
	end
	
	if instanceof(self.destContainer:getParent(), 'IsoMannequin') then
		local mannequin = self.destContainer:getParent()
		mannequin:wearItem(self.item, self.character)
	end

	triggerEvent("OnContainerUpdate", self.srcContainer, self.destContainer, self.character);
	-- Hack for giving cooking XP.
	if instanceof(self.item, "Food") then
		self.item:setChef(self.character:getFullName())
	end
	if self.destContainer:getType() == "stonefurnace" then
		self.item:setWorker(self.character:getFullName());
	end
	
	local pdata = getPlayerData(self.character:getPlayerNum());
	
	ISInventoryPage.renderDirty = true
	--pdata.playerInventory:refreshBackpacks();
	--pdata.lootInventory:refreshBackpacks();
	
	-- do the overlay sprite
	if not isClient() then
		if self.srcContainer:getParent() and self.srcContainer:getParent():getOverlaySprite() then
			ItemPicker.updateOverlaySprite(self.srcContainer:getParent())
		end
		if self.destContainer:getParent() then
			ItemPicker.updateOverlaySprite(self.destContainer:getParent())
		end
	end
end

function ISInventoryTransferAction:checkitemputin(item)
	if item:getType() == "GoldenSkull" then
		self.character:getEmitter():playSound("WoodDoorUnlock");
	end
end

function ISInventoryTransferAction:checkitemtakeit(item)
	if item:getType() == "GoldenSkull" then
		self.character:getEmitter():playSound("WoodDoorLock");
	end
end

function ISInventoryTransferAction:checkskintimeputin(item)
	if item:getType() == "CowSkin" 
	  or item:getType() == "DeerSkin" 
	  or item:getType() == "BearSkin" 
	  or item:getType() == "SugarcanePile"
	  or item:getType() == "CheeseMoldFull"
	  or item:getType() == "CheeseMoldFull2"
	  or item:getType() == "CheeseMoldFull3"	  then
		local data = item:getModData();
		local ItemName = "";
		local animal = false;
		local hoursneeded = 360;
		local State = getText("Tooltip_NotCured");
		if item:getType() == "CowSkin" then
			ItemName = getItemText("Cow_skin");
			animal = true;
			hoursneeded = 360;
		elseif item:getType() == "DeerSkin" then
			ItemName = getItemText("Deer_skin");
			animal = true;
			hoursneeded = 168;
		elseif item:getType() == "BearSkin" then
			ItemName = getItemText("Bear_skin");
			animal = true;
			hoursneeded = 360;
		elseif item:getType() == "SugarcanePile" then
			ItemName = getItemText("Sugarcane_Pile");
			animal = false;
			hoursneeded = 72;
			State = getText("Tooltip_Green");
		elseif item:getType() == "CheeseMoldFull" then
			ItemName = getItemText("Cheese_in_Mold");
			animal = false;
			hoursneeded = 20;
			State = getText("Tooltip_NotFinished");
		elseif item:getType() == "CheeseMoldFull2" then
			ItemName = getItemText("BarCheese_in_Mold");
			animal = false;
			hoursneeded = 14;
			State = getText("Tooltip_NotFinished");
		elseif item:getType() == "CheeseMoldFull3" then
			ItemName = getItemText("Mozzarella_in_Mold");
			animal = false;
			hoursneeded = 12;
			State = getText("Tooltip_NotFinished");
		else
		end
		if not data.dry then
			data.dry = 0;
		end
		if not data.IsInside then
			data.IsInside = 1;
		end
		if data.dry == 0 then
			if not data.hoursneeded then
				data.hoursneeded = hoursneeded;
			end
			if not data.initialhour then
				data.initialhour = getGameTime():getWorldAgeHours();
			end
			item:setName(ItemName .. " " .. State);
		end
		if not animal then
			if data.dry == 2 then
				data.initialhour = getGameTime():getWorldAgeHours();
				data.IsInside = 1;
			end
		end
	end
end

function ISInventoryTransferAction:checkskintimetakeit(item)
	if item:getType() == "CowSkin" 
	  or item:getType() == "DeerSkin"
	  or item:getType() == "BearSkin"
	  or item:getType() == "SugarcanePile"
	  or item:getType() == "CheeseMoldFull"
	  or item:getType() == "CheeseMoldFull2"
	  or item:getType() == "CheeseMoldFull3"then
		local data = item:getModData();
		local ItemName = "";
		local State = getText("Tooltip_Cured");
		local animal = false;
		if item:getType() == "CowSkin" then
			ItemName = getItemText("Cow_skin");
			animal = true;
		elseif item:getType() == "DeerSkin" then
			ItemName = getItemText("Deer_skin");
			animal = true;
		elseif item:getType() == "BearSkin" then
			ItemName = getItemText("Bear_skin");
			animal = true;
		elseif item:getType() == "SugarcanePile" then
			ItemName = getItemText("Sugarcane_Pile");
			State = getText("Tooltip_Dry");
		elseif item:getType() == "CheeseMoldFull" then
			ItemName = getItemText("Cheese_in_Mold");
			State = getText("Tooltip_Finished");
		elseif item:getType() == "CheeseMoldFull2" then
			ItemName = getItemText("BarCheese_in_Mold");
			State = getText("Tooltip_Finished");
		elseif item:getType() == "CheeseMoldFull3" then
			ItemName = getItemText("Mozzarella_in_Mold");
			State = getText("Tooltip_Finished");
		else
		end
		if not data.dry then
			data.dry = 0;
		end
		if data.dry == 0 then
			if getGameTime():getWorldAgeHours() - data.initialhour  >= data.hoursneeded then
				data.dry = 1;
				item:setName(ItemName .. " " .. State);
				--if item:getType() == "SugarcanePile" then
					--local newTexture = item:getTexture():setName("media/textures/Item_CanePileDry.png");
					--item:setTexture(newTexture);
					--item:setTexture(getTexture("media/textures/Item_CanePileDry.png"))
				--end
			else
				if not data.timetake then
					data.timetake = getGameTime():getWorldAgeHours() - data.initialhour;
					data.initialhour = data.timetake;
				end
				if animal then
					State = getText("Tooltip_Ruined");
				else
					if item:getType() == "SugarcanePile" then
						State = getText("Tooltip_Green");
					else
						State = getText("Tooltip_NotFinished");
					end
				end
				item:setName(ItemName .. " " .. State);
				data.dry = 2;
			end
		else
			if not animal then
				if data.dry and data.dry == 2 then
					if data.timetake then
						if (data.timetake + (getGameTime():getWorldAgeHours() - data.initialhour))  >= data.hoursneeded then
							data.dry = 1;
							item:setName(ItemName .. " " .. State);
						else
							data.timetake = data.timetake + (getGameTime():getWorldAgeHours() - data.initialhour);
							data.initialhour = data.timetake;
						end
					end
				end
			end
		end
		data.IsInside = 0;
	end
end

function ISInventoryTransferAction:reduceweightonputin(item)
	local itemdata = item:getModData();
	if not itemdata.bweight then
		itemdata.bweight = item:getActualWeight();
	end
	item:setActualWeight((itemdata.bweight * 0.5));
    item:setWeight(item:getActualWeight());
    item:setCustomWeight(true)
end

function ISInventoryTransferAction:restoreweightontake(item)
	local itemdata = item:getModData();
	if itemdata.bweight then
		item:setActualWeight(itemdata.bweight);
		item:setWeight(item:getActualWeight());
		item:setCustomWeight(true)
	end
end

-- local function IsActivatedMod(mod_Name)
    -- local mods = getActivatedMods();
    -- for i=0, mods:size()-1, 1 do
        -- if mods:get(i) == mod_Name then
            -- return true;
        -- end
    -- end
    -- return false;
-- end