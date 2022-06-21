--Made by Snake
DrinksInfoMenu = {};

DrinksInfoMenu.doMenu = function(player, context, items)
	local pl = getPlayer();
	if not pl:HasTrait("Illiterate") then
	    
		local item = nil;
		local item2 = nil;
		local Info = "";
	
		for i,v in ipairs(items) do
			local tempitem = v;
			if not instanceof(v, "InventoryItem") then
				tempitem = v.items[1];
			end
			if tempitem:getType() == "Ginebra" then
				item  = tempitem;
				Info = "Tooltip_GinebraTT";
			end
			if tempitem:getType() == "DryVermouth" then
				item  = tempitem;
				Info = "Tooltip_DryVermouthTT";
			end
			if tempitem:getType() == "WhiteRum" then
				item  = tempitem;
				Info = "Tooltip_WhiteRumTT";
			end
			if tempitem:getType() == "Rum" then
				item  = tempitem;
				Info = "Tooltip_RumTT";
			end
			if tempitem:getType() == "Aguaardiente" then
				item  = tempitem;
				Info = "Tooltip_AguaardienteTT";
			end
			if tempitem:getType() == "TripleSec" then
				item  = tempitem;
				Info = "Tooltip_TriplesecTT";
			end
			if tempitem:getType() == "WhiteTequila" then
				item  = tempitem;
				Info = "Tooltip_WhiteTequilaTT";
			end
			if tempitem:getType() == "Beer1" then
				item  = tempitem;
				Info = "Tooltip_Beer1TT";
			end
			if tempitem:getType() == "Beer2" then
				item  = tempitem;
				Info = "Tooltip_Beer2TT";
			end
			if tempitem:getType() == "Beer3" then
				item  = tempitem;
				Info = "Tooltip_Beer3TT";
			end
			if tempitem:getType() == "BeerSixPack1" then
				item2  = tempitem;
				Info = "Tooltip_Beer1TT";
			end
			if tempitem:getType() == "BeerSixPack2" then
				item2  = tempitem;
				Info = "Tooltip_Beer2TT";
			end
			if tempitem:getType() == "BeerSixPack3" then
				item2  = tempitem;
				Info = "Tooltip_Beer3TT";
			end
		end
	
		if item or item2 then
			local ctext = "";
			local target;
			if item then
				ctext = "ContextMenu_Read_DrinkInfo";
				target = item;
			elseif item2 then
				ctext = "ContextMenu_Read_DrinkPackInfo";
				target = item2;
			end
			local option = context:addOption(getText(ctext), target, nil, player);
			local tooltip = ISWorldObjectContextMenu.addToolTip();
			tooltip:setName(target:getDisplayName());
			tooltip.description = tooltip.description .. getText(Info);
			tooltip:setTexture(target:getTexture():getName());
			option.toolTip = tooltip;
		end
	end
end

Events.OnFillInventoryObjectContextMenu.Add(DrinksInfoMenu.doMenu);