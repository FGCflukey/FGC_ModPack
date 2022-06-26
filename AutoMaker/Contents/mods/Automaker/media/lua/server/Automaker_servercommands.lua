local Commands = {}
Commands.Automaker = {}

Commands.Automaker.CreateVehicle = function( player, args)
	
	local vehicle = addVehicleDebug( tostring( args.VehicleID), IsoDirections.E, nil, player:getSquare())
	
	if vehicle then
	
		vehicle:repair()		
		vehicle:putKeyInIgnition( vehicle:createVehicleKey())
		
		local gastank = vehicle:getPartById("GasTank")
		if gastank ~= nil then
			gastank:setContainerContentAmount( 0.0)
		end
		
		local thedoor = vehicle:getPartById("DoorFrontLeft")
		if thedoor ~= nil then
			thedoor:getDoor():setLocked( false)
			thedoor:getDoor():setLockBroken( false)
		end
	end
end

local onClientCommand = function( module, command, player, args)
	
	if Commands[module] and Commands[module][command] then		
		Commands[module][command]( player, args)
	end
end

Events.OnClientCommand.Add(onClientCommand)