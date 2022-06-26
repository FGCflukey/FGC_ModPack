UG_Automaker = {}

local function UG_Automaker.initTooltip( context, vehicle, mechanictype, player)

end

function UG_Automaker.FillWorldContextMenu( player, context, worldobjects, test)

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
		
			local mt = v:getMechanicType()
			-- Script:getMechanicType()    1=standard 2=heavy duty 3=sports	
			
			if mt == 1 then
			
				local ModelContext = subMenuStandardModels:addOption( getText("IGUI_VehicleName" .. v:getName()), worldobjects, UG_Automaker.onNewVehicle, v:getFullName())
				initTooltip( ModelContext, v, mt, player)
			elseif mt == 2 then

				local ModelContext = subMenuHeavyDutyModels:addOption( getText("IGUI_VehicleName" .. v:getName()), worldobjects, UG_Automaker.onNewVehicle, v:getFullName())
				initTooltip( ModelContext, v, mt, player)
			elseif mt == 3 then

				local ModelContext = subMenuSportModels:addOption( getText("IGUI_VehicleName" .. v:getName()), worldobjects, UG_Automaker.onNewVehicle, v:getFullName())
				initTooltip( ModelContext, v, mt, player)
			else
			
				local ModelContext = subMenuOtherModels:addOption( getText("IGUI_VehicleName" .. v:getName()), worldobjects, UG_Automaker.onNewVehicle, v:getFullName())
				initTooltip( ModelContext, v, mt, player)
			end		
		end
	end
end

function UG_Automaker.onNewVehicle( worldobjects, vehiclescript)
	
	sendClientCommand( getPlayer(), "Automaker", "CreateVehicle", { VehicleID = vehiclescript})
end

Events.OnFillWorldObjectContextMenu.Add(UG_Automaker.FillWorldContextMenu)