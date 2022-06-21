require "Vehicles/snakenetadis"

local distributionTable = VehicleDistributions[1]
if VehicleDistributions then
	if VehicleDistributions.VanSnakeneta then
		--items
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, "AdvancedFishing.MetalDetector");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, 0.5);
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, "Base.TeaBagBox");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, 0.2);
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, "Base.CheeseMoldEmpty3");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, 0.2);
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, "Base.CheeseMoldEmpty2");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, 0.2);
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, "Base.CheeseMoldEmpty");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, 0.2);
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, "Base.LacticFerment");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, 0.8);
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, "Base.CitricAcid");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, 0.8);
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, "Base.EdibleDyeYellow");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, 0.8);
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, "Base.EdibleDyeRed");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, 0.8);
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, "Base.EdibleDyeOrange");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, 0.8);
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, "Base.MilkPowder");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, 0.8);
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, "Base.MilkPowder");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, 0.8);
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, "AdvancedFishing.AcidC");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, 1);
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, "AdvancedFishing.FishingEncyclopedia");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, 0.2);
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, "AdvancedFishing.FishingEncyclopedia2");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, 0.2);
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, "AdvancedFishing.FishingEncyclopedia3");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, 0.2);
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, "AdvancedFishing.FishingEncyclopedia4");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, 0.2);
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, "Base.ManualMeatMincer");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, 1);
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, "Base.ElectricMeatMincer");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].items, 0.8);

		--junk
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, "AdvancedFishing.MetalDetector");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, 0.5);
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, "Base.TeaBagBox");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, 0.2);
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, "Base.CheeseMoldEmpty3");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, 0.2);
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, "Base.CheeseMoldEmpty2");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, 0.2);
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, "Base.CheeseMoldEmpty");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, 0.2);
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, "Base.LacticFerment");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, 0.8);
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, "Base.CitricAcid");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, 0.8);
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, "Base.EdibleDyeYellow");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, 0.8);
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, "Base.EdibleDyeRed");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, 0.8);
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, "Base.EdibleDyeOrange");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, 0.8);
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, "Base.MilkPowder");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, 0.8);
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, "Base.MilkPowder");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, 0.8);
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, "AdvancedFishing.AcidC");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, 1);
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, "AdvancedFishing.FishingEncyclopedia");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, 0.2);
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, "AdvancedFishing.FishingEncyclopedia2");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, 0.2);
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, "AdvancedFishing.FishingEncyclopedia3");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, 0.2);
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, "AdvancedFishing.FishingEncyclopedia4");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, 0.2);
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, "Base.ManualMeatMincer");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, 1);
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, "Base.ElectricMeatMincer");
		table.insert(VehicleDistributions["VanSnakeneta"]["TruckBed"].junk, 0.8);
		
		--items
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, "Base.LgBinoculars");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, 0.2);
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, "Base.KnifeDepostador");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, 0.05);
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, "Base.LGCookingMag");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, 0.02);
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, "Base.LGCookingMag2");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, 0.02);
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, "Base.LGCookingMag3");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, 0.02);
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, "Base.LGCookingMag4");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, 0.02);
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, "Base.LGCookingMag5");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, 0.02);
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, "Base.LGCookingMag6");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, 0.02);
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, "Base.LGCookingMag7");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, 0.02);
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, "Base.LGCookingMag8");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, 0.02);
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, "legourmet.Shaker");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, 0.1);
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, "legourmet.CocktailSpoon");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, 0.1);
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, "Base.SurvivalistMag1");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, 0.05);
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, "Base.SurvivalistMag2");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, 0.05);
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, "Base.SurvivalistMag3");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, 0.05);
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, "Base.SurvivalistMag4");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, 0.05);
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, "Base.SurvivalistMag5");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, 0.05);
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, "Base.SurvivalistMag6");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, 0.05);
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, "Mining.MiningMag1");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, 0.1);
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, "Base.ManualLG");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, 1);
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, "Base.RubberBandsBox");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, 2);
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, "AdvancedFishing.SportFishingBook");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, 0.1);
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, "Base.LGClimatologyMag");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].items, 0.1);

		--junk
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, "Base.LgBinoculars");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, 0.2);
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, "Base.KnifeDepostador");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, 0.05);
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, "Base.LGCookingMag");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, 0.02);
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, "Base.LGCookingMag2");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, 0.02);
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, "Base.LGCookingMag3");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, 0.02);
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, "Base.LGCookingMag4");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, 0.02);
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, "Base.LGCookingMag5");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, 0.02);
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, "Base.LGCookingMag6");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, 0.02);
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, "Base.LGCookingMag7");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, 0.02);
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, "Base.LGCookingMag8");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, 0.02);
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, "legourmet.Shaker");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, 0.1);
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, "legourmet.CocktailSpoon");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, 0.1);
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, "Base.SurvivalistMag1");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, 0.05);
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, "Base.SurvivalistMag2");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, 0.05);
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, "Base.SurvivalistMag3");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, 0.05);
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, "Base.SurvivalistMag4");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, 0.05);
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, "Base.SurvivalistMag5");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, 0.05);
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, "Base.SurvivalistMag6");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, 0.05);
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, "Mining.MiningMag1");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, 0.1);
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, "Base.ManualLG");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, 1);
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, "Base.RubberBandsBox");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, 2);
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, "AdvancedFishing.SportFishingBook");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, 0.1);
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, "Base.LGClimatologyMag");
		table.insert(VehicleDistributions["VanSnakeneta"]["GloveBox"].junk, 0.1);

	end
	VehicleDistributions.LGRTruckBed = {
		rolls = 4,
		items = {
			"Base.TeaBagBox", 50,
			"Base.Tabasco", 50,
			"AdvancedFishing.MetalDetector", 50,
			"AdvancedFishing.AcidC", 100,
			"AdvancedFishing.AcidC", 100,
			"AdvancedFishing.AcidC", 100,
			"Base.LgBinoculars", 50,
			"Base.HuntingCard1", 50,
			"Base.HuntingCard2", 50,
			"Base.HuntingCard3", 50,
			"Base.HuntingCard4", 50,
			"Base.HuntingCard5", 50,
			"Base.HuntingCard6", 50,
			"Base.HuntingCard7", 50,
			"Base.HuntingCard8", 50,
			"Base.HuntingCard9", 50,
			"Base.HuntingCard10", 50,
			"Base.CheeseMoldEmpty3", 20,
			"Base.CheeseMoldEmpty", 20,
			"Base.CheeseMoldEmpty2", 20,
			"Base.LacticFerment", 30,
			"Base.CitricAcid", 30,
			"Base.Gelatine", 20,
			"Base.ElectricMeatMincer", 30,
			"Base.ManualMeatMincer", 20,
			"Base.MolinoCoffee", 20,
			"legourmet.Shaker", 25,
			"Base.WaffleMachine", 30,
			"Base.KnifeDepostador", 50,
			"legourmet.CocktailSpoon", 50,
			"AdvancedFishing.Fishinglurebox", 40,
			"AdvancedFishing.Fishinglurebox", 40,
			"AdvancedFishing.FishingBox", 10,
			"AdvancedFishing.FishingBox2", 5,
			"AdvancedFishing.FishingBox3", 3,
			"legourmetfarming.BSodium", 15,
			"AdvancedFishing.BoyaPack1", 20,
			"AdvancedFishing.BoyaPack2", 15,
			"AdvancedFishing.BoyaPack3", 10,
			"AdvancedFishing.LeaderPacket", 50,
			"AdvancedFishing.FishingLine2", 40,
			"AdvancedFishing.FishingLine3", 30,
			"AdvancedFishing.FishingEncyclopedia", 10,
			"AdvancedFishing.FishingEncyclopedia2", 10,
			"AdvancedFishing.FishingEncyclopedia3", 10,
			"AdvancedFishing.FishingEncyclopedia4", 10,
			"Base.DeerCall", 10,
			"Base.EdibleDyeYellow", 50,
			"Base.EdibleDyeRed", 50,
			"Base.EdibleDyeOrange", 50,
			"Base.MilkPowder", 70,
			"Base.MilkPowder", 70,
			"Base.LGCookingMag", 50,
			"Base.LGCookingMag2", 50,
			"Base.LGCookingMag3", 50,
			"Base.LGCookingMag4", 50,
			"Base.LGCookingMag5", 50,
			"Base.LGCookingMag6", 50,
			"Base.LGCookingMag7", 50,
			"Base.LGCookingMag8", 50,
			"legourmetfarming.SeedBook", 25,
			"Base.BearTrap", 20,
			"legourmet.EnergyDrinkBottle", 75,
			"legourmet.EnergyDrinkBottle", 75,
		},
	}
	VehicleDistributions.LGRGloveBox = {
		rolls = 1,
		items = {
			"Mining.MiningMag1", 50,
			"Base.LGClimatologyMag", 50,
			"legourmetfarming.LgFarmMag1", 50,
			"legourmet.EnergyMagazine", 50,
			"legourmet.DrinksMag2", 50,
			"Base.SurvivalistMag1", 50,
			"Base.SurvivalistMag2", 50,
			"Base.SurvivalistMag3", 50,
			"Base.SurvivalistMag4", 50,
			"Base.SurvivalistMag5", 50,
			"Base.SurvivalistMag6", 50,
			"AdvancedFishing.SportFishingBook", 50,
			"Base.ManualLG", 100,
			"Base.RubberBandsBox", 50,
		},
	}
	VehicleDistributions.LGRSeat = {
		rolls = 1,
		items = {
            "CorpseMale", 0.01,
            "CorpseFemale", 0.01,		
		},
	}
	VehicleDistributions.LGR = {
		TruckBed = VehicleDistributions.LGRTruckBed;

		TruckBedOpen = VehicleDistributions.LGRTruckBed;

		GloveBox = VehicleDistributions.LGRGloveBox;

		SeatRearLeft = VehicleDistributions.LGRSeat;
		SeatRearRight = VehicleDistributions.LGRSeat;
	}
end

if distributionTable["VanSnakeneta"] then
	if not distributionTable["VanSnakeneta"].Specific then
		distributionTable["VanSnakeneta"].Specific = {};
	end
	table.insert(distributionTable["VanSnakeneta"].Specific, VehicleDistributions.LGR);
end