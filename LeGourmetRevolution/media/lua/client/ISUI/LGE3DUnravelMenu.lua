--Made by Snake
LGE3DUnravelMenu = {};

local function predicateNotBroken(item)
	return not item:isBroken()
end

LGE3DUnravelMenu.doMenu = function(player, context, items)

    if ISInventoryPaneContextMenu.dontCreateMenu then return; end

	-- if the game is paused, we don't show the item context menu
	if UIManager.getSpeedControls():getCurrentGameSpeed() == 0 then
		return;
	end
	local clothingUnravel = nil;
	
    local testItem = nil;

	local item = nil;

    if clothingUnravel and item ~= nil then
		local tooltip = LGE3DUnravelMenu.doTooltip(nil, clothingUnravel);

		for i,k in pairs(items) do
			if not instanceof(k, "InventoryItem") then
				if #k.items > 2 then
					local option = context:addOption(getText("ContextMenu_UnravelClothing") .. " " .. clothingUnravel:getDisplayName(), items, nil, playerObj);
					local subMenu = context:getNew(context);
					context:addSubMenu(option, subMenu);
		
					local subMenuUnravelOption1 = subMenu:addOption(getText("ContextMenu_One"), items, LGE3DUnravelMenu.onUnravelClothing, playerObj, 1, item);
					subMenuUnravelOption1.toolTip = tooltip;
					local subMenuUnravelOption2 = subMenu:addOption(getText("ContextMenu_All"), items, LGE3DUnravelMenu.onUnravelClothing, playerObj, 2, item);
					subMenuUnravelOption2.toolTip = tooltip;
					break;
				else
					local option = context:addOption(getText("ContextMenu_UnravelClothing") .. " " .. clothingUnravel:getDisplayName(), items, LGE3DUnravelMenu.onUnravelClothing, playerObj, 1, item);
					option.toolTip = tooltip;
					break;
				end
			else
				local option = context:addOption(getText("ContextMenu_UnravelClothing") .. " " .. clothingUnravel:getDisplayName(), items, LGE3DUnravelMenu.onUnravelClothing, playerObj, 1, item);
				option.toolTip = tooltip;
				break;
			end
		end
    end
end

LGE3DUnravelMenu.onUnravelClothing = function(items, playerObj, directive, scissor)
	if scissor and scissor ~= nil then
		if luautils.haveToBeTransfered(playerObj, scissor) then
			-- transfer scissors
			ISTimedActionQueue.add(ISInventoryTransferAction:new(playerObj, scissor, scissor:getContainer(), playerObj:getInventory()));
		end
		if not scissor:isEquipped() then	
			-- equip scissors first
			ISTimedActionQueue.add(ISEquipWeaponAction:new(playerObj, scissor, 50, true, false))
		end
	end
	local count = 0;
	for i,k in ipairs(items) do
		if not instanceof(k, "InventoryItem") then
			if directive == 1 then
				count = math.floor((#k.items - 1) / (#k.items - 1))
			else
				count =  math.floor(#k.items - 1)
			end
			for i2=1,count do
				local k2 = k.items[i2+1]
				if luautils.haveToBeTransfered(playerObj, k2) then
					ISTimedActionQueue.add(ISInventoryTransferAction:new(playerObj, k2, k2:getContainer(), playerObj:getInventory()));
				end
				if not k2:isEquipped() then
					ISTimedActionQueue.add(ISEquipWeaponAction:new(playerObj, k2, 50, false, false))
				end
				ISTimedActionQueue.add(ISUnravelClothing:new(playerObj, k2, scissor, 100))
			end
		else
			if luautils.haveToBeTransfered(playerObj, k) then
				ISTimedActionQueue.add(ISInventoryTransferAction:new(playerObj, k, k:getContainer(), playerObj:getInventory()))
			end
			if not k:isEquipped() then
				ISTimedActionQueue.add(ISEquipWeaponAction:new(playerObj, k, 50, false, false))
			end
			ISTimedActionQueue.add(ISUnravelClothing:new(playerObj, k, scissor, 100))
		end
	end
end

LGE3DUnravelMenu.doTooltip = function(option, clothing)
	local tooltip = ISInventoryPaneContextMenu.addToolTip();
	tooltip:setName(getText("ContextMenu_UnravelClothing") .. " " .. clothing:getDisplayName());
    tooltip.description = getText("ContextMenu_UnravelTT") .. " <LINE> <LINE>" .. LGE3DUnravelMenu.getExtraDescription(clothing);
	tooltip:setTexture("media/textures/Item_Unravel.png");
	return tooltip
end

LGE3DUnravelMenu.getExtraDescription = function(clothing)
	local item = ClothingUnravelDefinitions[clothing:getType()]
	local materials = luautils.split(item.materials, ":");
	local itemtotranslate = InventoryItemFactory.CreateItem(materials[1]);
	local text = "<GREEN>" .. getText("ContextMenu_CanObtain") .. " <LINE>" .. tostring(materials[2]) .. " " .. itemtotranslate:getDisplayName() .. getText("ContextMenu_PerU") .. ". <LINE> <LINE> <ORANGE>" .. getText("ContextMenu_TailorAdvice");
	return text
end
Events.OnFillInventoryObjectContextMenu.Add(LGE3DUnravelMenu.doMenu);