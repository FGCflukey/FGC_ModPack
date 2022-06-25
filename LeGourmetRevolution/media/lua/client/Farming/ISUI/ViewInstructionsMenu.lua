--Made by Snake
ViewInstructionsMenu = {};

ViewInstructionsMenu.doMenu = function(player, context, items)

	local pl = getSpecificPlayer(player);
	if not pl:HasTrait("Illiterate") then

		local SeedPacket = nil;
	    for i,v in ipairs(items) do
		    local tempitem = v;
            if not instanceof(v, "InventoryItem") then
                tempitem = v.items[1];
            end
			if LGRSeedPacketDef[tempitem:getType()] then
				SeedPacket = tempitem;
			end
		end

	    if SeedPacket then
			local option = context:addOption(getText("ContextMenu_View_Instructions"), SeedPacket, ViewInstructionsMenu.View_OnCreate, pl);
			ViewInstructionsMenu.Tooltip(option, pl, SeedPacket)
	    end
	end
end

ViewInstructionsMenu.Tooltip = function(option, pl, SeedPacket)
	local plrecipe = pl:getKnownRecipes();
	local result = true;
	local tooltip = ISInventoryPaneContextMenu.addToolTip();
	tooltip:setName(getText("ContextMenu_View_Instructions"));
	tooltip:setTexture(SeedPacket:getTexture():getName());
	if not plrecipe:contains(LGRSeedPacketDef[SeedPacket:getType()].recipetolearn) then
		tooltip.description = getText("ContextMenu_Learn") .. getText(LGRSeedPacketDef[SeedPacket:getType()].translation);
	else
		tooltip.description = "<RGB:1,0,0>" .. getText("ContextMenu_AlreadyLearned");
		result = false;
	end
	if not result then
		option.onSelect = nil;
		option.notAvailable = true;
    end
	option.toolTip = tooltip;
end

ViewInstructionsMenu.View_OnCreate = function(item, playerObj, RecipetoLearn, Recipetranslation)
	
	if luautils.haveToBeTransfered(playerObj, item) then
		ISTimedActionQueue.add(ISInventoryTransferAction:new(playerObj, item, item:getContainer(), playerObj:getInventory()));
	end	
	if not item:isEquipped() then
		local toPrimary = true;
		if not (not playerObj:getBodyDamage():getBodyPart(BodyPartType.Hand_R):isDeepWounded() and (playerObj:getBodyDamage():getBodyPart(BodyPartType.Hand_R):getFractureTime() == 0 or playerObj:getBodyDamage():getBodyPart(BodyPartType.Hand_R):getSplintFactor() > 0)) then
			toPrimary = false;
		elseif playerObj:getPrimaryHandItem() and not playerObj:getSecondaryHandItem() then
			if not playerObj:getBodyDamage():getBodyPart(BodyPartType.Hand_L):isDeepWounded() and (playerObj:getBodyDamage():getBodyPart(BodyPartType.Hand_L):getFractureTime() == 0 or playerObj:getBodyDamage():getBodyPart(BodyPartType.Hand_L):getSplintFactor() > 0) then
				toPrimary = false;
			end
		end

		ISTimedActionQueue.add(ISEquipWeaponAction:new(playerObj, item, 50, toPrimary, false))
	end
	ISTimedActionQueue.add(LGLearnRecipeAction:new(playerObj, item, 100));
end
Events.OnFillInventoryObjectContextMenu.Add(ViewInstructionsMenu.doMenu);