AFThrowFishMenu = {};
local FTrow = nil;

function AFThrowFishMenu.createMenu(player, context, items)
	for i,v in ipairs(items) do
		local tempitem = v;
        if not instanceof(v, "InventoryItem") then
            tempitem = v.items[1];
        end
		if tempitem:getType() == "Ray" or 
		  tempitem:getType() == "Pacu" or
		  tempitem:getType() == "Arapaima" or
		  tempitem:getType() == "Piraiba" or
		  tempitem:getType() == "Rtcatfish" or
		  tempitem:getType() == "Tarpon" then
		    FTrow = tempitem;
		end
	end

	if FTrow then
	    local pl = getPlayer();
		local nontrowable = getSpecificPlayer(player):getInventory():contains("HuntingKnife") or getSpecificPlayer(player):getInventory():contains("KitchenKnife")
        if pl:getInventory():contains(FTrow) and FTrow:getActualWeight() > 50 and not nontrowable then
		    local option = context:addOption(getText("ContextMenu_TrowFish"), FTrow, AFThrowFishMenu.onDestroyItem, player);
			local tooltip = ISInventoryPaneContextMenu.addToolTip();
			tooltip:setName(getText("ContextMenu_TrowFish"));
            tooltip.description = getText("ContextMenu_TrowFishTT");
			tooltip:setTexture(FTrow:getTexture():getName());
            option.toolTip = tooltip;
		elseif pl:getInventory():contains(FTrow) and FTrow:getActualWeight() > 50 and nontrowable then
		else
		end
	end
end

function AFThrowFishMenu.onDestroyItem(item, playernum)
    local player = getSpecificPlayer(playernum)

	local time = 50;
	ISTimedActionQueue.add(AFTrowFishAction:new(player, item, time));
end

Events.OnPreFillInventoryObjectContextMenu.Add(AFThrowFishMenu.createMenu);