--Made by Snake
LGRDepostarMenu = {};

local function predicateNotBroken(item)
	return not item:isBroken()
end

function LGRDepostarMenu.canbutcheranimals(playerObj)
	local playerInv = playerObj:getInventory()
	return (playerInv:containsTypeEvalRecurse("Base.KnifeDepostador", predicateNotBroken)
		or playerInv:containsTypeEvalRecurse("AliceBP.MilitaryKnife", predicateNotBroken)
		or playerInv:containsTypeEvalRecurse("Base.HuntingKnife", predicateNotBroken) 
		or playerInv:containsTypeEvalRecurse("Base.MeatCleaver", predicateNotBroken) 
		or playerInv:containsTypeEvalRecurse("Base.KitchenKnife", predicateNotBroken)
		or playerInv:containsTypeEvalRecurse("Base.FlintKnife", predicateNotBroken))

end

function LGRDepostarMenu.getKnife(playerObj)
	local playerInv = playerObj:getInventory()
	local item = playerInv:getFirstTypeEvalRecurse("KnifeDepostador", predicateNotBroken) or
				playerInv:getFirstTypeEvalRecurse("MilitaryKnife", predicateNotBroken) or
				playerInv:getFirstTypeEvalRecurse("HuntingKnife", predicateNotBroken) or
				playerInv:getFirstTypeEvalRecurse("MeatCleaver", predicateNotBroken) or
				playerInv:getFirstTypeEvalRecurse("KitchenKnife", predicateNotBroken) or
				playerInv:getFirstTypeEvalRecurse("FlintKnife", predicateNotBroken)
	return item;
end

function LGRDepostarMenu.getKnifePenalty(knife)
	local penalty = " <SPACE> <GREEN> " .. getText("Tooltip_CutPerfect") .. " (100%)";
	local KnifeType = knife:getType()
	if KnifeType ~= nil then
		if KnifeType == "MilitaryKnife" then
			penalty = " <SPACE> <RGB:0.6,1,0> " .. getText("Tooltip_VeryGood") .. " (90%)";
		elseif KnifeType == "HuntingKnife" then
			penalty = " <SPACE> <RGB:0.8,1,0> " .. getText("Tooltip_Good") .. " (80%)";
		elseif KnifeType == "MeatCleaver" then
			penalty = " <SPACE> <RGB:1,1,0> " .. getText("Tooltip_Average") .. " (65%)";
		elseif KnifeType == "KitchenKnife" then
			penalty = " <SPACE> <ORANGE> " .. getText("Tooltip_Bad") .. " (50%)";
		elseif KnifeType == "FlintKnife" then
			penalty = " <SPACE> <RED> " .. getText("Tooltip_VeryBad") .. " (25%)";
		else
			penalty = penalty;
		end
	else
	end
	return penalty
end

LGRDepostarMenu.doMenu = function(player, context, items)

    if ISInventoryPaneContextMenu.dontCreateMenu then return; end

	-- if the game is paused, we don't show the item context menu
	if UIManager.getSpeedControls():getCurrentGameSpeed() == 0 then
		return;
	end
	local animal = nil;
	local worldItem = nil;
	
	local playerObj = getSpecificPlayer(player)
	local playerInv = playerObj:getInventory();

    local testItem = nil;

    for i,v in ipairs(items) do
        testItem = v;
		if not instanceof(v, "InventoryItem") then
            testItem = v.items[1];
        end
        if DepostarDefinitions[testItem:getType()] and testItem:getWorldItem() ~= nil then
            animal = testItem;
        end
	end
	if LGRDepostarMenu.canbutcheranimals(playerObj) then
		local item = LGRDepostarMenu.getKnife(playerObj);	
		if animal and item ~= nil then
			local option = context:addOption(getText("ContextMenu_CutAnimal") .. " " .. animal:getDisplayName(), animal, LGRDepostarMenu.onDepostar, playerObj, item, 1);
			local penalty = LGRDepostarMenu.getKnifePenalty(item);
			local tooltip = ISInventoryPaneContextMenu.addToolTip()
			tooltip:setName(getText("ContextMenu_CutAnimal") .. " " .. animal:getDisplayName());
			tooltip.texture = item:getTex();
			tooltip.description = getText("Tooltip_CutDesc") .. " <BR>" .. getText("Tooltip_KnifeType") .. " " .. item:getDisplayName() .. "." .. " <LINE>"
			tooltip.description = tooltip.description .. getText("Tooltip_KnifePenalty").. " " .. penalty;
			option.toolTip = tooltip
		end
	end
end

LGRDepostarMenu.doMenu2 = function(player, context, worldobjects)

	if test and ISWorldObjectContextMenu.Test then return true end

    if getCore():getGameMode()=="LastStand" then
        return;
    end
	local worldItem = nil;
	local animal = nil;
	local playerObj = getSpecificPlayer(player);
	local playerInv = playerObj:getInventory();

	for i,v in ipairs(worldobjects) do
		if v:getSquare() then
			local worldItems = v:getSquare():getWorldObjects();
			if worldItems and not worldItems:isEmpty() then
				worldItem = worldItems:get(0);
			end
		end
	end
	if LGRDepostarMenu.canbutcheranimals(playerObj) then
		local kitem = LGRDepostarMenu.getKnife(playerObj);
		if worldItem and getCore():getGameMode()~="LastStand" then
			local itemList = {}
			local doneSquare = {}
			for i,v in ipairs(worldobjects) do
				if v:getSquare() and not doneSquare[v:getSquare()] then
					doneSquare[v:getSquare()] = true
					for n = 0,v:getSquare():getWorldObjects():size()-1 do
						local item = v:getSquare():getWorldObjects():get(n)
						if DepostarDefinitions[item:getItem():getType()] then
							animal = item:getItem();
							local itemType = (item:getItem():getType())
							if not itemList[itemType] then itemList[itemType] = {} end
								table.insert(itemList[itemType], item)
							break;
						end
					end
				end
			end
			if animal ~= nil and kitem ~= nil then
				for name,items in pairs(itemList) do
					if #items == 1 then
						local option = context:addOption(getText("ContextMenu_CutAnimal") .. " " .. animal:getDisplayName(),  items[1], LGRDepostarMenu.onDepostar, playerObj, kitem, 2, animal);
						local penalty = LGRDepostarMenu.getKnifePenalty(kitem);
						local tooltip = ISInventoryPaneContextMenu.addToolTip()
						tooltip:setName(getText("ContextMenu_CutAnimal") .. " " .. animal:getDisplayName());
						tooltip.texture = kitem:getTex();
						tooltip.description = getText("Tooltip_CutDesc") .. " <BR>" .. getText("Tooltip_KnifeType") .. " " .. kitem:getDisplayName() .. "." .. " <LINE>"
						tooltip.description = tooltip.description .. getText("Tooltip_KnifePenalty").. " " .. penalty;
						option.toolTip = tooltip
					end
				end
			end
		end
	end
end

LGRDepostarMenu.onDepostar = function(animal, playerObj, item, directive, WItem)
	if item and item ~= nil then
		local player = playerObj:getPlayerNum()
		if directive == 2 then
			if animal:getSquare() and luautils.walkAdj(playerObj, animal:getSquare()) then
				playerObj:faceLocation(animal:getX(), animal:getY());
				ISWorldObjectContextMenu.transferIfNeeded(playerObj, item)
				ISInventoryPaneContextMenu.equipWeapon(item, true, false, player)
			end
			ISTimedActionQueue.add(OnDepostarAction:new(playerObj, WItem, item, animal))
		elseif directive == 1 then
			ISWorldObjectContextMenu.transferIfNeeded(playerObj, item)
			ISInventoryPaneContextMenu.equipWeapon(item, true, false, player)
			ISTimedActionQueue.add(OnDepostarAction:new(playerObj, animal, item, nil))
		end
	end
end

-- LGRDepostarMenu.doTooltip = function(option, clothing)
	-- local tooltip = ISInventoryPaneContextMenu.addToolTip();
	-- tooltip:setName(getText("ContextMenu_UnravelClothing") .. " " .. clothing:getDisplayName());
    -- tooltip.description = getText("ContextMenu_UnravelTT") .. " <LINE> <LINE>" .. LGRDepostarMenu.getExtraDescription(clothing);
	-- tooltip:setTexture("media/textures/Item_Unravel.png");
	-- return tooltip
-- end

-- LGRDepostarMenu.getExtraDescription = function(clothing)
	-- local item = ClothingUnravelDefinitions[clothing:getType()]
	-- local materials = luautils.split(item.materials, ":");
	-- local itemtotranslate = InventoryItemFactory.CreateItem(materials[1]);
	-- local text = "<GREEN>" .. getText("ContextMenu_CanObtain") .. " <LINE>" .. tostring(materials[2]) .. " " .. itemtotranslate:getDisplayName() .. getText("ContextMenu_PerU") .. ". <LINE> <LINE> <ORANGE>" .. getText("ContextMenu_TailorAdvice");
	-- return text
-- end
Events.OnFillInventoryObjectContextMenu.Add(LGRDepostarMenu.doMenu);
Events.OnFillWorldObjectContextMenu.Add(LGRDepostarMenu.doMenu2);