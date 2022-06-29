UG_Automaker = {}

function UG_Automaker.buildSkillList( context, toolTip, mechanictype, player)

	local mechanicSkill = player:getPerkLevel( Perks.Mechanics)
	local metalworkSkill = player:getPerkLevel( Perks.MetalWelding)
	local electricalSkill = player:getPerkLevel( Perks.Electricity)
	local mechanicReq = 5
	local metalworkReq = 5
	local electricalReq = 5
	
	-- Script:getMechanicType()    1=standard 2=heavy duty 3=sports	
	if mechanictype == 1 then
	
		mechanicReq = 5
		metalworkReq = 5
		electricalReq = 6
	elseif mechanictype == 2 then
	
		mechanicReq = 7
		metalworkReq = 7
		electricalReq = 6
	elseif mechanictype == 3 then
	
		mechanicReq = 9
		metalworkReq = 9
		electricalReq = 6
	end

	if mechanicSkill < mechanicReq then
		toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> Mechanic skill " .. tostring( mechanicSkill) .. "/" .. tostring( mechanicReq)
		context.notAvailable = true
	else
		toolTip.description = toolTip.description .. " <LINE> <RGB:1,1,1> Mechanic skill " .. tostring( mechanicSkill) .. "/" .. tostring( mechanicReq)
	end
	
	if metalworkSkill < metalworkReq then
		toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> Metalwork skill " .. tostring( metalworkSkill) .. "/" .. tostring( metalworkReq)
		context.notAvailable = true
	else
		toolTip.description = toolTip.description .. " <LINE> <RGB:1,1,1> Metalwork skill " .. tostring( metalworkSkill) .. "/" .. tostring( metalworkReq)
	end
	
	if electricalSkill < electricalReq then
		toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> Electrical skill " .. tostring( electricalSkill) .. "/" .. tostring( electricalReq)
		context.notAvailable = true
	else
		toolTip.description = toolTip.description .. " <LINE> <RGB:1,1,1> Electrical skill " .. tostring( electricalSkill) .. "/" .. tostring( electricalReq)
	end	
end

function UG_Automaker.getMaterialReq( mechanictype)
	local ret = {}

	-- Script:getMechanicType()    1=standard 2=heavy duty 3=sports	
	if mechanictype == 1 then
	
		ret["SheetMetal"] = 50
		ret["MetalBar"] = 35
		ret["ElectronicsScrap"] = 30
		ret["ElectricWire"] = 30
		ret["EngineParts"] = 40
	elseif mechanictype == 2 then
	
		ret["SheetMetal"] = 80
		ret["MetalBar"] = 45
		ret["ElectronicsScrap"] = 30
		ret["ElectricWire"] = 35
		ret["EngineParts"] = 50
	elseif mechanictype == 3 then
	
		ret["SheetMetal"] = 60
		ret["MetalBar"] = 40
		ret["ElectronicsScrap"] = 40
		ret["ElectricWire"] = 35
		ret["EngineParts"] = 60
	end	
	
	return ret
end

function UG_Automaker.takeMaterials( mechanictype)

	local materials = UG_Automaker.getMaterialReq( mechanictype)
	local materialOnGround = buildUtil.checkMaterialOnGround( getPlayer():getSquare())	
	local playerInv = getPlayer():getInventory()

	local ISItem = {}
	ISItem.player = getPlayer():getPlayerNum()
	ISItem.sq = getPlayer():getSquare()
	ISItem.modData = {}	
	
	for m,c in pairs( materials) do -- m is the materialID, c is the number required
		ISItem.modData["need:Base.".. tostring( m)] = c
	end

	buildUtil.consumeMaterial(ISItem)
end

function UG_Automaker.buildMaterialList( context, toolTip, mechanictype, player)

	local PlayerInv = player:getInventory()
	local requirements = UG_Automaker.getMaterialReq( mechanictype)
	local materialOnGround = buildUtil.checkMaterialOnGround( player:getSquare())
	
	
	local totalMetalSheets = materialOnGround["SheetMetal"]
	if totalMetalSheets == nil then totalMetalSheets = 0 end
	totalMetalSheets = totalMetalSheets + PlayerInv:getCountTypeRecurse("SheetMetal")
	
	if totalMetalSheets < requirements["SheetMetal"] then
		toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> Metal Sheets " .. tostring( totalMetalSheets) .. "/" .. tostring( requirements["SheetMetal"])
		context.notAvailable = true;
	else
		toolTip.description = toolTip.description .. " <LINE> <RGB:1,1,1> Metal Sheets " .. tostring( totalMetalSheets) .. "/" .. tostring( requirements["SheetMetal"])
	end	

	
	local totalMetalBars = materialOnGround["MetalBar"]
	if totalMetalBars == nil then totalMetalBars = 0 end
	totalMetalBars = totalMetalBars + PlayerInv:getCountTypeRecurse("MetalBar")
	
	if totalMetalBars < requirements["MetalBar"] then
		toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> Metal Bars " .. tostring( totalMetalBars) .. "/" .. tostring( requirements["MetalBar"])
		context.notAvailable = true;
	else
		toolTip.description = toolTip.description .. " <LINE> <RGB:1,1,1> Metal Bars " .. tostring( totalMetalBars) .. "/" .. tostring( requirements["MetalBar"])
	end

	
	local totalScrapElectronics = materialOnGround["ElectronicsScrap"]
	if totalScrapElectronics == nil then totalScrapElectronics = 0 end
	totalScrapElectronics = totalScrapElectronics + PlayerInv:getCountTypeRecurse("ElectronicsScrap")
	
	if totalScrapElectronics < requirements["ElectronicsScrap"] then
		toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> Scrap Electronics " .. tostring( totalScrapElectronics) .. "/" .. tostring( requirements["ElectronicsScrap"])
		context.notAvailable = true;
	else
		toolTip.description = toolTip.description .. " <LINE> <RGB:1,1,1> Scrap Electronics " .. tostring( totalScrapElectronics) .. "/" .. tostring( requirements["ElectronicsScrap"])
	end	

	
	local totalElectricalWire = materialOnGround["ElectricWire"]
	if totalElectricalWire == nil then totalElectricalWire = 0 end
	totalElectricalWire = totalElectricalWire + PlayerInv:getCountTypeRecurse("ElectricWire")
	
	if totalElectricalWire < requirements["ElectricWire"] then
		toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> Electrical Wire " .. tostring( totalElectricalWire) .. "/" .. tostring( requirements["ElectricWire"])
		context.notAvailable = true;
	else
		toolTip.description = toolTip.description .. " <LINE> <RGB:1,1,1> Electrical Wire " .. tostring( totalElectricalWire) .. "/" .. tostring( requirements["ElectricWire"])
	end

	
	local totalEngineParts = materialOnGround["EngineParts"]
	if totalEngineParts == nil then totalEngineParts = 0 end
	totalEngineParts = totalEngineParts + PlayerInv:getCountTypeRecurse("EngineParts")

	if totalEngineParts < requirements["EngineParts"] then
		toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> Engine Parts " .. tostring( totalEngineParts) .. "/" .. tostring( requirements["EngineParts"])
		context.notAvailable = true;
	else
		toolTip.description = toolTip.description .. " <LINE> <RGB:1,1,1> Engine Parts " .. tostring( totalEngineParts) .. "/" .. tostring( requirements["EngineParts"])
	end
end

function UG_Automaker.initTooltip( context, vehicle, mechanictype, player)

	local toolTip = ISToolTip:new()
	toolTip:initialise()
	toolTip:setVisible(false)

	-- add it to our current option
	context.toolTip = toolTip
	toolTip:setName( "Build a new car")
	toolTip.description = "Automaker:" .. " <LINE> Let's build a car!"
	--toolTip:setTexture("crafted_01_16")  --figure out a way to get images of each car.
	
	UG_Automaker.buildSkillList( context, toolTip, mechanictype, player)
	UG_Automaker.buildMaterialList( context, toolTip, mechanictype, player)
	
end

function UG_Automaker.FillWorldContextMenu( player, context, worldobjects, test)

	player = getPlayer()
	local automakerOption = context:addOption( "Build New Vehicle", worldobjects, nil)	

	local subMenuVehicles = ISContextMenu:getNew(context)
	context:addSubMenu(automakerOption, subMenuVehicles)

	local subMenuStandard = subMenuVehicles:addOption( "Standard Models", worldobjects, nil)
	local subMenuStandardModels = ISContextMenu:getNew(context)
	context:addSubMenu(subMenuStandard, subMenuStandardModels)

	local subMenuSport = subMenuVehicles:addOption( "Sport Models", worldobjects, nil)
	local subMenuSportModels = ISContextMenu:getNew(context)
	context:addSubMenu(subMenuSport, subMenuSportModels)
	
	local subMenuHeavyDuty = subMenuVehicles:addOption( "Heavy Duty Models", worldobjects, nil)
	local subMenuHeavyDutyModels = ISContextMenu:getNew(context)
	context:addSubMenu(subMenuHeavyDuty, subMenuHeavyDutyModels)
	
	local subMenuOther = subMenuVehicles:addOption( "Other Models", worldobjects, nil)
	local subMenuOtherModels = ISContextMenu:getNew(context)
	context:addSubMenu(subMenuOther, subMenuOtherModels)

	local AllScripts = getScriptManager():getAllVehicleScripts()
	
	for i=1, AllScripts:size() do
	
		local v = AllScripts:get( i-1)
		if string.find( v:getName(), "Smashed") == nil and string.find( v:getName(), "Burnt") == nil then
		
			local mt = v:getMechanicType()  -- Script:getMechanicType()    1=standard 2=heavy duty 3=sports	
			local ModelContext
			
			if mt == 1 then
			
				ModelContext = subMenuStandardModels:addOption( getText("IGUI_VehicleName" .. v:getName()), worldobjects, UG_Automaker.onNewVehicle, v:getFullName(), mt)
				UG_Automaker.initTooltip( ModelContext, v, mt, player)
			elseif mt == 2 then

				ModelContext = subMenuHeavyDutyModels:addOption( getText("IGUI_VehicleName" .. v:getName()), worldobjects, UG_Automaker.onNewVehicle, v:getFullName(), mt)
				UG_Automaker.initTooltip( ModelContext, v, mt, player)
			elseif mt == 3 then

				ModelContext = subMenuSportModels:addOption( getText("IGUI_VehicleName" .. v:getName()), worldobjects, UG_Automaker.onNewVehicle, v:getFullName(), mt)
				UG_Automaker.initTooltip( ModelContext, v, mt, player)
			else
			
				ModelContext = subMenuOtherModels:addOption( getText("IGUI_VehicleName" .. v:getName()), worldobjects, UG_Automaker.onNewVehicle, v:getFullName(), mt)
				UG_Automaker.initTooltip( ModelContext, v, mt, player)
			end		
		end
	end
end

function UG_Automaker.onNewVehicle( worldobjects, vehiclescript, mechanictype)

	UG_Automaker.takeMaterials( mechanictype)
	sendClientCommand( getPlayer(), "Automaker", "CreateVehicle", { VehicleID = vehiclescript})
end

Events.OnFillWorldObjectContextMenu.Add(UG_Automaker.FillWorldContextMenu)