local Commands = {}
Commands.RebuildEngine = {}

Commands.RebuildEngine.RepairEngine = function( player, args)
	
	if isClient() then return end
	local vehicle = getVehicleById( tonumber( args.vehicle))

	--just in case something goes wrong.
	if vehicle == nil then
		print( "Warning: no vehicle found while rebuilding engine.")
		return
	end
	
	--set Engine Condition to 100
	vehicle:getPartById( "Engine"):setCondition( 100)
	--set Engine Quality to 100
	vehicle:setEngineFeature( 100, vehicle:getEngineLoudness(), vehicle:getEnginePower())

end

local onClientCommand = function( module, command, player, args)
	
	if Commands[module] and Commands[module][command] then		
		Commands[module][command]( player, args)
	end
end

Events.OnClientCommand.Add(onClientCommand)