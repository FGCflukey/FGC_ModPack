--Made by Snake
AFHiddenBoxMenu = {};


AFHiddenBoxMenu.doMenu = function(player, context, items)

	local HBox = nil;
	local itemsCrafting = {};
    local c = 0;
	for i,v in ipairs(items) do
		local tempitem = v;
        if not instanceof(v, "InventoryItem") then
            tempitem = v.items[1];
        end
		if tempitem:getType() == "HiddenBox" then
			HBox = tempitem;
		end
		itemsCrafting[c + 1] = tempitem;
		c = c + 1;
		if c > 1 then
			HBox = nil;
		end
	end
	if HBox == nil then
		return
	end
	if HBox ~= nil then
		local plbody = getSpecificPlayer(player):getBodyDamage();
        if HBox:isEquipped() or
    		(not plbody:getBodyPart(BodyPartType.Hand_R):isDeepWounded() and (plbody:getBodyPart(BodyPartType.Hand_R):getFractureTime() == 0 or plbody:getBodyPart(BodyPartType.Hand_R):getSplintFactor() > 0)) or
			(not plbody:getBodyPart(BodyPartType.Hand_L):isDeepWounded() and (plbody:getBodyPart(BodyPartType.Hand_L):getFractureTime() == 0 or plbody:getBodyPart(BodyPartType.Hand_L):getSplintFactor() > 0)) then
		    
			local openHBoxOption = context:addOption(getText("ContextMenu_OpenHiddenBox"), items, nil, player);
			local subMenuopenHBox = context:getNew(context)
			context:addSubMenu(openHBoxOption, subMenuopenHBox)
			local tooltip = ISInventoryPaneContextMenu.addToolTip();
			tooltip:setName(getText("ContextMenu_OpenHiddenBox"));
            tooltip.description = getText("ContextMenu_OpenHiddenBoxTT");
			tooltip:setTexture(HBox:getTexture():getName());
			
			for i,k in pairs(items) do
				if not instanceof(k, "InventoryItem") then
					if #k.items > 2 then
						local subMenuOpenHBoxOption1 = subMenuopenHBox:addOption(getText("ContextMenu_One"), items, AFHiddenBoxMenu.OpenLureBox_OnCreate, player, 1);
						subMenuOpenHBoxOption1.toolTip = tooltip;
						local subMenuOpenHBoxOption2 = subMenuopenHBox:addOption(getText("ContextMenu_IdentifyHalf"), items, AFHiddenBoxMenu.OpenLureBox_OnCreate, player, 2);
						subMenuOpenHBoxOption2.toolTip = tooltip;
						local subMenuOpenHBoxOption3 = subMenuopenHBox:addOption(getText("ContextMenu_IdentifyAll"), items, AFHiddenBoxMenu.OpenLureBox_OnCreate, player, 3);
						subMenuOpenHBoxOption3.toolTip = tooltip;
						break;
					else
						local subMenuOpenHBoxOption = subMenuopenHBox:addOption(getText("ContextMenu_One"), items, AFHiddenBoxMenu.OpenLureBox_OnCreate, player, 3);
						subMenuOpenHBoxOption.toolTip = tooltip;
						break;
					end
				else
					local subMenuOpenHBoxOption = subMenuopenHBox:addOption(getText("ContextMenu_One"), items, AFHiddenBoxMenu.OpenLureBox_OnCreate, player, 3);
					subMenuOpenHBoxOption.toolTip = tooltip;
					break;
				end
			end
		end
	end
end

AFHiddenBoxMenu.OpenLureBox_OnCreate = function(items, playernum, directive)
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
				AFHiddenBoxMenu.EquipHiddenBox(k2, player);
				ISTimedActionQueue.add(AFOpenHiddenBoxAction:new(player, k2, 50));
			end
		else
			if luautils.haveToBeTransfered(player, k) then
				ISTimedActionQueue.add(ISInventoryTransferAction:new(player, k, k:getContainer(), player:getInventory()))
			end
			AFHiddenBoxMenu.EquipHiddenBox(k, player);
			ISTimedActionQueue.add(AFOpenHiddenBoxAction:new(player, k, 50));
		end
	end
end

AFHiddenBoxMenu.EquipHiddenBox = function(item, player)
	if not item:isEquipped() then
		local toPrimary = true;
		if not (not player:getBodyDamage():getBodyPart(BodyPartType.Hand_R):isDeepWounded() and (player:getBodyDamage():getBodyPart(BodyPartType.Hand_R):getFractureTime() == 0 or player:getBodyDamage():getBodyPart(BodyPartType.Hand_R):getSplintFactor() > 0)) then
			-- Primary hand is damaged
			toPrimary = false;
		elseif player:getPrimaryHandItem() and not player:getSecondaryHandItem() then
			-- Primary hand has an item, but secondary is free
			if not player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):isDeepWounded() and (player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):getFractureTime() == 0 or player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):getSplintFactor() > 0) then
				-- Secondary hand is not damaged, so secondary it is!
				toPrimary = false;
			end
		end
	
		-- equip the item first
		ISTimedActionQueue.add(ISEquipWeaponAction:new(player, item, 50, toPrimary, false))
	end
end

Events.OnFillInventoryObjectContextMenu.Add(AFHiddenBoxMenu.doMenu);