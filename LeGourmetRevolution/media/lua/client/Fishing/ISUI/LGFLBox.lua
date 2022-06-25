--Made by Snake
LGFLBox = {};


LGFLBox.doMenu = function(player, context, items)

	if AMBaseGameCharacterDetails then return end;

	local FLB = nil;

	for i,v in ipairs(items) do
		local tempitem = v;
        if not instanceof(v, "InventoryItem") then
            tempitem = v.items[1];
        end
		if tempitem:getType() == "LeadFishingbox" or
		    tempitem:getType() == "LeadFishingbox2" or
			tempitem:getType() == "LeadFishingbox3" or
			tempitem:getType() == "LeadFishingbox4" or
			tempitem:getType() == "LeadFishingbox5" then
			FLB = tempitem;
		end
	end

	if FLB then
        if FLB:isEquipped() or
    	    (not getSpecificPlayer(player):getBodyDamage():getBodyPart(BodyPartType.Hand_R):isDeepWounded() and (getSpecificPlayer(player):getBodyDamage():getBodyPart(BodyPartType.Hand_R):getFractureTime() == 0 or getSpecificPlayer(player):getBodyDamage():getBodyPart(BodyPartType.Hand_R):getSplintFactor() > 0)) or
		    (not getSpecificPlayer(player):getBodyDamage():getBodyPart(BodyPartType.Hand_L):isDeepWounded() and (getSpecificPlayer(player):getBodyDamage():getBodyPart(BodyPartType.Hand_L):getFractureTime() == 0 or getSpecificPlayer(player):getBodyDamage():getBodyPart(BodyPartType.Hand_L):getSplintFactor() > 0)) then
            local option = context:addOption(getText("ContextMenu_OpenLGFLB"), FLB, LGFLBox.OpenFLB_OnCreate, player);
			local tooltip = ISWorldObjectContextMenu.addToolTip();
		    tooltip:setName(getText("ContextMenu_OpenLGFLB"));
		    tooltip.description = tooltip.description .. getText("ContextMenu_OpenLGFLBTT");
		    tooltip:setTexture(FLB:getTexture():getName());
		    option.toolTip = tooltip;
        end
	end
end

LGFLBox.OpenFLB_OnCreate = function(item, playernum)

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
	ISTimedActionQueue.add(OpenLGFLBAction:new(player, item, time));
end

Events.OnFillInventoryObjectContextMenu.Add(LGFLBox.doMenu);