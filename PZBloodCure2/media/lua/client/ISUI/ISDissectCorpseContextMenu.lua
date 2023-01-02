ISDissectCorpseContextMenu = {}
ISDissectCorpseContextMenu.fetchSquares = {}
local body = nil;
local c = 0;
ISDissectCorpseContextMenu.clearFetch = function()
    body = nil;
--	item = nil;
end

ISDissectCorpseContextMenu.fetch = function(v, player, doSquare)

	local playerObj = getSpecificPlayer(player);
	local playerInv = playerObj:getInventory();

	if v:getSquare() then
		local worldItems = v:getSquare():getWorldObjects();
		if worldItems and not worldItems:isEmpty() then
			worldItem = worldItems:get(0);
		end
	end
	c = c + 1;
    if instanceof(v, "IsoDeadBody") then
        body = v;
    end
    if not body and v:getSquare() and v:getSquare():getDeadBody() then
        body = v:getSquare():getDeadBody();
    end
	
end

ISDissectCorpseContextMenu.createMenu = function(player, context, worldobjects, test)
	
	if test then 
		return ISWorldObjectContextMenu.setTest() 
	end
	
	if UIManager.getSpeedControls():getCurrentGameSpeed() == 0 then
		return;
	end
	
    body = nil;
	c = 0;
	
	local playerObj = getSpecificPlayer(player);
	local playerInv = playerObj:getInventory();
	
	if playerObj:isAsleep() then 
		return 
	end
	
	for i,v in ipairs(worldobjects) do
		ISDissectCorpseContextMenu.fetch(v, player, true);
    end

    if c == 0 then
        return;
    end

	-- Dissect a Corpse
	body = IsoObjectPicker.Instance:PickCorpse(Mouse.getXA(), Mouse.getYA()) or body
    if body then
	
		for i = 0, playerInv:getItems():size() - 1 do
			local item = playerInv:getItems():get(i);

			local itemnameID = item.getName();
			print(" item name:"..itemnameID..")

            if item:getTags().contains("ChopTree") or item:getTags().contains("SharpKnife") then
				
				context:addOption(getText("ContextMenu_Dissect_Corpse"), worldobjects, ISDissectCorpseContextMenu.onDissectCorpse, player, body, item);
            end
        end
    end
end

ISDissectCorpseContextMenu.onDissectCorpse = function(worldobjects, player, corpse, knife)
    local playerObj = getSpecificPlayer(player)
	local playerInv = playerObj:getInventory()
    if corpse:getSquare() and luautils.walkAdj(playerObj, corpse:getSquare()) then
		print(playerObj:getPrimaryHandItem());
		if playerObj:getPrimaryHandItem() then
		
			if playerObj:getPrimaryHandItem():getTags().contains("SharpKnife") or playerObj:getPrimaryHandItem():getTags().contains("ChopTree") then
			
				ISTimedActionQueue.add(ISDissectCorpseAction:new(playerObj, corpse, playerObj:getPrimaryHandItem()));
			else
				ISTimedActionQueue.add(ISEquipWeaponAction:new(playerObj, knife, 20, true, false));
				ISTimedActionQueue.add(ISDissectCorpseAction:new(playerObj, corpse, knife));
			end
		else
			ISTimedActionQueue.add(ISEquipWeaponAction:new(playerObj, knife, 20, true, false));
			ISTimedActionQueue.add(ISDissectCorpseAction:new(playerObj, corpse, knife));
		end
		
--        ISTimedActionQueue.add(ISDissectCorpseAction:new(playerObj, corpse, playerObj:getPrimaryHandItem()));
    end
end

Events.OnPreFillWorldObjectContextMenu.Add(ISDissectCorpseContextMenu.createMenu);