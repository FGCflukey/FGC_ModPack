--debugVehicleColor(playerObj, vehicle)

UGPaintJob = {}

-- baseVehicle.ModelInfo.modelScript.shaderName
-- baseVehicle.ModelInfo.modelScript.textureName

function UGPaintJob.PJ_worldcontext( player, context, worldObjects, test)

	local playerObj = getSpecificPlayer( player)
	
    local square = nil;
	
    for i,v in ipairs( worldObjects) do
	
        square = v:getSquare();
        break;
    end
	
	local vehicle = square:getVehicleContainer()
	
	-- local PaintCans
	-- PaintCans = playerObj:getInventory():getAllCategoryRecurse( "Paint", PaintCans)
	
	local hasPaint = true
	
	-- for _,v in pairs( PaintCans) do
	
		-- if v:isDrainable() and v:getUsedDelta() == 1 then
		
			-- hasPaint = true
			-- break
		-- end
	-- end
	
    if vehicle ~= nil then
	
		--local paintOption = context:addOption( "Paint Vehicle", playerObj, UGPaintJob.onPaintVehicle, vehicle);
		
		--add in a few sanity checks....
		--if isAdmin() and isUpsideDownVehicle( vehicle) then
		if isAdmin() then
			local flipOption = context:addOption( "Flip Vehicle Upright", playerObj, UGPaintJob.onFlipVehicle, vehicle);
		end
		
		if not hasPaint then
			--paintOption.notAvailable = true
		end
	end
end

function isUpsideDownVehicle(vehicle)

	local tempVector1 = Vector3f.new()
	local tempVector2 = Vector3f.new()
	
	local topPos = vehicle:getWorldPos(0, 1, 0, tempVector1)
	local centerPos = vehicle:getWorldPos(0, 0, 0, tempVector2)

	return topPos:z() < (centerPos:z() + 0.3)
end

function getCorrectAngle(vehicle)

	local tempVector1 = Vector3f.new()
	local tempVector2 = Vector3f.new()
	
	local frontPos = vehicle:getWorldPos(0, 0, 1, tempVector1)
	local centerPos = vehicle:getWorldPos(0, 0, 0, tempVector2)

	local dx = frontPos:x() - centerPos:x()
	local dy = frontPos:y() - centerPos:y()

	local dirVector = tempVector1:set(dx, dy, 0):normalize()
	local baseVector = tempVector2:set(1, 0, 0):normalize()

	local angle = (baseVector:angle(dirVector) * 180 / math.pi + 270) % 360

	return angle
end

function UGPaintJob.onFlipVehicle( playerObj, vehicle)
	
	if not vehicle then return end
	
	local angle = getCorrectAngle(vehicle)
	vehicle:flipUpright();
	vehicle:setAngles(0, angle, 0)
	vehicle:setPhysicsActive(true)
	vehicle:updatePhysics()
end

function UGPaintJob.onPaintVehicle( playerObj, vehicle)

	-- local PaintCans
	-- playerObj:getInventory():getAllCategoryRecurse( "Paint", PaintCans)
	
	local hasPaint = true
	
	-- for i,v in ipairs( PaintCans) do
	
		-- if v:isDrainable() and v:getUsedDelta() == 1 then
		
			-- hasPaint = true
			-- v:getContainer():DoRemoveItem( v)
			-- v=nil
			-- break
		-- end
	-- end
	
	if hasPaint then
	
		debugVehicleColor( playerObj, vehicle)
	end
end

Events.OnFillWorldObjectContextMenu.Add( UGPaintJob.PJ_worldcontext)