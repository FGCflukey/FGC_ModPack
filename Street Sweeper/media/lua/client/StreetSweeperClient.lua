UG_StreetSweeper = {}

function UG_StreetSweeper.Cleanup()
	
	if isClient() then
	
		print( "sending StreetSweeper client command")
		sendClientCommand( getPlayer(), "StreetSweeper", "Cleanup", {})		
	end
end

Events.EveryTenMinutes.Add( UG_StreetSweeper.Cleanup)

-- local orig_DropWorldItemAction = ISDropWorldItemAction.perform

-- function ISDropWorldItemAction.perform()
	
	-- print("drop item tag?")
	-- if self.item:getModData().placed then
		-- print("Tagging placed item")
		-- self.item:getModData().placed = nil
		-- self.item:getModData().isPlaced = true
		-- self.item:transmitModData()
	-- end
	
	-- orig_DropWorldItemAction( self)
	
	-- self.sq:transmitModData()
-- end

-- local old3dcursor = ISPlace3DItemCursor.create

-- function ISPlace3dItemCursor.create( x, y, z, north, sprite)

	-- print("3dItemCursor tag")
	-- for i,v in ipairs(self.items) do
		-- v:getModData().placed = true
		-- v:transmitModData()
	-- end
	
	-- old3dcursor( self)
	
	-- self.itemSq:transmitModData()
-- end