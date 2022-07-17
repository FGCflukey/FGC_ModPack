--Made by Snake
ViewInstructionsMenu = {};

ViewInstructionsMenu.doMenu = function(player, context, items)

	local pl = getSpecificPlayer(player);
	if not pl:HasTrait("Illiterate") then

		local SeedPacket = nil;
        local SeedBook = nil;
	    for i,v in ipairs(items) do
		    local tempitem = v;
            if not instanceof(v, "InventoryItem") then
                tempitem = v.items[1];
            end
			if LGRSeedPacketDef[tempitem:getType()] then
				SeedPacket = tempitem;
			end
			if tempitem:getType() == "SeedBook" then
				SeedBook = tempitem;
			end
        end

	    if SeedPacket then
			local option = context:addOption(getText("ContextMenu_View_Instructions"), SeedPacket, ViewInstructionsMenu.View_OnCreate, pl);
			ViewInstructionsMenu.Tooltip(option, pl, SeedPacket)
	    end
	    if SeedBook then
			local option = context:addOption("Learn All Sowing Recipes", SeedBook, ViewInstructionsMenu.LearnAll, pl);
	    end
	end
end

ViewInstructionsMenu.LearnAll = function(item, playerObj, RecipetoLearn, Recipetranslation)
    for key,values in pairs(LGRSeedPacketDef) do
        local seed_packet = nil
        seed_packet = InventoryItemFactory.CreateItem("Greenfire." .. key)
        if seed_packet == nil then
            seed_packet = InventoryItemFactory.CreateItem("legourmetfarming." .. key)
        end
        if seed_packet == nil then
            seed_packet = InventoryItemFactory.CreateItem("farming." .. key)
        end
        if seed_packet == nil then
            return
        end
        ISTimedActionQueue.add(LGLearnRecipeAction:new(playerObj, seed_packet, 20))
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