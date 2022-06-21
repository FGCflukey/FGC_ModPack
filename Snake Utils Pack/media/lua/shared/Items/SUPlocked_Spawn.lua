function SUPlocked_Spawn(roomName, containerType, container)	
	local shouldLock = nil
	local combination = nil
	local padlocked = nil
	local vendor = nil
	local notShelf = nil
	local master = nil
	local keyId = nil
	if containerType == "metal_shelves" and container:getParent() and container:getParent():getProperties():Val("CustomName") == "Locker" then
		notShelf = true
	end

		
	if roomName:contains("security") then
		if containerType == "locker" or containerType == "crate" or containerType == "displaycase"  or containerType == "counter" or notShelf then
			if ZombRand(0,9) ~= 0 then
				shouldLock = true
				master = true
			end
		end
	end
	if roomName:contains("trainingcamp")then
		if containerType == "locker" or containerType == "crate" or containerType == "displaycase"  or containerType == "counter" or notShelf then
			if ZombRand(0,9) ~= 0 then
				shouldLock = true
			end
		end
	end
	if roomName:contains("ammomakerroom") then
		if containerType == "locker" or containerType == "army_locker" or notShelf and ZombRand(0,2) == 0 then
			shouldLock = true
		end
	end
	if roomName:contains("MilitaryGeneralRoom") then
		if containerType == "desk" or containerType == "wardrobe" or containerType == "security_box" or notShelf and ZombRand(0,2) == 0 then
			shouldLock = true
			padlocked = nil
			combination = nil
			master = true
		end
	end
	if roomName:contains("ammostorage") or roomName:contains("ammostorage2") or roomName:contains("vigtower") or roomName:contains("mcpolicestorage") or roomName:contains("mcgunstorestorage") or roomName:contains("hangarclothes") or roomName:contains("gunstorestorage")  then
		if containerType == "military_crate" or containerType == "extinguishers_shelves" or containerType == "military_shelves" or containerType == "army_locker" or containerType == "simple_military_crate" or containerType == "crate" or containerType == "ammo_crate" then
			if ZombRand(0,2) == 0 then
				shouldLock = true
				padlocked = nil
				combination = nil
				master = true
			end
		end
	end
	if (containerType == "simple_military_crate" or containerType == "military_crate" or containerType == "extinguishers_shelves" or containerType == "ammo_crate") then
		if ZombRand(0,3) == 0 then
			shouldLock = true
		end
	end
	if (containerType == "security_box") and ZombRand(0,2) == 0 then
		shouldLock = true
		combination = true
	end
	if shouldLock and (not master) and containerType == "army_locker" and roomName ~=("gunstore") then		
		padlocked = true
	end
	if shouldLock and (containerType == "ammo_crate" or containerType == "simple_military_crate" or containerType == "military_crate") then		
		padlocked = true
	end
	
	if container:getParent() and container:getParent():getProperties():Val("GroupName") == "Battered Cartboard" then shouldLock = nil end
	
	local cont = container:getParent()
	if cont then 
		keyId = cont:getX() + cont:getY()
		if not padlocked and master then keyId = math.floor( ( math.sqrt(cont:getX()) + math.sqrt(cont:getY()) )/3) end
		if not padlocked and master then
			if roomName:contains("gunstore") then
				keyId = keyId + 100
			elseif roomName:contains("policestorage") then
				keyId = keyId + 200
			elseif roomName:contains("armystorage") then
				keyId = keyId + 300
			elseif roomName:contains("security") then 
				keyId = keyId + 400
			end
		end	
	end
	locked_Spawn2(shouldLock, combination, padlocked, vendor, notShelf, master, keyId, container)
	
end

