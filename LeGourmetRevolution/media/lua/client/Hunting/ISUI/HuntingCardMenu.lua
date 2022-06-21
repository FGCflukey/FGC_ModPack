--Made by Snake
HuntingCardsMenu = {};

HuntingCardsMenu.doMenu = function(player, context, items)
	local pl = getPlayer();
	if not pl:HasTrait("Illiterate") then
	    
		local HCard = nil;
	
		for i,v in ipairs(items) do
			local tempitem = v;
			if not instanceof(v, "InventoryItem") then
				tempitem = v.items[1];
			end
			if tempitem:getType() == "HuntingCard1" or 
			  tempitem:getType() == "HuntingCard2" or
			  tempitem:getType() == "HuntingCard3" or
			  tempitem:getType() == "HuntingCard4" or
			  tempitem:getType() == "HuntingCard5" or
			  tempitem:getType() == "HuntingCard6" or 
			  tempitem:getType() == "HuntingCard7" or 
			  tempitem:getType() == "HuntingCard8" or
			  tempitem:getType() == "HuntingCard9" or
			  tempitem:getType() == "HuntingCard10"then
				HCard = tempitem;
			end
		end
	
		if HCard then
			local option = context:addOption((getText("ContextMenu_Read") .. " " .. HCard:getDisplayName()), HCard, HuntingCardsMenu.ViewHCard_OnCreate, player);
			local tooltip = ISWorldObjectContextMenu.addToolTip();
			tooltip:setName(getText("ContextMenu_Read") .. " " .. HCard:getDisplayName());
			tooltip.description = tooltip.description .. getText("ContextMenu_OpenHcardTT");
			tooltip:setTexture(HCard:getTexture():getName());
			option.toolTip = tooltip;
		end
	end
end


HuntingCardsMenu.ViewHCard_OnCreate = function(item, playernum)

	local player = getSpecificPlayer(playernum)
	
	-- check if needs to be moved
	if luautils.haveToBeTransfered(player, item) then
		ISTimedActionQueue.add(ISInventoryTransferAction:new(player, item, item:getContainer(), player:getInventory()));
	end
	
	if not item:isEquipped() then	
		-- equip the item first
		ISTimedActionQueue.add(ISEquipWeaponAction:new(player, item, 50, true, false))
	end

	ISTimedActionQueue.add(ViewHuntingCardAction:new(player, item, nil));
end

Events.OnFillInventoryObjectContextMenu.Add(HuntingCardsMenu.doMenu);