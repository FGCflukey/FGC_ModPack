UG_Automaker = {}

function UG_Automaker.FillWorldContextMenu( player, context, worldobjects, test)

	local automakerOption = context:addOption(getText("Build New Vehicle"), worldobjects, nil)	

	local subMenuVehicles = ISContextMenu:getNew(context)
	context:addSubMenu(automakerOption, subMenuVehicles)

	local subMenuStandard = subMenuVehicles:addOption(getText("Standard Models"), worldobjects, nil)
	local subMenuStandardModels = ISContextMenu:getNew(context)
	context:addSubMenu(subMenuStandard, subMenuStandardModels)
	
	subMenuStandardModels:addOption( "Chevalier Dart", worldobjects, UG_Automaker.onNewVehicle, "Base.SmallCar")
	subMenuStandardModels:addOption( "Masterson Horizon", worldobjects, UG_Automaker.onNewVehicle, "Base.SmallCar02")
	subMenuStandardModels:addOption( "Chevalier Nyala", worldobjects, UG_Automaker.onNewVehicle, "Base.CarNormal")
	subMenuStandardModels:addOption( "Yellow Taxi", worldobjects, UG_Automaker.onNewVehicle, "Base.CarTaxi")
	subMenuStandardModels:addOption( "Green Taxi", worldobjects, UG_Automaker.onNewVehicle, "Base.CarTaxi2")
	subMenuStandardModels:addOption( "Dash Rancher", worldobjects, UG_Automaker.onNewVehicle, "Base.OffRoad")

	local subMenuSport = subMenuVehicles:addOption(getText("Sport Models"), worldobjects, nil)
	local subMenuSportModels = ISContextMenu:getNew(context)
	context:addSubMenu(subMenuSport, subMenuSportModels)
	
	subMenuSportModels:addOption( "Chevalier Cossette", worldobjects, UG_Automaker.onNewVehicle, "Base.SportsCar")
	subMenuSportModels:addOption( "Mercia Lang 4000", worldobjects, UG_Automaker.onNewVehicle, "Base.CarLuxury")
	subMenuSportModels:addOption( "Dash Elite", worldobjects, UG_Automaker.onNewVehicle, "Base.ModernCar")
	subMenuSportModels:addOption( "Chevalier Primani", worldobjects, UG_Automaker.onNewVehicle, "Base.ModernCar02")
	
	local subMenuHeavyDuty = subMenuVehicles:addOption(getText("Heavy Duty Models"), worldobjects, nil)
	local subMenuHeavyDutyModels = ISContextMenu:getNew(context)
	context:addSubMenu(subMenuHeavyDuty, subMenuHeavyDutyModels)

	subMenuHeavyDutyModels:addOption( "Franklin All-Terrain", worldobjects, UG_Automaker.onNewVehicle, "Base.SUV")
	subMenuHeavyDutyModels:addOption( "Dash Bulldriver", worldobjects, UG_Automaker.onNewVehicle, "Base.PickUpVan")
	subMenuHeavyDutyModels:addOption( "Dash Bulldriver (Ranger)", worldobjects, UG_Automaker.onNewVehicle, "Base.PickUpVanLights")
	subMenuHeavyDutyModels:addOption( "Dash Bulldriver (Fire Dpt.)", worldobjects, UG_Automaker.onNewVehicle, "Base.PickUpVanLightsFire")
	subMenuHeavyDutyModels:addOption( "Dash Bulldriver (Poliece)", worldobjects, UG_Automaker.onNewVehicle, "Base.PickUpVanLightsPolice")
	subMenuHeavyDutyModels:addOption( "Chevalier D6", worldobjects, UG_Automaker.onNewVehicle, "Base.PickUpTruck")
	subMenuHeavyDutyModels:addOption( "Chevalier D6 (Fossoil)", worldobjects, UG_Automaker.onNewVehicle, "Base.PickUpTruckLights")
	subMenuHeavyDutyModels:addOption( "Chevalier D6 (Fire Dpt.)", worldobjects, UG_Automaker.onNewVehicle, "Base.PickUpTruckLightsFire")
	subMenuHeavyDutyModels:addOption( "Chevalier D6 (McCoy)", worldobjects, UG_Automaker.onNewVehicle, "Base.PickUpVanMccoy")
	subMenuHeavyDutyModels:addOption( "Franklin Valuline", worldobjects, UG_Automaker.onNewVehicle, "Base.Van")
	subMenuHeavyDutyModels:addOption( "Franklin Valuline Passenger Van", worldobjects, UG_Automaker.onNewVehicle, "Base.VanSeats")
	subMenuHeavyDutyModels:addOption( "Spiffo Van", worldobjects, UG_Automaker.onNewVehicle, "Base.VanSpiffo")
	subMenuHeavyDutyModels:addOption( "Ambulance", worldobjects, UG_Automaker.onNewVehicle, "Base.VanAmbulance")
	subMenuHeavyDutyModels:addOption( "Radio Van", worldobjects, UG_Automaker.onNewVehicle, "Base.VanRadio")
	subMenuHeavyDutyModels:addOption( "Chevalier Step Van", worldobjects, UG_Automaker.onNewVehicle, "Base.StepVan")
	subMenuHeavyDutyModels:addOption( "Chevalier Step Van (Mail)", worldobjects, UG_Automaker.onNewVehicle, "Base.StepVanMail")
	subMenuHeavyDutyModels:addOption( "Franklin Valuline (McCoy)", worldobjects, UG_Automaker.onNewVehicle, "Base.VanSpecial")
	
	local subMenuMilitary = subMenuVehicles:addOption(getText("Military Models"), worldobjects, nil)
	local subMenuMilitaryModels = ISContextMenu:getNew(context)
	context:addSubMenu(subMenuMilitary, subMenuMilitaryModels)

end

function UG_Automaker.onNewVehicle( worldobjects, vehiclescript)

	--SendCommandToServer( string.format("/addvehicle %s", vehiclescript))
	
	sendClientCommand( getPlayer(), "Automaker", "CreateVehicle", { VehicleID = vehiclescript})

end

Events.OnFillWorldObjectContextMenu.Add(UG_Automaker.FillWorldContextMenu)