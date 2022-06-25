----------------------------------------------------------------------------------
--
-- AFDigRWormMenu.lua
-- Parte del mod Advanced Fishing.
-- Creado por Snake.
--
--
-- Parte del codigo utilizado se encuentra en ISWorldObjectContextMenu.lua
-- los cuales han sido creados por Robert Johnson.
--
----------------------------------------------------------------------------------


AFDigRWormMenu = {};

local function predicateDigGrave(item)
    return not item:isBroken() and item:hasTag("DigGrave")
end

AFDigRWormMenu.doModData = function(grave)
	local objectData = grave:getModData();
	if not objectData.remainingcav then
		if SandboxVars.OtherLoot == 1 then -- very poor
			objectData.remainingcav = ZombRand(1,4);
		elseif SandboxVars.OtherLoot == 2 then -- poor
			objectData.remainingcav = ZombRand(1,6);
		elseif SandboxVars.OtherLoot == 3 then -- normal
			objectData.remainingcav = ZombRand(4,11);
		elseif SandboxVars.OtherLoot == 4 then -- abundant
			objectData.remainingcav = ZombRand(6,16);
		elseif SandboxVars.OtherLoot == 5 then -- very abundant
			objectData.remainingcav = ZombRand(10,21);
		end
		grave:transmitModData();
	elseif objectData.remainingcav < 1 then
		return;
	end
end

AFDigRWormMenu.doNewMenu = function(player, context, worldobjects, test)
	if test and ISWorldObjectContextMenu.Test then return true end

    if getCore():getGameMode()=="LastStand" then
        return;
    end
	local playerObj = getSpecificPlayer(player);
	if playerObj:getVehicle() then
		return
	end

	local gravestone = nil;

	for i,v in ipairs(worldobjects) do
		for i=0,v:getSquare():getObjects():size()-1 do
			local object = v:getSquare():getObjects():get(i);
			if instanceof(object, "IsoObject") and
			  object:getSprite() and
			  object:getSprite():getProperties() and
			  object:getSprite():getProperties():Val("CustomName") == "Gravestone" then
				
				gravestone = object;
				break;
			end
		end
	end
	if gravestone == nil then return;end
	local playerInv = playerObj:getInventory()
	local shovel = playerInv:getFirstEvalRecurse(predicateDigGrave);
	if gravestone ~= nil and shovel then
		AFDigRWormMenu.doModData(gravestone)
		if test == true then return true; end
		local square = gravestone:getSquare()
        local option = context:addOption(getText("ContextMenu_Scarvengewithshovel"), worldobjects, AFDigRWormMenu.onnewDigForRedWorm, square, player);
	        --local option = context:addOption(getText("ContextMenu_Scarvengewithshovel"), _RedWormSourceSquare, AFDigRWormMenu.onDigForRedWorm, playerObj, object, shovels);
        local tooltip = ISWorldObjectContextMenu.addToolTip();
        tooltip.description = getText("ContextMenu_ScarvengewithshovelTT");
        option.toolTip = tooltip;
	end
end

AFDigRWormMenu.onnewDigForRedWorm = function(worldobjects, square, player)
	local playerObj = getSpecificPlayer(player)
	local bo = ISLootGraveCursor:new(playerObj, "grave")
	getCell():setDrag(bo, player)
end

AFDigRWormMenu.doLootGrave = function(playerObj, square, grave)	
	if not grave or grave:getObjectIndex() == -1 then return end
	if luautils.walkAdj(playerObj, grave:getSquare(), true) then
		local handItem = playerObj:getPrimaryHandItem()
		if not handItem or not predicateDigGrave(handItem) then
			handItem = playerObj:getInventory():getFirstEvalRecurse(predicateDigGrave);
			if not handItem then return end
			local primary = true
			local twoHands = not playerObj:getSecondaryHandItem()
			ISWorldObjectContextMenu.equip(playerObj, playerObj:getPrimaryHandItem(), handItem, primary, twoHands)
		end
		ISTimedActionQueue.add(AFDigRedWormAction:new(playerObj, square, grave, handItem));
	end
end
Events.OnFillWorldObjectContextMenu.Add(AFDigRWormMenu.doNewMenu);