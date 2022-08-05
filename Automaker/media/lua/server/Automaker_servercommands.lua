local Commands = {}
Commands.Automaker = {}

Commands.Automaker.CreateVehicle = function( player, args)
	
	if isClient() then return end
	
	local vehicle = addVehicleDebug( tostring( args.VehicleID), IsoDirections.E, nil, player:getSquare())
	
	if vehicle then
	
		vehicle:putKeyInIgnition( vehicle:createVehicleKey())
	
		if SandboxVars.UG_Automaker.fullbuild then
		
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

		vehicle:setEngineFeature( PZMath.clamp(player:getPerkLevel( Perks.Mechanics) * 10 + (ZombRand(30) - 15), 50 , 100), vehicle:getEngineLoudness(), vehicle:getEnginePower())
		
		sendServerCommand( player, "Automaker", "TakeMaterials", { MechanicType=args.MechanicType})
	else
	
		print( "Automaker Error:  No vehicle spawned for " .. tostring( player.getName()))
	end
end

local onClientCommand = function( module, command, player, args)
	
	if Commands[module] and Commands[module][command] then		
		Commands[module][command]( player, args)
	end
end

Events.OnClientCommand.Add(onClientCommand)