local doorlocksystem = {}
doorlocksystem.onFillWorldObjectContextMenu = function(playerId, context, worldobjects, test)
local player = getSpecificPlayer(playerId)
for a,door in ipairs(worldobjects) do
			
				if instanceof(door, 'IsoThumpable') and door:isDoor() then
					    local KeyMenu = context:addOption("Key Options", worldobjects);
                        local subMenu = ISContextMenu:getNew(context);
                        doorlocksystem.context = context
	                    doorlocksystem.subMenu = subMenu
                        context:addSubMenu(KeyMenu, subMenu);
					if isClient() == false or isAdmin() or isCoopHost() then
					subMenu:addOption(getText('(Admin) Reset Key'), worldobjects, doorlocksystem.adminSetKey, player, door)
					subMenu:addOption(getText('(Admin) Get Key'), worldobjects, doorlocksystem.adminGetKey, player, door)
					subMenu:addOption(getText('Reset Key'), worldobjects, doorlocksystem.SetKey, player, door)
					subMenu:addOption(getText('Duplicate Key'), worldobjects, doorlocksystem.DuplicateKey, player, door)
					subMenu:addOption(getText('Set Key to Lock'), worldobjects, doorlocksystem.SetToLock, player, door)
					subMenu:addOption(getText('Set Lock to Key'), worldobjects, doorlocksystem.SetToKey, player, door)
                    else
                    subMenu:addOption(getText('Reset Key'), worldobjects, doorlocksystem.SetKey, player, door)
					subMenu:addOption(getText('Duplicate Key'), worldobjects, doorlocksystem.DuplicateKey, player, door)
					subMenu:addOption(getText('Set Key to Lock'), worldobjects, doorlocksystem.SetToLock, player, door)
					subMenu:addOption(getText('Set Lock to Key'), worldobjects, doorlocksystem.SetToKey, player, door)
                    end
				end
			end
end

doorlocksystem.adminSetKey = function(worldobjects, player, door)
local keycode = ZombRand(999999) + 100000
door:setKeyId(keycode)
door:setLockedByKey(true)
getPlayer():Say('Key has been Reset')
--local doorkey = getPlayer():getInventory():AddItem('Base.Key1')
--doorkey:setKeyId(keycode)
end

doorlocksystem.adminGetKey = function(worldobjects, player, door)
local keycode = door:getKeyId()
local doorkey = getPlayer():getInventory():AddItem('Base.Key1')
doorkey:setKeyId(keycode)
doorkey:setName('Key #' .. keycode)
getPlayer():Say('Key Issued')
end

doorlocksystem.SetKey = function(worldobjects, player, door)
local inventory = player:getInventory()
local username = player:getUsername();
if inventory:haveThisKeyId(door:getKeyId()) then
local keycode = ZombRand(999999) + 100000
door:setKeyId(keycode)
door:setLockedByKey(true)
getPlayer():Say('Key has been Reset')
local keycode = door:getKeyId()
local doorkey = getPlayer():getInventory():AddItem('Base.Key1')
doorkey:setKeyId(keycode)
doorkey:setName('Key #' .. keycode)
getPlayer():Say('Key Issued')
else
getPlayer():Say('You Must have this Key to Reset it!')
end
end

doorlocksystem.DuplicateKey = function(worldobjects, player, door)
local inventory = player:getInventory()
if inventory:haveThisKeyId(door:getKeyId()) then
local keycode = door:getKeyId()
local doorkey = getPlayer():getInventory():AddItem('Base.Key1')
doorkey:setKeyId(keycode)
doorkey:setName('Key #' .. keycode)
getPlayer():Say('Key Issued')
else
getPlayer():Say('You Must have this Key to Duplicate it!')
end
end

doorlocksystem.SetToLock = function(worldobjects, player, door)
local inventory = player:getInventory()
local username = player:getUsername();
if inventory:haveThisKeyId(door:getKeyId()) then
local inhand = player:getPrimaryHandItem();
if inhand ~= nil then
local name = inhand:getDisplayName();
if string.find(name, 'Key') then
local keycode = door:getKeyId()
inhand:setKeyId(keycode)
inhand:setName('Key #' .. keycode)
getPlayer():Say('Key Set To Lock')
else
getPlayer():Say('You Must have this Key in Primary Hand to Set it!')
end
end
end
end

doorlocksystem.SetToKey = function(worldobjects, player, door)
local inventory = player:getInventory()
local username = player:getUsername();
if inventory:haveThisKeyId(door:getKeyId()) then
local inhand = player:getPrimaryHandItem();
if inhand ~= nil then
local name = inhand:getDisplayName();
if string.find(name, 'Key') then
local keycode = inhand:getKeyId()
door:setKeyId(keycode)
inhand:setName('Key #' .. keycode)
getPlayer():Say('Lock Set To Key')
else
getPlayer():Say('You Must have this Key in Primary Hand to Set it!')
end
end
end
end



--function isOwn(player)
--	local username = getClientUsername()
--for i=0,SafeHouse.getSafehouseList():size()-1 do
--		local safe = SafeHouse.getSafehouseList():get(i);
--		local safeX = safe:getX()
--		local safeY = safe:getY()
--		local playerX = player:getX()
--		local playerY = player:getY()
--		local distX = ''
--		local distY = ''
--		if safeX > playerX then
--			distX = safeX - playerX
--		else
--			distX = playerX - safeX
--		end
--		if safeY > playerY then
--			distY = safeY - playerY
--		else
--			distY = playerY - safeY
--		end
--		if safe:getPlayers():contains(username) or safe:getOwner() == username then
--			if distX <= 10 and distY <= 10 then
--    	return true
--    end
--     end
--        end
--end

--function isSafe(player)
--for i=0,SafeHouse.getSafehouseList():size()-1 do
--		local safe = SafeHouse.getSafehouseList():get(i);
--		local safeX = safe:getX()
--		local safeY = safe:getY()
--		local playerX = player:getX()
--		local playerY = player:getY()
--		local distX = ''
--		local distY = ''
--		if safeX > playerX then
--			distX = safeX - playerX
--		else
--			distX = playerX - safeX
--		end
--		if safeY > playerY then
--			distY = safeY - playerY
--		else
--			distY = playerY - safeY
--		end
--			if distX <= 10 and distY <= 10 then
--    	return true
--    end
--        end
--end

Events.OnFillWorldObjectContextMenu.Add(doorlocksystem.onFillWorldObjectContextMenu)