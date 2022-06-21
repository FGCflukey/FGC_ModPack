AFFNetMenu = {};
AFFNetMenu.fetchSquares = {}

local function predicateNotBroken(item)
	return not item:isBroken()
end

AFFNetMenu.clearFetch = function()
    canTrapFishes = false;
    woodentrapFish = nil;
	--AFFNetMenu.fetchSquares = {}
	table.wipe(AFFNetMenu.fetchSquares)
end

AFFNetMenu.fetch = function(v, player, doSquare)
	local playerObj = getSpecificPlayer(player)
	local playerInv = playerObj:getInventory()
    if instanceof(v, "IsoObject") and v:getSprite() and v:getSprite():getProperties() and v:getSprite():getProperties():Is(IsoFlagType.water) and playerInv:containsTypeRecurse("WoodenFishingNet") then
        canTrapFishes = true;
    end
    if instanceof(v, "IsoObject") and v:getName() == "WoodenFishingNet" and v:getSquare() then
        woodentrapFish = v;
    end
	AFFNetMenu.fetchSquares[v:getSquare()] = true
end

AFFNetMenu.initContextMenu = function(player, context, worldobjects)
	if getCore():getGameMode() == "Tutorial" then return end
	local playerObj = getSpecificPlayer(player)
	local playerInv = playerObj:getInventory()
	--if playerObj:isAsleep() then return end

	AFFNetMenu.clearFetch()
    for i,v in ipairs(worldobjects) do
		AFFNetMenu.fetch(v, player, true);
    end

   -- For fishing with the joypad, look around the player to find some water.
    local fishObject = worldobjects[1]
    if JoypadState.players[player+1] then
        local px = playerObj:getX()
        local py = playerObj:getY()
        local pz = playerObj:getZ()
        local net = playerInv:getFirstTypeRecurse("WoodenFishingNet")
        if net then
            for dy = -5,5 do
                for dx = -5,5 do
                    local square = getCell():getGridSquare(px + dx, py + dy, pz)
                    -- FIXME: is there a wall in between?
                    -- TODO: pick a square in the direction the player is facing.
                    if square and square:Is(IsoFlagType.water) and square:getObjects():size() > 0 then
                        if net then canTrapFishes = true end
                        fishObject = square:getObjects():get(0)
                        break
                    end
                end
                if canTrapFishes then break end
            end
        end
        for dy = -5,5 do
            for dx = -5,5 do
                local square = getCell():getGridSquare(px + dx, py + dy, pz)
                -- FIXME: is there a wall in between?
                -- TODO: pick a square in the direction the player is facing.
                if square and square:Is(IsoFlagType.water) and square:getObjects():size() > 0 then
                    for i = 0,square:getObjects():size()-1 do
                        local v = square:getObjects():get(i)
                        if instanceof(v, "IsoObject") and v:getName() == "WoodenFishingNet" then
                            woodentrapFish = v
                            break
                        end
                    end
                    if woodentrapFish then break end
                end
            end
        end
	end
	
    -- Fishing
    if canTrapFishes then
        if test == true then return true; end
        suboption = context:addOption(getText("ContextMenu_Place_Wooden_Fishing_Net"), worldobjects, AFFNetMenu.onFishingNet, playerObj)
        if storeWater:getSquare():DistToProper(getSpecificPlayer(player):getCurrentSquare()) >= 5 then
            suboption.notAvailable = true;
        end
    end
    if woodentrapFish then
       if test == true then return true; end
       local hourElapsed = math.floor(((getGameTime():getCalender():getTimeInMillis() - woodentrapFish:getSquare():getModData()["fishingNetTS"]) / 60000) / 60);
       if hourElapsed > 0 then
           suboption = context:addOption(getText("ContextMenu_Check_Trap"), worldobjects, AFFNetMenu.onCheckFishingNet, playerObj, woodentrapFish, hourElapsed);
           if woodentrapFish:getSquare():DistToProper(playerObj:getSquare()) >= 5 then
               suboption.notAvailable = true;
           end
       end

       suboption = context:addOption(getText("ContextMenu_Remove_Trap"), worldobjects, AFFNetMenu.onRemoveFishingNet, playerObj, woodentrapFish);
       if woodentrapFish:getSquare():DistToProper(playerObj:getSquare()) >= 5 then
           suboption.notAvailable = true;
       end
    end
end

AFFNetMenu.onFishingNet = function(worldobjects, player)
    local net = WoodenfishingNet:new(player);
    getCell():setDrag(net, player:getPlayerNum());
end

AFFNetMenu.onCheckFishingNet = function(worldobjects, player, trap, hours)
    ISTimedActionQueue.add(ISCheckWoodenFishingNetAction:new(player, trap, hours));
end

AFFNetMenu.onRemoveFishingNet = function(worldobjects, player, trap)
    WoodenfishingNet.remove(trap, player);
end


Events.OnPreFillWorldObjectContextMenu.Add(AFFNetMenu.initContextMenu);
