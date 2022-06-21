--Made by Snake
AFLureBoxMenu = {};


AFLureBoxMenu.doMenu = function(player, context, items)

	local FLB = nil;
	local itemsCrafting = {};
    local c = 0;	
	for i,v in ipairs(items) do
		local tempitem = v;
        if not instanceof(v, "InventoryItem") then
            tempitem = v.items[1];
        end
		if tempitem:getType() == "Fishinglurebox" then
			FLB = tempitem;
		end
		itemsCrafting[c + 1] = tempitem;
		c = c + 1;
		if c > 1 then
			FLB = nil;
		end
	end
	if FLB == nil then
		return
	end
	if FLB ~= nil then
		local plbody = getSpecificPlayer(player):getBodyDamage();
        if(not plbody:getBodyPart(BodyPartType.Hand_L):HasInjury() and not plbody:getBodyPart(BodyPartType.Hand_R):HasInjury()) then
			local openLBoxOption = context:addOption(getText("ContextMenu_OpenLureBox"), items, nil, player);
			local subMenuopenLBox = context:getNew(context)
			context:addSubMenu(openLBoxOption, subMenuopenLBox)

		    --local option = context:addOption(getText("ContextMenu_OpenLureBox"), FLB, AFLureBoxMenu.OpenLureBox_OnCreate, player);
			local tooltip = ISWorldObjectContextMenu.addToolTip();
			tooltip:setName(getText("ContextMenu_OpenLureBox"));
			tooltip.description = tooltip.description .. getText("ContextMenu_OpenLureBoxTT") .. " <LINE> <LINE> <RGB:1,0,0> " .. getText("ContextMenu_OpenLureBoxTT2");
			tooltip:setTexture(FLB:getTexture():getName());
			--option.toolTip = tooltip;
			
			for i,k in pairs(items) do
				if not instanceof(k, "InventoryItem") then
					if #k.items > 2 then
						local subMenuOpenLBoxOption1 = subMenuopenLBox:addOption(getText("ContextMenu_One"), items, AFLureBoxMenu.OpenLureBox_OnCreate, player, 1);
						subMenuOpenLBoxOption1.toolTip = tooltip;
						local subMenuOpenLBoxOption2 = subMenuopenLBox:addOption(getText("ContextMenu_IdentifyHalf"), items, AFLureBoxMenu.OpenLureBox_OnCreate, player, 2);
						subMenuOpenLBoxOption2.toolTip = tooltip;
						local subMenuOpenLBoxOption3 = subMenuopenLBox:addOption(getText("ContextMenu_IdentifyAll"), items, AFLureBoxMenu.OpenLureBox_OnCreate, player, 3);
						subMenuOpenLBoxOption3.toolTip = tooltip;
						break;
					else
						local subMenuOpenLBoxOption = subMenuopenLBox:addOption(getText("ContextMenu_One"), items, AFLureBoxMenu.OpenLureBox_OnCreate, player, 3);
						subMenuOpenLBoxOption.toolTip = tooltip;
						break;
					end
				else
					local subMenuOpenLBoxOption = subMenuopenLBox:addOption(getText("ContextMenu_One"), items, AFLureBoxMenu.OpenLureBox_OnCreate, player, 3);
					subMenuOpenLBoxOption.toolTip = tooltip;
					break;
				end
			end
		end
	end
end

AFLureBoxMenu.OpenLureBox_OnCreate = function(items, playernum, directive)
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
				ISTimedActionQueue.add(AFOpenLureBoxAction:new(player, k2, 50));
			end
		else
			if luautils.haveToBeTransfered(player, k) then
				ISTimedActionQueue.add(ISInventoryTransferAction:new(player, k, k:getContainer(), player:getInventory()))
			end
			AFHiddenBoxMenu.EquipHiddenBox(k, player);
			ISTimedActionQueue.add(AFOpenLureBoxAction:new(player, k, 50));
		end
	end
end

Events.OnFillInventoryObjectContextMenu.Add(AFLureBoxMenu.doMenu);