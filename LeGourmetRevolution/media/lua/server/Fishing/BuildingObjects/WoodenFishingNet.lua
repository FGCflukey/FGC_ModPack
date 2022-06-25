require "BuildingObjects/ISBuildingObject"

WoodenfishingNet = ISBuildingObject:derive("WoodenfishingNet");

--************************************************************************--
--** WoodenfishingNet:new
--**
--************************************************************************--
function WoodenfishingNet:create(x, y, z, north, sprite)
    local grid = getCell():getGridSquare(x, y, z);
    local net = IsoObject.new(grid, sprite, "WoodenFishingNet");
    grid:AddTileObject(net)
    net:transmitCompleteItemToServer();
    WoodenfishingNet.doTimestamp(net);
    local item = self.character:getPrimaryHandItem()
    if item and item:getType() == "WoodenFishingNet" then
        self.character:setPrimaryHandItem(nil)
        self.character:getInventory():Remove(item)
    else
        item = self.character:getSecondaryHandItem()
        if item and item:getType() == "WoodenFishingNet" then
            self.character:setSecondaryHandItem(nil)
            self.character:getInventory():Remove(item)
        else
            self.character:getInventory():RemoveOneOf("WoodenFishingNet");
        end
    end
    self.character:playSound("PlaceFishingNet");
    getCell():setDrag(nil, self.player);
end

function WoodenfishingNet:new(player)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o:init();
    o:setNorthSprite("carpentry_04_20");
    o:setSprite("carpentry_04_21");
    o.character = player
    o.player = player:getPlayerNum();
    o.skipBuildAction = true;
    o.skipWalk = true;
    return o;
end

function WoodenfishingNet:isValid(square, north)
    if not self.character:getInventory():contains("WoodenFishingNet") then return false end
    return square:DistToProper(self.character:getCurrentSquare()) < 5 and square:getProperties():Is(IsoFlagType.water);
end

function WoodenfishingNet:render(x, y, z, square)
    ISBuildingObject.render(self, x, y, z, square)
end

WoodenfishingNet.doTimestamp = function(net)
    net:getSquare():getModData()["fishingNetTS"] = getGameTime():getCalender():getTimeInMillis();
    net:getSquare():transmitModdata();
end

WoodenfishingNet.remove = function(net, player)
    net:getSquare():transmitRemoveItemFromSquare(net);
    player:getInventory():AddItem("AdvancedFishing.WoodenFishingNet");
    player:playSound("RemoveFishingNet");
end

WoodenfishingNet.checkTrap = function(player, trap, hours)
    if hours > 3 and ZombRand(3) == 0 then
	    player:playSound("PoolcueBreak");
        trap:getSquare():transmitRemoveItemFromSquare(trap);
        player:getInventory():AddItems("Base.Twigs", ZombRand(1,3));
        return;
    end
    if hours > 20 then
        hours = 20;
    end
    for i=1,hours do
		local itemname = nil;
		local minlive = nil;
        if ZombRand(10) == 0 then
			itemname = "Base.BaitFish";
			minlive = 10;
		elseif ZombRand(20) == 0 then
			if ZombRand(2) == 0 then
				itemname = "AdvancedFishing.Crab";
			else
				itemname = "Base.Crayfish";
			end
			minlive = 720;
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
			  itemname == "Base.Crayfish" then
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
    if ZombRand(5) == 0 then
	    player:playSound("PoolcueBreak");
        trap:getSquare():transmitRemoveItemFromSquare(trap);
        player:getInventory():AddItems("Base.Twigs", ZombRand(1,3));
        return;
    end
    WoodenfishingNet.doTimestamp(trap);
end
