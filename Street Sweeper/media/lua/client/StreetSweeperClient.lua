UG_StreetSweeper = {}

function UG_StreetSweeper.Cleanup()
	
	if isClient() then
	
		print( "sending StreetSweeper client command")
		sendClientCommand( getPlayer(), "StreetSweeper", "Cleanup", {})		
	end
end

Events.EveryTenMinutes.Add( UG_StreetSweeper.Cleanup)