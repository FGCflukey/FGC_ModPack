require "BuildingObjects/ISBuildingObject"
require "Fishing/BuildingObjects/FishingNet"

fishingNet.checkTrap = function(player, trap, hours)
    -- the fishnet can broke !
    if hours > 15 and ZombRand(5) == 0 then
--        getSoundManager():PlayWorldSound("getFish", false, player:getSquare(), 1, 20, 1, false)
        player:playSound("CheckFishingNet");
        trap:getSquare():transmitRemoveItemFromSquare(trap);
        player:getInventory():AddItem("Base.BrokenFishingNet");
        return;
    end
    if hours > 20 then
        hours = 20;
    end
    for i=1,hours do
		local itemname = nil;
		local minlive = nil;
        if ZombRand(15) == 0 then
			itemname = "Base.BaitFish";
			minlive = 10;
        elseif ZombRand(20) == 0 then
			if ZombRand(2) == 0 then
				itemname = "AdvancedFishing.Crab";
			else
				itemname = "Base.Crayfish";
			end
			minlive = 720;
        elseif ZombRand(20) == 0 then
			itemname = "AdvancedFishing.Dentudo";
			minlive = 20;
        elseif ZombRand(20) == 0 then
			itemname = "AdvancedFishing.Anguila";
			minlive = 360;
        elseif ZombRand(20) == 0 then
			itemname = "Base.TreeBranch";
        elseif ZombRand(20) == 0 then
			itemname = "Base.Twigs";
        elseif ZombRand(30) >= 24 then
            if ZombRand(2) == 0 then
				itemname = "AdvancedFishing.Algae";
			else
				itemname = "AdvancedFishing.Algae2";
			    player:getInventory():AddItem("AdvancedFishing.Algae2");
			end
        end
		if itemname ~= nil then
			local item = InventoryItemFactory.CreateItem(itemname);
			if itemname == "Base.BaitFish" or 
			  itemname == "AdvancedFishing.Crab" or
			  itemname == "Base.Crayfish" or
			  itemname == "AdvancedFishing.Dentudo" or
			  itemname == "AdvancedFishing.Anguila" then
				data = item:getModData();
				if not data.alive then
					data.alive = 1;
				end
				if not data.catchinghour then
					data.catchingmin = getGameTime():getWorldAgeHours()*60;
				end
				if not data.mtodie then
					data.mtodie = tonumber(LGFTD[tostring(item:getType())][1]);
				end
				if not data.namechange then
					if not data.origname then
						data.origname = getItemText(item:getDisplayName());
					end
					data.namechange = 1;
					item:setName(getItemText(item:getDisplayName()) .. " " .. getText("IGUI_Alive2"));
				end
			end
			player:getXp():AddXP(Perks.Fishing, 1);
			player:getInventory():AddItem(item);
		end
    end
    fishingNet.doTimestamp(trap);
end
