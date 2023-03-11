UG_Automaker = {}

UG_Automaker.fullbuild = true

function UG_Automaker.VehicleBlackList( VehicleID)
	--any VehicleID in this list will return True (as in it's blacklisted don't make it)
	if VehicleID == "ATAArmyBus" then
		return true
	elseif VehicleID == "ATAPrisonBus" then
		return true
	elseif VehicleID == "ATASchoolBus" then
		return true
	elseif VehicleID == "BoatMotor" then
		return true
	elseif VehicleID == "BoatMotor_Ground" then
		return true		
	elseif VehicleID == "BoatSailingYacht" then
		return true
	elseif VehicleID == "BoatSailingYacht_Ground" then
		return true
	elseif VehicleID == "86bounder" then
		return true
	elseif VehicleID == "86econolinerv" then
		return true
	elseif VehicleID == "schoolbus" then
		return true		
	elseif VehicleID == "schoolbusshort" then
		return true
	elseif VehicleID == "Trailercamperscamp" then
		return true
	elseif VehicleID == "TrailerHome" then
		return true
	elseif VehicleID == "TrailerHomeExplorer" then
		return true
	elseif VehicleID == "TrailerHomeHartman" then
		return true
	elseif VehicleID == "TrailerWithBoatMotor" then
		return true
	elseif VehicleID == "TrailerWithBoatSailingYacht" then
		return true
	elseif VehicleID == "BoatZeroPatient" then
		return true
	elseif VehicleID == "TrailerAMCWaverunner" then
		return true
	elseif VehicleID == "AMC_Waverunner_Ground" then
		return true
	elseif VehicleID == "AMC_Waverunner" then
		return true
	elseif VehicleID == "TrailerAMCWaverunnerWithBody" then
		return true
	elseif VehicleID == "TrailerWithBoat" then
		return true
	elseif VehicleID == "BoatSailingYacht_shipwreckland" then
		return true
		
	--remove vehicles from Expanded Helicopter events mod
	elseif string.find( VehicleID, "Bell206") then 
		return true
	elseif string.find( VehicleID, "SupplyDrop") then
		return true
	elseif string.find( VehicleID, "UH1H") then
		return true
	elseif string.find( VehicleID, "UH60") then
		return true
	else
		return false
	end
end

function UG_Automaker.getVehicleRealName( VehicleID)

	if VehicleID == "CarTaxi" then
		return "Yellow Taxi"
	elseif VehicleID == "CarTaxi2" then
		return "Green Taxi"	
	elseif VehicleID == "CarLightsPolice" then
		return "Chevalier Nyala: Police"
	elseif VehicleID == "TrailerAdvert" then
		return "Advert Trailer"
	elseif VehicleID == "TrailerCover" then
		return "Small Covered Trailer"	
	elseif VehicleID == "92crownvicRavenCreek" then
		return "1992 Crown Vic Raven Creek PD"	
	elseif VehicleID == "92crownvicMetroAirport" then
		return "1992 Crown Vic Metro Airport PD "	
	elseif VehicleID == "85vicKnoxSheriff" then
		return "1985 Crown Vic Knox County Sheriff "	
	elseif VehicleID == "92crownvicMatthews" then
		return "1992 Crown Vic St. Matthews PD"	
	elseif VehicleID == "92crownvicUSAF" then
		return "1992 Crown Vic USAF"	
	elseif VehicleID == "Trailer" then
		return "Small Open Trailer"	
	elseif VehicleID == "92crownvicLDOC" then
		return "1992 Crown Vic Louisville Corrections"	
	elseif VehicleID == "CarLights" then
		return "Kentucky Ranger"	
	elseif VehicleID == "92crownvicWestPointSpecial" then
		return "1992 Crown Vic West Point PD 'special'"	
	elseif VehicleID == "92crownvicWestPoint" then
		return "1992 Crown Vic West Point PD"	
	elseif VehicleID == "92crownvicBlackwood" then
		return "1992 Crown Vic Blackwood PD"	
	elseif VehicleID == "92crownvicRavenCreekTransit" then
		return "1992 Crown Vic Raven Creek Transit PD"	
	elseif VehicleID == "92crownvicLynnview" then
		return "1992 Crown Vic Lynnview PD"	
	elseif VehicleID == "85vicUK" then
		return "1985 Crown Vic University of Kentucky "	
	-- elseif VehicleID == "Car2" then
		-- return "Green "	
	-- elseif VehicleID == "Car2" then
		-- return "Green "	
	-- elseif VehicleID == "Car2" then
		-- return "Green "	
	-- elseif VehicleID == "Car2" then
		-- return "Green "	
	-- elseif VehicleID == "Car2" then
		-- return "Green "	
	-- elseif VehicleID == "Car2" then
		-- return "Green "	
	-- elseif VehicleID == "Car2" then
		-- return "Green "	
	-- elseif VehicleID == "Car2" then
		-- return "Green "	
	-- elseif VehicleID == "Car2" then
		-- return "Green "	
	-- elseif VehicleID == "Car2" then
		-- return "Green "	
	-- elseif VehicleID == "Car2" then
		-- return "Green "	
	-- elseif VehicleID == "Car2" then
		-- return "Green "	
	-- elseif VehicleID == "Car2" then
		-- return "Green "	
		else
			return getText("IGUI_VehicleName" .. VehicleID)
	end
end

function UG_Automaker.buildSkillList( context, toolTip, mechanictype, player)

	local mechanicSkill = player:getPerkLevel( Perks.Mechanics)
	local metalworkSkill = player:getPerkLevel( Perks.MetalWelding)
	local electricalSkill = player:getPerkLevel( Perks.Electricity)
	local mechanicReq = 5
	local metalworkReq = 5
	local electricalReq = 5
	
	-- Script:getMechanicType()    1=standard 2=heavy duty 3=sports	
	if isAdmin() and player:isBuildCheat() then
		
		mechanicReq = 0
		metalworkReq = 0
		electricalReq = 0
	elseif mechanictype == 1 then
	
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
	else
	
		mechanicReq = 11
		metalworkReq = 11
		electricalReq = 11
	end

	if mechanicSkill < mechanicReq then
		toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> Mechanic skill " .. tostring( mechanicSkill) .. "/" .. tostring( mechanicReq)
		context.notAvailable = true
	else
		toolTip.description = toolTip.description .. " <LINE> <RGB:1,1,1> Mechanic skill " .. tostring( mechanicSkill) .. "/" .. tostring( mechanicReq)
	end
	
	if metalworkSkill < metalworkReq and not( isAdmin() and getPlayer():isBuildCheat()) then
		toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> Metalwork skill " .. tostring( metalworkSkill) .. "/" .. tostring( metalworkReq)
		context.notAvailable = true
	else
		toolTip.description = toolTip.description .. " <LINE> <RGB:1,1,1> Metalwork skill " .. tostring( metalworkSkill) .. "/" .. tostring( metalworkReq)
	end
	
	if electricalSkill < electricalReq and not( isAdmin() and getPlayer():isBuildCheat()) then
		toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> Electrical skill " .. tostring( electricalSkill) .. "/" .. tostring( electricalReq)
		context.notAvailable = true
	else
		toolTip.description = toolTip.description .. " <LINE> <RGB:1,1,1> Electrical skill " .. tostring( electricalSkill) .. "/" .. tostring( electricalReq)
	end	
end

function UG_Automaker.getMaterialReq( mechanictype)
	local ret = {}
	
	if isAdmin() and getPlayer():isBuildCheat() then
	
		ret["SheetMetal"] = 0
		ret["MetalBar"] = 0
		ret["ElectronicsScrap"] = 0
		ret["ElectricWire"] = 0
		ret["EngineParts"] = 0
	--Script:getMechanicType()    1=standard 2=heavy duty 3=sports	
	elseif mechanictype == 1 then
	
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
	else
	
		ret["SheetMetal"] = 80
		ret["MetalBar"] = 80
		ret["ElectronicsScrap"] = 80
		ret["ElectricWire"] = 80
		ret["EngineParts"] = 80	
	end

	if not SandboxVars.UG_Automaker.fullbuild then
	
		ret["SheetMetal"] = math.floor( ret["SheetMetal"] /3)
		ret["MetalBar"] = math.floor( ret["MetalBar"] / 3)
		ret["ElectronicsScrap"] = math.floor( ret["ElectronicsScrap"] / 3)
		ret["ElectricWire"] = math.floor( ret["ElectricWire"] / 3)
		ret["EngineParts"] = math.floor( ret["EngineParts"] / 3)
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
		if m == "ElectricWire" then
			ISItem.modData["need:Radio." .. tostring( m)] = c
		else
			ISItem.modData["need:Base.".. tostring( m)] = c
		end
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
	
	if mechanictype == 1 then
		
		if player:getKnownRecipes():contains("Automaker Basics") == false then
			toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> Recipe: Automaker Basics "
			context.notAvailable = true; 
		else
			toolTip.description = toolTip.description .. " <LINE> <RGB:1,1,1> Recipe: Automaker Basics "
		end
	elseif mechanictype == 2 then

		if player:getKnownRecipes():contains("Automaker Intermediate") == false then
			toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> Recipe: Automaker Intermediate "
			context.notAvailable = true; 
		else
			toolTip.description = toolTip.description .. " <LINE> <RGB:1,1,1> Recipe: Automaker Intermediate "
		end
	elseif mechanictype == 3 then

		if player:getKnownRecipes():contains("Automaker Expert") == false then
			toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> Recipe: Automaker Expert "
			context.notAvailable = true; 
		else
			toolTip.description = toolTip.description .. " <LINE> <RGB:1,1,1> Recipe: Automaker Expert "
		end
	end
	
end

function UG_Automaker.getSkillReq( player, mechanictype)

	local mechanicReq = 5
	local metalworkReq = 5
	local electricalReq = 5
	
	-- Script:getMechanicType()    1=standard 2=heavy duty 3=sports	
	if isAdmin() and player:isBuildCheat() then
		
		mechanicReq = 0
		metalworkReq = 0
		electricalReq = 0
	elseif mechanictype == 1 then
	
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
	else
	
		mechanicReq = 11
		metalworkReq = 11
		electricalReq = 11
	end
	
	return mechanicReq, metalworkReq, electricalReq

end

function UG_Automaker.canBuild( player, mechanictype)
	
	local materialReqs = UG_Automaker.getMaterialReq( mechanictype)
	local groundItems = buildUtil.getMaterialOnGround( player:getSquare())
	local groundItemCounts = buildUtil.getMaterialOnGroundCounts( groundItems)	
	local playerInv = player:getInventory()
	
	--do they have the materials?
	for k,v in pairs( materialReqs) do
	
		if luautils.stringStarts( k, "need:") then
		
			local itemFullType = luautils.split( k, ":")[ 2]
			local nbOfItem = playerInv:getCountTypeEvalRecurse( itemFullType, buildUtil.predicateMaterial)
			
			if groundItemCounts[ itemFullType] then
				nbOfItem = nbOfItem + groundItemCounts[ itemFullType];
			end
			if nbOfItem < tonumber( v) then
				--player:Say("Not enough mats")
				return false
			end			
		end
	end
	
	--do they have the skill?	
	local mechanicReq, metalworkReq, electricalReq = UG_Automaker.getSkillReq( player, mechanictype)

	if player:getPerkLevel( Perks.Mechanics) < mechanicReq then
		--player:Say("Not enough skill Mech")
		return false
	end
	
	if player:getPerkLevel( Perks.MetalWelding) < metalworkReq then
		--player:Say("Not enough skill Meta")
		return false
	end
	
	if player:getPerkLevel( Perks.Electricity) < electricalReq  then
		--player:Say("Not enough skill Elec")
		return false
	end

	--have they read the books!?
	if mechanictype == 1 and player:getKnownRecipes():contains("Automaker Basics") == false then
		--player:Say("No book1")
		return false
	elseif mechanictype == 2 and player:getKnownRecipes():contains("Automaker Intermediate") == false then
		--player:Say("No book2")
		return false
	elseif mechanictype == 3 and player:getKnownRecipes():contains("Automaker Expert") == false then
		--player:Say("No book3")
		return false
	end
	
	--should be all good now
	return true
end

-- function UG_Automaker.initTooltip( context, vehicle, mechanictype, player)

	-- local toolTip = ISToolTip:new()
	-- toolTip:initialise()
	-- toolTip:setVisible(false)

	-- -- add it to our current option
	-- context.toolTip = toolTip
	-- toolTip:setName( "Build a new car")
	-- toolTip.description = tostring(vehicle:getName()) .. "<LINE>Automaker:" .. "<LINE>Let's build a car!<LINE>"
	
	-- UG_Automaker.buildSkillList( context, toolTip, mechanictype, player)
	-- UG_Automaker.buildMaterialList( context, toolTip, mechanictype, player)
	
-- end

 function UG_Automaker.FillWorldContextMenu( player, context, worldobjects, test)

	player = getPlayer()	
	local automakerOption = context:addOption( "Build Vehicle", worldobjects, UG_Automaker.onNewNew, player)
	-- local automakerOption = context:addOption( "Build New Vehicle", worldobjects, nil)	

	-- local subMenuVehicles = ISContextMenu:getNew(context)
	-- context:addSubMenu(automakerOption, subMenuVehicles)

	-- local subMenuStandard = subMenuVehicles:addOption( "Standard Models", worldobjects, nil)
	-- local subMenuStandardModels = ISContextMenu:getNew(context)
	-- context:addSubMenu(subMenuStandard, subMenuStandardModels)

	-- local subMenuSport = subMenuVehicles:addOption( "Sport Models", worldobjects, nil)
	-- local subMenuSportModels = ISContextMenu:getNew(context)
	-- context:addSubMenu(subMenuSport, subMenuSportModels)
	
	-- local subMenuHeavyDuty = subMenuVehicles:addOption( "Heavy Duty Models", worldobjects, nil)
	-- local subMenuHeavyDutyModels = ISContextMenu:getNew(context)
	-- context:addSubMenu(subMenuHeavyDuty, subMenuHeavyDutyModels)
	
	-- local subMenuOther = subMenuVehicles:addOption( "Other Models", worldobjects, nil)
	-- local subMenuOtherModels = ISContextMenu:getNew(context)
	-- context:addSubMenu(subMenuOther, subMenuOtherModels)

	-- local AllScripts = getScriptManager():getAllVehicleScripts()
	
	-- for i=1, AllScripts:size() do
	
		-- local v = AllScripts:get( i-1)
		-- if UG_Automaker.VehicleBlackList( v:getName()) == false and string.find( v:getName(), "Smashed") == nil and string.find( v:getName(), "Burnt") == nil and string.find( v:getName(), "shipwreck") == nil then
		
			-- local mt = v:getMechanicType()  -- Script:getMechanicType()    1=standard 2=heavy duty 3=sports	
			-- local ModelContext
			
			-- if mt == 1 then
			
				-- ModelContext = subMenuStandardModels:addOption( UG_Automaker.getVehicleRealName( v:getName()), worldobjects, UG_Automaker.onNewVehicle, v:getFullName(), mt, subMenuVehicles)
				-- UG_Automaker.initTooltip( ModelContext, v, mt, player)
			-- elseif mt == 2 then

				-- ModelContext = subMenuHeavyDutyModels:addOption( getText("IGUI_VehicleName" .. v:getName()), worldobjects, UG_Automaker.onNewVehicle, v:getFullName(), mt, subMenuVehicles)
				-- UG_Automaker.initTooltip( ModelContext, v, mt, player)
			-- elseif mt == 3 then

				-- ModelContext = subMenuSportModels:addOption( getText("IGUI_VehicleName" .. v:getName()), worldobjects, UG_Automaker.onNewVehicle, v:getFullName(), mt, subMenuVehicles)
				-- UG_Automaker.initTooltip( ModelContext, v, mt, player)
			-- else
			
				-- ModelContext = subMenuOtherModels:addOption( getText("IGUI_VehicleName" .. v:getName()), worldobjects, UG_Automaker.onNewVehicle, v:getFullName(), mt, subMenuVehicles)
				-- UG_Automaker.initTooltip( ModelContext, v, mt, player)
			-- end		
		-- end
	-- end
end

function UG_Automaker.onNewVehicle( worldobjects, vehiclescript, mechanictype, context)

	-- if context then
		-- context:closeAll()
		-- context:setVisible(false)
	-- end --for some reason the context menu stays open.
	
	--UG_Automaker.takeMaterials( mechanictype)
	sendClientCommand( getPlayer(), "Automaker", "CreateVehicle", { VehicleID=vehiclescript, MechanicType=mechanictype})
end

function UG_Automaker.init()

	this.fullbuild = SandboxVars.UG_Automaker.fullbuild
end

function UG_Automaker.onNewNew( worldobjects, player)

	UG_AutomakerUI:show( player)
end


--New UI with 3D Preview
UG_AutomakerUI = ISCollapsableWindow:derive("UG_AutomakerUI")
UG_AutomakerUI.instance = nil;
UG_AutomakerUI.SMALL_FONT_HGT = getTextManager():getFontFromEnum(UIFont.Small):getLineHeight()
UG_AutomakerUI.MEDIUM_FONT_HGT = getTextManager():getFontFromEnum(UIFont.Medium):getLineHeight()

local width = 845
local height = 550
local posX = 0
local posY = 0
 
function UG_AutomakerUI:show( player)

    local square = player:getSquare()
    posX = square:getX()
    posY = square:getY()

	if UG_AutomakerUI.instance == nil then
		
		UG_AutomakerUI.instance = UG_AutomakerUI:new( 0, 0, width, height, player)
		UG_AutomakerUI.instance:initialise()
		UG_AutomakerUI.instance:instantiate()
	end
	
	UG_AutomakerUI.instance.pinButton:setVisible( false)
	UG_AutomakerUI.instance.collapseButton:setVisible( false)
	UG_AutomakerUI.instance:addToUIManager()
	--UG_AutomakerUI.instance.setVisible( true)
	
	return UG_AutomakerUI.instance;
end

function UG_AutomakerUI:onMouseMove( dx, dy)

	self.mouseOver = true;
	if self.moving then
	
		self:setX( self.x + dx)
		self:setY( self.y + dy)
		self:bringToTop();
	end
	
	--UG_AutomakerUI.instance:toggleToolTip( false)
end

function UG_AutomakerUI:onMouseDown( x, y)

	ISCollapsableWindow.onMouseDown( self, x, y)
	--if UG_AutomakerUI.instance then UG_AutomakerUI.instance.close() end
end

function UG_AutomakerUI:close()

	self:setVisible( false)
	UG_AutomakerUI.instance:removeFromUIManager()
	UG_AutomakerUI.instance = nil
	self:removeFromUIManager()
end

function UG_AutomakerUI:createChildren()

	ISCollapsableWindow.createChildren( self)
	
	local x=30
	local y=85
	
    local th = self:titleBarHeight()
    self.panel = ISTabPanel:new(1, th, self.width-2, self.height-(th+1))
    self.panel:initialise()
    self.panel:setAnchorRight(true)
    self.panel:setAnchorBottom(true)
    self.panel.borderColor = { r = 1, g = 0, b = 0, a = 1}
    --self.panel.onActivateView = self.onActivateView
    self.panel.target = self
	self.panel.tabHeight = 25
    self.panel:setEqualTabWidth(false)
    self:addChild(self.panel)
	
	local tab
	--Script:getMechanicType()    1=standard 2=heavy duty 3=sports	
	
	tab = AutoTab:new(0, 0, self.width, self.panel.height - self.panel.tabHeight)
	tab:initialise()
	tab:setAnchorRight(true)
	tab:setAnchorBottom(true)
	tab:setAutoList(UG_AutomakerUI.instance)
	tab:setCategoryType( "Standard Models")
	tab:FillList()
	tab:FillDescription( 1)
	self.panel:addView( "Standard Models", tab)
	tab.parent = self

	tab = AutoTab:new(0, 0, self.width, self.panel.height - self.panel.tabHeight)
	tab:initialise()
	tab:setAnchorRight(true)
	tab:setAnchorBottom(true)
	tab:setAutoList(UG_AutomakerUI.instance)
	tab:setCategoryType( "Sport Models")
	tab:FillList()
	tab:FillDescription( 3)
	self.panel:addView( "Sport Models", tab)
	tab.parent = self
	
	tab = AutoTab:new(0, 0, self.width, self.panel.height - self.panel.tabHeight)
	tab:initialise()
	tab:setAnchorRight(true)
	tab:setAnchorBottom(true)
	tab:setAutoList(UG_AutomakerUI.instance)
	tab:setCategoryType( "Heavy Duty Models")
	tab:FillList()
	tab:FillDescription( 2)
	self.panel:addView( "Heavy Duty Models", tab)
	tab.parent = self
	
	self.panel:activateView( "Standard Models")
end

function UG_AutomakerUI:render()

	ISCollapsableWindow.render( self)
end

function UG_AutomakerUI:new(x, y, width, height, player)
    local o = {}
    if x == 0 and y == 0 then
        x = (getCore():getScreenWidth() / 2) - (width / 2);
        y = (getCore():getScreenHeight() / 2) - (height / 2);
    end
    o = ISCollapsableWindow:new(x, y, width, height);
    setmetatable(o, self)
    o.fgBar = {r=0, g=0.6, b=0, a=0.7 }
    self.__index = self
    
    o.title = "Automaker: Select a vehicle to create **Please create your vehicle outside in an open area!**"
    o.player = player
    o.resizable = false;
    return o
end

















Events.OnFillWorldObjectContextMenu.Add(UG_Automaker.FillWorldContextMenu)


if not isClient() then return end

local Commands = {}
Commands.Automaker = {}

Commands.Automaker.TakeMaterials = function( args)

	UG_Automaker.takeMaterials( tonumber( args.MechanicType))
end

local function OnServerCommand( module, command, args)

	if Commands[module] and Commands[module][command] then
		Commands[module][command]( args)
	end
end

Events.OnServerCommand.Add(OnServerCommand)