--Made by Snake
IdentifySeedsMenu = {};

IdentifySeedsMenu.doMenu = function(player, context, items)
	local itemsCrafting = {};
    local c = 0;
	local tempitem = nil;
	local isInPlayerInventory = false;
	local playerObj = getSpecificPlayer(player)

	--local IdentifyBook = nil;
	local UnknownSeed = nil;
	local _inventory = getSpecificPlayer(player):getInventory();
	
	for i,v in ipairs(items) do
		local tempitem = v;
        if not instanceof(v, "InventoryItem") then
            tempitem = v.items[1];
        end
		if tempitem:getType() == "UnknownSeed" then
			UnknownSeed = tempitem;
		end
		itemsCrafting[c + 1] = tempitem;
		c = c + 1;
		if c > 1 then
			UnknownSeed = nil;
		end
	end
	if UnknownSeed == nil then
		return
	end
	if (UnknownSeed ~= nil and (_inventory:contains("SeedBook")) or (playerObj:getDescriptor():getProfession() == "farmer")) then
		local identifyOption = context:addOption(getText("ContextMenu_IdentifySeeds"), items, nil, player);
		local subMenuIdentify = context:getNew(context)
		context:addSubMenu(identifyOption, subMenuIdentify)
		local tooltip = ISInventoryPaneContextMenu.addToolTip();
		tooltip:setName(getText("ContextMenu_IdentifySeeds"));
		tooltip.description = getText("ContextMenu_IdentifySeedsTT");
		tooltip:setTexture("media/textures/Item_SeedBook.png");
		for i,k in pairs(items) do
			if not instanceof(k, "InventoryItem") then
				if #k.items > 2 then
					local subMenuIdentifyOption1 = subMenuIdentify:addOption(getText("ContextMenu_One"), items, IdentifySeedsMenu.Identify_OnCreate, player, 1);
					subMenuIdentifyOption1.toolTip = tooltip;
					local subMenuIdentifyOption2 = subMenuIdentify:addOption(getText("ContextMenu_IdentifyHalf"), items, IdentifySeedsMenu.Identify_OnCreate, player, 2);
					subMenuIdentifyOption2.toolTip = tooltip;
					local subMenuIdentifyOption3 = subMenuIdentify:addOption(getText("ContextMenu_IdentifyAll"), items, IdentifySeedsMenu.Identify_OnCreate, player, 3);
					subMenuIdentifyOption3.toolTip = tooltip;
					break;
				else
					local subMenuIdentifyOption = subMenuIdentify:addOption(getText("ContextMenu_One"), items, IdentifySeedsMenu.Identify_OnCreate, player, 3);
					subMenuIdentifyOption.toolTip = tooltip;
					break;
				end
			else
				local subMenuIdentifyOption = subMenuIdentify:addOption(getText("ContextMenu_One"), items, IdentifySeedsMenu.Identify_OnCreate, player, 3);
				subMenuIdentifyOption.toolTip = tooltip;
				break;
			end
		end
	end
end

IdentifySeedsMenu.Identify_OnCreate = function(items, playernum, directive)
	local player = getSpecificPlayer(playernum);
	local count = 0;
	for i,k in ipairs(items) do
		if not instanceof(k, "InventoryItem") then
			if directive == 1 then
				count = math.floor((#k.items - 1) / (#k.items - 1))
			elseif directive == 2 then
				count =  math.floor((#k.items - 1) / 2)
			else
				count =  math.floor(#k.items - 1)
			end
			-- first in a list is a dummy duplicate, so ignore it.
			for i2=1,count do
				local k2 = k.items[i2+1]
				if luautils.haveToBeTransfered(player, k2) then
					ISTimedActionQueue.add(ISInventoryTransferAction:new(player, k2, k2:getContainer(), player:getInventory()))
				end
				if player:getDescriptor():getProfession() == "farmer" then
					--nothing
				else
					if player:getInventory():contains("SeedBook") then
						local book = player:getInventory():getItemFromType("SeedBook")
						ISTimedActionQueue.add(ISEquipWeaponAction:new(player, book, 50, true, false))
					end
				end
				if not k2:isEquipped() then
					ISTimedActionQueue.add(ISEquipWeaponAction:new(player, k2, 50, false, false))
				end
				ISTimedActionQueue.add(LGIdentifySeedAction:new(player, k2, 100));
			end
		else
			if luautils.haveToBeTransfered(player, k) then
				ISTimedActionQueue.add(ISInventoryTransferAction:new(player, k, k:getContainer(), player:getInventory()))
			end
			ISTimedActionQueue.add(LGIdentifySeedAction:new(player, k2, 100));
		end
	end
end

Events.OnFillInventoryObjectContextMenu.Add(IdentifySeedsMenu.doMenu);