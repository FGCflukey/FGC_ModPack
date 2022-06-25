MincerMenu = {};
local function predicateNotFrozen(item)
	return not item:isFrozen();
end
MincerMenu.doBuildMenu = function(player, context, worldobjects)

	if test and ISWorldObjectContextMenu.Test then return true end

    if getCore():getGameMode()=="LastStand" then
        return;
    end
	local playerObj = getSpecificPlayer(player);
	local playerInv = playerObj:getInventory();
	local MMincer = nil;

	for i,v in ipairs(worldobjects) do
		for i=0,v:getSquare():getObjects():size()-1 do
			local object = v:getSquare():getObjects():get(i);
			if instanceof(object, "IsoObject") and
			  object:getSprite() and
			  object:getSprite():getProperties() and
			  (object:getSprite():getProperties():Val("CustomName") == "Meat Grinder" or
			  object:getSprite():getProperties():Val("CustomName") == "Electric Meat Grinder") then
				MMincer = object;
				break;
			end
		end
	end

	if MMincer == nil then return;end
	
	if MMincer ~= nil then
		--Menu Contextual y funcion de tooltip
		-- Titulo y creacion de submenu
		local FirstTitle = context:addOption(getText("ContextMenu_MeatGrinder"), worldobjects, nil);
		local SubMenu = context:getNew(context);
		context:addSubMenu(FirstTitle, SubMenu);
		local nm1 = nil;
		local nm2 = nil;
		local electric = false;
		local mult = 1;
		if MMincer:getSprite():getProperties():Val("CustomName") == "Electric Meat Grinder" then
			electric = true;
			mult = 0.5;
		end
		if playerInv:containsTypeEvalRecurse("Steak", predicateNotFrozen) then
			nm1 = playerInv:getAllTypeEvalRecurse("Steak", predicateNotFrozen);
		end
		if playerInv:containsTypeEvalRecurse("PorkChop", predicateNotFrozen) then
			nm2 = playerInv:getAllTypeEvalRecurse("PorkChop", predicateNotFrozen);
		end
		if nm1 ~= nil and nm1:size() < 2 then
			local _option = SubMenu:addOption(getText("ContextMenu_Steak"), MMincer, MincerMenu.onChop, playerObj, "Steak", 1, 450*mult);
			MincerMenu.HacerTooltip(MMincer, playerObj, "Steak", _option, electric);
		elseif nm1 ~= nil and nm1:size() > 1 then

			local TitleOne = SubMenu:addOption(getText("ContextMenu_Steak"), worldobjects, nil);
			local SubMenu2 = context:getNew(SubMenu);
			context:addSubMenu(TitleOne, SubMenu2);
			local _option = SubMenu2:addOption(getText("ContextMenu_One"), MMincer, MincerMenu.onChop, playerObj, "Steak", 1, 450*mult);
			MincerMenu.HacerTooltip(MMincer, playerObj, "Steak", _option, electric)

			local _option2 = SubMenu2:addOption(getText("ContextMenu_All"), MMincer, MincerMenu.onChop, playerObj, "Steak", nm1:size(), 450*mult);
			MincerMenu.HacerTooltip(MMincer, playerObj, "Steak", _option2, electric)

		else
			local _option = SubMenu:addOption(getText("ContextMenu_Steak"), MMincer, MincerMenu.onChop, playerObj, "Steak", 1, 450*mult);
			MincerMenu.HacerTooltip(MMincer, playerObj, "Steak", _option, electric);
		end
		if nm2 ~= nil and nm2:size() < 2 then
			local _option2 = SubMenu:addOption(getText("ContextMenu_PorkChop"), MMincer, MincerMenu.onChop, playerObj, "PorkChop", 1, 450*mult);
			MincerMenu.HacerTooltip(MMincer, playerObj, "PorkChop", _option2, electric);
		elseif nm2 ~= nil and nm2:size() > 1 then

			local TitleOne = SubMenu:addOption(getText("ContextMenu_PorkChop"), worldobjects, nil);
			local SubMenu2 = context:getNew(SubMenu);
			context:addSubMenu(TitleOne, SubMenu2);
			local _option = SubMenu2:addOption(getText("ContextMenu_One"), MMincer, MincerMenu.onChop, playerObj, "PorkChop", 1, 450*mult);
			MincerMenu.HacerTooltip(MMincer, playerObj, "PorkChop", _option, electric)
			
			local _option2 = SubMenu2:addOption(getText("ContextMenu_All"), MMincer, MincerMenu.onChop, playerObj, "PorkChop", nm2:size(), 450*mult);
			MincerMenu.HacerTooltip(MMincer, playerObj, "PorkChop", _option2, electric)
		else
			local _option2 = SubMenu:addOption(getText("ContextMenu_PorkChop"), MMincer, MincerMenu.onChop, playerObj, "PorkChop", 1, 450*mult);
			MincerMenu.HacerTooltip(MMincer, playerObj, "PorkChop", _option2, electric);
		end
	end
end
MincerMenu.HacerTooltip = function(MMincer, playerObj, item, _option, needpower)
	local playerInv = playerObj:getInventory();
	local tooltip = ISInventoryPaneContextMenu.addToolTip();
	tooltip:setName(getText("ContextMenu_"..item));
	tooltip.description = "<RGB:1,1,0>" .. getText("ContextMenu_"..item.."TT") .. " <LINE>" .. "<RGB:0.596078431372549,0.9843137254901961,0.596078431372549> <LINE> <LINE>" ..  getText("Tooltip_craft_Needs") .. " : ";

	tooltip:setTexture(MMincer:getTextureName());
	tooltip.footNote = "";
	if needpower then
		if (SandboxVars.AllowExteriorGenerator and MMincer:getSquare():haveElectricity()) or (SandboxVars.ElecShutModifier > -1 and GameTime:getInstance():getNightsSurvived() < SandboxVars.ElecShutModifier) then
			tooltip.footNote = getText("IGUI_RadioPowerNearby");
		else
			tooltip.footNote = getText("IGUI_RadioRequiresPowerNearby");
			_option.notAvailable = true;
		end
	end
	local itemtotranslate = InventoryItemFactory.CreateItem("Base." .. item);
	if playerInv:containsTypeEvalRecurse(item, predicateNotFrozen) then
		local nm = playerInv:getAllTypeEvalRecurse(item, predicateNotFrozen);
		tooltip.description = tooltip.description .. "<LINE> <RGB:0,0.8,0>" .. itemtotranslate:getDisplayName() .. ": ".. tostring(nm:size()) .. "/1"
	else
		tooltip.description = tooltip.description .. "<LINE> <RGB:1,0,0>" .. itemtotranslate:getDisplayName() .. ": 0/1"
		_option.notAvailable = true;
	end
	if needpower then
	
	else
		if playerObj:getPerkLevel(Perks.Strength) < 6 then
			tooltip.description = tooltip.description .. " <LINE> <RGB:1,0,0>" .. getText("IGUI_perks_Strength") .. " " .. tostring(playerObj:getPerkLevel(Perks.Strength)) .. "/6" .. " <LINE>";
			_option.notAvailable = true;
		else
			tooltip.description = tooltip.description .. " <LINE> <RGB:0,0.8,0>" .. getText("IGUI_perks_Strength") .. " " .. tostring(playerObj:getPerkLevel(Perks.Strength)) .. "/6" .. " <LINE>";
		end
	end
	_option.toolTip = tooltip;
end

MincerMenu.onChop = function(MMincer, playerObj, item, directive, time)

	local matitem = nil;
	local playerInv = playerObj:getInventory();
	local stacks = playerInv:getAllTypeEvalRecurse(item, predicateNotFrozen)
	if MMincer and luautils.walkAdj(playerObj, MMincer:getSquare()) then
		if stacks:size() > 1 and directive > 1 then 
			for i=1,stacks:size() do
				local ItemBase = stacks:get(i-1)
				if ItemBase ~= nil then
					if luautils.haveToBeTransfered(playerObj, ItemBase) then
						ISTimedActionQueue.add(ISInventoryTransferAction:new(playerObj, ItemBase, ItemBase:getContainer(), playerObj:getInventory()));
					end
					if not ItemBase:isEquipped() then
						ISTimedActionQueue.add(ISEquipWeaponAction:new(playerObj, ItemBase, 50, true, false))
					end
					ISTimedActionQueue.add(OnMincerMeatAction:new(playerObj, MMincer, ItemBase, time));
				end
			end
		else
			if playerObj:getInventory():containsTypeRecurse(item) then
				matitem = playerObj:getInventory():getFirstTypeRecurse(item);
			end
			if matitem ~= nil then
				if luautils.haveToBeTransfered(playerObj, matitem) then
					ISTimedActionQueue.add(ISInventoryTransferAction:new(playerObj, matitem, matitem:getContainer(), playerObj:getInventory()));
				end
				if not matitem:isEquipped() then
					ISTimedActionQueue.add(ISEquipWeaponAction:new(playerObj, matitem, 50, true, false))
				end
				ISTimedActionQueue.add(OnMincerMeatAction:new(playerObj, MMincer, matitem, time));
			end
		end
	end
end

Events.OnFillWorldObjectContextMenu.Add(MincerMenu.doBuildMenu);
