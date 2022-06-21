--Made by Snake
LGManualMenu = {};

LGManualMenu.doMenu = function(player, context, items)

	local manual = nil;
	
	for i,v in ipairs(items) do
		local tempitem = v;
        if not instanceof(v, "InventoryItem") then
            tempitem = v.items[1];
        end
		if tempitem:getType() == "ManualLG" then
			manual = tempitem;
		end
	end
	
	if manual then
		local option = context:addOption(getText("ContextMenu_OpenLGManual"), manual, LGManualMenu.OpenManual_OnCreate, player);
		local tooltip = ISWorldObjectContextMenu.addToolTip();
		tooltip:setName(getText("ContextMenu_LGManual"));
		tooltip.description = tooltip.description .. getText("ContextMenu_LGManualTT");
		tooltip:setTexture(manual:getTexture():getName());
		option.toolTip = tooltip;
	end
end

LGManualMenu.OpenManual_OnCreate = function(item, playernum)

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

	ISTimedActionQueue.add(LGOpenGuideAction:new(player, item, nil))

end

Events.OnFillInventoryObjectContextMenu.Add(LGManualMenu.doMenu);