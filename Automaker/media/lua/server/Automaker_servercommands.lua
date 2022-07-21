local Commands = {}
Commands.Automaker = {}

Commands.Automaker.CreateVehicle = function( player, args)

	-- when true, the built vehicle will have all parts installed and set to 100% condition
	-- when false, the vehicle will have all parts uninstalled.
	local fullbuild = true
	
	if isClient() then return end
	
	local vehicle = addVehicleDebug( tostring( args.VehicleID), IsoDirections.E, nil, player:getSquare())
	
	if vehicle then
	
		vehicle:putKeyInIgnition( vehicle:createVehicleKey())
	
		if fullbuild then
		
			vehicle:repair()		
			
			local gastank = vehicle:getPartById("GasTank")
			if gastank ~= nil then
				gastank:setContainerContentAmount( 0.0)
			end
			
			local thedoor = vehicle:getPartById("DoorFrontLeft")
			if thedoor ~= nil then
				thedoor:getDoor():setLocked( false)
				thedoor:getDoor():setLockBroken( false)
			end		
		else
		
			local i = 0
			local part = vehicle:getPartByIndex( i)
			
			while part ~= nil do
				part:setInventoryItem( nil)
				i = i + 1
				part = vehicle:getPartByIndex( i)
			end		
		end
	end
end

local onClientCommand = function( module, command, player, args)
	
	if Commands[module] and Commands[module][command] then		
		Commands[module][command]( player, args)
	end
end

Events.OnClientCommand.Add(onClientCommand)