local oldProc = ISAttachTrailerToVehicle.isValid

function ISAttachTrailerToVehicle:isValid()
	--print( "keyword: ISAttachTrailerToVehicle called")
	if not self.character.admin then
		--print( "keyword: not an admin, check it out")
		if Valhalla ~= nil and isClient() then
			--print( "keyword: Valhalla is present and this is a client")
			
			local ownerA = Valhalla.VehicleClaims:getOwner( self.vehicleA)
			local ownerB = Valhalla.VehicleClaims:getOwner( self.vehicleB)
			if ownerA ~= nil or ownerB ~= nil then
				--print( "keyword: somebody owns something")
				
				if (ownerA and ownerA ~= self.character:getUsername()) or Valhalla.VehicleClaims:playerCanMaintainVehicle(self.character, self.vehicleA) == false then
					--print( "keyword: owner A tick")
					return false
				end
				
				if (ownerB and ownerB ~= self.character:getUsername()) or Valhalla.VehicleClaims:playerCanMaintainVehicle(self.character, self.vehicleB) == false then
					--print( "keyword: owner B tick")
					return false
				end				
			end
		end	
	end
	
	return oldProc( self)
end