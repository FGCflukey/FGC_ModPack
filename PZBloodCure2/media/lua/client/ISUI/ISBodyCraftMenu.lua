BodyCraftMenu = {};

BodyCraftMenu.doCraftMenu = function(player,context, items)
    local playerInv = getSpecificPlayer(player):getInventory();
	local canBloodCure = nil;
 
--print(items);
	for i,v in ipairs(items) do
--print(v);		
        local testItem = v;
		
        if not instanceof(v, "InventoryItem") then
            testItem = v.items[1];
			print(testItem);
        end		

		if testItem:getType() == "BloodCure" then              
			canBloodCure = true;
        end
		
		if canBloodCure then
		context:addOption(getText("ContextMenu_BloodCure"), items, BodyCraftMenu.onBloodCure, player);
		end
	
	end


end

BodyCraftMenu.onBloodCure = function(a, player)
	for i,k in pairs(a) do
        if not instanceof(k, "InventoryItem") then
            for i2,k2 in ipairs(k.items) do

                if i2 ~= 1 then
                    BodyCraftMenu.BloodCure(k2, player);
					break;
                end
            end
        else
			BodyCraftMenu.BloodCure(k, player);
        end
		break;
    end
end

BodyCraftMenu.BloodCure = function(item, player)

	local playerObj = getSpecificPlayer(player)
	if luautils.haveToBeTransfered(playerObj, item) then
        ISTimedActionQueue.add(ISInventoryTransferAction:new(playerObj, item, item:getContainer(), playerObj:getInventory()));
    end

	ISTimedActionQueue.add(ISBloodCure:new(playerObj, item, 20));
end

Events.OnFillInventoryObjectContextMenu.Add(BodyCraftMenu.doCraftMenu);