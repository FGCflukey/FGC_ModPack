
local oldProc = ISEquippedItem.prerender
function ISEquippedItem:prerender()
	oldProc( self)
	
	if isClient() then
		local maxY = getCore():getScreenHeight();
		local maxX = getCore():getScreenWidth();
		
		self:drawText( "Coords: "..self.chr:getSquare():getX().."/"..self.chr:getSquare():getY(), maxX-300, maxY-60, 0.8, 0.8, 0.8, 1, UIFont.NewMedium)
	end
end