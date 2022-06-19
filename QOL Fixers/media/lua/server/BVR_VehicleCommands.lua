if isClient() then return end

local BVR_VehicleCommands = {}
local BVR_Commands = {}

BVR_VehicleCommands.wantNoise = getDebug() or false

local noise = function(msg)
	if BVR_VehicleCommands.wantNoise then
--		print('VehicleCommands: '..msg)
	end
end

function BVR_Commands.repairHeater(player, args)
	local vehicle = getVehicleById(args.vehicle)
	if vehicle then
		local part = vehicle:getPartById("Heater")
		
		if not part then
			noise('no such part heater')
			return
		end
		
		local blowtorch = player:getPrimaryHandItem()
		
		if blowtorch == nil or blowtorch:getType() ~= "BlowTorch" or blowtorch:getDrainableUsesInt() < 5 then
			noise('blowtorch not equipped or not enough uses')
		end
		
		part:setCondition(args.targetCondition)
		
		player:sendObjectChange('addXp', { perk = Perks.MetalWelding:index(), xp = 2, noMultiplier = false })
		
		for partType,partCount in pairs(args["repairParts"]) do
			player:sendObjectChange('removeItemType', { type = partType, count = partCount })
		end

		blowtorch:Use()
		blowtorch:Use()
		blowtorch:Use()
		blowtorch:Use()
		blowtorch:Use()



		vehicle:updatePartStats()
		vehicle:updateBulletStats()
		vehicle:transmitPartCondition(part)
		vehicle:transmitPartItem(part)
		vehicle:transmitPartModData(part)

		player:sendObjectChange('mechanicActionDone', { success = true, vehicleId = vehicle:getId(), partId = part:getId(), itemId = -1, installing = true })
	else
		noise('no such vehicle id='..tostring(args.vehicle))
	end
end

BVR_VehicleCommands.OnClientCommand = function(module, command, player, args)
	if module == 'BVR_vehicle' and BVR_Commands[command] then
		local argStr = ''
		args = args or {}
		for k,v in pairs(args) do
			if k == "repairParts" then
				argStr = argStr..' '..k..'={'
				
				for l,w in pairs(args[k]) do
					argStr = argStr..' '..l..'='..tostring(w)
				end
				
				argStr = argStr..'}'
			else
				argStr = argStr..' '..k..'='..tostring(v)
			end
		end
		noise('received '..module..' '..command..' '..tostring(player)..argStr)
		BVR_Commands[command](player, args)
	end
end

Events.OnClientCommand.Add(BVR_VehicleCommands.OnClientCommand)
