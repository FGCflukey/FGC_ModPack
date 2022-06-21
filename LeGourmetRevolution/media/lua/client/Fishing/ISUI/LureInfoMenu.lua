--Made by Snake
LureInfoMenu = {};

LureInfoMenu.doMenu = function(player, context, items)
	local pl = getPlayer();
	if not pl:HasTrait("Illiterate") then    
		local item = nil;
		local item2 = nil;
		local Info = "";
		local Texture = "";
	
		for i,v in ipairs(items) do
			local tempitem = v;
			if not instanceof(v, "InventoryItem") then
				tempitem = v.items[1];
			end
			if tempitem:getType() == "StormFlutterstick" then
				item  = tempitem;
				Info = "Tooltip_StormFlutterstickTT";
				Texture = "flutterstick";
			end
			if tempitem:getType() == "Alfers" then
				item  = tempitem;
				Info = "Tooltip_AlfersTT";
				Texture = "alfers";
			end
			if tempitem:getType() == "RattlinRap" then
				item  = tempitem;
				Info = "Tooltip_RattlinRapTT";
				Texture = "rattlinrap";
			end
			if tempitem:getType() == "SwimJig" then
				item  = tempitem;
				Info = "Tooltip_SwimJigTT";
				Texture = "swimjig1";
			end
			if tempitem:getType() == "SwimJig2" then
				item  = tempitem;
				Info = "Tooltip_SwimJigTT";
				Texture = "swimjig2";
			end
			if tempitem:getType() == "SwimJig3" then
				item  = tempitem;
				Info = "Tooltip_SwimJigTT";
				Texture = "swimjig3";
			end
			if tempitem:getType() == "GTPopper" then
				item  = tempitem;
				Info = "Tooltip_GTPopperTT";
				Texture = "GTPopper";
			end
			if tempitem:getType() == "SpoonLure1" then
				item  = tempitem;
				Info = "Tooltip_SpoonLureTT";
				Texture = "Spoon1";
			end
			if tempitem:getType() == "SpoonLure2" then
				item  = tempitem;
				Info = "Tooltip_SpoonLureTT";
				Texture = "Spoon2";
			end
			if tempitem:getType() == "SpoonLure3" then
				item  = tempitem;
				Info = "Tooltip_SpoonLureTT";
				Texture = "Spoon3";
			end
			if tempitem:getType() == "JitterBug" then
				item  = tempitem;
				Info = "Tooltip_JitterBugTT";
				Texture = "Jitterbug";
			end
			if tempitem:getType() == "Crankbait" then
				item  = tempitem;
				Info = "Tooltip_CrankbaitTT";
				Texture = "Crankbait";
			end
			if tempitem:getType() == "SwimShad" then
				item  = tempitem;
				Info = "Tooltip_SwimShadTT";
				Texture = "SwimShad";
			end
			if tempitem:getType() == "Spinnerbait" then
				item  = tempitem;
				Info = "Tooltip_SpinnerbaitTT";
				Texture = "Spinnerbait";
			end

			if tempitem:getType() == "FishingTackle" then
				item2  = tempitem;
			end
			if tempitem:getType() == "FishingTackle2" then
				item2  = tempitem;
			end
		end
	
		if item then
			local ctext = "";
			local target;
			if item then
				ctext = "ContextMenu_Read_LureInfo";
				target = item;
			end
			local option = context:addOption(getText(ctext), target, nil, player);
			local tooltip = ISWorldObjectContextMenu.addToolTip();
			tooltip:setName(target:getDisplayName());
			tooltip.description = tooltip.description .. getText(Info);
			tooltip:setTexture(Texture);
			option.toolTip = tooltip;
		end

		if item2 then
			local target;
			local ctext = "";
			if item2 then
				ctext = "ContextMenu_Identify_Tackle";
				target = item2;
			end
			local option = context:addOption(getText(ctext), target, LureInfoMenu.Identify_OnCreate, player);
			local tooltip = ISWorldObjectContextMenu.addToolTip();
			tooltip:setName(getText(ctext) .. " " .. target:getDisplayName());
			tooltip.description = tooltip.description .. getText("Tooltip_Identify_Tackle");
			tooltip:setTexture(target:getTexture():getName());
			option.toolTip = tooltip;
		end
	end
end

LureInfoMenu.Identify_OnCreate = function(item, playernum)

	local player = getSpecificPlayer(playernum)
	
	-- check if needs to be moved
	if luautils.haveToBeTransfered(player, item) then
		ISTimedActionQueue.add(ISInventoryTransferAction:new(player, item, item:getContainer(), player:getInventory()));
	end
	
	if not item:isEquipped() then
		local toPrimary = true;
		if not (not getSpecificPlayer(playernum):getBodyDamage():getBodyPart(BodyPartType.Hand_R):isDeepWounded() and (getSpecificPlayer(playernum):getBodyDamage():getBodyPart(BodyPartType.Hand_R):getFractureTime() == 0 or getSpecificPlayer(playernum):getBodyDamage():getBodyPart(BodyPartType.Hand_R):getSplintFactor() > 0)) then
			-- Primary hand is damaged
			toPrimary = false;
		elseif player:getPrimaryHandItem() and not player:getSecondaryHandItem() then
			-- Primary hand has an item, but secondary is free
			if not getSpecificPlayer(playernum):getBodyDamage():getBodyPart(BodyPartType.Hand_L):isDeepWounded() and (getSpecificPlayer(playernum):getBodyDamage():getBodyPart(BodyPartType.Hand_L):getFractureTime() == 0 or getSpecificPlayer(playernum):getBodyDamage():getBodyPart(BodyPartType.Hand_L):getSplintFactor() > 0) then
				-- Secondary hand is not damaged, so secondary it is!
				toPrimary = false;
			end
		end
		
		-- equip the item first
		ISTimedActionQueue.add(ISEquipWeaponAction:new(player, item, 50, toPrimary, false))
	end

    local time = 50;
	ISTimedActionQueue.add(IdentifyTackleAction:new(player, item, time));
end

Events.OnFillInventoryObjectContextMenu.Add(LureInfoMenu.doMenu);