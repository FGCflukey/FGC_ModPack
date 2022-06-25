TMTrowAnimalMenu = {};
local ATrow = nil;

function TMTrowAnimalMenu.createMenu(player, context, items)
	for i,v in ipairs(items) do
		local tempitem = v;
        if not instanceof(v, "InventoryItem") then
            tempitem = v.items[1];
        end
		if tempitem:getType() == "DeadPork" or 
		  tempitem:getType() == "Jabalimeat" or
		  tempitem:getType() == "DeadCow" or 
		  tempitem:getType() == "Cowmeat" or
		  tempitem:getType() == "DeadBear" or 
		  tempitem:getType() == "BearMeat" then
		    ATrow = tempitem;
		end
	end

	if ATrow then
	    local pl = getPlayer();
		local nontrowable = getSpecificPlayer(player):getInventory():contains("KnifeDepostador");
        if pl:getInventory():contains(ATrow) and ATrow:getActualWeight() > 50 and (not nontrowable or getSpecificPlayer(player):getPerkLevel(Perks.Trapping) < 3) then
		    local option = context:addOption(getText("ContextMenu_TrowAnimal"), ATrow, TMTrowAnimalMenu.onDestroyItem, player);
			local tooltip = ISInventoryPaneContextMenu.addToolTip();
			tooltip:setName(getText("ContextMenu_TrowAnimal"));
            tooltip.description = getText("ContextMenu_TrowAnimalTT");
			tooltip:setTexture(ATrow:getTexture():getName());
            option.toolTip = tooltip;
		elseif pl:getInventory():contains(ATrow) and ATrow:getActualWeight() > 50 and nontrowable then
		else
		end
	end
end

function TMTrowAnimalMenu.onDestroyItem(item, playernum)
    local player = getSpecificPlayer(playernum)

	local time = 50;
	ISTimedActionQueue.add(TMTrowAnimalAction:new(player, item, time));
end

Events.OnPreFillInventoryObjectContextMenu.Add(TMTrowAnimalMenu.createMenu);