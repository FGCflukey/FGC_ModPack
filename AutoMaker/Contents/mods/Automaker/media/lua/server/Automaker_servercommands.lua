local Commands = {}
Commands.Automaker = {}

Commands.Automaker.CreateVehicle = function( player, args)
	
	local vehicle = addVehicleDebug( tostring( args.VehicleID), IsoDirections.E, nil, player:getSquare())
	
	if vehicle then
	
		vehicle:repair()		
		vehicle:putKeyInIgnition( vehicle:createVehicleKey())
		vehicle:getPartById("DoorFrontLeft"):setLockBroken( false)
		vehicle:getPartById("DoorFrontLeft"):setLocked( false)
	end
end

local onClientCommand = function( module, command, player, args)
	
	if Commands[module] and Commands[module][command] then		
		Commands[module][command]( player, args)
	end
end

Events.OnClientCommand.Add(onClientCommand)