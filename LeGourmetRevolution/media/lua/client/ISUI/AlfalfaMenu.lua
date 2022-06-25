LGAlfalfa = {};
LGAlfalfa.initContextMenu = function(player, context, worldobjects)

	local playerObj = getSpecificPlayer(player)

	local alfalfa = nil;
	for _, object in ipairs(worldobjects) do
		if instanceof(object, "IsoObject") and object:getSprite() and (object:getSprite():getName() == "vegetation_farm_01_8" or object:getSprite():getName() == "vegetation_farm_01_9" or object:getSprite():getName() == "vegetation_farm_01_10" or object:getSprite():getName() == "vegetation_farm_01_11") and object:getSquare() and object:getSquare():DistToProper(playerObj:getSquare()) < 3 then
			alfalfa = object;
			break;
		end
	end

	if not alfalfa then return end;

    local objectData = alfalfa:getModData();

	local havealfalfa = 0;

    if not objectData.havealfalfa then
        if SandboxVars.FoodLoot == 1 then -- very poor
            objectData.havealfalfa = ZombRand(1,6);
		elseif SandboxVars.FoodLoot == 2 then -- poor
		    objectData.havealfalfa = ZombRand(5,11);
		elseif SandboxVars.FoodLoot == 3 then -- normal
		    objectData.havealfalfa = ZombRand(10,16);
	    elseif SandboxVars.FoodLoot == 4 then -- abundant
		    objectData.havealfalfa = ZombRand(16,21);
	    elseif SandboxVars.FoodLoot == 5 then -- very abundant
		    objectData.havealfalfa = ZombRand(20,31);
		end
        alfalfa:transmitModData();
    elseif objectData.havealfalfa < 1 then
        return;
    end
	
    local inventory = getSpecificPlayer(player):getInventory();
	local tridents = getSpecificPlayer(player):getInventory():getBestCondition("GardenFork");
	if alfalfa and objectData.havealfalfa > 1 and tridents and tridents:getCondition() > 0 then
		local object = alfalfa;
        local alfoption = context:addOption(getText("ContextMenu_TakeAlfalfa"), alfalfa, LGAlfalfa.Takealfalfa, player, object);
		LGAlfalfa.addToolTip(alfoption)
	end
end

LGAlfalfa.addToolTip = function(option)
    local toolTip = ISInventoryPaneContextMenu.addToolTip();
    toolTip:setName(getText("ContextMenu_TakeAlfalfa"));
    toolTip.description = " <RGB:1,1,1>" .. getText("ContextMenu_TakeAlfalfaTT") .. " <LINE> ";
    toolTip:setTexture("media/textures/Item_Alfalfa.png");
	option.toolTip = toolTip;
    return toolTip;
end

LGAlfalfa.Takealfalfa = function(alfalfa, player, object)
	local playerObj = getSpecificPlayer(player);
    if luautils.walkAdj(playerObj, alfalfa:getSquare()) then
	    local item = playerObj:getInventory():getItemFromType("GardenFork");
	    if not item:isEquipped() then
		    ISTimedActionQueue.add(ISEquipWeaponAction:new(playerObj, item, 50, true, true))
	    end
        -- make some noise
        ISTimedActionQueue.add(LGAlfalfaAction:new(playerObj, alfalfa, 200, object, item));
	end
end

Events.OnPreFillWorldObjectContextMenu.Add(LGAlfalfa.initContextMenu);