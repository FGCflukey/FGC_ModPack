--***********************************************************
--**               LEMMY/ROBERT JOHNSON                    **
--***********************************************************
require "ISUI/ISPanel"
require "ISUI/ISButton"
require "ISUI/ISMouseDrag"
require "TimedActions/ISTimedActionQueue"
require "TimedActions/ISEatFoodAction"
require "ISUI/ISInventoryPane"

function ISInventoryPane:refreshContainer()
    self.itemslist = {}
    self.itemindex = {}

    if self.collapsed == nil then
        self.collapsed = {}
    end
	if self.selected == nil then
		self.selected = {}
	end

	local selected = self:saveSelection({})
	table.wipe(self.selected)

    local playerObj = getSpecificPlayer(self.player)

	if not self.hotbar then
		self.hotbar = getPlayerHotbar(self.player);
	end

	local isEquipped = {}
	local isInHotbar = {}
	if self.parent.onCharacter then
		local wornItems = playerObj:getWornItems()
		for i=1,wornItems:size() do
			local wornItem = wornItems:get(i-1)
			isEquipped[wornItem:getItem()] = true
		end
		local item = playerObj:getPrimaryHandItem()
		if item then
			isEquipped[item] = true
		end
		item = playerObj:getSecondaryHandItem()
		if item then
			isEquipped[item] = true
		end
		if self.hotbar and self.hotbar.attachedItems then
			for _,item in pairs(self.hotbar.attachedItems) do
				isInHotbar[item] = true
			end
		end
	end

	local it = self.inventory:getItems();
    for i = 0, it:size()-1 do
        local item = it:get(i);
		local add = true;
		-- don't add the ZedDmg category, they are just equipped models
		if item:isHidden() then
			add = false;
		end
		if add then
			local itemName = item:getName();
			if item:IsFood() and item:getHerbalistType() and item:getHerbalistType() ~= "" then
				if playerObj:isRecipeKnown("Herbalist") then
					if item:getHerbalistType() == "Berry" then
						itemName = (item:getPoisonPower() > 0) and getText("IGUI_PoisonousBerry") or getText("IGUI_Berry")
					end
					if item:getHerbalistType() == "Mushroom" then
						itemName = (item:getPoisonPower() > 0) and getText("IGUI_PoisonousMushroom") or getText("IGUI_Mushroom")
					end
				else
					if item:getHerbalistType() == "Berry"  then
						itemName = getText("IGUI_UnknownBerry")
					end
					if item:getHerbalistType() == "Mushroom" then
						itemName = getText("IGUI_UnknownMushroom")
					end
				end
				if itemName ~= item:getDisplayName() then
					item:setName(itemName);
				end
				itemName = item:getName()
			end
			DoModSystem(item)
			local equipped = false
			local inHotbar = false
			if self.parent.onCharacter then
				if isEquipped[item] then
					itemName = "equipped:"..itemName
					equipped = true
				elseif item:getType() == "KeyRing" and playerObj:getInventory():contains(item) then
					itemName = "keyring:"..itemName
					equipped = true
				end
				if self.hotbar then
					inHotbar = isInHotbar[item];
					if inHotbar and not equipped then
						itemName = "hotbar:"..itemName
					end
				end
			end
			if self.itemindex[itemName] == nil then
				self.itemindex[itemName] = {};
				self.itemindex[itemName].items = {}
				self.itemindex[itemName].count = 0
			end
			local ind = self.itemindex[itemName];
			ind.equipped = equipped
			ind.inHotbar = inHotbar;

			ind.count = ind.count + 1
			ind.items[ind.count] = item;
		end
    end

    for k, v in pairs(self.itemindex) do

        if v ~= nil then
            table.insert(self.itemslist, v);
            local count = 1;
			local weight = 0;
            for k2, v2 in ipairs(v.items) do
                if v2 == nil then
                    table.remove(v.items, k2);
                else
                    count = count + 1;
					weight = weight + v2:getUnequippedWeight();
                end
            end
            v.count = count;
            v.invPanel = self;
            v.name = k -- v.items[1]:getName();
            v.cat = v.items[1]:getDisplayCategory() or v.items[1]:getCategory();
			v.weight = weight;
            if self.collapsed[v.name] == nil then
                self.collapsed[v.name] = true;
            end
        end
    end


    --print("Preparing to sort inv items");
    table.sort(self.itemslist, self.itemSortFunc );
    
    -- Adding the first item in list additionally at front as a dummy at the start, to be used in the details view as a header.
    for k, v in ipairs(self.itemslist) do
        local item = v.items[1];
        table.insert(v.items, 1, item);
    end

    self:restoreSelection(selected);
    table.wipe(selected);
    
    self:updateScrollbars();
    self.inventory:setDrawDirty(false);

    -- Update the buttons
    if self:isMouseOver() then
        self:onMouseMove(0, 0)
    end
end

function DoModSystem(itm)
	local LeGourmetMod = nil;
	if LGBaseGameCharacterDetails then
		LeGourmetMod = true;
	end
	local PMRMod = nil;
	if TiresMenu then
		PMRMod = true;
	end
	if PMRMod ~= nil then
		if itm:getType() == "DismountedTire" then
			local txt = "";
			if itm:getCondition() and itm:getConditionMax() then
				txt = getText("Tooltip_weapon_Condition") .. ": " .. tostring(itm:getCondition()) .. "/" .. tostring(itm:getConditionMax())
			end
			if itm:getTooltip() ~= txt then
				itm:setTooltip(txt)
			end
		end
		if itm:getType() == "CarRim" then
			local txt = "";
			if itm:getCondition() and itm:getConditionMax() then
				txt = getText("Tooltip_weapon_Condition") .. ": " .. tostring(itm:getCondition()) .. "/" .. tostring(itm:getConditionMax())
			end
			if itm:getTooltip() ~= txt then
				itm:setTooltip(txt)
			end
		end
	end
	if LeGourmetMod ~= nil then
		if itm:getType() == "VHS_Retail" then
			if itm:getName() == "RM_fa55f437-59c8-4277-aca2-561hunting01" then
				itm:setName(getText("IGUI_VHSHunting1"))
			end
			if itm:getName() == "RM_fa55f437-59c8-4277-aca1-561hunting02" then
				itm:setName(getText("IGUI_VHSHunting2"))
			end
		end
		if itm:getType() == "BadPorkChop" 
		  or itm:getType() == "BadCowChop" 
		  or itm:getType() == "BadMuttonChop" 
		  or itm:getType() == "BadDeerChop" 
		  or itm:getType() == "BadBearChop" 
		  or itm:getType() == "BadBisonChop" 
		  or itm:getType() == "BadMooseChop" then
			local Data = itm:getModData();
			if Data.Tenderize and Data.Tenderize == "1" then
				if itm:getTooltip() ~= nil and itm:getTooltip() ~= getText("Tooltip_AlreadyChopped") then
					itm:setTooltip(getText("Tooltip_AlreadyChopped"))
				end
			end
		end
		if itm:getType() == "BaitFish"
		  or itm:getType() == "Crab"
		  or itm:getType() == "Crayfish"
		  or itm:getType() == "Dentudo"
		  or itm:getType() == "Anguila"
		  or itm:getType() == "Palometa"
		  or itm:getType() == "Piranha"
		  or itm:getType() == "Crappie"
		  or itm:getType() == "Panfish"
		  or itm:getType() == "Payara"
		  or itm:getType() == "Carp"
		  or itm:getType() == "Peje"
		  or itm:getType() == "Waterturtle"
		  or itm:getType() == "Perch"
		  or itm:getType() == "Bass"
		  or itm:getType() == "Trout"
		  or itm:getType() == "Catfish"
		  or itm:getType() == "Dorado"
		  or itm:getType() == "Tucunare"
		  or itm:getType() == "Pacu"
		  or itm:getType() == "Tararira"
		  or itm:getType() == "Walleye"
		  or itm:getType() == "Pati"
		  or itm:getType() == "Snakehead"
		  or itm:getType() == "Pike"
		  or itm:getType() == "Arowana"
		  or itm:getType() == "FSalmon"
		  or itm:getType() == "RainbowTrout"
		  or itm:getType() == "Tarpon"
		  or itm:getType() == "Surubi"
		  or itm:getType() == "Piraiba"
		  or itm:getType() == "Rtcatfish"
		  or itm:getType() == "Arapaima"
		  or itm:getType() == "Ray" then
			local data = itm:getModData();
			if not data.alive then
				data.alive = 0;
			end
			if itm:getHeat() > 1.6 then
				data.alive = 0;
			end
			if itm:getFreezingTime() >= 30 then
				data.alive = 0;
			end
			if itm:isFrozen() or itm:isCooked() or itm:isRotten() then
				data.alive = 0;
			end
			if data.alive and data.alive == 1 then
				if data.catchingmin and data.mtodie then
					local actualhours = (getGameTime():getWorldAgeHours()*60) - data.catchingmin;
					if actualhours > data.mtodie then
						data.alive = 0;
					end
					if data.alive == 0 then
						if data.namechange and data.namechange == 1 then
							if data.origname then
							
								itm:setName(data.origname .. " " .. getText("IGUI_Dead2"));
							end
							data.namechange = 0;
						end
					end
				end
			else
				if data.namechange and data.namechange == 1 then
					if data.origname then
						itm:setName(data.origname .. " " .. getText("IGUI_Dead2"));
					end
					data.namechange = 0;
				else
					if not data.origname then
						data.origname = getItemText(itm:getDisplayName());
						itm:setName(data.origname .. " " .. getText("IGUI_Dead2"));
						data.namechange = 0;
					end
				end				
			end
		end

		if itm:getType() == "CowSkin" 
		  or itm:getType() == "DeerSkin" 
		  or itm:getType() == "BearSkin" 
		  or itm:getType() == "SugarcanePile"
		  or itm:getType() == "CheeseMoldFull"
		  or itm:getType() == "CheeseMoldFull2"
		  or itm:getType() == "CheeseMoldFull3" then
			local itemdata = itm:getModData();
			local ItemNm = "";
			local animal = false;
			local State = getText("Tooltip_Cured");
			if itm:getType() == "CowSkin" then
				ItemNm = getItemText("Cow_skin");
				animal = true;
			elseif itm:getType() == "DeerSkin" then
				ItemNm = getItemText("Deer_skin");
				animal = true;
			elseif itm:getType() == "BearSkin" then
				ItemNm = getItemText("Bear_skin");
				animal = true;
			elseif itm:getType() == "SugarcanePile" then
				ItemNm = getItemText("Sugarcane_Pile");
			elseif itm:getType() == "CheeseMoldFull" then
				ItemNm = getItemText("Cheese_in_Mold");
			elseif itm:getType() == "CheeseMoldFull2" then
				ItemNm = getItemText("BarCheese_in_Mold");
			elseif itm:getType() == "CheeseMoldFull3" then
				ItemNm = getItemText("Mozzarella_in_Mold");
			else
			end
			if (not itemdata.dry) or (itemdata.dry == 0) then
				--itemdata.dry = 0;
				if itm:getContainer() and itm:getContainer():getType() == "floor" then
					if itemdata.dry == 0 then
						if animal then
							itemdata.dry = 2;
							itm:setName(ItemNm .. " " .. getText("Tooltip_Ruined"));
							if itemdata.initialhour then
								if not itemdata.timetake then
									itemdata.timetake = getGameTime():getWorldAgeHours() - itemdata.initialhour;
								end
							end
						
						end
						if itemdata.IsInside and itemdata.IsInside == 1 then
							itemdata.IsInside = 0;
						end
					end
				end
				--if animal then
					if itemdata.hoursneeded and itemdata.initialhour then
						local actualhours = getGameTime():getWorldAgeHours() - itemdata.initialhour;
						if actualhours >= itemdata.hoursneeded then
							itemdata.dry = 1;
							if animal then
								State = getText("Tooltip_Cured");
							else
								if itm:getType() == "SugarcanePile" then
									State = getText("Tooltip_Dry");
								else
									State = getText("Tooltip_Finished");
								end
							end
						else
							if animal then
								State = getText("Tooltip_NotCured");
							else
								if itm:getType() == "SugarcanePile" then
									State = getText("Tooltip_Green");
								else
									State = getText("Tooltip_NotFinished");
								end
							end
						end
						itm:setName(ItemNm .. " " .. State);
					end
				--end
			elseif itemdata.dry == 1 then
				if animal then
					State = getText("Tooltip_Cured");
				else
					if itm:getType() == "SugarcanePile" then
						State = getText("Tooltip_Dry");
					else
						State = getText("Tooltip_Finished");
					end
				end
				itm:setName(ItemNm .. " " .. State);
			else
				if animal then
					State = getText("Tooltip_Ruined");
				else
					if itm:getType() == "SugarcanePile" then
						State = getText("Tooltip_Green");
					else
						State = getText("Tooltip_NotFinished");
					end
				end

				itm:setName(ItemNm .. " " .. State);
			end
		end
	end
	if itm:getType() == "ZAWBrick" 
	  or itm:getType() == "ZAWConcreteBrick"
	  or itm:getType() == "ZAWBrickPack" then
		if itm:getContainer() and itm:getContainer():getType() == "floor" then
			local itemdata = itm:getModData();
			if itemdata.bweight then
				if itemdata.bweight >= itm:getActualWeight() then
					itm:setActualWeight(itemdata.bweight);
					itm:setWeight(itm:getActualWeight());
					itm:setCustomWeight(true)
				end
			end
		end
		if itm:getContainer() and itm:getContainer():getType() == "brickpallet" then
			local itemdata = itm:getModData();
			if not itemdata.bweight then
				itemdata.bweight = itm:getActualWeight();
				itm:setActualWeight(itemdata.bweight * 0.5);
				itm:setWeight(itm:getActualWeight());
				itm:setCustomWeight(true)
			end
		end
	end
end