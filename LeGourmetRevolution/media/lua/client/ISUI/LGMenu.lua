--Made by Snake
LGMenu = {};


LGMenu.doMenu = function(player, context, items)

    local _inventory = getSpecificPlayer(player):getInventory();
	local WaffleBatter = nil;
	local BirdNest = nil;
	local Watercube = nil;
	
	for i,v in ipairs(items) do
		local tempitem = v;
        if not instanceof(v, "InventoryItem") then
            tempitem = v.items[1];
        end
		if tempitem:getType() == "WafflesPrep" then
			WaffleBatter = tempitem;
		end
		if tempitem:getType() == "BirdNest" then
			BirdNest = tempitem;
		end
		if tempitem:getType() == "WaterCubebox" then
			Watercube = tempitem;
		end
	end
	
	if Watercube ~= nil then
		context:addOption(getText("ContextMenu_Pour_on_Ground"), Watercube, LGMenu.PourOnGround_OnCreate, player);
		if Watercube:isFrozen() and Watercube:getFreezingTime() >= 80 then
			local option = context:addOption(getText("ContextMenu_TakeIceCubes"), Watercube, LGMenu.TakeIceCubes_OnCreate, player);
			local tooltip = ISWorldObjectContextMenu.addToolTip();
			tooltip:setName(getText("ContextMenu_TakeIceCubes"));
			tooltip.description = getItemText("Water_cube_box");
			tooltip:setTexture("media/textures/Item_cubeboxfull.png");
			option.toolTip = tooltip;
		end
	end
	
	if BirdNest ~= nil then
		local Nestoption = context:addOption(getText("ContextMenu_SearchOnNest"), BirdNest, LGMenu.OnsearchNest_OnCreate, player);
		local tooltip = ISWorldObjectContextMenu.addToolTip();
		tooltip:setName(getText("ContextMenu_SearchOnNest"));
		tooltip.description = tooltip.description .. getText("ContextMenu_SearchOnNestTT");
		tooltip:setTexture("Item_WildEggs");
		Nestoption.toolTip = tooltip;
	end
	if WaffleBatter and SandboxVars.ElecShutModifier > -1 and GameTime:getInstance():getNightsSurvived() < SandboxVars.ElecShutModifier then
		local option = context:addOption(getText("ContextMenu_CookWaffle"), WaffleBatter, LGMenu.CookWaffle_OnCreate, player);
		local tooltip = ISWorldObjectContextMenu.addToolTip();
		tooltip:setName(getText("ContextMenu_CookWaffle"));
		tooltip.description = tooltip.description .. getText("ContextMenu_CookWaffleTT");
		tooltip:setTexture("media/textures/Item_Wafflera.png");
		option.toolTip = tooltip;
	elseif WaffleBatter and SandboxVars.ElecShutModifier >= -1 and GameTime:getInstance():getNightsSurvived() > SandboxVars.ElecShutModifier then
		local zoneSize = 20; -- Tamaño de la zona a chequear;
		for z = 0, 3 do
			for x = getSpecificPlayer(player):getSquare():getX() - zoneSize, getSpecificPlayer(player):getSquare():getX() + zoneSize do
				for y = getSpecificPlayer(player):getSquare():getY() - zoneSize, getSpecificPlayer(player):getSquare():getY() + zoneSize do
					local Square = getSpecificPlayer(player):getCell():getGridSquare(x, y, z);
					if Square and Square:getGenerator() and Square:getGenerator():isActivated() then
						local option = context:addOption(getText("ContextMenu_CookWaffle"), WaffleBatter, LGMenu.CookWaffle_OnCreate, player);
						local tooltip = ISWorldObjectContextMenu.addToolTip();
						tooltip:setName(getText("ContextMenu_CookWaffle"));
						tooltip.description = tooltip.description .. getText("ContextMenu_CookWaffleTT");
						tooltip:setTexture("media/textures/Item_Wafflera.png");
						option.toolTip = tooltip;
					end
				end
			end
		end
	end
end

LGMenu.PourOnGround_OnCreate = function(item, playernum)

	local player = getSpecificPlayer(playernum)
	-- check if needs to be moved
	if luautils.haveToBeTransfered(player, item) then
		ISTimedActionQueue.add(ISInventoryTransferAction:new(player, item, item:getContainer(), player:getInventory()));
	end

    local time = 50;
	ISTimedActionQueue.add(PourJarAction:new(player, item, time));
end

LGMenu.CookWaffle_OnCreate = function(item, playernum)

	local player = getSpecificPlayer(playernum)
	-- check if needs to be moved
	if luautils.haveToBeTransfered(player, item) then
		ISTimedActionQueue.add(ISInventoryTransferAction:new(player, item, item:getContainer(), player:getInventory()));
	end
	
	if not item:isEquipped() then
		local toPrimary = true;
		if not (not getSpecificPlayer(playernum):getBodyDamage():getBodyPart(BodyPartType.Hand_R):isDeepWounded() and (getSpecificPlayer(playernum):getBodyDamage():getBodyPart(BodyPartType.Hand_R):getFractureTime() == 0 or getSpecificPlayer(playernum):getBodyDamage():getBodyPart(BodyPartType.Hand_R):getSplintFactor() > 0)) then
			-- Primary hand is damaged
			toPrimary = false;
		elseif player:getPrimaryHandItem() and not player:getSecondaryHandItem() then
			-- Primary hand has an item, but secondary is free
			if not getSpecificPlayer(playernum):getBodyDamage():getBodyPart(BodyPartType.Hand_L):isDeepWounded() and (getSpecificPlayer(playernum):getBodyDamage():getBodyPart(BodyPartType.Hand_L):getFractureTime() == 0 or getSpecificPlayer(playernum):getBodyDamage():getBodyPart(BodyPartType.Hand_L):getSplintFactor() > 0) then
				-- Secondary hand is not damaged, so secondary it is!
				toPrimary = false;
			end
		end
		
		-- equip the item first
		ISTimedActionQueue.add(ISEquipWeaponAction:new(player, item, 50, toPrimary, false))
	end

    local time = 300;
	ISTimedActionQueue.add(MakeWafflesAction:new(player, item, time));
end

LGMenu.OnsearchNest_OnCreate = function(item, playernum)
	local player = getSpecificPlayer(playernum)
	
	-- check if needs to be moved
	if luautils.haveToBeTransfered(player, item) then
		ISTimedActionQueue.add(ISInventoryTransferAction:new(player, item, item:getContainer(), player:getInventory()));
	end
	
	if not item:isEquipped() then
		local toPrimary = true;
		if not (not getSpecificPlayer(playernum):getBodyDamage():getBodyPart(BodyPartType.Hand_R):isDeepWounded() and (getSpecificPlayer(playernum):getBodyDamage():getBodyPart(BodyPartType.Hand_R):getFractureTime() == 0 or getSpecificPlayer(playernum):getBodyDamage():getBodyPart(BodyPartType.Hand_R):getSplintFactor() > 0)) then
			-- Primary hand is damaged
			toPrimary = false;
		elseif player:getPrimaryHandItem() and not player:getSecondaryHandItem() then
			-- Primary hand has an item, but secondary is free
			if not getSpecificPlayer(playernum):getBodyDamage():getBodyPart(BodyPartType.Hand_L):isDeepWounded() and (getSpecificPlayer(playernum):getBodyDamage():getBodyPart(BodyPartType.Hand_L):getFractureTime() == 0 or getSpecificPlayer(playernum):getBodyDamage():getBodyPart(BodyPartType.Hand_L):getSplintFactor() > 0) then
				-- Secondary hand is not damaged, so secondary it is!
				toPrimary = false;
			end
		end
		
		-- equip the item first
		ISTimedActionQueue.add(ISEquipWeaponAction:new(player, item, 50, toPrimary, false))
	end

    local time = 50;
	ISTimedActionQueue.add(OnSearchNestAction:new(player, item, time));
end

LGMenu.TakeIceCubes_OnCreate = function(item, playernum)
	local playerObj = getSpecificPlayer(playernum)
	
	if luautils.haveToBeTransfered(playerObj, item) then
		ISTimedActionQueue.add(ISInventoryTransferAction:new(playerObj, item, item:getContainer(), playerObj:getInventory()));
	end	
	ISTimedActionQueue.add(OnTakeIceCubesAction:new(playerObj, item, 100));
end
Events.OnFillInventoryObjectContextMenu.Add(LGMenu.doMenu);