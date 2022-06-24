
local oldProc = ISEquippedItem.prerender
function ISEquippedItem:prerender()
	oldProc( self)
	
	if isClient() then
		local maxY = getCore():getScreenHeight();
		local maxX = getCore():getScreenWidth();
		
		local square = self.chr:getSquare() --this should catch any situation where a character can not 'getSquare'
		if square then 
			self:drawText( "Coords: "..square:getX().."/"..square:getY(), maxX-300, maxY-60, 0.8, 0.8, 0.8, 1, UIFont.NewMedium)
		end
	end
end