CoffeeGrinderMenu = {};
CoffeeGrinderMenu.doBuildMenu = function(player, context, worldobjects)

	if test and ISWorldObjectContextMenu.Test then return true end

    if getCore():getGameMode()=="LastStand" then
        return;
    end
	local playerObj = getSpecificPlayer(player);
	local playerInv = playerObj:getInventory();
	local CGrinder = nil;

	for i,v in ipairs(worldobjects) do
		for i=0,v:getSquare():getObjects():size()-1 do
			local object = v:getSquare():getObjects():get(i);
			if instanceof(object, "IsoObject") and
			  object:getSprite() and
			  object:getSprite():getProperties() and
			  ( object:getSprite():getProperties():Val("GroupName") == "Coffee" and object:getSprite():getProperties():Val("CustomName") == "Grinder") then
				CGrinder = object;
				break;
			end
		end
	end

	if CGrinder == nil then return;end
	
	if CGrinder ~= nil then
		--Menu Contextual y funcion de tooltip
		-- Titulo y creacion de submenu
		local nm1 = nil;
		local nm2 = nil;
		local mult = 1;
		if CGrinder:getContainer() and CGrinder:getContainer():getContentsWeight() > 0 then
			nm1 = CGrinder:getContainer():getItemFromType("ToastedCafeSeeds")
		end
		if playerInv:containsTypeRecurse("CoffeeEmpty") then	
			nm2 = playerInv:getFirstTypeRecurse("CoffeeEmpty");
		end

		local FirstTitle = context:addOption(getText("ContextMenu_CoffeeGrinder"), CGrinder, CoffeeGrinderMenu.onGrind, player, nm1, nm2);
		CoffeeGrinderMenu.HacerTooltip(CGrinder, playerObj, nm1, nm2, FirstTitle);
	end
end
CoffeeGrinderMenu.HacerTooltip = function(CGrinder, playerObj, item1, item2, _option)
	local playerInv = playerObj:getInventory();
	local tooltip = ISInventoryPaneContextMenu.addToolTip();
	_option.toolTip = tooltip;
	tooltip:setName(getText("ContextMenu_CoffeeGrinder"));
	tooltip.description = "<RGB:1,1,0>" .. getText("ContextMenu_CoffeeGrinderTT") .. " <LINE>" .. "<RGB:0.596078431372549,0.9843137254901961,0.596078431372549> <LINE> <LINE>" ..  getText("Tooltip_craft_Needs") .. " : ";

	tooltip:setTexture(CGrinder:getTextureName());
	tooltip.footNote = "";
	if item1 ~= nil then
		tooltip.description = tooltip.description .. "<LINE> <RGB:0,0.8,0>" .. getItemNameFromFullType(item1:getFullType()) .. " 1/1 ";
	else
		tooltip.description = tooltip.description .. "<LINE> <RGB:1,0,0>" .. getItemNameFromFullType("Base.ToastedCafeSeeds") .. " 0/1 ";
	end
	if item2 ~= nil then
		tooltip.description = tooltip.description .. "<LINE> <RGB:0,0.8,0>" .. getItemNameFromFullType(item2:getFullType()) .. " 1/1";
	else
		tooltip.description = tooltip.description .. "<LINE> <RGB:1,0,0>" .. getItemNameFromFullType("Base.CoffeeEmpty") .. " 0/1";
	end
	if item1 ~= nil and item2 ~= nil then
		-- nothing, we have all things!
	else
		_option.onSelect = nil;
		_option.notAvailable = true;
	end
end

CoffeeGrinderMenu.onGrind = function(CGrinder, player, item1, item2)
	local playerObj = getSpecificPlayer(player);
	if CGrinder and luautils.walkAdj(playerObj, CGrinder:getSquare()) then
		if item2 ~= nil then
			ISInventoryPaneContextMenu.transferIfNeeded(playerObj, item2)
			if not playerObj:hasEquipped(item2:getFullType()) then
				ISInventoryPaneContextMenu.equipWeapon(item2, true, false, player)
			end
		end
		ISTimedActionQueue.add(OnGrindCoffeeAction:new(playerObj, CGrinder, item1, item2));
	end
end

Events.OnFillWorldObjectContextMenu.Add(CoffeeGrinderMenu.doBuildMenu);
