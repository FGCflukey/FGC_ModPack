require 'Items/SuburbsDistributions'
require 'Items/Distributions'
AdvFishing = {
};

local MoneyMod = nil;
if ZMoney then
    MoneyMod = true;
end

LeGourmetCustomLoot = {
    restaurant = {
        displaycase = {
            rolls = 3,
            items = {
                "Base.Pizza", 8,
            },
        },
	},
};

table.insert(SuburbsDistributions,picture_1);
SuburbsDistributions["picture_1"] = {
	crate_black = {
        rolls = 1,
        items = {
            "Hammer",500,
			"Saw",500,
			"Axe",500,
			"Money",500,
			"Money",500,
			"Money",500,
			"Money",500,
        },
    },
};

table.insert(ProceduralDistributions["list"]["ButcherFish"].items, "AdvancedFishing.SuruFillet");
table.insert(ProceduralDistributions["list"]["ButcherFish"].items, 2);
table.insert(ProceduralDistributions["list"]["ButcherFish"].items, "AdvancedFishing.SuruFillet");
table.insert(ProceduralDistributions["list"]["ButcherFish"].items, 2);
table.insert(ProceduralDistributions["list"]["ButcherFish"].items, "AdvancedFishing.RayFillet");
table.insert(ProceduralDistributions["list"]["ButcherFish"].items, 1);
table.insert(ProceduralDistributions["list"]["ButcherFish"].items, "AdvancedFishing.Dorado");
table.insert(ProceduralDistributions["list"]["ButcherFish"].items, 4);

table.insert(ProceduralDistributions["list"]["StoreKitchenCafe"].items, "Base.TeaBagBox");
table.insert(ProceduralDistributions["list"]["StoreKitchenCafe"].items, 1.5);
table.insert(ProceduralDistributions["list"]["StoreKitchenCafe"].items, "Base.TeaBagEmpty");
table.insert(ProceduralDistributions["list"]["StoreKitchenCafe"].items, 0.5);

table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, "Base.TeaBagBox");
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, 0.5);

table.insert(ProceduralDistributions["list"]["KitchenBreakfast"].junk, "Base.TeaBagEmpty");
table.insert(ProceduralDistributions["list"]["KitchenBreakfast"].junk, 2);
table.insert(ProceduralDistributions["list"]["BreakRoomCounter"].items, "Base.TeaBagBox");
table.insert(ProceduralDistributions["list"]["BreakRoomCounter"].items, 0.5);
table.insert(ProceduralDistributions["list"]["BreakRoomShelves"].items, "Base.TeaBagBox");
table.insert(ProceduralDistributions["list"]["BreakRoomShelves"].items, 0.5);
table.insert(ProceduralDistributions["list"]["BreakRoomCounter"].items, "legourmet.YerbaMate");
table.insert(ProceduralDistributions["list"]["BreakRoomCounter"].items, 0.5);
table.insert(ProceduralDistributions["list"]["JaysKitchenBaking"].items, "legourmet.YerbaMate");
table.insert(ProceduralDistributions["list"]["JaysKitchenBaking"].items, 6);
table.insert(ProceduralDistributions["list"]["BreakRoomShelves"].items, "legourmet.YerbaMate");
table.insert(ProceduralDistributions["list"]["BreakRoomShelves"].items, 4);
table.insert(ProceduralDistributions["list"]["GigamartBakingMisc"].items, "legourmet.YerbaMate");
table.insert(ProceduralDistributions["list"]["GigamartBakingMisc"].items, 10);
table.insert(ProceduralDistributions["list"]["KitchenBaking"].items, "legourmet.YerbaMate");
table.insert(ProceduralDistributions["list"]["KitchenBaking"].items, 6);
table.insert(ProceduralDistributions["list"]["KitchenBreakfast"].items, "legourmet.YerbaMate");
table.insert(ProceduralDistributions["list"]["KitchenBreakfast"].items, 6);
table.insert(ProceduralDistributions["list"]["KitchenBaking"].items, "legourmet.VacuumFlaskEmpty");
table.insert(ProceduralDistributions["list"]["KitchenBaking"].items, 1);
table.insert(ProceduralDistributions["list"]["KitchenBreakfast"].items, "legourmet.VacuumFlaskEmpty");
table.insert(ProceduralDistributions["list"]["KitchenBreakfast"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, "legourmet.VacuumFlaskEmpty");
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, 10);


table.insert(SuburbsDistributions["all"]["inventorymale"].items, "Base.TeaBagEmpty");
table.insert(SuburbsDistributions["all"]["inventorymale"].items, 0.001);
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "Base.TeaBagEmpty");
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, 0.001);

table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "Base.Tabasco");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, 0.2);

table.insert(ProceduralDistributions["list"]["SpiffosKitchenFridge"].items, "Base.Tabasco");
table.insert(ProceduralDistributions["list"]["SpiffosKitchenFridge"].items, 3);

table.insert(ProceduralDistributions["list"]["StoreKitchenSauce"].items, "Base.Tabasco");
table.insert(ProceduralDistributions["list"]["StoreKitchenSauce"].items, 3);

table.insert(ProceduralDistributions["list"]["PizzaKitchenSauce"].items, "Base.Tabasco");
table.insert(ProceduralDistributions["list"]["PizzaKitchenSauce"].items, 3);
table.insert(ProceduralDistributions["list"]["PizzaKitchenFridge"].items, "Base.Tabasco");
table.insert(ProceduralDistributions["list"]["PizzaKitchenFridge"].items, 3);

table.insert(SuburbsDistributions["all"]["crate"].items, "AdvancedFishing.MetalDetector");
table.insert(SuburbsDistributions["all"]["crate"].items, 0.8);
table.insert(ProceduralDistributions["list"]["MechanicShelfTools"].items, "AdvancedFishing.MetalDetector");
table.insert(ProceduralDistributions["list"]["MechanicShelfTools"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, "AdvancedFishing.MetalDetector");
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, 0.1);
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, "Base.Mov_WallDiana");
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, 1);

table.insert(ProceduralDistributions["list"]["CrateSheetMetal"].items, "AdvancedFishing.MetalDetector");
table.insert(ProceduralDistributions["list"]["CrateSheetMetal"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateSheetMetal"].items, "AdvancedFishing.AcidC");
table.insert(ProceduralDistributions["list"]["CrateSheetMetal"].items, 5);
table.insert(ProceduralDistributions["list"]["CrateSheetMetal"].items, "AdvancedFishing.AcidC");
table.insert(ProceduralDistributions["list"]["CrateSheetMetal"].items, 5);
table.insert(ProceduralDistributions["list"]["CrateSheetMetal"].items, "AdvancedFishing.AcidC");
table.insert(ProceduralDistributions["list"]["CrateSheetMetal"].items, 5);

table.insert(ProceduralDistributions["list"]["GarageMetalwork"].items, "AdvancedFishing.MetalDetector");
table.insert(ProceduralDistributions["list"]["GarageMetalwork"].items, 1);
table.insert(ProceduralDistributions["list"]["GarageTools"].items, "AdvancedFishing.MetalDetector");
table.insert(ProceduralDistributions["list"]["GarageTools"].items, 1);

table.insert(ProceduralDistributions["list"]["CrateMetalwork"].items, "AdvancedFishing.MetalDetector");
table.insert(ProceduralDistributions["list"]["CrateMetalwork"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateMetalwork"].items, "AdvancedFishing.AcidC");
table.insert(ProceduralDistributions["list"]["CrateMetalwork"].items, 0.5);
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, "AdvancedFishing.AcidC");
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, 0.1);
table.insert(ProceduralDistributions["list"]["CrateCamping"].items, "Base.magnifyingglass");
table.insert(ProceduralDistributions["list"]["CrateCamping"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateCamping"].items, "Base.LgBinoculars");
table.insert(ProceduralDistributions["list"]["CrateCamping"].items, 0.5);
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, "Base.LgBinoculars");
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, 0.1);

table.insert(ProceduralDistributions["list"]["CrateMagazines"].items, "Mining.MiningMag1");
table.insert(ProceduralDistributions["list"]["CrateMagazines"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateMagazines"].items, "legourmetfarming.LgFarmMag1");
table.insert(ProceduralDistributions["list"]["CrateMagazines"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateMagazines"].items, "Base.LGClimatologyMag");
table.insert(ProceduralDistributions["list"]["CrateMagazines"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateMagazines"].items, "legourmet.EnergyMagazine");
table.insert(ProceduralDistributions["list"]["CrateMagazines"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateMagazines"].items, "legourmet.DrinksMag2");
table.insert(ProceduralDistributions["list"]["CrateMagazines"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateMagazines"].items, "Base.SurvivalistMag1");
table.insert(ProceduralDistributions["list"]["CrateMagazines"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateMagazines"].items, "Base.SurvivalistMag2");
table.insert(ProceduralDistributions["list"]["CrateMagazines"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateMagazines"].items, "Base.SurvivalistMag3");
table.insert(ProceduralDistributions["list"]["CrateMagazines"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateMagazines"].items, "Base.SurvivalistMag4");
table.insert(ProceduralDistributions["list"]["CrateMagazines"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateMagazines"].items, "Base.SurvivalistMag5");
table.insert(ProceduralDistributions["list"]["CrateMagazines"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateMagazines"].items, "Base.SurvivalistMag6");
table.insert(ProceduralDistributions["list"]["CrateMagazines"].items, 1);

table.insert(ProceduralDistributions["list"]["CrateCamping"].items, "Base.HuntingCard1");
table.insert(ProceduralDistributions["list"]["CrateCamping"].items, 0.2);
table.insert(ProceduralDistributions["list"]["CrateCamping"].items, "Base.HuntingCard2");
table.insert(ProceduralDistributions["list"]["CrateCamping"].items, 0.2);
table.insert(ProceduralDistributions["list"]["CrateCamping"].items, "Base.HuntingCard3");
table.insert(ProceduralDistributions["list"]["CrateCamping"].items, 0.2);
table.insert(ProceduralDistributions["list"]["CrateCamping"].items, "Base.HuntingCard4");
table.insert(ProceduralDistributions["list"]["CrateCamping"].items, 0.2);
table.insert(ProceduralDistributions["list"]["CrateCamping"].items, "Base.HuntingCard5");
table.insert(ProceduralDistributions["list"]["CrateCamping"].items, 0.2);
table.insert(ProceduralDistributions["list"]["CrateCamping"].items, "Base.HuntingCard6");
table.insert(ProceduralDistributions["list"]["CrateCamping"].items, 0.2);
table.insert(ProceduralDistributions["list"]["CrateCamping"].items, "Base.HuntingCard7");
table.insert(ProceduralDistributions["list"]["CrateCamping"].items, 0.2);
table.insert(ProceduralDistributions["list"]["CrateCamping"].items, "Base.HuntingCard8");
table.insert(ProceduralDistributions["list"]["CrateCamping"].items, 0.2);
table.insert(ProceduralDistributions["list"]["CrateCamping"].items, "Base.HuntingCard9");
table.insert(ProceduralDistributions["list"]["CrateCamping"].items, 0.2);
table.insert(ProceduralDistributions["list"]["CrateCamping"].items, "Base.HuntingCard10");
table.insert(ProceduralDistributions["list"]["CrateCamping"].items, 0.2);
table.insert(ProceduralDistributions["list"]["CrateCamping"].items, "Base.BearTrap");
table.insert(ProceduralDistributions["list"]["CrateCamping"].items, 0.1);

table.insert(ProceduralDistributions["list"]["CrateDishes"].items, "Base.CheeseMoldEmpty");
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, 0.5);
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, "Base.CheeseMoldEmpty2");
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, "Base.CheeseMoldEmpty3");
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, 0.5);
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, "Base.KitchenBrush");
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, 1);

table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, "Base.CheeseMoldEmpty");
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, 0.5);
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, "Base.CheeseMoldEmpty2");
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, "Base.CheeseMoldEmpty3");
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, 0.5);
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, "Base.KitchenBrush");
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, 1);


table.insert(ProceduralDistributions["list"]["CrateCanning"].items, "Base.LacticFerment");
table.insert(ProceduralDistributions["list"]["CrateCanning"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateCanning"].items, "Base.CitricAcid");
table.insert(ProceduralDistributions["list"]["CrateCanning"].items, 0.5);
table.insert(ProceduralDistributions["list"]["CrateCanning"].items, "Base.Gelatine");
table.insert(ProceduralDistributions["list"]["CrateCanning"].items, 0.5);


table.insert(ProceduralDistributions["list"]["GigamartHouseElectronics"].items, "Base.ElectricMeatMincer");
table.insert(ProceduralDistributions["list"]["GigamartHouseElectronics"].items, 2);

table.insert(ProceduralDistributions["list"]["CrateDishes"].items, "Base.WaffleMachine");
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, 0.5);
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, "Base.ManualMeatMincer");
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, 0.5);
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, "Base.ElectricMeatMincer");
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, 0.5);
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, "Base.KnifeDepostador");
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, "Base.MolinoCoffee");
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, "legourmet.CocktailSpoon");
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, "legourmet.Shaker");
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, "Base.CubeboxEmpty");
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, "legourmet.MateEmpty");
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, 0.0001);
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, "legourmet.VacuumFlaskEmpty");
table.insert(ProceduralDistributions["list"]["CrateDishes"].items, 0.0001);

table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, "Base.WaffleMachine");
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, 0.5);
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, "Base.ManualMeatMincer");
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, 0.5);
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, "Base.ElectricMeatMincer");
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, 0.5);
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, "Base.KnifeDepostador");
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, "Base.MolinoCoffee");
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, "legourmet.CocktailSpoon");
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, "legourmet.Shaker");
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, "Base.CubeboxEmpty");
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, "legourmet.MateEmpty");
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, 0.1);
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, "legourmet.VacuumFlaskEmpty");
table.insert(ProceduralDistributions["list"]["CrateRandomJunk"].items, 0.1);

table.insert(ProceduralDistributions["list"]["CrateElectronics"].items, "Base.ElectricMeatMincer");
table.insert(ProceduralDistributions["list"]["CrateElectronics"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateElectronics"].items, "Base.WaffleMachine");
table.insert(ProceduralDistributions["list"]["CrateElectronics"].items, 1);

--señuelos--

table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, "AdvancedFishing.Fishinglurebox");
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, 5);
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, "AdvancedFishing.GTPopper");
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, 5);
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, "AdvancedFishing.JitterBug");
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, 5);
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, "AdvancedFishing.Alfers");
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, 5);
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, "AdvancedFishing.MediumHook");
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, 3);
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, "AdvancedFishing.SmallHook");
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, 5);
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, "AdvancedFishing.BigHook");
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, 1);
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, "AdvancedFishing.LeaderPacket");
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, 0.1);
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, "AdvancedFishing.FishingLine2");
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, 0.5);
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, "AdvancedFishing.FishingLine3");
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, 0.2);
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, "AdvancedFishing.AcidC");
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, 4);
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, "AdvancedFishing.LeadFishingbox");
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, 7);
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, "AdvancedFishing.LeadFishingbox5");
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, 7);
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, "AdvancedFishing.FishingBox");
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, 1);
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, "AdvancedFishing.FishingBox2");
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, 0.5);
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, "AdvancedFishing.FishingBox3");
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, 0.2);
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, "AdvancedFishing.Boya1");
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, 4);
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, "AdvancedFishing.Boya2");
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, 2);
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, "AdvancedFishing.Boya3");
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, 1);
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, "AdvancedFishing.Leader");
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, 1);
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, "AdvancedFishing.AcidC");
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, 2);
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, "AdvancedFishing.Boya1");
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, 4);
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, "AdvancedFishing.Boya2");
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, 2);
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, "AdvancedFishing.Boya3");
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, 1);
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, "AdvancedFishing.Leader");
table.insert(ProceduralDistributions["list"]["ToolStoreMisc"].items, 1);

table.insert(ProceduralDistributions["list"]["ToolStoreMetalwork"].items, "AdvancedFishing.AcidC");
table.insert(ProceduralDistributions["list"]["ToolStoreMetalwork"].items, 2);
table.insert(ProceduralDistributions["list"]["ToolStoreMetalwork"].items, "AdvancedFishing.AcidC");
table.insert(ProceduralDistributions["list"]["ToolStoreMetalwork"].items, 2);

table.insert(ProceduralDistributions["list"]["ToolStoreFarming"].items, "legourmetfarming.BSodium");
table.insert(ProceduralDistributions["list"]["ToolStoreFarming"].items, 2);
table.insert(ProceduralDistributions["list"]["ToolStoreFarming"].items, "legourmetfarming.BSodium");
table.insert(ProceduralDistributions["list"]["ToolStoreFarming"].items, 2);

table.insert(SuburbsDistributions["all"]["crate"].items, "AdvancedFishing.AcidC");
table.insert(SuburbsDistributions["all"]["crate"].items, 0.5);


table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, "AdvancedFishing.Fishinglurebox");
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, 2);
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, "AdvancedFishing.Fishinglurebox");
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, 2);
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, "AdvancedFishing.StormFlutterstick");
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, 2);
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, "AdvancedFishing.RattlinRap");
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, 2);
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, "AdvancedFishing.SwimJig");
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, 2);
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, "AdvancedFishing.SwimJig2");
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, 2);
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, "AdvancedFishing.SwimJig3");
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, 2);
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, "AdvancedFishing.GTPopper");
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, 2);
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, "AdvancedFishing.SpoonLure1");
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, 2);
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, "AdvancedFishing.SpoonLure2");
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, 2);
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, "AdvancedFishing.SpoonLure3");
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, 2);
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, "AdvancedFishing.JitterBug");
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, 2);
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, "AdvancedFishing.Crankbait");
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, 2);
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, "AdvancedFishing.SwimShad");
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, 2);
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, "AdvancedFishing.Alfers");
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, 2);
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, "AdvancedFishing.Boya1");
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, 4);
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, "AdvancedFishing.Boya2");
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, 3);
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, "AdvancedFishing.Boya3");
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, 2);
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, "AdvancedFishing.BoyaPack1");
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, 4);
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, "AdvancedFishing.BoyaPack2");
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, 3);
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, "AdvancedFishing.BoyaPack3");
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, 2);
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, "AdvancedFishing.Leader");
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, 1);
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, "AdvancedFishing.LeaderPacket");
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, 0.1);
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, "AdvancedFishing.FishingLine2");
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, 1);
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, "AdvancedFishing.FishingLine3");
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, 0.5);

--Cajas de pesca--
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, "AdvancedFishing.FishingBox");
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, 0.06);
table.insert(ProceduralDistributions["list"]["CampingStoreBooks"].items, "AdvancedFishing.FishingEncyclopedia");
table.insert(ProceduralDistributions["list"]["CampingStoreBooks"].items, 0.05);
table.insert(ProceduralDistributions["list"]["CampingStoreBooks"].items, "AdvancedFishing.FishingEncyclopedia2");
table.insert(ProceduralDistributions["list"]["CampingStoreBooks"].items, 0.05);
table.insert(ProceduralDistributions["list"]["CampingStoreBooks"].items, "AdvancedFishing.FishingEncyclopedia3");
table.insert(ProceduralDistributions["list"]["CampingStoreBooks"].items, 0.05);
table.insert(ProceduralDistributions["list"]["CampingStoreBooks"].items, "AdvancedFishing.FishingEncyclopedia4");
table.insert(ProceduralDistributions["list"]["CampingStoreBooks"].items, 0.05);
table.insert(ProceduralDistributions["list"]["CampingStoreBooks"].items, "AdvancedFishing.SportFishingBook");
table.insert(ProceduralDistributions["list"]["CampingStoreBooks"].items, 0.005);

table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, "AdvancedFishing.FishingBox");
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, 0.06);

table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, "AdvancedFishing.FishingBox2");
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, 0.04);

table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, "AdvancedFishing.FishingBox3");
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, 0.02);
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, "AdvancedFishing.LeadFishingbox");
table.insert(ProceduralDistributions["list"]["FishingStoreGear"].items, 0.1);


table.insert(ProceduralDistributions["list"]["GarageMetalwork"].items, "AdvancedFishing.AcidC");
table.insert(ProceduralDistributions["list"]["GarageMetalwork"].items, 0.02);

--Enciclopedias
table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, "AdvancedFishing.FishingEncyclopedia");
table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, 0.5);
table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, "AdvancedFishing.FishingEncyclopedia2");
table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, 0.5);
table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, "AdvancedFishing.FishingEncyclopedia3");
table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, 0.5);
table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, "AdvancedFishing.FishingEncyclopedia4");
table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, 0.5);
table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, "AdvancedFishing.FishingEncyclopedia5");
table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, 0.5);

table.insert(ProceduralDistributions["list"]["BookstoreMisc"].items, "Base.ManualLG");
table.insert(ProceduralDistributions["list"]["BookstoreMisc"].items, 1);

table.insert(SuburbsDistributions["all"]["postbox"].items, "AdvancedFishing.FishingEncyclopedia");
table.insert(SuburbsDistributions["all"]["postbox"].items, 0.005);
table.insert(SuburbsDistributions["all"]["postbox"].items, "AdvancedFishing.FishingEncyclopedia2");
table.insert(SuburbsDistributions["all"]["postbox"].items, 0.005);
table.insert(SuburbsDistributions["all"]["postbox"].items, "AdvancedFishing.FishingEncyclopedia3");
table.insert(SuburbsDistributions["all"]["postbox"].items, 0.005);
table.insert(SuburbsDistributions["all"]["postbox"].items, "AdvancedFishing.FishingEncyclopedia4");
table.insert(SuburbsDistributions["all"]["postbox"].items, 0.005);
table.insert(SuburbsDistributions["all"]["postbox"].items, "AdvancedFishing.FishingEncyclopedia5");
table.insert(SuburbsDistributions["all"]["postbox"].items, 0.005);
table.insert(SuburbsDistributions["all"]["postbox"].items, "AdvancedFishing.SportFishingBook");
table.insert(SuburbsDistributions["all"]["postbox"].items, 0.05);
table.insert(SuburbsDistributions["all"]["postbox"].items, "Base.ManualLG");
table.insert(SuburbsDistributions["all"]["postbox"].items, 0.05);
table.insert(SuburbsDistributions["all"]["postbox"].items, "Mining.MiningMag1");
table.insert(SuburbsDistributions["all"]["postbox"].items, 0.05);

SuburbsDistributions["FishingBox"] = {
rolls = 2,
items = {
			"Base.FishingLine", 30,
			"Base.FishingLine", 30,
			"Base.Paperclip", 70,
			"Base.Paperclip", 70,
			"Base.Paperclip", 70,
			"Base.Twine", 30,
			"Base.Worm", 75,
			"AdvancedFishing.RedWorm", 1,
			"AdvancedFishing.FishingLead3", 30,
			"AdvancedFishing.Boya1", 30,
			"AdvancedFishing.BoyaPack1", 5,
			"AdvancedFishing.SwimJig", 2,
			"AdvancedFishing.RattlinRap", 1,
			"AdvancedFishing.StormFlutterstick", 1,
			"AdvancedFishing.LeadFishingbox3", 75,
			"AdvancedFishing.OldMagazine", 75,
			"AdvancedFishing.Fishinglurebox", 0.02,
			"AdvancedFishing.Leader", 1,
			"AdvancedFishing.LeaderPacket", 0.2,
			"Base.Cornflour", 1,
},
fillRand = 2,
};

SuburbsDistributions["FishingBox2"] = {
rolls = 2,
items = {
			"Base.FishingLine", 30,
			"Base.FishingLine", 30,
			"Base.FishingNet", 10,
			"Base.Paperclip", 70,
			"Base.PaperclipBox", 10,
			"Base.Wire", 75,
			"Base.Worm", 75,
			"AdvancedFishing.RedWorm", 1,
			"AdvancedFishing.SwimJig", 2,
			"AdvancedFishing.RattlinRap", 1,
			"AdvancedFishing.Boya2", 2,
			"AdvancedFishing.BoyaPack2", 1,
			"AdvancedFishing.SwimJig2", 2,
			"AdvancedFishing.SwimJig3", 2,
			"AdvancedFishing.FishingLead2", 30,
			"AdvancedFishing.StormFlutterstick", 1,
			"AdvancedFishing.StormFlutterstick", 1,
			"AdvancedFishing.JitterBug", 4,
			"AdvancedFishing.JitterBug", 4,
			"AdvancedFishing.SpoonLure1", 4,
			"AdvancedFishing.SpoonLure3", 4,
			"AdvancedFishing.OldMagazine", 75,
			"AdvancedFishing.Fishinglurebox", 0.02,
			"AdvancedFishing.Leader", 1,
			"AdvancedFishing.Leader", 1,
			"AdvancedFishing.LeaderPacket", 0.2,
			"AdvancedFishing.FishingLine2", 1,
			"Base.Cornflour", 3,
},
fillRand = 2,
};

SuburbsDistributions["FishingBox3"] = {
rolls = 2,
items = {
			"Base.FishingLine", 30,
			"Base.FishingLine", 30,
			"Base.FishingNet", 10,
			"Base.Paperclip", 70,
			"Base.Twine", 30,
			"Base.PaperclipBox", 30,
			"Base.Rope", 30,
			"Base.Wire", 75,
			"Base.Worm", 75,
			"AdvancedFishing.RedWorm", 30,
			"AdvancedFishing.SwimJig", 2,
			"AdvancedFishing.Boya1", 30,
			"AdvancedFishing.Boya2", 10,
			"AdvancedFishing.Boya3", 1,
			"AdvancedFishing.BoyaPack3", 2,
			"AdvancedFishing.FishingLead1", 30,
			"AdvancedFishing.RattlinRap", 1,
			"AdvancedFishing.StormFlutterstick", 30,
			"AdvancedFishing.LeadFishingbox", 75,
			"AdvancedFishing.LeadFishingbox2", 75,
			"AdvancedFishing.OldMagazine", 75,
			"AdvancedFishing.OldMagazine2", 75,
			"AdvancedFishing.Fishinglurebox", 0.02,
			"AdvancedFishing.Leader", 1,
			"AdvancedFishing.Leader", 1,
			"AdvancedFishing.Leader", 1,
			"AdvancedFishing.LeaderPacket", 0.2,
			"AdvancedFishing.FishingLine3", 1,
			"Base.Cornflour", 5,
			"Base.LGClimatologyMag", 1,
},
fillRand = 0,
};

-- Bar fixer
table.insert(SuburbsDistributions, barkitchen);
SuburbsDistributions["barkitchen"] = {

    shelves = {
        rolls = 4,
        items = {
            "Base.WhiskeyFull", 3,
            "Base.WhiskeyFull", 3,
            "Base.WhiskeyFull", 3,
            "Base.Wine2", 3,
            "Base.Wine2", 3,
            "Base.Wine", 3,
            "Base.Wine", 3,
            "Base.Magazine", 2,
            "Base.Newspaper", 2,
            "Base.Poolcue", 4,
            "Base.Lighter", 3,
            "Base.Cigarettes", 3,
            "Base.Cigarettes", 3,
            "Base.WaterBottleFull", 4,
            "Base.Pop", 4,
            "Base.Pop2", 4,
            "Base.Pop3", 4,
            "Base.PopBottle", 4,
            "Base.Peanuts", 4,
            "Base.PoolBall", 4,
            "Base.Dart", 4,
            "Base.Dart", 4,
            "Base.Dart", 4,
            "Base.Dart", 4,
		}
    },

    crate ={
        rolls = 5,
        items = {
            "Base.WhiskeyFull", 3,
            "Base.WhiskeyFull", 3,
            "Base.WhiskeyFull", 3,
            "Base.Wine2", 3,
            "Base.Wine2", 3,
            "Base.Wine", 3,
            "Base.Wine", 3,
            "Base.Magazine", 2,
            "Base.Newspaper", 2,
            "Base.Lighter", 3,
            "Base.Cigarettes", 3,
            "Base.Cigarettes", 3,
            "Base.WaterBottleFull", 4,
            "Base.Pop", 4,
            "Base.Pop2", 4,
            "Base.Pop3", 4,
            "Base.PopBottle", 4,
            "Base.Peanuts", 4,
            "Base.Dart", 4,
            "Base.Dart", 4,
            "Base.Dart", 4,
            "Base.Dart", 4,
			"Base.Mov_WallDiana", 4,
		}
    },
	
	counter = {
        rolls = 2,
        items = {
            "Base.WhiskeyFull", 3,
            "Base.WhiskeyFull", 3,
            "Base.WhiskeyFull", 3,
            "Base.WhiskeyFull", 3,
            "Base.Wine2", 3,
            "Base.Wine2", 3,
            "Base.Wine", 3,
            "Base.Wine", 3,
            "Base.Poolcue", 4,
            "Base.BaseballBat", 2,
            "Base.Lighter", 3,
            "Base.Cigarettes", 3,
            "Base.Cigarettes", 3,
            "Base.WaterBottleFull", 4,
            "Base.PopBottle", 4,
            "Base.Pop", 4,
            "Base.Pop2", 4,
            "Base.Pop3", 4,
            "Base.PopBottle", 4,
            "Base.Peanuts", 4,
            "Base.Peanuts", 4,
            "Base.PoolBall", 4,
            "Base.PoolBall", 4,
            "Base.Dart", 4,
            "Base.Dart", 4,
            "Base.Dart", 4,
            "Base.Dart", 4,
            "Base.Pickles", 4,
            "Radio.RadioBlack",1,
            "Radio.RadioRed",0.5,
            "Radio.WalkieTalkie1",0.05,
            "Radio.WalkieTalkie2",0.03,
            "Radio.WalkieTalkie3",0.001,
			"Base.Mov_WallDiana", 4,
		}
    },
},

table.insert(SuburbsDistributions, barstorage);
SuburbsDistributions["barstorage"] = {

    metal_shelves = {
        rolls = 5,
        items = {
            "Base.WhiskeyFull", 3,
            "Base.WhiskeyFull", 3,
            "Base.WhiskeyFull", 3,
            "Base.Wine2", 3,
            "Base.Wine2", 3,
            "Base.Wine", 3,
            "Base.Wine", 3,
            "Base.Magazine", 2,
            "Base.Newspaper", 2,
            "Base.Lighter", 3,
            "Base.Cigarettes", 3,
            "Base.Cigarettes", 3,
            "Base.WaterBottleFull", 4,
            "Base.Pop", 4,
            "Base.Pop2", 4,
            "Base.Pop3", 4,
            "Base.PopBottle", 4,
            "Base.Peanuts", 4,
            "Base.Dart", 4,
            "Base.Dart", 4,
            "Base.Dart", 4,
            "Base.Dart", 4,
		}
    },

    fridge = {
        rolls = 5,
        items = {
            "Base.WhiskeyFull", 3,
            "Base.WhiskeyFull", 3,
            "Base.WhiskeyFull", 3,
            "Base.Wine2", 3,
            "Base.Wine2", 3,
            "Base.Wine", 3,
            "Base.Wine", 3,
            "Base.Pop", 4,
            "Base.Pop2", 4,
            "Base.Pop3", 4,
            "Base.Peanuts", 4,
            "Base.Lollipop", 4,
            "Base.MintCandy", 4,
            "Base.Chocolate", 4,
		}
    },

    freezer = {
        rolls = 5,
        items = {
            "Base.WhiskeyFull", 3,
            "Base.WhiskeyFull", 3,
            "Base.WhiskeyFull", 3,
            "Base.Wine2", 3,
            "Base.Wine2", 3,
            "Base.Wine", 3,
            "Base.Wine", 3,
            "Base.Pop", 4,
            "Base.Pop2", 4,
            "Base.Pop3", 4,
			"Base.WaterCubebox", 1,
			"Base.CubeboxEmpty", 2,
		}
    },
	
    crate ={
        rolls = 5,
        items = {
            "Base.WhiskeyFull", 3,
            "Base.WhiskeyFull", 3,
            "Base.WhiskeyFull", 3,
			"Base.WhiskeyFull", 3,
			"Base.WhiskeyFull", 3,
            "Base.Wine2", 3,
            "Base.Wine2", 3,
            "Base.Wine", 3,
            "Base.Wine", 3,
			"Base.Wine", 3,
			"Base.Wine", 3,
            "Base.WaterBottleFull", 4,
            "Base.Pop", 4,
            "Base.Pop2", 4,
            "Base.Pop3", 4,
            "Base.PopBottle", 4,
		}
    },
};

table.insert(ProceduralDistributions["list"]["PostOfficeBooks"].items, "Base.ManualLG");
table.insert(ProceduralDistributions["list"]["PostOfficeBooks"].items, 1.0);
table.insert(ProceduralDistributions["list"]["CampingStoreBooks"].items, "Base.ManualLG");
table.insert(ProceduralDistributions["list"]["CampingStoreBooks"].items, 1.0);
table.insert(ProceduralDistributions["list"]["BedroomSideTable"].items, "Base.ManualLG");
table.insert(ProceduralDistributions["list"]["BedroomSideTable"].items, 0.5);

--------------------------------------Farming Items--------------------------------------
--Magazines
table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, "legourmetfarming.LgFarmMag1");
table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, 0.5);
table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, "Base.LGClimatologyMag");
table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, 0.5);

table.insert(SuburbsDistributions["all"]["crate"].items, "legourmetfarming.CornBagSeed");
table.insert(SuburbsDistributions["all"]["crate"].items, 0.5);
table.insert(SuburbsDistributions["all"]["crate"].items, "legourmetfarming.WheatBagSeed");
table.insert(SuburbsDistributions["all"]["crate"].items, 0.5);
table.insert(SuburbsDistributions["all"]["crate"].items, "legourmetfarming.RiceBagSeed");
table.insert(SuburbsDistributions["all"]["crate"].items, 0.5);
table.insert(SuburbsDistributions["all"]["crate"].items, "legourmetfarming.BeanBagSeed");
table.insert(SuburbsDistributions["all"]["crate"].items, 0.5);
table.insert(SuburbsDistributions["all"]["crate"].items, "legourmetfarming.BellPepperBagSeed");
table.insert(SuburbsDistributions["all"]["crate"].items, 0.5);
table.insert(SuburbsDistributions["all"]["crate"].items, "legourmetfarming.EggplantBagSeed");
table.insert(SuburbsDistributions["all"]["crate"].items, 0.5);
table.insert(SuburbsDistributions["all"]["crate"].items, "legourmetfarming.GrapeBagSeed");
table.insert(SuburbsDistributions["all"]["crate"].items, 0.5);
table.insert(SuburbsDistributions["all"]["crate"].items, "legourmetfarming.LeekBagSeed");
table.insert(SuburbsDistributions["all"]["crate"].items, 0.5);
table.insert(SuburbsDistributions["all"]["crate"].items, "legourmetfarming.LettuceBagSeed");
table.insert(SuburbsDistributions["all"]["crate"].items, 0.5);
table.insert(SuburbsDistributions["all"]["crate"].items, "legourmetfarming.OnionBagSeed");
table.insert(SuburbsDistributions["all"]["crate"].items, 0.5);
table.insert(SuburbsDistributions["all"]["crate"].items, "legourmetfarming.PeaBagSeed");
table.insert(SuburbsDistributions["all"]["crate"].items, 0.5);
table.insert(SuburbsDistributions["all"]["crate"].items, "legourmetfarming.PeanutBagSeed");
table.insert(SuburbsDistributions["all"]["crate"].items, 0.5);
table.insert(SuburbsDistributions["all"]["crate"].items, "legourmetfarming.PumpkinBagSeed");
table.insert(SuburbsDistributions["all"]["crate"].items, 0.5);
table.insert(SuburbsDistributions["all"]["crate"].items, "legourmetfarming.WatermelonBagSeed");
table.insert(SuburbsDistributions["all"]["crate"].items, 0.5);
table.insert(SuburbsDistributions["all"]["crate"].items, "legourmetfarming.ZucchiniBagSeed");
table.insert(SuburbsDistributions["all"]["crate"].items, 0.5);
table.insert(SuburbsDistributions["all"]["crate"].items, "legourmetfarming.PineappleBagSeed");
table.insert(SuburbsDistributions["all"]["crate"].items, 0.5);
table.insert(SuburbsDistributions["all"]["crate"].items, "legourmetfarming.ChiliBagSeed");
table.insert(SuburbsDistributions["all"]["crate"].items, 0.5);
table.insert(SuburbsDistributions["all"]["crate"].items, "legourmetfarming.HabaneroBagSeed");
table.insert(SuburbsDistributions["all"]["crate"].items, 0.5);
table.insert(SuburbsDistributions["all"]["crate"].items, "legourmetfarming.JalapenoBagSeed");
table.insert(SuburbsDistributions["all"]["crate"].items, 0.5);
table.insert(SuburbsDistributions["all"]["crate"].items, "legourmetfarming.TobaccoBagSeed");
table.insert(SuburbsDistributions["all"]["crate"].items, 0.1);
table.insert(SuburbsDistributions["all"]["crate"].items, "Base.CoffeeBag");
table.insert(SuburbsDistributions["all"]["crate"].items, 0.5);

--------------------------------------------------------------------------------------

table.insert(SuburbsDistributions["all"]["counter"].items, "legourmetfarming.CornBagSeed");
table.insert(SuburbsDistributions["all"]["counter"].items, 0.01);
table.insert(SuburbsDistributions["all"]["counter"].items, "legourmetfarming.WheatBagSeed");
table.insert(SuburbsDistributions["all"]["counter"].items, 0.01);
table.insert(SuburbsDistributions["all"]["counter"].items, "legourmetfarming.RiceBagSeed");
table.insert(SuburbsDistributions["all"]["counter"].items, 0.01);
table.insert(SuburbsDistributions["all"]["counter"].items, "legourmetfarming.BeanBagSeed");
table.insert(SuburbsDistributions["all"]["counter"].items, 0.01);
table.insert(SuburbsDistributions["all"]["counter"].items, "legourmetfarming.BellPepperBagSeed");
table.insert(SuburbsDistributions["all"]["counter"].items, 0.01);
table.insert(SuburbsDistributions["all"]["counter"].items, "legourmetfarming.EggplantBagSeed");
table.insert(SuburbsDistributions["all"]["counter"].items, 0.01);
table.insert(SuburbsDistributions["all"]["counter"].items, "legourmetfarming.GrapeBagSeed");
table.insert(SuburbsDistributions["all"]["counter"].items, 0.01);
table.insert(SuburbsDistributions["all"]["counter"].items, "legourmetfarming.LeekBagSeed");
table.insert(SuburbsDistributions["all"]["counter"].items, 0.01);
table.insert(SuburbsDistributions["all"]["counter"].items, "legourmetfarming.LettuceBagSeed");
table.insert(SuburbsDistributions["all"]["counter"].items, 0.01);
table.insert(SuburbsDistributions["all"]["counter"].items, "legourmetfarming.OnionBagSeed");
table.insert(SuburbsDistributions["all"]["counter"].items, 0.01);
table.insert(SuburbsDistributions["all"]["counter"].items, "legourmetfarming.PeaBagSeed");
table.insert(SuburbsDistributions["all"]["counter"].items, 0.01);
table.insert(SuburbsDistributions["all"]["counter"].items, "legourmetfarming.PeanutBagSeed");
table.insert(SuburbsDistributions["all"]["counter"].items, 0.01);
table.insert(SuburbsDistributions["all"]["counter"].items, "legourmetfarming.PumpkinBagSeed");
table.insert(SuburbsDistributions["all"]["counter"].items, 0.01);
table.insert(SuburbsDistributions["all"]["counter"].items, "legourmetfarming.WatermelonBagSeed");
table.insert(SuburbsDistributions["all"]["counter"].items, 0.01);
table.insert(SuburbsDistributions["all"]["counter"].items, "legourmetfarming.ZucchiniBagSeed");
table.insert(SuburbsDistributions["all"]["counter"].items, 0.01);
table.insert(SuburbsDistributions["all"]["counter"].items, "legourmetfarming.PineappleBagSeed");
table.insert(SuburbsDistributions["all"]["counter"].items, 0.01);
table.insert(SuburbsDistributions["all"]["counter"].items, "legourmetfarming.ChiliBagSeed");
table.insert(SuburbsDistributions["all"]["counter"].items, 0.01);
table.insert(SuburbsDistributions["all"]["counter"].items, "legourmetfarming.HabaneroBagSeed");
table.insert(SuburbsDistributions["all"]["counter"].items, 0.01);
table.insert(SuburbsDistributions["all"]["counter"].items, "legourmetfarming.JalapenoBagSeed");
table.insert(SuburbsDistributions["all"]["counter"].items, 0.01);
table.insert(SuburbsDistributions["all"]["counter"].items, "legourmetfarming.TobaccoBagSeed");
table.insert(SuburbsDistributions["all"]["counter"].items, 0.01);
table.insert(SuburbsDistributions["all"]["counter"].items, "Base.CoffeeBag");
table.insert(SuburbsDistributions["all"]["counter"].items, 0.01);

-----------------------------------------------------------------------------------------------------

table.insert(ProceduralDistributions["list"]["GardenStoreMisc"].items, "legourmetfarming.BeanBagSeed");
table.insert(ProceduralDistributions["list"]["GardenStoreMisc"].items, 5);
table.insert(ProceduralDistributions["list"]["GardenStoreMisc"].items, "legourmetfarming.BellPepperBagSeed");
table.insert(ProceduralDistributions["list"]["GardenStoreMisc"].items, 5);
table.insert(ProceduralDistributions["list"]["GardenStoreMisc"].items, "legourmetfarming.EggplantBagSeed");
table.insert(ProceduralDistributions["list"]["GardenStoreMisc"].items, 5);
table.insert(ProceduralDistributions["list"]["GardenStoreMisc"].items, "legourmetfarming.GrapeBagSeed");
table.insert(ProceduralDistributions["list"]["GardenStoreMisc"].items, 5);
table.insert(ProceduralDistributions["list"]["GardenStoreMisc"].items, "legourmetfarming.LeekBagSeed");
table.insert(ProceduralDistributions["list"]["GardenStoreMisc"].items, 5);
table.insert(ProceduralDistributions["list"]["GardenStoreMisc"].items, "legourmetfarming.LettuceBagSeed");
table.insert(ProceduralDistributions["list"]["GardenStoreMisc"].items, 5);
table.insert(ProceduralDistributions["list"]["GardenStoreMisc"].items, "legourmetfarming.OnionBagSeed");
table.insert(ProceduralDistributions["list"]["GardenStoreMisc"].items, 5);
table.insert(ProceduralDistributions["list"]["GardenStoreMisc"].items, "legourmetfarming.PeaBagSeed");
table.insert(ProceduralDistributions["list"]["GardenStoreMisc"].items, 5);
table.insert(ProceduralDistributions["list"]["GardenStoreMisc"].items, "legourmetfarming.PeanutBagSeed");
table.insert(ProceduralDistributions["list"]["GardenStoreMisc"].items, 5);
table.insert(ProceduralDistributions["list"]["GardenStoreMisc"].items, "legourmetfarming.PumpkinBagSeed");
table.insert(ProceduralDistributions["list"]["GardenStoreMisc"].items, 5);
table.insert(ProceduralDistributions["list"]["GardenStoreMisc"].items, "legourmetfarming.WatermelonBagSeed");
table.insert(ProceduralDistributions["list"]["GardenStoreMisc"].items, 5);
table.insert(ProceduralDistributions["list"]["GardenStoreMisc"].items, "legourmetfarming.ZucchiniBagSeed");
table.insert(ProceduralDistributions["list"]["GardenStoreMisc"].items, 5);
table.insert(ProceduralDistributions["list"]["GardenStoreMisc"].items, "legourmetfarming.CornBagSeed");
table.insert(ProceduralDistributions["list"]["GardenStoreMisc"].items, 5);
table.insert(ProceduralDistributions["list"]["GardenStoreMisc"].items, "legourmetfarming.RiceBagSeed");
table.insert(ProceduralDistributions["list"]["GardenStoreMisc"].items, 5);
table.insert(ProceduralDistributions["list"]["GardenStoreMisc"].items, "legourmetfarming.ChiliBagSeed");
table.insert(ProceduralDistributions["list"]["GardenStoreMisc"].items, 5);
table.insert(ProceduralDistributions["list"]["GardenStoreMisc"].items, "legourmetfarming.HabaneroBagSeed");
table.insert(ProceduralDistributions["list"]["GardenStoreMisc"].items, 5);
table.insert(ProceduralDistributions["list"]["GardenStoreMisc"].items, "legourmetfarming.JalapenoBagSeed");
table.insert(ProceduralDistributions["list"]["GardenStoreMisc"].items, 5);
table.insert(ProceduralDistributions["list"]["GardenStoreMisc"].items, "legourmetfarming.WheatBagSeed");
table.insert(ProceduralDistributions["list"]["GardenStoreMisc"].items, 5);
table.insert(ProceduralDistributions["list"]["GardenStoreMisc"].items, "legourmetfarming.SunFlowerBagSeed");
table.insert(ProceduralDistributions["list"]["GardenStoreMisc"].items, 5);
table.insert(ProceduralDistributions["list"]["GardenStoreMisc"].items, "legourmetfarming.SugarcaneBagSeed");
table.insert(ProceduralDistributions["list"]["GardenStoreMisc"].items, 5);
table.insert(ProceduralDistributions["list"]["GardenStoreMisc"].items, "legourmetfarming.TobaccoBagSeed");
table.insert(ProceduralDistributions["list"]["GardenStoreMisc"].items, 5);
table.insert(ProceduralDistributions["list"]["GardenStoreMisc"].items, "Base.CoffeeBag");
table.insert(ProceduralDistributions["list"]["GardenStoreMisc"].items, 5);

--------------------------------------------------------------------------------------

table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.WheatBagSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.BeanBagSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.BellPepperBagSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.EggplantBagSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.GrapeBagSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.LeekBagSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.LettuceBagSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.OnionBagSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.PeaBagSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.PeanutBagSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.PumpkinBagSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.WatermelonBagSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.ZucchiniBagSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.CornBagSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.RiceBagSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.ChiliBagSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.JalapenoBagSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.HabaneroBagSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.BananaSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.BananaSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.PeachSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.PeachSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.AppleSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.AppleSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.PearSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.PearSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.OrangeSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.OrangeSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.LemonSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.LemonSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.AvocadoSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.AvocadoSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.GrapeFruitSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.GrapeFruitSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.MangoSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.MangoSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.SeedBook");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 5);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.CafeSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.CafeSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.SunFlowerBagSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.SugarcaneBagSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.TobaccoBagSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 2);

------------------------------------------------------------------------------------------------------------

table.insert(SuburbsDistributions["SeedBag"].items, "legourmetfarming.BeanBagSeed");
table.insert(SuburbsDistributions["SeedBag"].items, 1);
table.insert(SuburbsDistributions["SeedBag"].items, "legourmetfarming.TobaccoBagSeed");
table.insert(SuburbsDistributions["SeedBag"].items, 1);
table.insert(SuburbsDistributions["SeedBag"].items, "legourmetfarming.BellPepperBagSeed");
table.insert(SuburbsDistributions["SeedBag"].items, 1);
table.insert(SuburbsDistributions["SeedBag"].items, "legourmetfarming.EggplantBagSeed");
table.insert(SuburbsDistributions["SeedBag"].items, 1);
table.insert(SuburbsDistributions["SeedBag"].items, "legourmetfarming.GrapeBagSeed");
table.insert(SuburbsDistributions["SeedBag"].items, 1);
table.insert(SuburbsDistributions["SeedBag"].items, "legourmetfarming.LeekBagSeed");
table.insert(SuburbsDistributions["SeedBag"].items, 1);
table.insert(SuburbsDistributions["SeedBag"].items, "legourmetfarming.LettuceBagSeed");
table.insert(SuburbsDistributions["SeedBag"].items, 1);
table.insert(SuburbsDistributions["SeedBag"].items, "legourmetfarming.OnionBagSeed");
table.insert(SuburbsDistributions["SeedBag"].items, 1);
table.insert(SuburbsDistributions["SeedBag"].items, "legourmetfarming.PeaBagSeed");
table.insert(SuburbsDistributions["SeedBag"].items, 1);
table.insert(SuburbsDistributions["SeedBag"].items, "legourmetfarming.PeanutBagSeed");
table.insert(SuburbsDistributions["SeedBag"].items, 1);
table.insert(SuburbsDistributions["SeedBag"].items, "legourmetfarming.PumpkinBagSeed");
table.insert(SuburbsDistributions["SeedBag"].items, 1);
table.insert(SuburbsDistributions["SeedBag"].items, "legourmetfarming.WatermelonBagSeed");
table.insert(SuburbsDistributions["SeedBag"].items, 1);
table.insert(SuburbsDistributions["SeedBag"].items, "legourmetfarming.ZucchiniBagSeed");
table.insert(SuburbsDistributions["SeedBag"].items, 1);
table.insert(SuburbsDistributions["SeedBag"].items, "legourmetfarming.CornBagSeed");
table.insert(SuburbsDistributions["SeedBag"].items, 1);
table.insert(SuburbsDistributions["SeedBag"].items, "legourmetfarming.RiceBagSeed");
table.insert(SuburbsDistributions["SeedBag"].items, 1);
table.insert(SuburbsDistributions["SeedBag"].items, "legourmetfarming.ChiliBagSeed");
table.insert(SuburbsDistributions["SeedBag"].items, 1);
table.insert(SuburbsDistributions["SeedBag"].items, "legourmetfarming.HabaneroBagSeed");
table.insert(SuburbsDistributions["SeedBag"].items, 1);
table.insert(SuburbsDistributions["SeedBag"].items, "legourmetfarming.JalapenoBagSeed");
table.insert(SuburbsDistributions["SeedBag"].items, 1);
table.insert(SuburbsDistributions["SeedBag"].items, "legourmetfarming.WheatBagSeed");
table.insert(SuburbsDistributions["SeedBag"].items, 1);
table.insert(SuburbsDistributions["SeedBag"].items, "legourmetfarming.SunFlowerBagSeed");
table.insert(SuburbsDistributions["SeedBag"].items, 1);
table.insert(SuburbsDistributions["SeedBag"].items, "legourmetfarming.SugarcaneBagSeed");
table.insert(SuburbsDistributions["SeedBag"].items, 1);
table.insert(SuburbsDistributions["SeedBag"].items, "Base.CoffeeBag");
table.insert(SuburbsDistributions["SeedBag"].items, 1);

table.insert(ProceduralDistributions["list"]["SafehouseMedical"].items, "Base.MedicalHose");
table.insert(ProceduralDistributions["list"]["SafehouseMedical"].items, 2);
table.insert(ProceduralDistributions["list"]["SafehouseMedical"].items, "legourmetfarming.BSodium");
table.insert(ProceduralDistributions["list"]["SafehouseMedical"].items, 2);

table.insert(ProceduralDistributions["list"]["ArmyStorageMedical"].items, "Base.MedicalHose");
table.insert(ProceduralDistributions["list"]["ArmyStorageMedical"].items, 10);
table.insert(ProceduralDistributions["list"]["ArmyStorageMedical"].items, "Base.MedicalHose");
table.insert(ProceduralDistributions["list"]["ArmyStorageMedical"].items, 5);


table.insert(ProceduralDistributions["list"]["MedicalClinicTools"].items, "Base.MedicalHose");
table.insert(ProceduralDistributions["list"]["MedicalClinicTools"].items, 2);
table.insert(ProceduralDistributions["list"]["MedicalClinicTools"].items, "Base.MedicalHose");
table.insert(ProceduralDistributions["list"]["MedicalClinicTools"].items, 2);

table.insert(ProceduralDistributions["list"]["MedicalStorageTools"].items, "Base.MedicalHose");
table.insert(ProceduralDistributions["list"]["MedicalStorageTools"].items, 2);
table.insert(ProceduralDistributions["list"]["MedicalStorageDrugs"].items, "legourmetfarming.BSodium");
table.insert(ProceduralDistributions["list"]["MedicalStorageDrugs"].items, 2);
table.insert(ProceduralDistributions["list"]["MedicalStorageDrugs"].items, "legourmetfarming.BSodium");
table.insert(ProceduralDistributions["list"]["MedicalStorageDrugs"].items, 2);
table.insert(ProceduralDistributions["list"]["MedicalStorageDrugs"].items, "legourmetfarming.BSodium");
table.insert(ProceduralDistributions["list"]["MedicalStorageDrugs"].items, 2);

table.insert(ProceduralDistributions["list"]["BathroomCounter"].items, "Base.MedicalHose");
table.insert(ProceduralDistributions["list"]["BathroomCounter"].items, 0.05);
table.insert(ProceduralDistributions["list"]["MedicalStorageDrugs"].items, "legourmetfarming.BSodium");
table.insert(ProceduralDistributions["list"]["MedicalStorageDrugs"].items, 0.05);

table.insert(ProceduralDistributions["list"]["GunStoreDisplayCase"].items, "Base.LgBinoculars");
table.insert(ProceduralDistributions["list"]["GunStoreDisplayCase"].items, 1);
table.insert(ProceduralDistributions["list"]["CampingStoreGear"].items, "Base.LgBinoculars");
table.insert(ProceduralDistributions["list"]["CampingStoreGear"].items, 2);
table.insert(ProceduralDistributions["list"]["GunStoreDisplayCase"].items, "Base.LgBinoculars");
table.insert(ProceduralDistributions["list"]["GunStoreDisplayCase"].items, 1);
table.insert(ProceduralDistributions["list"]["BedroomSideTable"].items, "Base.LgBinoculars");
table.insert(ProceduralDistributions["list"]["BedroomSideTable"].items, 0.005);
table.insert(SuburbsDistributions["all"]["crate"].items, "Base.LgBinoculars");
table.insert(SuburbsDistributions["all"]["crate"].items, 0.0005);

table.insert(ProceduralDistributions["list"]["GunStoreMagazineRack"].items, "Base.HuntingCard1");
table.insert(ProceduralDistributions["list"]["GunStoreMagazineRack"].items, 0.2);
table.insert(ProceduralDistributions["list"]["GunStoreMagazineRack"].items, "Base.HuntingCard2");
table.insert(ProceduralDistributions["list"]["GunStoreMagazineRack"].items, 0.2);
table.insert(ProceduralDistributions["list"]["GunStoreMagazineRack"].items, "Base.HuntingCard3");
table.insert(ProceduralDistributions["list"]["GunStoreMagazineRack"].items, 0.2);
table.insert(ProceduralDistributions["list"]["GunStoreMagazineRack"].items, "Base.HuntingCard4");
table.insert(ProceduralDistributions["list"]["GunStoreMagazineRack"].items, 0.2);
table.insert(ProceduralDistributions["list"]["GunStoreMagazineRack"].items, "Base.HuntingCard5");
table.insert(ProceduralDistributions["list"]["GunStoreMagazineRack"].items, 0.2);
table.insert(ProceduralDistributions["list"]["GunStoreMagazineRack"].items, "Base.HuntingCard6");
table.insert(ProceduralDistributions["list"]["GunStoreMagazineRack"].items, 0.2);
table.insert(ProceduralDistributions["list"]["GunStoreMagazineRack"].items, "Base.HuntingCard7");
table.insert(ProceduralDistributions["list"]["GunStoreMagazineRack"].items, 0.2);
table.insert(ProceduralDistributions["list"]["GunStoreMagazineRack"].items, "Base.HuntingCard8");
table.insert(ProceduralDistributions["list"]["GunStoreMagazineRack"].items, 0.2);
table.insert(ProceduralDistributions["list"]["GunStoreMagazineRack"].items, "Base.HuntingCard9");
table.insert(ProceduralDistributions["list"]["GunStoreMagazineRack"].items, 0.2);
table.insert(ProceduralDistributions["list"]["GunStoreMagazineRack"].items, "Base.HuntingCard10");
table.insert(ProceduralDistributions["list"]["GunStoreMagazineRack"].items, 0.2);
table.insert(ProceduralDistributions["list"]["GunStoreMagazineRack"].items, "Base.LGCookingMag4");
table.insert(ProceduralDistributions["list"]["GunStoreMagazineRack"].items, 1);

table.insert(ProceduralDistributions["list"]["GunStoreCounter"].items, "Base.DeerCall");
table.insert(ProceduralDistributions["list"]["GunStoreCounter"].items, 0.5);
table.insert(ProceduralDistributions["list"]["GunStoreDisplayCase"].items, "Base.DeerCall");
table.insert(ProceduralDistributions["list"]["GunStoreDisplayCase"].items, 0.5);

table.insert(ProceduralDistributions["list"]["CampingStoreGear"].items, "Base.HuntingCard1");
table.insert(ProceduralDistributions["list"]["CampingStoreGear"].items, 0.2);
table.insert(ProceduralDistributions["list"]["CampingStoreGear"].items, "Base.HuntingCard2");
table.insert(ProceduralDistributions["list"]["CampingStoreGear"].items, 0.2);
table.insert(ProceduralDistributions["list"]["CampingStoreGear"].items, "Base.HuntingCard3");
table.insert(ProceduralDistributions["list"]["CampingStoreGear"].items, 0.2);
table.insert(ProceduralDistributions["list"]["CampingStoreGear"].items, "Base.HuntingCard4");
table.insert(ProceduralDistributions["list"]["CampingStoreGear"].items, 0.2);
table.insert(ProceduralDistributions["list"]["CampingStoreGear"].items, "Base.HuntingCard5");
table.insert(ProceduralDistributions["list"]["CampingStoreGear"].items, 0.2);
table.insert(ProceduralDistributions["list"]["CampingStoreGear"].items, "Base.HuntingCard6");
table.insert(ProceduralDistributions["list"]["CampingStoreGear"].items, 0.2);
table.insert(ProceduralDistributions["list"]["CampingStoreGear"].items, "Base.HuntingCard7");
table.insert(ProceduralDistributions["list"]["CampingStoreGear"].items, 0.2);
table.insert(ProceduralDistributions["list"]["CampingStoreGear"].items, "Base.HuntingCard8");
table.insert(ProceduralDistributions["list"]["CampingStoreGear"].items, 0.2);
table.insert(ProceduralDistributions["list"]["CampingStoreGear"].items, "Base.HuntingCard9");
table.insert(ProceduralDistributions["list"]["CampingStoreGear"].items, 0.2);
table.insert(ProceduralDistributions["list"]["CampingStoreGear"].items, "Base.HuntingCard10");
table.insert(ProceduralDistributions["list"]["CampingStoreGear"].items, 0.2);

table.insert(ProceduralDistributions["list"]["GunStoreDisplayCase"].items, "Base.HuntingCard1");
table.insert(ProceduralDistributions["list"]["GunStoreDisplayCase"].items, 0.2);
table.insert(ProceduralDistributions["list"]["GunStoreDisplayCase"].items, "Base.HuntingCard2");
table.insert(ProceduralDistributions["list"]["GunStoreDisplayCase"].items, 0.2);
table.insert(ProceduralDistributions["list"]["GunStoreDisplayCase"].items, "Base.HuntingCard3");
table.insert(ProceduralDistributions["list"]["GunStoreDisplayCase"].items, 0.2);
table.insert(ProceduralDistributions["list"]["GunStoreDisplayCase"].items, "Base.HuntingCard4");
table.insert(ProceduralDistributions["list"]["GunStoreDisplayCase"].items, 0.2);
table.insert(ProceduralDistributions["list"]["GunStoreDisplayCase"].items, "Base.HuntingCard5");
table.insert(ProceduralDistributions["list"]["GunStoreDisplayCase"].items, 0.2);
table.insert(ProceduralDistributions["list"]["GunStoreDisplayCase"].items, "Base.HuntingCard6");
table.insert(ProceduralDistributions["list"]["GunStoreDisplayCase"].items, 0.2);
table.insert(ProceduralDistributions["list"]["GunStoreDisplayCase"].items, "Base.HuntingCard7");
table.insert(ProceduralDistributions["list"]["GunStoreDisplayCase"].items, 0.2);
table.insert(ProceduralDistributions["list"]["GunStoreDisplayCase"].items, "Base.HuntingCard8");
table.insert(ProceduralDistributions["list"]["GunStoreDisplayCase"].items, 0.2);
table.insert(ProceduralDistributions["list"]["GunStoreDisplayCase"].items, "Base.HuntingCard9");
table.insert(ProceduralDistributions["list"]["GunStoreDisplayCase"].items, 0.2);
table.insert(ProceduralDistributions["list"]["GunStoreDisplayCase"].items, "Base.HuntingCard10");
table.insert(ProceduralDistributions["list"]["GunStoreDisplayCase"].items, 0.2);

table.insert(SuburbsDistributions["GunCache1"]["GunBox"].items, "Base.HuntingCard1");
table.insert(SuburbsDistributions["GunCache1"]["GunBox"].items, 0.2);
table.insert(SuburbsDistributions["GunCache1"]["GunBox"].items, "Base.HuntingCard2");
table.insert(SuburbsDistributions["GunCache1"]["GunBox"].items, 0.2);
table.insert(SuburbsDistributions["GunCache1"]["GunBox"].items, "Base.HuntingCard3");
table.insert(SuburbsDistributions["GunCache1"]["GunBox"].items, 0.2);
table.insert(SuburbsDistributions["GunCache1"]["GunBox"].items, "Base.HuntingCard4");
table.insert(SuburbsDistributions["GunCache1"]["GunBox"].items, 0.2);
table.insert(SuburbsDistributions["GunCache1"]["GunBox"].items, "Base.HuntingCard5");
table.insert(SuburbsDistributions["GunCache1"]["GunBox"].items, 0.2);
table.insert(SuburbsDistributions["GunCache1"]["GunBox"].items, "Base.HuntingCard6");
table.insert(SuburbsDistributions["GunCache1"]["GunBox"].items, 0.2);
table.insert(SuburbsDistributions["GunCache1"]["GunBox"].items, "Base.HuntingCard7");
table.insert(SuburbsDistributions["GunCache1"]["GunBox"].items, 0.2);
table.insert(SuburbsDistributions["GunCache1"]["GunBox"].items, "Base.HuntingCard8");
table.insert(SuburbsDistributions["GunCache1"]["GunBox"].items, 0.2);
table.insert(SuburbsDistributions["GunCache1"]["GunBox"].items, "Base.HuntingCard9");
table.insert(SuburbsDistributions["GunCache1"]["GunBox"].items, 0.2);
table.insert(SuburbsDistributions["GunCache1"]["GunBox"].items, "Base.HuntingCard10");
table.insert(SuburbsDistributions["GunCache1"]["GunBox"].items, 0.2);

table.insert(ProceduralDistributions["list"]["StoreKitchenDishes"].items, "Base.CheeseMoldEmpty");
table.insert(ProceduralDistributions["list"]["StoreKitchenDishes"].items, 1);
table.insert(ProceduralDistributions["list"]["StoreKitchenDishes"].items, "Base.CheeseMoldEmpty2");
table.insert(ProceduralDistributions["list"]["StoreKitchenDishes"].items, 2);
table.insert(ProceduralDistributions["list"]["StoreKitchenDishes"].items, "Base.CheeseMoldEmpty3");
table.insert(ProceduralDistributions["list"]["StoreKitchenDishes"].items, 1);

table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, "Base.LacticFerment");
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, 2);
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, "Base.CitricAcid");
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, 2);
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, "Base.EdibleDyeYellow");
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, 2);
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, "Base.EdibleDyeRed");
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, 2);
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, "Base.EdibleDyeOrange");
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, 2);

table.insert(ProceduralDistributions["list"]["BurgerKitchenFridge"].items, "Base.Tabasco");
table.insert(ProceduralDistributions["list"]["BurgerKitchenFridge"].items, 3);

table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, "Base.LacticFerment");
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, 0.5);
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, "Base.CitricAcid");
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, 0.5);
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, "Base.Gelatine");
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, 2);
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, "Base.EdibleDyeYellow");
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, 0.5);
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, "Base.EdibleDyeRed");
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, 0.5);
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, "Base.EdibleDyeOrange");
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, 0.5);
table.insert(ProceduralDistributions["list"]["StoreKitchenPots"].items, "Base.CheeseMoldEmpty");
table.insert(ProceduralDistributions["list"]["StoreKitchenPots"].items, 0.5);
table.insert(ProceduralDistributions["list"]["StoreKitchenPots"].items, "Base.CheeseMoldEmpty3");
table.insert(ProceduralDistributions["list"]["StoreKitchenPots"].items, 0.5);

table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, "Base.MilkPowder");
table.insert(SuburbsDistributions["SurvivorCache1"]["SurvivorCrate"].items, 15);
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, "Base.MilkPowder");
table.insert(SuburbsDistributions["SurvivorCache2"]["SurvivorCrate"].items, 15);

table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, "Base.MoldesMagBox");
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, 3);
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, "Base.MilkPowder");
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, 4);

table.insert(ProceduralDistributions["list"]["StoreKitchenCafe"].items, "Base.WaffleMachine");
table.insert(ProceduralDistributions["list"]["StoreKitchenCafe"].items, 1);
table.insert(ProceduralDistributions["list"]["StoreKitchenCafe"].items, "Base.MolinoCoffee");
table.insert(ProceduralDistributions["list"]["StoreKitchenCafe"].items, 4);
table.insert(ProceduralDistributions["list"]["StoreKitchenCafe"].items, "Base.KitchenBrush");
table.insert(ProceduralDistributions["list"]["StoreKitchenCafe"].items, 1);
table.insert(ProceduralDistributions["list"]["StoreKitchenCafe"].items, "Base.WaffleMachine");
table.insert(ProceduralDistributions["list"]["StoreKitchenCafe"].items, 1);
table.insert(ProceduralDistributions["list"]["StoreKitchenCafe"].items, "legourmet.MateEmpty");
table.insert(ProceduralDistributions["list"]["StoreKitchenCafe"].items, 0.1);
table.insert(ProceduralDistributions["list"]["StoreKitchenCafe"].items, "legourmet.VacuumFlaskEmpty");
table.insert(ProceduralDistributions["list"]["StoreKitchenCafe"].items, 0.1);

table.insert(ProceduralDistributions["list"]["StoreKitchenDishes"].items, "Base.KitchenBrush");
table.insert(ProceduralDistributions["list"]["StoreKitchenDishes"].items, 1);

table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, "Base.Oil");
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, 1);
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, "Base.Oil");
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, 1);
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, "Base.Oil");
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, 1);
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, "Base.CornOil");
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, 1);
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, "Base.CornOil");
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, 1);
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, "Base.CornOil");
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, 1);

table.insert(ProceduralDistributions["list"]["PizzaKitchenCheese"].items, "Base.EdibleDyeYellow");
table.insert(ProceduralDistributions["list"]["PizzaKitchenCheese"].items, 1);
table.insert(ProceduralDistributions["list"]["PizzaKitchenCheese"].items, "Base.EdibleDyeRed");
table.insert(ProceduralDistributions["list"]["PizzaKitchenCheese"].items, 1);
table.insert(ProceduralDistributions["list"]["PizzaKitchenCheese"].items, "Base.EdibleDyeOrange");
table.insert(ProceduralDistributions["list"]["PizzaKitchenCheese"].items, 1);

table.insert(ProceduralDistributions["list"]["GigamartBakingMisc"].items, "Base.Oil");
table.insert(ProceduralDistributions["list"]["GigamartBakingMisc"].items, 0.1);
table.insert(ProceduralDistributions["list"]["GigamartBakingMisc"].items, "Base.Oil");
table.insert(ProceduralDistributions["list"]["GigamartBakingMisc"].items, 0.1);
table.insert(ProceduralDistributions["list"]["GigamartBakingMisc"].items, "Base.CornOil");
table.insert(ProceduralDistributions["list"]["GigamartBakingMisc"].items, 0.1);
table.insert(ProceduralDistributions["list"]["GigamartBakingMisc"].items, "Base.CornOil");
table.insert(ProceduralDistributions["list"]["GigamartBakingMisc"].items, 0.1);
table.insert(ProceduralDistributions["list"]["GigamartBakingMisc"].items, "Base.MoldesMagBox");
table.insert(ProceduralDistributions["list"]["GigamartBakingMisc"].items, 0.1);

table.insert(ProceduralDistributions["list"]["GigamartHousewares"].items, "Base.MoldesMagBox");
table.insert(ProceduralDistributions["list"]["GigamartHousewares"].items, 0.1);
table.insert(ProceduralDistributions["list"]["GigamartPots"].items, "Base.CheeseMoldEmpty");
table.insert(ProceduralDistributions["list"]["GigamartPots"].items, 4);
table.insert(ProceduralDistributions["list"]["GigamartPots"].items, "Base.CheeseMoldEmpty2");
table.insert(ProceduralDistributions["list"]["GigamartPots"].items, 4);
table.insert(ProceduralDistributions["list"]["GigamartPots"].items, "Base.CheeseMoldEmpty3");
table.insert(ProceduralDistributions["list"]["GigamartPots"].items, 4);
table.insert(ProceduralDistributions["list"]["GigamartHousewares"].items, "Base.MolinoCoffee");
table.insert(ProceduralDistributions["list"]["GigamartHousewares"].items, 2);
table.insert(ProceduralDistributions["list"]["GigamartHousewares"].items, "Base.CheeseMoldEmpty");
table.insert(ProceduralDistributions["list"]["GigamartHousewares"].items, 2);
table.insert(ProceduralDistributions["list"]["GigamartHousewares"].items, "Base.CheeseMoldEmpty2");
table.insert(ProceduralDistributions["list"]["GigamartHousewares"].items, 2);
table.insert(ProceduralDistributions["list"]["GigamartHousewares"].items, "Base.CheeseMoldEmpty3");
table.insert(ProceduralDistributions["list"]["GigamartHousewares"].items, 2);

table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, "Base.MilkPowder");
table.insert(ProceduralDistributions["list"]["GigamartDryGoods"].items, 10);

table.insert(ProceduralDistributions["list"]["StoreKitchenPots"].items, "Base.WaffleMachine");
table.insert(ProceduralDistributions["list"]["StoreKitchenPots"].items, 0.02);
table.insert(ProceduralDistributions["list"]["StoreKitchenCafe"].items, "Base.MoldesMagBox");
table.insert(ProceduralDistributions["list"]["StoreKitchenCafe"].items, 2);
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, "Base.MilkPowder");
table.insert(ProceduralDistributions["list"]["StoreKitchenBaking"].items, 3);

table.insert(ProceduralDistributions["list"]["CratePancakeMix"].items, "Base.MoldesMagBox");
table.insert(ProceduralDistributions["list"]["CratePancakeMix"].items, 10);
table.insert(ProceduralDistributions["list"]["CratePancakeMix"].items, "Base.WaffleMachine");
table.insert(ProceduralDistributions["list"]["CratePancakeMix"].items, 10);
table.insert(ProceduralDistributions["list"]["CrateButter"].items, "Base.MilkPowder");
table.insert(ProceduralDistributions["list"]["CrateButter"].items, 10);
table.insert(ProceduralDistributions["list"]["CrateButter"].items, "Base.MilkPowder");
table.insert(ProceduralDistributions["list"]["CrateButter"].items, 10);
table.insert(ProceduralDistributions["list"]["CratePasta"].items, "Base.ManualMeatMincer");
table.insert(ProceduralDistributions["list"]["CratePasta"].items, 10);
table.insert(ProceduralDistributions["list"]["CratePasta"].items, "Base.MolinoCoffee");
table.insert(ProceduralDistributions["list"]["CratePasta"].items, 10);
table.insert(ProceduralDistributions["list"]["CratePasta"].items, "Base.ElectricMeatMincer");
table.insert(ProceduralDistributions["list"]["CratePasta"].items, 10);
table.insert(ProceduralDistributions["list"]["CratePasta"].items, "Base.KnifeDepostador");
table.insert(ProceduralDistributions["list"]["CratePasta"].items, 20);
table.insert(ProceduralDistributions["list"]["CratePasta"].items, "Base.KnifeDepostador");
table.insert(ProceduralDistributions["list"]["CratePasta"].items, 20);
table.insert(ProceduralDistributions["list"]["CratePasta"].items, "Base.CheeseMoldEmpty");
table.insert(ProceduralDistributions["list"]["CratePasta"].items, 5);
table.insert(ProceduralDistributions["list"]["CratePasta"].items, "Base.CheeseMoldEmpty2");
table.insert(ProceduralDistributions["list"]["CratePasta"].items, 5);
table.insert(ProceduralDistributions["list"]["CratePasta"].items, "Base.CheeseMoldEmpty3");
table.insert(ProceduralDistributions["list"]["CratePasta"].items, 5);

table.insert(ProceduralDistributions["list"]["CratePasta"].items, "Base.KitchenBrush");
table.insert(ProceduralDistributions["list"]["CratePasta"].items, 10);
table.insert(ProceduralDistributions["list"]["CratePancakeMix"].items, "Base.KitchenBrush");
table.insert(ProceduralDistributions["list"]["CratePancakeMix"].items, 10);
table.insert(ProceduralDistributions["list"]["CrateBakingSoda"].items, "Base.KitchenBrush");
table.insert(ProceduralDistributions["list"]["CrateBakingSoda"].items, 10);




table.insert(ProceduralDistributions["list"]["ElectronicStoreMisc"].items, "Base.WaffleMachine");
table.insert(ProceduralDistributions["list"]["ElectronicStoreMisc"].items, 1);

table.insert(ProceduralDistributions["list"]["GigamartHouseElectronics"].items, "Base.WaffleMachine");
table.insert(ProceduralDistributions["list"]["GigamartHouseElectronics"].items, 1);

table.insert(ProceduralDistributions["list"]["CampingStoreBooks"].items, "legourmetfarming.SeedBook");
table.insert(ProceduralDistributions["list"]["CampingStoreBooks"].items, 5);
table.insert(ProceduralDistributions["list"]["CampingStoreBooks"].items, "Base.LGCookingMag4");
table.insert(ProceduralDistributions["list"]["CampingStoreBooks"].items, 0.2);

table.insert(SuburbsDistributions["all"]["postbox"].items, "Base.LGCookingMag");
table.insert(SuburbsDistributions["all"]["postbox"].items, 0.5);
table.insert(SuburbsDistributions["all"]["postbox"].items, "Base.LGCookingMag2");
table.insert(SuburbsDistributions["all"]["postbox"].items, 0.5);
table.insert(SuburbsDistributions["all"]["postbox"].items, "Base.LGCookingMag3");
table.insert(SuburbsDistributions["all"]["postbox"].items, 0.5);
table.insert(SuburbsDistributions["all"]["postbox"].items, "Base.LGCookingMag4");
table.insert(SuburbsDistributions["all"]["postbox"].items, 0.5);
table.insert(SuburbsDistributions["all"]["postbox"].items, "Base.LGCookingMag5");
table.insert(SuburbsDistributions["all"]["postbox"].items, 0.5);
table.insert(SuburbsDistributions["all"]["postbox"].items, "Base.LGCookingMag6");
table.insert(SuburbsDistributions["all"]["postbox"].items, 0.5);
table.insert(SuburbsDistributions["all"]["postbox"].items, "Base.LGCookingMag7");
table.insert(SuburbsDistributions["all"]["postbox"].items, 0.5);
table.insert(SuburbsDistributions["all"]["postbox"].items, "Base.LGCookingMag8");
table.insert(SuburbsDistributions["all"]["postbox"].items, 0.5);
table.insert(SuburbsDistributions["all"]["postbox"].items, "Base.LGCookingMag9");
table.insert(SuburbsDistributions["all"]["postbox"].items, 0.2);
table.insert(SuburbsDistributions["all"]["postbox"].items, "legourmetfarming.SeedBook");
table.insert(SuburbsDistributions["all"]["postbox"].items, 0.5);


table.insert(ProceduralDistributions["list"]["CrateBooks"].items, "Base.LGCookingMag");
table.insert(ProceduralDistributions["list"]["CrateBooks"].items, 0.2);
table.insert(ProceduralDistributions["list"]["CrateBooks"].items, "Base.LGCookingMag2");
table.insert(ProceduralDistributions["list"]["CrateBooks"].items, 0.2);
table.insert(ProceduralDistributions["list"]["CrateBooks"].items, "Base.LGCookingMag3");
table.insert(ProceduralDistributions["list"]["CrateBooks"].items, 0.2);
table.insert(ProceduralDistributions["list"]["CrateBooks"].items, "Base.LGCookingMag4");
table.insert(ProceduralDistributions["list"]["CrateBooks"].items, 0.2);
table.insert(ProceduralDistributions["list"]["CrateBooks"].items, "Base.LGCookingMag5");
table.insert(ProceduralDistributions["list"]["CrateBooks"].items, 0.2);
table.insert(ProceduralDistributions["list"]["CrateBooks"].items, "Base.LGCookingMag6");
table.insert(ProceduralDistributions["list"]["CrateBooks"].items, 0.2);
table.insert(ProceduralDistributions["list"]["CrateBooks"].items, "Base.LGCookingMag7");
table.insert(ProceduralDistributions["list"]["CrateBooks"].items, 0.2);
table.insert(ProceduralDistributions["list"]["CrateBooks"].items, "Base.LGCookingMag8");
table.insert(ProceduralDistributions["list"]["CrateBooks"].items, 0.2);
table.insert(ProceduralDistributions["list"]["CrateBooks"].items, "Base.LGCookingMag9");
table.insert(ProceduralDistributions["list"]["CrateBooks"].items, 0.1);
table.insert(ProceduralDistributions["list"]["CrateBooks"].items, "legourmetfarming.SeedBook");
table.insert(ProceduralDistributions["list"]["CrateBooks"].items, 0.5);

table.insert(SuburbsDistributions["all"]["bin"].items, "Base.OilEmpty");
table.insert(SuburbsDistributions["all"]["bin"].items, 0.1);
table.insert(SuburbsDistributions["all"]["bin"].items, "Base.CornOilEmpty");
table.insert(SuburbsDistributions["all"]["bin"].items, 0.1);

table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "Base.PackSalchichas");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, 1);

table.insert(ProceduralDistributions["list"]["CrepeKitchenFridge"].items, "Base.PackSalchichas");
table.insert(ProceduralDistributions["list"]["CrepeKitchenFridge"].items, 2);

table.insert(ProceduralDistributions["list"]["SpiffosKitchenFridge"].items, "Base.PackSalchichas");
table.insert(ProceduralDistributions["list"]["SpiffosKitchenFridge"].items, 3);

--Trampas
table.insert(ProceduralDistributions["list"]["CampingStoreGear"].items, "Base.BearTrap");
table.insert(ProceduralDistributions["list"]["CampingStoreGear"].items, 1);
table.insert(ProceduralDistributions["list"]["CampingStoreGear"].items, "Base.KnifeDepostador");
table.insert(ProceduralDistributions["list"]["CampingStoreGear"].items, 1);

table.insert(ProceduralDistributions["list"]["GunStoreDisplayCase"].items, "Base.BearTrap");
table.insert(ProceduralDistributions["list"]["GunStoreDisplayCase"].items, 1);
table.insert(ProceduralDistributions["list"]["GunStoreDisplayCase"].items, "Base.KnifeDepostador");
table.insert(ProceduralDistributions["list"]["GunStoreDisplayCase"].items, 1);

table.insert(SuburbsDistributions["all"]["crate"].items, "Base.BearTrap");
table.insert(SuburbsDistributions["all"]["crate"].items, 0.002);
table.insert(SuburbsDistributions["all"]["crate"].items, "Base.KnifeDepostador");
table.insert(SuburbsDistributions["all"]["crate"].items, 0.0005);
table.insert(SuburbsDistributions["all"]["crate"].items, "Base.MolinoCoffee");
table.insert(SuburbsDistributions["all"]["crate"].items, 0.0005);

------------------------ Vodka ------------------------
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "legourmet.VodkaFull");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, 3);

table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, "legourmet.VodkaFull");
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, 5);
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, "legourmet.VodkaFull");
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, 5);

table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, "legourmet.VodkaFull");
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, 5);
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, "legourmet.VodkaFull");
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, 5);

------------------------ Cola ------------------------

table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "legourmet.ColaBottle");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, 2);
table.insert(ProceduralDistributions["list"]["MotelFridge"].items, "legourmet.ColaBottle");
table.insert(ProceduralDistributions["list"]["MotelFridge"].items, 1);

table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, "legourmet.ColaBottle");
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, 2);
------------------------ Energy Drinks ----------------------
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "legourmet.EnergyDrinkBottle");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, 2);
table.insert(ProceduralDistributions["list"]["OfficeDrawers"].items, "legourmet.EnergyDrinkBottle");
table.insert(ProceduralDistributions["list"]["OfficeDrawers"].items, 1);
table.insert(ProceduralDistributions["list"]["OfficeDrawers"].items, "legourmet.EnergyDrink");
table.insert(ProceduralDistributions["list"]["OfficeDrawers"].items, 2);
table.insert(ProceduralDistributions["list"]["OfficeDrawers"].items, "legourmet.EnergyDrink2");
table.insert(ProceduralDistributions["list"]["OfficeDrawers"].items, 2);
table.insert(ProceduralDistributions["list"]["OfficeDrawers"].items, "legourmet.EnergyDrink3");
table.insert(ProceduralDistributions["list"]["OfficeDrawers"].items, 2);
table.insert(ProceduralDistributions["list"]["OfficeDrawers"].items, "legourmet.EnergyDrink4");
table.insert(ProceduralDistributions["list"]["OfficeDrawers"].items, 2);
table.insert(ProceduralDistributions["list"]["OfficeDrawers"].items, "legourmet.EnergyDrink5");
table.insert(ProceduralDistributions["list"]["OfficeDrawers"].items, 2);

table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, "legourmet.EnergyDrinkBottle");
table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, 0.002);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "legourmet.EnergyDrinkBottle");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 4);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "legourmet.EnergyDrink");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 3);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "legourmet.EnergyDrink2");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 3);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "legourmet.EnergyDrink3");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 3);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "legourmet.EnergyDrink4");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 3);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "legourmet.EnergyDrink5");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 3);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "Corkscrew");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 10);

table.insert(ProceduralDistributions["list"]["BarCounterWeapon"].items, "Corkscrew");
table.insert(ProceduralDistributions["list"]["BarCounterWeapon"].items, 10);
table.insert(ProceduralDistributions["list"]["BarCounterWeapon"].junk, "Corkscrew");
table.insert(ProceduralDistributions["list"]["BarCounterWeapon"].junk, 20);

table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, "legourmet.EnergyDrinkBottle");
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, 2);
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, "legourmet.EnergyDrink");
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, 2);
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, "legourmet.EnergyDrink2");
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, 2);
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, "legourmet.EnergyDrink3");
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, 2);
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, "legourmet.EnergyDrink4");
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, 2);
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, "legourmet.EnergyDrink5");
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, 2);

------------------------ Gums ----------------------

table.insert(SuburbsDistributions["all"]["sidetable"].items, "legourmet.GumPack");
table.insert(SuburbsDistributions["all"]["sidetable"].items, 3);
table.insert(SuburbsDistributions["all"]["sidetable"].junk, "legourmet.Gum");
table.insert(SuburbsDistributions["all"]["sidetable"].junk, 3);
table.insert(SuburbsDistributions["all"]["inventorymale"].items, "legourmet.Gum");
table.insert(SuburbsDistributions["all"]["inventorymale"].items, 0.1);
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "legourmet.Gum");
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, 0.1);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "legourmet.GumPack");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 5);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "legourmet.GumPack");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 5);

table.insert(SuburbsDistributions["all"]["sidetable"].items, "legourmet.GumPack1");
table.insert(SuburbsDistributions["all"]["sidetable"].items, 3);
table.insert(SuburbsDistributions["all"]["sidetable"].junk, "legourmet.Gum1");
table.insert(SuburbsDistributions["all"]["sidetable"].junk, 3);
table.insert(SuburbsDistributions["all"]["inventorymale"].items, "legourmet.Gum1");
table.insert(SuburbsDistributions["all"]["inventorymale"].items, 0.1);
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "legourmet.Gum1");
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, 0.1);

table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "legourmet.GumPack1");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 5);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "legourmet.GumPack1");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 5);

table.insert(SuburbsDistributions["all"]["sidetable"].items, "legourmet.GumPack2");
table.insert(SuburbsDistributions["all"]["sidetable"].items, 3);
table.insert(SuburbsDistributions["all"]["sidetable"].junk, "legourmet.Gum2");
table.insert(SuburbsDistributions["all"]["sidetable"].junk, 3);
table.insert(SuburbsDistributions["all"]["inventorymale"].items, "legourmet.Gum2");
table.insert(SuburbsDistributions["all"]["inventorymale"].items, 0.1);
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "legourmet.Gum2");
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, 0.1);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "legourmet.GumPack2");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 5);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "legourmet.GumPack2");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 5);

------------------------ Candy ---------------------- 

table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, "legourmet.GummyBears");
table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, 5);
table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, "legourmet.CornCandy");
table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, 5);
table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, "legourmet.GummyWorms");
table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, 5);
table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, "legourmet.CandySkil");
table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, 5);
table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, "legourmet.MixCandy");
table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, 5);
table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, "legourmet.JellyBeans");
table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, 5);
table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, "legourmet.MarshmallowPackage");
table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, 5);
table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, "legourmet.GumPack");
table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, 5);
table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, "legourmet.GumPack1");
table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, 5);
table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, "legourmet.GumPack2");
table.insert(ProceduralDistributions["list"]["CandyStoreSnacks"].items, 5);

table.insert(ProceduralDistributions["list"]["StoreShelfCombo"].items, "legourmet.GummyBears");
table.insert(ProceduralDistributions["list"]["StoreShelfCombo"].items, 5);
table.insert(ProceduralDistributions["list"]["StoreShelfCombo"].items, "legourmet.CornCandy");
table.insert(ProceduralDistributions["list"]["StoreShelfCombo"].items, 5);
table.insert(ProceduralDistributions["list"]["StoreShelfCombo"].items, "legourmet.GummyWorms");
table.insert(ProceduralDistributions["list"]["StoreShelfCombo"].items, 5);
table.insert(ProceduralDistributions["list"]["StoreShelfCombo"].items, "legourmet.CandySkil");
table.insert(ProceduralDistributions["list"]["StoreShelfCombo"].items, 5);
table.insert(ProceduralDistributions["list"]["StoreShelfCombo"].items, "legourmet.MixCandy");
table.insert(ProceduralDistributions["list"]["StoreShelfCombo"].items, 5);
table.insert(ProceduralDistributions["list"]["StoreShelfCombo"].items, "legourmet.JellyBeans");
table.insert(ProceduralDistributions["list"]["StoreShelfCombo"].items, 5);
table.insert(ProceduralDistributions["list"]["StoreShelfCombo"].items, "legourmet.MarshmallowPackage");
table.insert(ProceduralDistributions["list"]["StoreShelfCombo"].items, 5);
table.insert(ProceduralDistributions["list"]["StoreShelfCombo"].items, "legourmet.GumPack");
table.insert(ProceduralDistributions["list"]["StoreShelfCombo"].items, 5);
table.insert(ProceduralDistributions["list"]["StoreShelfCombo"].items, "legourmet.GumPack1");
table.insert(ProceduralDistributions["list"]["StoreShelfCombo"].items, 5);
table.insert(ProceduralDistributions["list"]["StoreShelfCombo"].items, "legourmet.GumPack2");
table.insert(ProceduralDistributions["list"]["StoreShelfCombo"].items, 5);

------------------------ Candy ---------------------- Sidetables
table.insert(SuburbsDistributions["all"]["sidetable"].items, "legourmet.GummyBears");
table.insert(SuburbsDistributions["all"]["sidetable"].items, 0.1);
table.insert(SuburbsDistributions["all"]["sidetable"].items, "legourmet.CornCandy");
table.insert(SuburbsDistributions["all"]["sidetable"].items, 0.1);
table.insert(SuburbsDistributions["all"]["sidetable"].items, "legourmet.GummyWorms");
table.insert(SuburbsDistributions["all"]["sidetable"].items, 0.1);
table.insert(SuburbsDistributions["all"]["sidetable"].items, "legourmet.CandySkil");
table.insert(SuburbsDistributions["all"]["sidetable"].items, 0.1);
table.insert(SuburbsDistributions["all"]["sidetable"].items, "legourmet.MixCandy");
table.insert(SuburbsDistributions["all"]["sidetable"].items, 0.1);
table.insert(SuburbsDistributions["all"]["sidetable"].items, "legourmet.JellyBeans");
table.insert(SuburbsDistributions["all"]["sidetable"].items, 0.1);
table.insert(SuburbsDistributions["all"]["sidetable"].items, "legourmet.MarshmallowPackage");
table.insert(SuburbsDistributions["all"]["sidetable"].items, 0.1);

table.insert(SuburbsDistributions["all"]["sidetable"].junk, "legourmet.GummyBears");
table.insert(SuburbsDistributions["all"]["sidetable"].junk, 0.02);
table.insert(SuburbsDistributions["all"]["sidetable"].junk, "legourmet.CornCandy");
table.insert(SuburbsDistributions["all"]["sidetable"].junk, 0.02);
table.insert(SuburbsDistributions["all"]["sidetable"].junk, "legourmet.GummyWorms");
table.insert(SuburbsDistributions["all"]["sidetable"].junk, 0.02);
table.insert(SuburbsDistributions["all"]["sidetable"].junk, "legourmet.CandySkil");
table.insert(SuburbsDistributions["all"]["sidetable"].junk, 0.02);
table.insert(SuburbsDistributions["all"]["sidetable"].junk, "legourmet.MixCandy");
table.insert(SuburbsDistributions["all"]["sidetable"].junk, 0.02);
table.insert(SuburbsDistributions["all"]["sidetable"].junk, "legourmet.JellyBeans");
table.insert(SuburbsDistributions["all"]["sidetable"].junk, 0.02);
table.insert(SuburbsDistributions["all"]["sidetable"].junk, "legourmet.MarshmallowPackage");
table.insert(SuburbsDistributions["all"]["sidetable"].junk, 0.02);
------------------------ Candy ---------------------- Motelrooms
table.insert(SuburbsDistributions["motelroom"]["sidetable"].items, "legourmet.GummyBears");
table.insert(SuburbsDistributions["motelroom"]["sidetable"].items, 0.4);
table.insert(SuburbsDistributions["motelroom"]["sidetable"].items, "legourmet.CornCandy");
table.insert(SuburbsDistributions["motelroom"]["sidetable"].items, 0.4);
table.insert(SuburbsDistributions["motelroom"]["sidetable"].items, "legourmet.GummyWorms");
table.insert(SuburbsDistributions["motelroom"]["sidetable"].items, 0.4);
table.insert(SuburbsDistributions["motelroom"]["sidetable"].items, "legourmet.CandySkil");
table.insert(SuburbsDistributions["motelroom"]["sidetable"].items, 0.4);
table.insert(SuburbsDistributions["motelroom"]["sidetable"].items, "legourmet.MixCandy");
table.insert(SuburbsDistributions["motelroom"]["sidetable"].items, 0.4);
table.insert(SuburbsDistributions["motelroom"]["sidetable"].items, "legourmet.JellyBeans");
table.insert(SuburbsDistributions["motelroom"]["sidetable"].items, 0.4);
table.insert(SuburbsDistributions["motelroom"]["sidetable"].items, "legourmet.MarshmallowPackage");
table.insert(SuburbsDistributions["motelroom"]["sidetable"].items, 0.4);


table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, "legourmet.GummyBears");
table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, 5);
table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, "legourmet.CornCandy");
table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, 5);
table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, "legourmet.GummyWorms");
table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, 5);
table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, "legourmet.CandySkil");
table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, 5);
table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, "legourmet.MixCandy");
table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, 5);
table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, "legourmet.JellyBeans");
table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, 5);
table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, "legourmet.GumPack");
table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, 5);
table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, "legourmet.GumPack1");
table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, 5);
table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, "legourmet.GumPack2");
table.insert(ProceduralDistributions["list"]["TheatreSnacks"].items, 5);

--Sodas--
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "legourmet.Soda01");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, 0.2);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "legourmet.Soda02");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, 0.2);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "legourmet.Soda03");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, 0.2);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "legourmet.Soda04");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, 0.2);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "legourmet.Soda05");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, 0.2);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "legourmet.Soda06");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, 0.2);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "legourmet.Soda07");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, 0.2);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "legourmet.Soda08");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, 0.2);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "legourmet.Soda09");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, 0.2);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "legourmet.Soda10");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, 0.2);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "legourmet.Soda11");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, 0.2);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "legourmet.Soda12");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, 0.2);
--Sodas 2--
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, "legourmet.Soda01");
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, 0.4);
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, "legourmet.Soda02");
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, 0.4);
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, "legourmet.Soda03");
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, 0.4);
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, "legourmet.Soda04");
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, 0.4);
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, "legourmet.Soda05");
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, 0.4);
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, "legourmet.Soda06");
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, 0.4);
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, "legourmet.Soda07");
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, 0.4);
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, "legourmet.Soda08");
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, 0.4);
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, "legourmet.Soda09");
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, 0.4);
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, "legourmet.Soda10");
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, 0.4);
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, "legourmet.Soda11");
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, 0.4);
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, "legourmet.Soda12");
table.insert(ProceduralDistributions["list"]["FridgeSoda"].items, 0.4);

table.insert(ProceduralDistributions["list"]["StoreShelfDrinks"].items, "legourmet.Soda01");
table.insert(ProceduralDistributions["list"]["StoreShelfDrinks"].items, 0.4);
table.insert(ProceduralDistributions["list"]["StoreShelfDrinks"].items, "legourmet.Soda02");
table.insert(ProceduralDistributions["list"]["StoreShelfDrinks"].items, 0.4);
table.insert(ProceduralDistributions["list"]["StoreShelfDrinks"].items, "legourmet.Soda03");
table.insert(ProceduralDistributions["list"]["StoreShelfDrinks"].items, 0.4);
table.insert(ProceduralDistributions["list"]["StoreShelfDrinks"].items, "legourmet.Soda04");
table.insert(ProceduralDistributions["list"]["StoreShelfDrinks"].items, 0.4);
table.insert(ProceduralDistributions["list"]["StoreShelfDrinks"].items, "legourmet.Soda05");
table.insert(ProceduralDistributions["list"]["StoreShelfDrinks"].items, 0.4);
table.insert(ProceduralDistributions["list"]["StoreShelfDrinks"].items, "legourmet.Soda06");
table.insert(ProceduralDistributions["list"]["StoreShelfDrinks"].items, 0.4);
table.insert(ProceduralDistributions["list"]["StoreShelfDrinks"].items, "legourmet.Soda07");
table.insert(ProceduralDistributions["list"]["StoreShelfDrinks"].items, 0.4);
table.insert(ProceduralDistributions["list"]["StoreShelfDrinks"].items, "legourmet.Soda08");
table.insert(ProceduralDistributions["list"]["StoreShelfDrinks"].items, 0.4);
table.insert(ProceduralDistributions["list"]["StoreShelfDrinks"].items, "legourmet.Soda09");
table.insert(ProceduralDistributions["list"]["StoreShelfDrinks"].items, 0.4);
table.insert(ProceduralDistributions["list"]["StoreShelfDrinks"].items, "legourmet.Soda10");
table.insert(ProceduralDistributions["list"]["StoreShelfDrinks"].items, 0.4);
table.insert(ProceduralDistributions["list"]["StoreShelfDrinks"].items, "legourmet.Soda11");
table.insert(ProceduralDistributions["list"]["StoreShelfDrinks"].items, 0.4);
table.insert(ProceduralDistributions["list"]["StoreShelfDrinks"].items, "legourmet.Soda12");
table.insert(ProceduralDistributions["list"]["StoreShelfDrinks"].items, 0.4);

--Sodas Bar--
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "legourmet.Soda01");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 0.4);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "legourmet.Soda02");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 0.4);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "legourmet.Soda03");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 0.4);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "legourmet.Soda04");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 0.4);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "legourmet.Soda05");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 0.4);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "legourmet.Soda06");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 0.4);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "legourmet.Soda07");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 0.4);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "legourmet.Soda08");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 0.4);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "legourmet.Soda09");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 0.4);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "legourmet.Soda10");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 0.4);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "legourmet.Soda11");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 0.4);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "legourmet.Soda12");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 0.4);

table.insert(ProceduralDistributions["list"]["TheatreDrinks"].items, "legourmet.Soda01");
table.insert(ProceduralDistributions["list"]["TheatreDrinks"].items, 0.4);
table.insert(ProceduralDistributions["list"]["TheatreDrinks"].items, "legourmet.Soda02");
table.insert(ProceduralDistributions["list"]["TheatreDrinks"].items, 0.4);
table.insert(ProceduralDistributions["list"]["TheatreDrinks"].items, "legourmet.Soda03");
table.insert(ProceduralDistributions["list"]["TheatreDrinks"].items, 0.4);
table.insert(ProceduralDistributions["list"]["TheatreDrinks"].items, "legourmet.Soda04");
table.insert(ProceduralDistributions["list"]["TheatreDrinks"].items, 0.4);
table.insert(ProceduralDistributions["list"]["TheatreDrinks"].items, "legourmet.Soda05");
table.insert(ProceduralDistributions["list"]["TheatreDrinks"].items, 0.4);
table.insert(ProceduralDistributions["list"]["TheatreDrinks"].items, "legourmet.Soda06");
table.insert(ProceduralDistributions["list"]["TheatreDrinks"].items, 0.4);
table.insert(ProceduralDistributions["list"]["TheatreDrinks"].items, "legourmet.Soda07");
table.insert(ProceduralDistributions["list"]["TheatreDrinks"].items, 0.4);
table.insert(ProceduralDistributions["list"]["TheatreDrinks"].items, "legourmet.Soda08");
table.insert(ProceduralDistributions["list"]["TheatreDrinks"].items, 0.4);
table.insert(ProceduralDistributions["list"]["TheatreDrinks"].items, "legourmet.Soda09");
table.insert(ProceduralDistributions["list"]["TheatreDrinks"].items, 0.4);
table.insert(ProceduralDistributions["list"]["TheatreDrinks"].items, "legourmet.Soda10");
table.insert(ProceduralDistributions["list"]["TheatreDrinks"].items, 0.4);
table.insert(ProceduralDistributions["list"]["TheatreDrinks"].items, "legourmet.Soda11");
table.insert(ProceduralDistributions["list"]["TheatreDrinks"].items, 0.4);
table.insert(ProceduralDistributions["list"]["TheatreDrinks"].items, "legourmet.Soda12");
table.insert(ProceduralDistributions["list"]["TheatreDrinks"].items, 0.4);

-- Dead Zeds
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "legourmet.EnergyDrink2");
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, 0.001);
table.insert(SuburbsDistributions["all"]["inventorymale"].items, "legourmet.EnergyDrink");
table.insert(SuburbsDistributions["all"]["inventorymale"].items, 0.001);
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "legourmet.EnergyDrink3");
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, 0.001);
table.insert(SuburbsDistributions["all"]["inventorymale"].items, "legourmet.EnergyDrink4");
table.insert(SuburbsDistributions["all"]["inventorymale"].items, 0.001);
table.insert(SuburbsDistributions["all"]["inventorymale"].items, "legourmet.EnergyDrink5");
table.insert(SuburbsDistributions["all"]["inventorymale"].items, 0.001);


-- Grocery
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, "legourmet.Crisps5");
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, 1);
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, "legourmet.Crisps6");
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, 1);
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, "legourmet.Crisps7");
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, 1);
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, "legourmet.Crisps8");
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, 1);
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, "legourmet.Crisps9");
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, 1);


table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, "legourmet.Wine3");
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, 3);
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, "legourmet.Wine3");
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, 3);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "legourmet.Wine3");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 3);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "legourmet.Wine3");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 3);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "Base.Corkscrew");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 5);

table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "Base.Corkscrew");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 5);

table.insert(SuburbsDistributions["motelroom"]["fridge"].items, "legourmet.Wine3");
table.insert(SuburbsDistributions["motelroom"]["fridge"].items, 2);

table.insert(ProceduralDistributions["list"]["StoreShelfWine"].items, "legourmet.Wine3");
table.insert(ProceduralDistributions["list"]["StoreShelfWine"].items, 20);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "legourmet.Wine3");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, 2);
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, "legourmet.Wine3");
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, 3);
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, "legourmet.Wine3");
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, 7);
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, "legourmet.Wine3");
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, 4);
table.insert(ProceduralDistributions["list"]["KitchenBottles"].junk, "legourmet.Wine3");
table.insert(ProceduralDistributions["list"]["KitchenBottles"].junk, 3);

table.insert(SuburbsDistributions["Bag_DuffelBag"].items, "Base.Wine");
table.insert(SuburbsDistributions["Bag_DuffelBag"].items, 0.5);
table.insert(SuburbsDistributions["Bag_DuffelBag"].items, "Base.Wine2");
table.insert(SuburbsDistributions["Bag_DuffelBag"].items, 0.5);
table.insert(SuburbsDistributions["Bag_DuffelBag"].items, "legourmet.Wine3");
table.insert(SuburbsDistributions["Bag_DuffelBag"].items, 0.5);
table.insert(SuburbsDistributions["Bag_DuffelBag"].items, "Base.Vinegar");
table.insert(SuburbsDistributions["Bag_DuffelBag"].items, 0.5);
table.insert(SuburbsDistributions["Bag_DuffelBag"].items, "Base.Corkscrew");
table.insert(SuburbsDistributions["Bag_DuffelBag"].items, 1);

table.insert(SuburbsDistributions["Bag_NormalHikingBag"].items, "Base.Wine");
table.insert(SuburbsDistributions["Bag_NormalHikingBag"].items, 0.5);
table.insert(SuburbsDistributions["Bag_NormalHikingBag"].items, "Base.Wine2");
table.insert(SuburbsDistributions["Bag_NormalHikingBag"].items, 0.5);
table.insert(SuburbsDistributions["Bag_NormalHikingBag"].items, "legourmet.Wine3");
table.insert(SuburbsDistributions["Bag_NormalHikingBag"].items, 0.5);
table.insert(SuburbsDistributions["Bag_NormalHikingBag"].items, "Base.Vinegar");
table.insert(SuburbsDistributions["Bag_NormalHikingBag"].items, 0.5);
table.insert(SuburbsDistributions["Bag_NormalHikingBag"].items, "Base.Corkscrew");
table.insert(SuburbsDistributions["Bag_NormalHikingBag"].items, 1);

table.insert(SuburbsDistributions["Bag_BigHikingBag"].items, "Base.Wine");
table.insert(SuburbsDistributions["Bag_BigHikingBag"].items, 0.5);
table.insert(SuburbsDistributions["Bag_BigHikingBag"].items, "Base.Wine2");
table.insert(SuburbsDistributions["Bag_BigHikingBag"].items, 0.5);
table.insert(SuburbsDistributions["Bag_BigHikingBag"].items, "legourmet.Wine3");
table.insert(SuburbsDistributions["Bag_BigHikingBag"].items, 0.5);
table.insert(SuburbsDistributions["Bag_BigHikingBag"].items, "Base.Vinegar");
table.insert(SuburbsDistributions["Bag_BigHikingBag"].items, 0.5);
table.insert(SuburbsDistributions["Bag_BigHikingBag"].items, "Base.Corkscrew");
table.insert(SuburbsDistributions["Bag_BigHikingBag"].items, 1);

table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "legourmet.JuiceBox2");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, 1);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "legourmet.JuiceBox2");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, 1);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "legourmet.JuiceBox2");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, 1);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "legourmet.JuiceBox3");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, 1);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "legourmet.JuiceBox3");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, 1);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "legourmet.JuiceBox3");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, 1);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "legourmet.JuiceBox4");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, 1);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "legourmet.JuiceBox4");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, 1);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "legourmet.JuiceBox4");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, 1);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "legourmet.JuiceBox5");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, 1);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "legourmet.JuiceBox5");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, 1);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "legourmet.JuiceBox5");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, 1);

table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, "legourmet.JuiceBox2");
table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, 2);
table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, "legourmet.JuiceBox2");
table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, 2);
table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, "legourmet.JuiceBox3");
table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, 2);
table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, "legourmet.JuiceBox3");
table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, 2);
table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, "legourmet.JuiceBox4");
table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, 2);
table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, "legourmet.JuiceBox4");
table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, 2);
table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, "legourmet.JuiceBox5");
table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, 2);
table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, "legourmet.JuiceBox5");
table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, 2);

table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "legourmet.JuiceBox2");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, 2);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "legourmet.JuiceBox2");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, 2);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "legourmet.JuiceBox3");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, 2);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "legourmet.JuiceBox3");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, 2);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "legourmet.JuiceBox4");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, 2);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "legourmet.JuiceBox4");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, 2);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "legourmet.JuiceBox5");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, 2);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "legourmet.JuiceBox5");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, 2);

table.insert(ProceduralDistributions["list"]["GigamartToys"].items, "Base.RubberBandsBox");
table.insert(ProceduralDistributions["list"]["GigamartToys"].items, 3);

table.insert(ProceduralDistributions["list"]["DeskGeneric"].items, "Base.RubberBandsBox");
table.insert(ProceduralDistributions["list"]["DeskGeneric"].items, 3);
table.insert(ProceduralDistributions["list"]["DeskGeneric"].junk, "Base.RubberBandsBox");
table.insert(ProceduralDistributions["list"]["DeskGeneric"].junk, 3);
table.insert(SuburbsDistributions["all"]["counter"].items, "Base.RubberBandsBox");
table.insert(SuburbsDistributions["all"]["counter"].items, 0.05);
table.insert(SuburbsDistributions["all"]["sidetable"].items, "Base.RubberBandsBox");
table.insert(SuburbsDistributions["all"]["sidetable"].items, 1);
table.insert(SuburbsDistributions["all"]["sidetable"].junk, "Base.RubberBandsBox");
table.insert(SuburbsDistributions["all"]["sidetable"].junk, 1);
table.insert(ProceduralDistributions["list"]["OfficeDrawers"].items, "Base.RubberBandsBox");
table.insert(ProceduralDistributions["list"]["OfficeDrawers"].items, 1);
table.insert(ProceduralDistributions["list"]["LibraryCounter"].items, "Base.RubberBandsBox");
table.insert(ProceduralDistributions["list"]["LibraryCounter"].items, 2);

--Magazines
table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, "legourmet.EnergyMagazine");
table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, 0.5);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "legourmet.EnergyMagazine");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 1);

table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, "legourmet.DrinksMag2");
table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, 0.5);

table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "legourmet.DrinksMag2");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 1);


------------------------ Beers ----------------------
table.insert(ProceduralDistributions["list"]["BarCounterWeapon"].items, "legourmet.Beercan1");
table.insert(ProceduralDistributions["list"]["BarCounterWeapon"].items, 0.01);
table.insert(ProceduralDistributions["list"]["BarCounterWeapon"].items, "legourmet.Beercan2");
table.insert(ProceduralDistributions["list"]["BarCounterWeapon"].items, 0.01);
table.insert(ProceduralDistributions["list"]["BarCounterWeapon"].items, "legourmet.Beercan3");
table.insert(ProceduralDistributions["list"]["BarCounterWeapon"].items, 0.01);
table.insert(ProceduralDistributions["list"]["BarCounterWeapon"].items, "legourmet.Beer1");
table.insert(ProceduralDistributions["list"]["BarCounterWeapon"].items, 0.01);
table.insert(ProceduralDistributions["list"]["BarCounterWeapon"].items, "legourmet.Beer2");
table.insert(ProceduralDistributions["list"]["BarCounterWeapon"].items, 0.01);
table.insert(ProceduralDistributions["list"]["BarCounterWeapon"].items, "legourmet.Beer3");
table.insert(ProceduralDistributions["list"]["BarCounterWeapon"].items, 0.01);
table.insert(ProceduralDistributions["list"]["BarCounterWeapon"].items, "legourmet.BeerSixPack1");
table.insert(ProceduralDistributions["list"]["BarCounterWeapon"].items, 0.0001);
table.insert(ProceduralDistributions["list"]["BarCounterWeapon"].items, "legourmet.BeerSixPack2");
table.insert(ProceduralDistributions["list"]["BarCounterWeapon"].items, 0.0001);
table.insert(ProceduralDistributions["list"]["BarCounterWeapon"].items, "legourmet.BeerSixPack3");
table.insert(ProceduralDistributions["list"]["BarCounterWeapon"].items, 0.0001);
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, "legourmet.Beer1");
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, 4);
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, "legourmet.Beer2");
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, 4);
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, "legourmet.Beer3");
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, 4);

table.insert(ProceduralDistributions["list"]["FridgeBeer"].items, "legourmet.Beercan1");
table.insert(ProceduralDistributions["list"]["FridgeBeer"].items, 0.01);
table.insert(ProceduralDistributions["list"]["FridgeBeer"].items, "legourmet.Beercan2");
table.insert(ProceduralDistributions["list"]["FridgeBeer"].items, 0.01);
table.insert(ProceduralDistributions["list"]["FridgeBeer"].items, "legourmet.Beercan3");
table.insert(ProceduralDistributions["list"]["FridgeBeer"].items, 0.01);
table.insert(ProceduralDistributions["list"]["FridgeBeer"].items, "legourmet.Beer1");
table.insert(ProceduralDistributions["list"]["FridgeBeer"].items, 0.01);
table.insert(ProceduralDistributions["list"]["FridgeBeer"].items, "legourmet.Beer2");
table.insert(ProceduralDistributions["list"]["FridgeBeer"].items, 0.01);
table.insert(ProceduralDistributions["list"]["FridgeBeer"].items, "legourmet.Beer3");
table.insert(ProceduralDistributions["list"]["FridgeBeer"].items, 0.01);
table.insert(ProceduralDistributions["list"]["FridgeBeer"].items, "legourmet.BeerSixPack1");
table.insert(ProceduralDistributions["list"]["FridgeBeer"].items, 0.0001);
table.insert(ProceduralDistributions["list"]["FridgeBeer"].items, "legourmet.BeerSixPack2");
table.insert(ProceduralDistributions["list"]["FridgeBeer"].items, 0.0001);
table.insert(ProceduralDistributions["list"]["FridgeBeer"].items, "legourmet.BeerSixPack3");
table.insert(ProceduralDistributions["list"]["FridgeBeer"].items, 0.0001);

table.insert(ProceduralDistributions["list"]["StoreShelfBeer"].items, "legourmet.Beercan1");
table.insert(ProceduralDistributions["list"]["StoreShelfBeer"].items, 2);
table.insert(ProceduralDistributions["list"]["StoreShelfBeer"].items, "legourmet.Beercan2");
table.insert(ProceduralDistributions["list"]["StoreShelfBeer"].items, 2);
table.insert(ProceduralDistributions["list"]["StoreShelfBeer"].items, "legourmet.Beercan3");
table.insert(ProceduralDistributions["list"]["StoreShelfBeer"].items, 2);
table.insert(ProceduralDistributions["list"]["StoreShelfBeer"].items, "legourmet.Beer1");
table.insert(ProceduralDistributions["list"]["StoreShelfBeer"].items, 2);
table.insert(ProceduralDistributions["list"]["StoreShelfBeer"].items, "legourmet.Beer2");
table.insert(ProceduralDistributions["list"]["StoreShelfBeer"].items, 2);
table.insert(ProceduralDistributions["list"]["StoreShelfBeer"].items, "legourmet.Beer3");
table.insert(ProceduralDistributions["list"]["StoreShelfBeer"].items, 2);
table.insert(ProceduralDistributions["list"]["StoreShelfBeer"].items, "legourmet.BeerSixPack1");
table.insert(ProceduralDistributions["list"]["StoreShelfBeer"].items, 1);
table.insert(ProceduralDistributions["list"]["StoreShelfBeer"].items, "legourmet.BeerSixPack2");
table.insert(ProceduralDistributions["list"]["StoreShelfBeer"].items, 1);
table.insert(ProceduralDistributions["list"]["StoreShelfBeer"].items, "legourmet.BeerSixPack3");
table.insert(ProceduralDistributions["list"]["StoreShelfBeer"].items, 1);

------------------------ TripleSec, Tequila, etc ----------------------

table.insert(ProceduralDistributions["list"]["StoreShelfWhiskey"].items, "legourmet.TripleSec");
table.insert(ProceduralDistributions["list"]["StoreShelfWhiskey"].items, 5);
table.insert(ProceduralDistributions["list"]["StoreShelfWhiskey"].items, "legourmet.WhiteTequila");
table.insert(ProceduralDistributions["list"]["StoreShelfWhiskey"].items, 5);
table.insert(ProceduralDistributions["list"]["StoreShelfWhiskey"].items, "legourmet.Ginebra");
table.insert(ProceduralDistributions["list"]["StoreShelfWhiskey"].items, 5);
table.insert(ProceduralDistributions["list"]["StoreShelfWhiskey"].items, "legourmet.DryVermouth");
table.insert(ProceduralDistributions["list"]["StoreShelfWhiskey"].items, 5);
table.insert(ProceduralDistributions["list"]["StoreShelfWhiskey"].items, "legourmet.WhiteRum");
table.insert(ProceduralDistributions["list"]["StoreShelfWhiskey"].items, 5);
table.insert(ProceduralDistributions["list"]["StoreShelfWhiskey"].items, "legourmet.Rum");
table.insert(ProceduralDistributions["list"]["StoreShelfWhiskey"].items, 5);
table.insert(ProceduralDistributions["list"]["StoreShelfWhiskey"].items, "legourmet.Aguaardiente");
table.insert(ProceduralDistributions["list"]["StoreShelfWhiskey"].items, 5);

table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "legourmet.TripleSec");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, 0.01);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "legourmet.WhiteTequila");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, 0.01);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "legourmet.Ginebra");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, 0.01);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "legourmet.DryVermouth");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, 0.01);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "legourmet.WhiteRum");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, 0.01);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "legourmet.Rum");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, 0.01);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "legourmet.Aguaardiente");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, 0.01);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "legourmet.SodaBottle");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, 0.01);
table.insert(ProceduralDistributions["list"]["FreezerGeneric"].items, "legourmet.IceCubes");
table.insert(ProceduralDistributions["list"]["FreezerGeneric"].items, 10);
table.insert(ProceduralDistributions["list"]["FreezerGeneric"].items, "Base.WaterCubebox");
table.insert(ProceduralDistributions["list"]["FreezerGeneric"].items, 0.2);

table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, "legourmet.TripleSec");
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, 2);
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, "legourmet.WhiteTequila");
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, 2);
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, "legourmet.Ginebra");
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, 2);
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, "legourmet.DryVermouth");
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, 2);
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, "legourmet.WhiteRum");
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, 2);
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, "legourmet.Rum");
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, 2);
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, "legourmet.Aguaardiente");
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, 2);
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, "legourmet.SodaBottle");
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, 4);
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, "legourmet.MargaritaGlass");
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, 2);
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, "legourmet.Glass");
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, 2);
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, "legourmet.Shaker");
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, 4);
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, "legourmet.CocktailSpoon");
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, 4);
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, "legourmet.TripleSec");
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, 4);
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, "legourmet.WhiteTequila");
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, 4);
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, "legourmet.Ginebra");
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, 4);
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, "legourmet.DryVermouth");
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, 4);
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, "legourmet.WhiteRum");
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, 4);
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, "legourmet.Rum");
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, 4);
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, "legourmet.Aguaardiente");
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, 4);
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, "legourmet.SodaBottle");
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, 4);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "legourmet.Shaker");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 2);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "legourmet.MargaritaGlass");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 3);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "legourmet.Glass");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 5);

table.insert(ProceduralDistributions["list"]["GigamartHousewares"].items, "legourmet.MargaritaGlass");
table.insert(ProceduralDistributions["list"]["GigamartHousewares"].items, 1);
table.insert(ProceduralDistributions["list"]["GigamartHousewares"].items, "legourmet.Glass");
table.insert(ProceduralDistributions["list"]["GigamartHousewares"].items, 1);

table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, "legourmet.TripleSec");
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, 2);
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, "legourmet.WhiteTequila");
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, 2);
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, "legourmet.Ginebra");
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, 2);
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, "legourmet.DryVermouth");
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, 2);
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, "legourmet.WhiteRum");
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, 2);
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, "legourmet.Rum");
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, 2);
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, "legourmet.Aguaardiente");
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, 2);
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, "legourmet.SodaBottle");
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, 4);
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, "legourmet.MargaritaGlass");
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, 2);
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, "legourmet.Glass");
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, 2);
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, "legourmet.Shaker");
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, 4);
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, "legourmet.CocktailSpoon");
table.insert(ProceduralDistributions["list"]["BarCounterLiquor"].items, 4);
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, "legourmet.TripleSec");
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, 4);
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, "legourmet.WhiteTequila");
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, 4);
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, "legourmet.Ginebra");
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, 4);
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, "legourmet.DryVermouth");
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, 4);
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, "legourmet.WhiteRum");
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, 4);
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, "legourmet.Rum");
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, 4);
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, "legourmet.Aguaardiente");
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, 4);
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, "legourmet.SodaBottle");
table.insert(ProceduralDistributions["list"]["BarShelfLiquor"].items, 4);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "legourmet.Shaker");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 2);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "legourmet.MargaritaGlass");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 3);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "legourmet.Glass");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 5);

table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "legourmet.Shaker");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 1);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "legourmet.MargaritaGlass");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 0.5);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "legourmet.Glass");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 0.5);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "legourmet.MartiniGlass");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 0.5);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "legourmet.MargaritaGlass");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 0.5);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "legourmet.Glass");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 0.5);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "legourmet.MartiniGlass");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 0.5);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "legourmet.MargaritaGlass");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 0.5);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "legourmet.Glass");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 0.5);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "legourmet.MartiniGlass");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 0.5);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "legourmet.CocktailSpoon");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 1);
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "Base.CubeboxEmpty");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 0.2);

table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "legourmet.JarOlives");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 2);

table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, "legourmet.CocktailSpoon");
table.insert(ProceduralDistributions["list"]["BarCounterMisc"].items, 2);

table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "legourmet.Lime");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, 3);
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, "legourmet.GreenOlives");
table.insert(ProceduralDistributions["list"]["FridgeGeneric"].items, 1);

table.insert(ProceduralDistributions["list"]["FreezerGeneric"].items, "legourmet.Lime");
table.insert(ProceduralDistributions["list"]["FreezerGeneric"].items, 1);
table.insert(ProceduralDistributions["list"]["CrepeKitchenFridge"].items, "legourmet.Lime");
table.insert(ProceduralDistributions["list"]["CrepeKitchenFridge"].items, 1);

table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, "Base.SurvivalistMag1");
table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, 0.5);
table.insert(ProceduralDistributions["list"]["CampingStoreBooks"].items, "Base.SurvivalistMag1");
table.insert(ProceduralDistributions["list"]["CampingStoreBooks"].items, 2);
table.insert(ProceduralDistributions["list"]["GunStoreMagazineRack"].items, "Base.SurvivalistMag1");
table.insert(ProceduralDistributions["list"]["GunStoreMagazineRack"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateBooks"].items, "Base.SurvivalistMag1");
table.insert(ProceduralDistributions["list"]["CrateBooks"].items, 0.2);

table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, "Base.SurvivalistMag2");
table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, 0.5);
table.insert(ProceduralDistributions["list"]["CampingStoreBooks"].items, "Base.SurvivalistMag2");
table.insert(ProceduralDistributions["list"]["CampingStoreBooks"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateBooks"].items, "Base.SurvivalistMag2");
table.insert(ProceduralDistributions["list"]["CrateBooks"].items, 0.2);

table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, "Base.SurvivalistMag3");
table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, 0.5);
table.insert(ProceduralDistributions["list"]["CampingStoreBooks"].items, "Base.SurvivalistMag3");
table.insert(ProceduralDistributions["list"]["CampingStoreBooks"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateBooks"].items, "Base.SurvivalistMag3");
table.insert(ProceduralDistributions["list"]["CrateBooks"].items, 0.2);

table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, "Base.SurvivalistMag4");
table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, 0.5);
table.insert(ProceduralDistributions["list"]["CampingStoreBooks"].items, "Base.SurvivalistMag4");
table.insert(ProceduralDistributions["list"]["CampingStoreBooks"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateBooks"].items, "Base.SurvivalistMag4");
table.insert(ProceduralDistributions["list"]["CrateBooks"].items, 0.2);

table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, "Base.SurvivalistMag5");
table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, 0.5);
table.insert(ProceduralDistributions["list"]["CampingStoreBooks"].items, "Base.SurvivalistMag5");
table.insert(ProceduralDistributions["list"]["CampingStoreBooks"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateBooks"].items, "Base.SurvivalistMag5");
table.insert(ProceduralDistributions["list"]["CrateBooks"].items, 0.2);

table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, "Base.SurvivalistMag6");
table.insert(ProceduralDistributions["list"]["MagazineRackMixed"].items, 0.5);
table.insert(ProceduralDistributions["list"]["CampingStoreBooks"].items, "Base.SurvivalistMag6");
table.insert(ProceduralDistributions["list"]["CampingStoreBooks"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateBooks"].items, "Base.SurvivalistMag6");
table.insert(ProceduralDistributions["list"]["CrateBooks"].items, 0.2);

-- PROCEDURAL Build 41

table.insert(ProceduralDistributions["list"]["Locker"].items, "Base.RubberBandsBox");
table.insert(ProceduralDistributions["list"]["Locker"].items, 3);

table.insert(ProceduralDistributions["list"]["Bakery"].items, "Base.MoldesMagBox");
table.insert(ProceduralDistributions["list"]["Bakery"].items, 2);
table.insert(ProceduralDistributions["list"]["Bakery"].items, "Base.MilkPowder");
table.insert(ProceduralDistributions["list"]["Bakery"].items, 2);
table.insert(ProceduralDistributions["list"]["Bakery"].items, "Base.WaffleMachine");
table.insert(ProceduralDistributions["list"]["Bakery"].items, 2);
table.insert(ProceduralDistributions["list"]["Bakery"].items, "Base.KitchenBrush");
table.insert(ProceduralDistributions["list"]["Bakery"].items, 2);

table.insert(ProceduralDistributions["list"]["Bakery"].items, "Base.LacticFerment");
table.insert(ProceduralDistributions["list"]["Bakery"].items, 2);
table.insert(ProceduralDistributions["list"]["Bakery"].items, "Base.CitricAcid");
table.insert(ProceduralDistributions["list"]["Bakery"].items, 2);
table.insert(ProceduralDistributions["list"]["Bakery"].items, "Base.Gelatine");
table.insert(ProceduralDistributions["list"]["Bakery"].items, 2);
table.insert(ProceduralDistributions["list"]["Bakery"].items, "Base.EdibleDyeYellow");
table.insert(ProceduralDistributions["list"]["Bakery"].items, 2);
table.insert(ProceduralDistributions["list"]["Bakery"].items, "Base.EdibleDyeRed");
table.insert(ProceduralDistributions["list"]["Bakery"].items, 2);
table.insert(ProceduralDistributions["list"]["Bakery"].items, "Base.EdibleDyeOrange");
table.insert(ProceduralDistributions["list"]["Bakery"].items, 2);
table.insert(ProceduralDistributions["list"]["Bakery"].items, "Base.MolinoCoffee");
table.insert(ProceduralDistributions["list"]["Bakery"].items, 0.02);

table.insert(ProceduralDistributions["list"]["KitchenBook"].items, "legourmetfarming.LgFarmMag1");
table.insert(ProceduralDistributions["list"]["KitchenBook"].items, 0.02);
table.insert(ProceduralDistributions["list"]["KitchenBook"].items, "Base.ManualLG");
table.insert(ProceduralDistributions["list"]["KitchenBook"].items, 0.1);
table.insert(ProceduralDistributions["list"]["KitchenBook"].items, "Base.LGCookingMag");
table.insert(ProceduralDistributions["list"]["KitchenBook"].items, 0.1);
table.insert(ProceduralDistributions["list"]["KitchenBook"].items, "Base.LGCookingMag2");
table.insert(ProceduralDistributions["list"]["KitchenBook"].items, 0.1);
table.insert(ProceduralDistributions["list"]["KitchenBook"].items, "Base.LGCookingMag3");
table.insert(ProceduralDistributions["list"]["KitchenBook"].items, 0.1);
table.insert(ProceduralDistributions["list"]["KitchenBook"].items, "Base.LGCookingMag5");
table.insert(ProceduralDistributions["list"]["KitchenBook"].items, 0.1);
table.insert(ProceduralDistributions["list"]["KitchenBook"].items, "Base.LGCookingMag6");
table.insert(ProceduralDistributions["list"]["KitchenBook"].items, 0.1);
table.insert(ProceduralDistributions["list"]["KitchenBook"].items, "Base.LGCookingMag7");
table.insert(ProceduralDistributions["list"]["KitchenBook"].items, 0.1);
table.insert(ProceduralDistributions["list"]["KitchenBook"].items, "Base.LGCookingMag8");
table.insert(ProceduralDistributions["list"]["KitchenBook"].items, 0.1);
table.insert(ProceduralDistributions["list"]["KitchenBook"].items, "Base.LGCookingMag9");
table.insert(ProceduralDistributions["list"]["KitchenBook"].items, 0.05);
table.insert(ProceduralDistributions["list"]["KitchenBook"].items, "legourmet.EnergyMagazine");
table.insert(ProceduralDistributions["list"]["KitchenBook"].items, 0.1);
table.insert(ProceduralDistributions["list"]["KitchenBook"].items, "legourmet.DrinksMag2");
table.insert(ProceduralDistributions["list"]["KitchenBook"].items, 0.1);

table.insert(ProceduralDistributions["list"]["LibraryBooks"].items, "Base.LGCookingMag");
table.insert(ProceduralDistributions["list"]["LibraryBooks"].items, 1);
table.insert(ProceduralDistributions["list"]["LibraryBooks"].items, "Base.LGCookingMag2");
table.insert(ProceduralDistributions["list"]["LibraryBooks"].items, 1);
table.insert(ProceduralDistributions["list"]["LibraryBooks"].items, "Base.LGCookingMag3");
table.insert(ProceduralDistributions["list"]["LibraryBooks"].items, 1);
table.insert(ProceduralDistributions["list"]["LibraryBooks"].items, "Base.LGCookingMag4");
table.insert(ProceduralDistributions["list"]["LibraryBooks"].items, 1);
table.insert(ProceduralDistributions["list"]["LibraryBooks"].items, "Base.LGCookingMag5");
table.insert(ProceduralDistributions["list"]["LibraryBooks"].items, 1);
table.insert(ProceduralDistributions["list"]["LibraryBooks"].items, "Base.LGCookingMag6");
table.insert(ProceduralDistributions["list"]["LibraryBooks"].items, 1);
table.insert(ProceduralDistributions["list"]["LibraryBooks"].items, "Base.LGCookingMag7");
table.insert(ProceduralDistributions["list"]["LibraryBooks"].items, 1);
table.insert(ProceduralDistributions["list"]["LibraryBooks"].items, "Base.LGCookingMag8");
table.insert(ProceduralDistributions["list"]["LibraryBooks"].items, 1);
table.insert(ProceduralDistributions["list"]["LibraryBooks"].items, "Base.LGCookingMag9");
table.insert(ProceduralDistributions["list"]["LibraryBooks"].items, 0.05);

table.insert(ProceduralDistributions["list"]["ShelfGeneric"].items, "legourmetfarming.LgFarmMag1");
table.insert(ProceduralDistributions["list"]["ShelfGeneric"].items, 0.1);
table.insert(ProceduralDistributions["list"]["ShelfGeneric"].items, "Base.ManualLG");
table.insert(ProceduralDistributions["list"]["ShelfGeneric"].items, 0.1);
table.insert(ProceduralDistributions["list"]["ShelfGeneric"].items, "Base.LGCookingMag");
table.insert(ProceduralDistributions["list"]["ShelfGeneric"].items, 0.1);
table.insert(ProceduralDistributions["list"]["ShelfGeneric"].items, "Base.LGCookingMag2");
table.insert(ProceduralDistributions["list"]["ShelfGeneric"].items, 0.1);
table.insert(ProceduralDistributions["list"]["ShelfGeneric"].items, "Base.LGCookingMag3");
table.insert(ProceduralDistributions["list"]["ShelfGeneric"].items, 0.1);
table.insert(ProceduralDistributions["list"]["ShelfGeneric"].items, "Base.LGCookingMag4");
table.insert(ProceduralDistributions["list"]["ShelfGeneric"].items, 0.1);
table.insert(ProceduralDistributions["list"]["ShelfGeneric"].items, "Base.LGCookingMag5");
table.insert(ProceduralDistributions["list"]["ShelfGeneric"].items, 0.1);
table.insert(ProceduralDistributions["list"]["ShelfGeneric"].items, "Base.LGCookingMag6");
table.insert(ProceduralDistributions["list"]["ShelfGeneric"].items, 0.1);
table.insert(ProceduralDistributions["list"]["ShelfGeneric"].items, "Base.LGCookingMag7");
table.insert(ProceduralDistributions["list"]["ShelfGeneric"].items, 0.1);
table.insert(ProceduralDistributions["list"]["ShelfGeneric"].items, "Base.LGCookingMag8");
table.insert(ProceduralDistributions["list"]["ShelfGeneric"].items, 0.1);
table.insert(ProceduralDistributions["list"]["ShelfGeneric"].items, "legourmet.EnergyMagazine");
table.insert(ProceduralDistributions["list"]["ShelfGeneric"].items, 0.1);
table.insert(ProceduralDistributions["list"]["ShelfGeneric"].items, "legourmet.DrinksMag2");
table.insert(ProceduralDistributions["list"]["ShelfGeneric"].items, 0.1);
table.insert(ProceduralDistributions["list"]["ShelfGeneric"].items, "legourmetfarming.SeedBook");
table.insert(ProceduralDistributions["list"]["ShelfGeneric"].items, 0.5);
table.insert(ProceduralDistributions["list"]["ShelfGeneric"].items, "Base.LGCookingMag9");
table.insert(ProceduralDistributions["list"]["ShelfGeneric"].items, 0.05);


---------------------------------------------------------------------------------------------------------
table.insert(ProceduralDistributions["list"]["ToolStoreFarming"].items, "legourmetfarming.BSodium");
table.insert(ProceduralDistributions["list"]["ToolStoreFarming"].items, 1);
table.insert(ProceduralDistributions["list"]["ToolStoreFarming"].items, "legourmetfarming.BeanBagSeed");
table.insert(ProceduralDistributions["list"]["ToolStoreFarming"].items, 0.5);
table.insert(ProceduralDistributions["list"]["ToolStoreFarming"].items, "legourmetfarming.TobaccoBagSeed");
table.insert(ProceduralDistributions["list"]["ToolStoreFarming"].items, 0.5);
table.insert(ProceduralDistributions["list"]["ToolStoreFarming"].items, "legourmetfarming.BellPepperBagSeed");
table.insert(ProceduralDistributions["list"]["ToolStoreFarming"].items, 0.5);
table.insert(ProceduralDistributions["list"]["ToolStoreFarming"].items, "legourmetfarming.EggplantBagSeed");
table.insert(ProceduralDistributions["list"]["ToolStoreFarming"].items, 0.5);
table.insert(ProceduralDistributions["list"]["ToolStoreFarming"].items, "legourmetfarming.GrapeBagSeed");
table.insert(ProceduralDistributions["list"]["ToolStoreFarming"].items, 0.5);
table.insert(ProceduralDistributions["list"]["ToolStoreFarming"].items, "legourmetfarming.LeekBagSeed");
table.insert(ProceduralDistributions["list"]["ToolStoreFarming"].items, 0.5);
table.insert(ProceduralDistributions["list"]["ToolStoreFarming"].items, "legourmetfarming.LettuceBagSeed");
table.insert(ProceduralDistributions["list"]["ToolStoreFarming"].items, 0.5);
table.insert(ProceduralDistributions["list"]["ToolStoreFarming"].items, "legourmetfarming.OnionBagSeed");
table.insert(ProceduralDistributions["list"]["ToolStoreFarming"].items, 0.5);
table.insert(ProceduralDistributions["list"]["ToolStoreFarming"].items, "legourmetfarming.PeaBagSeed");
table.insert(ProceduralDistributions["list"]["ToolStoreFarming"].items, 0.5);
table.insert(ProceduralDistributions["list"]["ToolStoreFarming"].items, "legourmetfarming.PeanutBagSeed");
table.insert(ProceduralDistributions["list"]["ToolStoreFarming"].items, 0.5);
table.insert(ProceduralDistributions["list"]["ToolStoreFarming"].items, "legourmetfarming.PumpkinBagSeed");
table.insert(ProceduralDistributions["list"]["ToolStoreFarming"].items, 0.5);
table.insert(ProceduralDistributions["list"]["ToolStoreFarming"].items, "legourmetfarming.WatermelonBagSeed");
table.insert(ProceduralDistributions["list"]["ToolStoreFarming"].items, 0.5);
table.insert(ProceduralDistributions["list"]["ToolStoreFarming"].items, "legourmetfarming.ZucchiniBagSeed");
table.insert(ProceduralDistributions["list"]["ToolStoreFarming"].items, 0.5);
table.insert(ProceduralDistributions["list"]["ToolStoreFarming"].items, "legourmetfarming.CornBagSeed");
table.insert(ProceduralDistributions["list"]["ToolStoreFarming"].items, 0.5);
table.insert(ProceduralDistributions["list"]["ToolStoreFarming"].items, "legourmetfarming.RiceBagSeed");
table.insert(ProceduralDistributions["list"]["ToolStoreFarming"].items, 0.5);
table.insert(ProceduralDistributions["list"]["ToolStoreFarming"].items, "legourmetfarming.ChiliBagSeed");
table.insert(ProceduralDistributions["list"]["ToolStoreFarming"].items, 0.5);
table.insert(ProceduralDistributions["list"]["ToolStoreFarming"].items, "legourmetfarming.HabaneroBagSeed");
table.insert(ProceduralDistributions["list"]["ToolStoreFarming"].items, 0.5);
table.insert(ProceduralDistributions["list"]["ToolStoreFarming"].items, "legourmetfarming.JalapenoBagSeed");
table.insert(ProceduralDistributions["list"]["ToolStoreFarming"].items, 0.5);

table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.BSodium");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.BeanBagSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.TobaccoBagSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.BellPepperBagSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.EggplantBagSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.GrapeBagSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.LeekBagSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.LettuceBagSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.OnionBagSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.PeaBagSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.PeanutBagSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.PumpkinBagSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.WatermelonBagSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.ZucchiniBagSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.CornBagSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.RiceBagSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.ChiliBagSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.HabaneroBagSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, "legourmetfarming.JalapenoBagSeed");
table.insert(ProceduralDistributions["list"]["CrateFarming"].items, 1);

table.insert(ProceduralDistributions["list"]["GigamartFarming"].items, "legourmetfarming.BSodium");
table.insert(ProceduralDistributions["list"]["GigamartFarming"].items, 1);
table.insert(ProceduralDistributions["list"]["GigamartFarming"].items, "legourmetfarming.BeanBagSeed");
table.insert(ProceduralDistributions["list"]["GigamartFarming"].items, 0.5);
table.insert(ProceduralDistributions["list"]["GigamartFarming"].items, "legourmetfarming.TobaccoBagSeed");
table.insert(ProceduralDistributions["list"]["GigamartFarming"].items, 0.5);
table.insert(ProceduralDistributions["list"]["GigamartFarming"].items, "legourmetfarming.BellPepperBagSeed");
table.insert(ProceduralDistributions["list"]["GigamartFarming"].items, 0.5);
table.insert(ProceduralDistributions["list"]["GigamartFarming"].items, "legourmetfarming.EggplantBagSeed");
table.insert(ProceduralDistributions["list"]["GigamartFarming"].items, 0.5);
table.insert(ProceduralDistributions["list"]["GigamartFarming"].items, "legourmetfarming.GrapeBagSeed");
table.insert(ProceduralDistributions["list"]["GigamartFarming"].items, 0.5);
table.insert(ProceduralDistributions["list"]["GigamartFarming"].items, "legourmetfarming.LeekBagSeed");
table.insert(ProceduralDistributions["list"]["GigamartFarming"].items, 0.5);
table.insert(ProceduralDistributions["list"]["GigamartFarming"].items, "legourmetfarming.LettuceBagSeed");
table.insert(ProceduralDistributions["list"]["GigamartFarming"].items, 0.5);
table.insert(ProceduralDistributions["list"]["GigamartFarming"].items, "legourmetfarming.OnionBagSeed");
table.insert(ProceduralDistributions["list"]["GigamartFarming"].items, 0.5);
table.insert(ProceduralDistributions["list"]["GigamartFarming"].items, "legourmetfarming.PeaBagSeed");
table.insert(ProceduralDistributions["list"]["GigamartFarming"].items, 0.5);
table.insert(ProceduralDistributions["list"]["GigamartFarming"].items, "legourmetfarming.PeanutBagSeed");
table.insert(ProceduralDistributions["list"]["GigamartFarming"].items, 0.5);
table.insert(ProceduralDistributions["list"]["GigamartFarming"].items, "legourmetfarming.PumpkinBagSeed");
table.insert(ProceduralDistributions["list"]["GigamartFarming"].items, 0.5);
table.insert(ProceduralDistributions["list"]["GigamartFarming"].items, "legourmetfarming.WatermelonBagSeed");
table.insert(ProceduralDistributions["list"]["GigamartFarming"].items, 0.5);
table.insert(ProceduralDistributions["list"]["GigamartFarming"].items, "legourmetfarming.ZucchiniBagSeed");
table.insert(ProceduralDistributions["list"]["GigamartFarming"].items, 0.5);
table.insert(ProceduralDistributions["list"]["GigamartFarming"].items, "legourmetfarming.CornBagSeed");
table.insert(ProceduralDistributions["list"]["GigamartFarming"].items, 0.5);
table.insert(ProceduralDistributions["list"]["GigamartFarming"].items, "legourmetfarming.RiceBagSeed");
table.insert(ProceduralDistributions["list"]["GigamartFarming"].items, 0.5);
table.insert(ProceduralDistributions["list"]["GigamartFarming"].items, "legourmetfarming.ChiliBagSeed");
table.insert(ProceduralDistributions["list"]["GigamartFarming"].items, 0.5);
table.insert(ProceduralDistributions["list"]["GigamartFarming"].items, "legourmetfarming.HabaneroBagSeed");
table.insert(ProceduralDistributions["list"]["GigamartFarming"].items, 0.5);
table.insert(ProceduralDistributions["list"]["GigamartFarming"].items, "legourmetfarming.JalapenoBagSeed");
table.insert(ProceduralDistributions["list"]["GigamartFarming"].items, 0.5);
table.insert(ProceduralDistributions["list"]["GigamartFarming"].items, "legourmetfarming.SeedBook");
table.insert(ProceduralDistributions["list"]["GigamartFarming"].items, 0.5);

table.insert(ProceduralDistributions["list"]["KitchenDishes"].items, "Base.WaffleMachine");
table.insert(ProceduralDistributions["list"]["KitchenDishes"].items, 0.0001);
table.insert(ProceduralDistributions["list"]["KitchenDishes"].items, "Base.ManualMeatMincer");
table.insert(ProceduralDistributions["list"]["KitchenDishes"].items, 0.001);
table.insert(ProceduralDistributions["list"]["KitchenDishes"].items, "Base.KitchenBrush");
table.insert(ProceduralDistributions["list"]["KitchenDishes"].items, 0.001);
table.insert(ProceduralDistributions["list"]["KitchenDishes"].items, "Base.CheeseMoldEmpty");
table.insert(ProceduralDistributions["list"]["KitchenDishes"].items, 0.05);
table.insert(ProceduralDistributions["list"]["KitchenDishes"].items, "Base.CheeseMoldEmpty2");
table.insert(ProceduralDistributions["list"]["KitchenDishes"].items, 0.1);
table.insert(ProceduralDistributions["list"]["KitchenDishes"].items, "Base.CheeseMoldEmpty3");
table.insert(ProceduralDistributions["list"]["KitchenDishes"].items, 0.05);
table.insert(ProceduralDistributions["list"]["KitchenDishes"].items, "Base.MolinoCoffee");
table.insert(ProceduralDistributions["list"]["KitchenDishes"].items, 0.001);
table.insert(ProceduralDistributions["list"]["KitchenDishes"].items, "legourmet.MateEmpty");
table.insert(ProceduralDistributions["list"]["KitchenDishes"].items, 0.0001);
table.insert(ProceduralDistributions["list"]["KitchenDishes"].items, "legourmet.VacuumFlaskEmpty");
table.insert(ProceduralDistributions["list"]["KitchenDishes"].items, 0.0001);

table.insert(ProceduralDistributions["list"]["KitchenDishes"].junk, "Base.WaffleMachine");
table.insert(ProceduralDistributions["list"]["KitchenDishes"].junk, 0.0001);
table.insert(ProceduralDistributions["list"]["KitchenDishes"].junk, "Base.ManualMeatMincer");
table.insert(ProceduralDistributions["list"]["KitchenDishes"].junk, 0.001);
table.insert(ProceduralDistributions["list"]["KitchenDishes"].junk, "Base.KitchenBrush");
table.insert(ProceduralDistributions["list"]["KitchenDishes"].junk, 0.001);
table.insert(ProceduralDistributions["list"]["KitchenDishes"].junk, "Base.CheeseMoldEmpty");
table.insert(ProceduralDistributions["list"]["KitchenDishes"].junk, 0.05);
table.insert(ProceduralDistributions["list"]["KitchenDishes"].junk, "Base.CheeseMoldEmpty2");
table.insert(ProceduralDistributions["list"]["KitchenDishes"].junk, 0.1);
table.insert(ProceduralDistributions["list"]["KitchenDishes"].junk, "Base.CheeseMoldEmpty3");
table.insert(ProceduralDistributions["list"]["KitchenDishes"].junk, 0.05);
table.insert(ProceduralDistributions["list"]["KitchenDishes"].junk, "Base.MolinoCoffee");
table.insert(ProceduralDistributions["list"]["KitchenDishes"].junk, 0.001);

table.insert(ProceduralDistributions["list"]["KitchenRandom"].items, "Base.KitchenBrush");
table.insert(ProceduralDistributions["list"]["KitchenRandom"].items, 1);
table.insert(ProceduralDistributions["list"]["KitchenRandom"].junk, "Base.KitchenBrush");
table.insert(ProceduralDistributions["list"]["KitchenRandom"].junk, 1);


table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, "Base.MoldesMagBox");
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, 0.1);
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, "Base.Oil");
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, 1);
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, "Base.Oil");
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, 1);
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, "Base.CornOil");
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, 1);
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, "Base.CornOil");
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, 1);
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, "Base.MilkPowder");
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, 1);
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, "Base.MilkPowder");
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, 1);
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, "Base.LacticFerment");
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, 0.1);
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, "Base.CitricAcid");
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, 0.05);
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, "Base.Gelatine");
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, 0.5);
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, "legourmet.Wine3");
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, 2);

table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, "legourmet.VodkaFull");
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, 2);

table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, "legourmet.Beer1");
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, 0.0001);
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, "legourmet.Beer2");
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, 0.0001);
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, "legourmet.Beer3");
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, 0.0001);


table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "legourmet.CannedSoupClassic");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, 1.5);
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, "legourmet.JarOlives");
table.insert(ProceduralDistributions["list"]["KitchenCannedFood"].items, 0.0001);

------------------------ Candy ---------------------- Houses Kitchen Counters
table.insert(ProceduralDistributions["list"]["KitchenBreakfast"].items, "legourmet.GummyBears");
table.insert(ProceduralDistributions["list"]["KitchenBreakfast"].items, 0.6);
table.insert(ProceduralDistributions["list"]["KitchenBreakfast"].items, "legourmet.CornCandy");
table.insert(ProceduralDistributions["list"]["KitchenBreakfast"].items, 0.6);
table.insert(ProceduralDistributions["list"]["KitchenBreakfast"].items, "legourmet.GummyWorms");
table.insert(ProceduralDistributions["list"]["KitchenBreakfast"].items, 0.6);
table.insert(ProceduralDistributions["list"]["KitchenBreakfast"].items, "legourmet.CandySkil");
table.insert(ProceduralDistributions["list"]["KitchenBreakfast"].items, 0.6);
table.insert(ProceduralDistributions["list"]["KitchenBreakfast"].items, "legourmet.MixCandy");
table.insert(ProceduralDistributions["list"]["KitchenBreakfast"].items, 0.6);
table.insert(ProceduralDistributions["list"]["KitchenBreakfast"].items, "legourmet.JellyBeans");
table.insert(ProceduralDistributions["list"]["KitchenBreakfast"].items, 0.6);
table.insert(ProceduralDistributions["list"]["KitchenBreakfast"].items, "legourmet.MarshmallowPackage");
table.insert(ProceduralDistributions["list"]["KitchenBreakfast"].items, 0.1);

-- Kitchens (Rarer)
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, "legourmet.Crisps5");
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, 0.5);
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, "legourmet.Crisps6");
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, 0.5);
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, "legourmet.Crisps7");
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, 0.5);
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, "legourmet.Crisps8");
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, 0.5);
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, "legourmet.Crisps9");
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, 0.5);

table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, "legourmet.TripleSec");
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, 0.0001);
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, "legourmet.WhiteTequila");
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, 0.0001);
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, "legourmet.Ginebra");
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, 0.0001);
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, "legourmet.DryVermouth");
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, 0.0001);
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, "legourmet.WhiteRum");
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, 0.0001);
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, "legourmet.Rum");
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, 0.0001);
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, "legourmet.Aguaardiente");
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, 0.0001);
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, "legourmet.SodaBottle");
table.insert(ProceduralDistributions["list"]["KitchenBottles"].items, 0.01);

table.insert(ProceduralDistributions["list"]["KitchenDishes"].items, "legourmet.Shaker");
table.insert(ProceduralDistributions["list"]["KitchenDishes"].items, 0.001);
table.insert(ProceduralDistributions["list"]["KitchenDishes"].items, "Base.CubeboxEmpty");
table.insert(ProceduralDistributions["list"]["KitchenDishes"].items, 0.05);

table.insert(ProceduralDistributions["list"]["GigamartCandy"].items, "legourmet.GummyBears");
table.insert(ProceduralDistributions["list"]["GigamartCandy"].items, 3);
table.insert(ProceduralDistributions["list"]["GigamartCandy"].items, "legourmet.CornCandy");
table.insert(ProceduralDistributions["list"]["GigamartCandy"].items, 3);
table.insert(ProceduralDistributions["list"]["GigamartCandy"].items, "legourmet.GummyWorms");
table.insert(ProceduralDistributions["list"]["GigamartCandy"].items, 3);
table.insert(ProceduralDistributions["list"]["GigamartCandy"].items, "legourmet.CandySkil");
table.insert(ProceduralDistributions["list"]["GigamartCandy"].items, 3);
table.insert(ProceduralDistributions["list"]["GigamartCandy"].items, "legourmet.MixCandy");
table.insert(ProceduralDistributions["list"]["GigamartCandy"].items, 3);
table.insert(ProceduralDistributions["list"]["GigamartCandy"].items, "legourmet.JellyBeans");
table.insert(ProceduralDistributions["list"]["GigamartCandy"].items, 3);
table.insert(ProceduralDistributions["list"]["GigamartCandy"].items, "legourmet.MarshmallowPackage");
table.insert(ProceduralDistributions["list"]["GigamartCandy"].items, 0.5);

table.insert(ProceduralDistributions["list"]["GigamartToys"].items, "Base.RubberBandsBox");
table.insert(ProceduralDistributions["list"]["GigamartToys"].items, 3);
table.insert(ProceduralDistributions["list"]["GigamartToys"].items, "Base.RubberBandsBox");
table.insert(ProceduralDistributions["list"]["GigamartToys"].items, 3);

table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, "Base.MilkPowder");
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, 15);
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, "Base.MilkPowder");
table.insert(ProceduralDistributions["list"]["KitchenDryFood"].items, 15);

table.insert(ProceduralDistributions["list"]["CrateTools"].items, "AdvancedFishing.MetalDetector");
table.insert(ProceduralDistributions["list"]["CrateTools"].items, 1);
table.insert(ProceduralDistributions["list"]["GigamartTools"].items, "AdvancedFishing.MetalDetector");
table.insert(ProceduralDistributions["list"]["GigamartTools"].items, 1);

table.insert(ProceduralDistributions["list"]["CrateTools"].items, "AdvancedFishing.Fishinglurebox");
table.insert(ProceduralDistributions["list"]["CrateTools"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateTools"].items, "AdvancedFishing.Boya1");
table.insert(ProceduralDistributions["list"]["CrateTools"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateTools"].items, "AdvancedFishing.Boya2");
table.insert(ProceduralDistributions["list"]["CrateTools"].items, 0.2);
table.insert(ProceduralDistributions["list"]["CrateTools"].items, "AdvancedFishing.Boya3");
table.insert(ProceduralDistributions["list"]["CrateTools"].items, 0.2);
table.insert(ProceduralDistributions["list"]["CrateTools"].items, "AdvancedFishing.BoyaPack1");
table.insert(ProceduralDistributions["list"]["CrateTools"].items, 0.2);
table.insert(ProceduralDistributions["list"]["CrateTools"].items, "AdvancedFishing.BoyaPack2");
table.insert(ProceduralDistributions["list"]["CrateTools"].items, 0.2);
table.insert(ProceduralDistributions["list"]["CrateTools"].items, "AdvancedFishing.BoyaPack3");
table.insert(ProceduralDistributions["list"]["CrateTools"].items, 0.2);
table.insert(ProceduralDistributions["list"]["CrateTools"].items, "AdvancedFishing.SmallHook");
table.insert(ProceduralDistributions["list"]["CrateTools"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateTools"].items, "AdvancedFishing.FishingEncyclopedia5");
table.insert(ProceduralDistributions["list"]["CrateTools"].items, 0.5);
table.insert(ProceduralDistributions["list"]["CrateTools"].items, "AdvancedFishing.FishingLine2");
table.insert(ProceduralDistributions["list"]["CrateTools"].items, 0.2);
table.insert(ProceduralDistributions["list"]["CrateTools"].items, "AdvancedFishing.FishingBox");
table.insert(ProceduralDistributions["list"]["CrateTools"].items, 0.1);
table.insert(ProceduralDistributions["list"]["CrateTools"].items, "AdvancedFishing.FishingBox2");
table.insert(ProceduralDistributions["list"]["CrateTools"].items, 0.1);
table.insert(ProceduralDistributions["list"]["CrateTools"].items, "AdvancedFishing.FishingBox3");
table.insert(ProceduralDistributions["list"]["CrateTools"].items, 0.1);
table.insert(ProceduralDistributions["list"]["CrateTools"].items, "AdvancedFishing.LeadFishingbox4");
table.insert(ProceduralDistributions["list"]["CrateTools"].items, 0.1);
table.insert(ProceduralDistributions["list"]["CrateTools"].items, "AdvancedFishing.AcidC");
table.insert(ProceduralDistributions["list"]["CrateTools"].items, 0.1);

table.insert(ProceduralDistributions["list"]["CrateFishing"].items, "AdvancedFishing.Fishinglurebox");
table.insert(ProceduralDistributions["list"]["CrateFishing"].items, 5);
table.insert(ProceduralDistributions["list"]["CrateFishing"].items, "AdvancedFishing.Boya1");
table.insert(ProceduralDistributions["list"]["CrateFishing"].items, 5);
table.insert(ProceduralDistributions["list"]["CrateFishing"].items, "AdvancedFishing.Boya2");
table.insert(ProceduralDistributions["list"]["CrateFishing"].items, 5);
table.insert(ProceduralDistributions["list"]["CrateFishing"].items, "AdvancedFishing.Boya3");
table.insert(ProceduralDistributions["list"]["CrateFishing"].items, 5);
table.insert(ProceduralDistributions["list"]["CrateFishing"].items, "AdvancedFishing.BoyaPack1");
table.insert(ProceduralDistributions["list"]["CrateFishing"].items, 5);
table.insert(ProceduralDistributions["list"]["CrateFishing"].items, "AdvancedFishing.BoyaPack2");
table.insert(ProceduralDistributions["list"]["CrateFishing"].items, 5);
table.insert(ProceduralDistributions["list"]["CrateFishing"].items, "AdvancedFishing.BoyaPack3");
table.insert(ProceduralDistributions["list"]["CrateFishing"].items, 5);
table.insert(ProceduralDistributions["list"]["CrateFishing"].items, "AdvancedFishing.SmallHook");
table.insert(ProceduralDistributions["list"]["CrateFishing"].items, 5);
table.insert(ProceduralDistributions["list"]["CrateFishing"].items, "AdvancedFishing.FishingEncyclopedia5");
table.insert(ProceduralDistributions["list"]["CrateFishing"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateFishing"].items, "AdvancedFishing.FishingLine2");
table.insert(ProceduralDistributions["list"]["CrateFishing"].items, 5);
table.insert(ProceduralDistributions["list"]["CrateFishing"].items, "AdvancedFishing.FishingBox");
table.insert(ProceduralDistributions["list"]["CrateFishing"].items, 5);
table.insert(ProceduralDistributions["list"]["CrateFishing"].items, "AdvancedFishing.FishingBox2");
table.insert(ProceduralDistributions["list"]["CrateFishing"].items, 5);
table.insert(ProceduralDistributions["list"]["CrateFishing"].items, "AdvancedFishing.FishingBox3");
table.insert(ProceduralDistributions["list"]["CrateFishing"].items, 5);
table.insert(ProceduralDistributions["list"]["CrateFishing"].items, "AdvancedFishing.LeadFishingbox4");
table.insert(ProceduralDistributions["list"]["CrateFishing"].items, 5);
table.insert(ProceduralDistributions["list"]["CrateFishing"].items, "AdvancedFishing.AcidC");
table.insert(ProceduralDistributions["list"]["CrateFishing"].items, 5);
table.insert(ProceduralDistributions["list"]["CrateFishing"].items, "AdvancedFishing.Leader");
table.insert(ProceduralDistributions["list"]["CrateFishing"].items, 8);
table.insert(ProceduralDistributions["list"]["CrateFishing"].items, "AdvancedFishing.LeaderPacket");
table.insert(ProceduralDistributions["list"]["CrateFishing"].items, 2);
table.insert(ProceduralDistributions["list"]["CrateFishing"].items, "AdvancedFishing.SportFishingBook");
table.insert(ProceduralDistributions["list"]["CrateFishing"].items, 5);

table.insert(ProceduralDistributions["list"]["StoreShelfMedical"].items, "Base.MedicalHose");
table.insert(ProceduralDistributions["list"]["StoreShelfMedical"].items, 1);
table.insert(ProceduralDistributions["list"]["StoreShelfMedical"].items, "legourmetfarming.BSodium");
table.insert(ProceduralDistributions["list"]["StoreShelfMedical"].items, 1);

table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, "Base.CitricAcid");
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, 1);
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, "Base.CheeseMoldEmpty");
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, 1);
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, "Base.CheeseMoldEmpty2");
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, 2);
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, "Base.CheeseMoldEmpty3");
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, 1);
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, "Base.LacticFerment");
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, 2);
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, "Base.Gelatine");
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, 2);
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, "Base.EdibleDyeYellow");
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, 2);
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, "Base.EdibleDyeRed");
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, 2);
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, "Base.EdibleDyeOrange");
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, 2);

table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, "legourmet.Crisps5");
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, 3);
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, "legourmet.Crisps6");
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, 3);
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, "legourmet.Crisps7");
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, 3);
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, "legourmet.Crisps8");
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, 3);
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, "legourmet.Crisps9");
table.insert(ProceduralDistributions["list"]["StoreShelfSnacks"].items, 3);

table.insert(ProceduralDistributions["list"]["GigamartCrisps"].items, "legourmet.Crisps5");
table.insert(ProceduralDistributions["list"]["GigamartCrisps"].items, 3);
table.insert(ProceduralDistributions["list"]["GigamartCrisps"].items, "legourmet.Crisps6");
table.insert(ProceduralDistributions["list"]["GigamartCrisps"].items, 3);
table.insert(ProceduralDistributions["list"]["GigamartCrisps"].items, "legourmet.Crisps7");
table.insert(ProceduralDistributions["list"]["GigamartCrisps"].items, 3);
table.insert(ProceduralDistributions["list"]["GigamartCrisps"].items, "legourmet.Crisps8");
table.insert(ProceduralDistributions["list"]["GigamartCrisps"].items, 3);
table.insert(ProceduralDistributions["list"]["GigamartCrisps"].items, "legourmet.Crisps9");
table.insert(ProceduralDistributions["list"]["GigamartCrisps"].items, 3);
--Juices
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "legourmet.JuiceBox2");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, 2);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "legourmet.JuiceBox2");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, 2);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "legourmet.JuiceBox3");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, 2);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "legourmet.JuiceBox3");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, 2);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "legourmet.JuiceBox4");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, 2);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "legourmet.JuiceBox4");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, 2);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "legourmet.JuiceBox5");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, 2);
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, "legourmet.JuiceBox5");
table.insert(ProceduralDistributions["list"]["FridgeOther"].items, 2);

table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, "legourmet.Soda01");
table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, 0.5);
table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, "legourmet.Soda02");
table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, 0.5);
table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, "legourmet.Soda03");
table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, 0.5);
table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, "legourmet.Soda04");
table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, 0.5);
table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, "legourmet.Soda05");
table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, 0.5);
table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, "legourmet.Soda06");
table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, 0.5);
table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, "legourmet.Soda07");
table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, 0.5);
table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, "legourmet.Soda08");
table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, 0.5);
table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, "legourmet.Soda09");
table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, 0.5);
table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, "legourmet.Soda10");
table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, 0.5);
table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, "legourmet.Soda11");
table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, 0.5);
table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, "legourmet.Soda12");
table.insert(ProceduralDistributions["list"]["FridgeBottles"].items, 0.5);


table.insert(SuburbsDistributions["all"]["sidetable"].items, "Base.LGRBookHunting1");
table.insert(SuburbsDistributions["all"]["sidetable"].items, 1);
table.insert(SuburbsDistributions["all"]["sidetable"].items, "Base.LGRBookHunting2");
table.insert(SuburbsDistributions["all"]["sidetable"].items, 0.5);
table.insert(SuburbsDistributions["all"]["sidetable"].items, "Base.LGRBookHunting3");
table.insert(SuburbsDistributions["all"]["sidetable"].items, 0.25);
table.insert(SuburbsDistributions["all"]["sidetable"].items, "Base.LGRBookHunting4");
table.insert(SuburbsDistributions["all"]["sidetable"].items, 0.15);
table.insert(SuburbsDistributions["all"]["sidetable"].items, "Base.LGRBookHunting5");
table.insert(SuburbsDistributions["all"]["sidetable"].items, 0.1);

table.insert(ProceduralDistributions["list"]["ShelfGeneric"].items, "Base.LGRBookHunting1");
table.insert(ProceduralDistributions["list"]["ShelfGeneric"].items, 1);
table.insert(ProceduralDistributions["list"]["ShelfGeneric"].items, "Base.LGRBookHunting2");
table.insert(ProceduralDistributions["list"]["ShelfGeneric"].items, 0.5);
table.insert(ProceduralDistributions["list"]["ShelfGeneric"].items, "Base.LGRBookHunting3");
table.insert(ProceduralDistributions["list"]["ShelfGeneric"].items, 0.25);
table.insert(ProceduralDistributions["list"]["ShelfGeneric"].items, "Base.LGRBookHunting4");
table.insert(ProceduralDistributions["list"]["ShelfGeneric"].items, 0.15);
table.insert(ProceduralDistributions["list"]["ShelfGeneric"].items, "Base.LGRBookHunting5");
table.insert(ProceduralDistributions["list"]["ShelfGeneric"].items, 0.1);

table.insert(ProceduralDistributions["list"]["LibraryBooks"].items, "Base.LGRBookHunting1");
table.insert(ProceduralDistributions["list"]["LibraryBooks"].items, 5);
table.insert(ProceduralDistributions["list"]["LibraryBooks"].items, "Base.LGRBookHunting2");
table.insert(ProceduralDistributions["list"]["LibraryBooks"].items, 4);
table.insert(ProceduralDistributions["list"]["LibraryBooks"].items, "Base.LGRBookHunting3");
table.insert(ProceduralDistributions["list"]["LibraryBooks"].items, 3);
table.insert(ProceduralDistributions["list"]["LibraryBooks"].items, "Base.LGRBookHunting4");
table.insert(ProceduralDistributions["list"]["LibraryBooks"].items, 2);
table.insert(ProceduralDistributions["list"]["LibraryBooks"].items, "Base.LGRBookHunting5");
table.insert(ProceduralDistributions["list"]["LibraryBooks"].items, 1);

table.insert(ProceduralDistributions["list"]["LivingRoomShelf"].items, "Base.LGRBookHunting1");
table.insert(ProceduralDistributions["list"]["LivingRoomShelf"].items, 1);
table.insert(ProceduralDistributions["list"]["LivingRoomShelf"].items, "Base.LGRBookHunting2");
table.insert(ProceduralDistributions["list"]["LivingRoomShelf"].items, 0.5);
table.insert(ProceduralDistributions["list"]["LivingRoomShelf"].items, "Base.LGRBookHunting3");
table.insert(ProceduralDistributions["list"]["LivingRoomShelf"].items, 0.25);
table.insert(ProceduralDistributions["list"]["LivingRoomShelf"].items, "Base.LGRBookHunting4");
table.insert(ProceduralDistributions["list"]["LivingRoomShelf"].items, 0.15);
table.insert(ProceduralDistributions["list"]["LivingRoomShelf"].items, "Base.LGRBookHunting5");
table.insert(ProceduralDistributions["list"]["LivingRoomShelf"].items, 0.1);

table.insert(ProceduralDistributions["list"]["BookstoreBooks"].items, "Base.LGRBookHunting1");
table.insert(ProceduralDistributions["list"]["BookstoreBooks"].items, 1);
table.insert(ProceduralDistributions["list"]["BookstoreBooks"].items, "Base.LGRBookHunting2");
table.insert(ProceduralDistributions["list"]["BookstoreBooks"].items, 0.5);
table.insert(ProceduralDistributions["list"]["BookstoreBooks"].items, "Base.LGRBookHunting3");
table.insert(ProceduralDistributions["list"]["BookstoreBooks"].items, 0.25);
table.insert(ProceduralDistributions["list"]["BookstoreBooks"].items, "Base.LGRBookHunting4");
table.insert(ProceduralDistributions["list"]["BookstoreBooks"].items, 0.15);
table.insert(ProceduralDistributions["list"]["BookstoreBooks"].items, "Base.LGRBookHunting5");
table.insert(ProceduralDistributions["list"]["BookstoreBooks"].items, 0.1);

table.insert(ProceduralDistributions["list"]["CampingStoreBooks"].items, "Base.LGRBookHunting1");
table.insert(ProceduralDistributions["list"]["CampingStoreBooks"].items, 5);
table.insert(ProceduralDistributions["list"]["CampingStoreBooks"].items, "Base.LGRBookHunting2");
table.insert(ProceduralDistributions["list"]["CampingStoreBooks"].items, 4);
table.insert(ProceduralDistributions["list"]["CampingStoreBooks"].items, "Base.LGRBookHunting3");
table.insert(ProceduralDistributions["list"]["CampingStoreBooks"].items, 3);
table.insert(ProceduralDistributions["list"]["CampingStoreBooks"].items, "Base.LGRBookHunting4");
table.insert(ProceduralDistributions["list"]["CampingStoreBooks"].items, 2);
table.insert(ProceduralDistributions["list"]["CampingStoreBooks"].items, "Base.LGRBookHunting5");
table.insert(ProceduralDistributions["list"]["CampingStoreBooks"].items, 1);

table.insert(ProceduralDistributions["list"]["ClassroomMisc"].items, "Base.LGRBookHunting1");
table.insert(ProceduralDistributions["list"]["ClassroomMisc"].items, 1);
table.insert(ProceduralDistributions["list"]["ClassroomMisc"].items, "Base.LGRBookHunting2");
table.insert(ProceduralDistributions["list"]["ClassroomMisc"].items, 0.5);
table.insert(ProceduralDistributions["list"]["ClassroomMisc"].items, "Base.LGRBookHunting3");
table.insert(ProceduralDistributions["list"]["ClassroomMisc"].items, 0.25);
table.insert(ProceduralDistributions["list"]["ClassroomMisc"].items, "Base.LGRBookHunting4");
table.insert(ProceduralDistributions["list"]["ClassroomMisc"].items, 0.15);
table.insert(ProceduralDistributions["list"]["ClassroomMisc"].items, "Base.LGRBookHunting5");
table.insert(ProceduralDistributions["list"]["ClassroomMisc"].items, 0.1);

table.insert(ProceduralDistributions["list"]["ClassroomShelves"].items, "Base.LGRBookHunting1");
table.insert(ProceduralDistributions["list"]["ClassroomShelves"].items, 1);
table.insert(ProceduralDistributions["list"]["ClassroomShelves"].items, "Base.LGRBookHunting2");
table.insert(ProceduralDistributions["list"]["ClassroomShelves"].items, 0.5);
table.insert(ProceduralDistributions["list"]["ClassroomShelves"].items, "Base.LGRBookHunting3");
table.insert(ProceduralDistributions["list"]["ClassroomShelves"].items, 0.25);
table.insert(ProceduralDistributions["list"]["ClassroomShelves"].items, "Base.LGRBookHunting4");
table.insert(ProceduralDistributions["list"]["ClassroomShelves"].items, 0.15);
table.insert(ProceduralDistributions["list"]["ClassroomShelves"].items, "Base.LGRBookHunting5");
table.insert(ProceduralDistributions["list"]["ClassroomShelves"].items, 0.1);

table.insert(ProceduralDistributions["list"]["CrateBooks"].items, "Base.LGRBookHunting1");
table.insert(ProceduralDistributions["list"]["CrateBooks"].items, 1);
table.insert(ProceduralDistributions["list"]["CrateBooks"].items, "Base.LGRBookHunting2");
table.insert(ProceduralDistributions["list"]["CrateBooks"].items, 0.5);
table.insert(ProceduralDistributions["list"]["CrateBooks"].items, "Base.LGRBookHunting3");
table.insert(ProceduralDistributions["list"]["CrateBooks"].items, 0.25);
table.insert(ProceduralDistributions["list"]["CrateBooks"].items, "Base.LGRBookHunting4");
table.insert(ProceduralDistributions["list"]["CrateBooks"].items, 0.15);
table.insert(ProceduralDistributions["list"]["CrateBooks"].items, "Base.LGRBookHunting5");
table.insert(ProceduralDistributions["list"]["CrateBooks"].items, 0.1);

table.insert(ProceduralDistributions["list"]["PostOfficeBooks"].items, "Base.LGRBookHunting1");
table.insert(ProceduralDistributions["list"]["PostOfficeBooks"].items, 2.5);
table.insert(ProceduralDistributions["list"]["PostOfficeBooks"].items, "Base.LGRBookHunting2");
table.insert(ProceduralDistributions["list"]["PostOfficeBooks"].items, 1.2);
table.insert(ProceduralDistributions["list"]["PostOfficeBooks"].items, "Base.LGRBookHunting3");
table.insert(ProceduralDistributions["list"]["PostOfficeBooks"].items, 0.5);
table.insert(ProceduralDistributions["list"]["PostOfficeBooks"].items, "Base.LGRBookHunting4");
table.insert(ProceduralDistributions["list"]["PostOfficeBooks"].items, 0.25);
table.insert(ProceduralDistributions["list"]["PostOfficeBooks"].items, "Base.LGRBookHunting5");
table.insert(ProceduralDistributions["list"]["PostOfficeBooks"].items, 0.2);

table.insert(ProceduralDistributions["list"]["CampingStoreGear"].items, "Base.DeerCall");
table.insert(ProceduralDistributions["list"]["CampingStoreGear"].items, 5);
table.insert(ProceduralDistributions["list"]["CampingStoreGear"].items, "Base.LgBinoculars");
table.insert(ProceduralDistributions["list"]["CampingStoreGear"].items, 5);
table.insert(ProceduralDistributions["list"]["CampingStoreGear"].items, "Base.magnifyingglass");
table.insert(ProceduralDistributions["list"]["CampingStoreGear"].items, 2);
table.insert(ProceduralDistributions["list"]["GunStoreCounter"].items, "Base.DeerCall");
table.insert(ProceduralDistributions["list"]["GunStoreCounter"].items, 5);
table.insert(ProceduralDistributions["list"]["GunStoreCounter"].items, "Base.LgBinoculars");
table.insert(ProceduralDistributions["list"]["GunStoreCounter"].items, 5);
table.insert(ProceduralDistributions["list"]["GunStoreCounter"].items, "Base.magnifyingglass");
table.insert(ProceduralDistributions["list"]["GunStoreCounter"].items, 5);

table.insert(ProceduralDistributions["list"]["CrateOfficeSupplies"].items, "Base.magnifyingglass");
table.insert(ProceduralDistributions["list"]["CrateOfficeSupplies"].items, 2);
table.insert(ProceduralDistributions["list"]["GigamartSchool"].items, "Base.magnifyingglass");
table.insert(ProceduralDistributions["list"]["GigamartSchool"].items, 2);

table.insert(ProceduralDistributions["list"]["GigamartSchool"].items, "Base.RubberBandsBox");
table.insert(ProceduralDistributions["list"]["GigamartSchool"].items, 0.5);



LeGourmet = {};

local function lgmergeDistributions()
	SuburbsDistributions.restaurant.displaycase = LeGourmetCustomLoot.restaurant.displaycase;
	if MoneyMod ~= nil then
	    SuburbsDistributions.all.vendingpop.rolls = SuburbsDistributions.all.vendingpop.rolls -4;
		table.remove(SuburbsDistributions.all.vendingpop.items);

		SuburbsDistributions.all.vendingsnack.rolls = SuburbsDistributions.all.vendingsnack.rolls -4;
		table.remove(SuburbsDistributions.all.vendingsnack.items);
	end
	if LCLootInsertion or RGunstoreLootInsertion then
	    print ("Items de Le Gourmet Evolution Plus agregados a Lobii City y/o Riverside Gunstore");

        table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, "AdvancedFishing.LeadFishingbox");
		table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, 0.2);
        table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, "AdvancedFishing.LeadFishingbox2");
		table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, 0.2);
        table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, "AdvancedFishing.LeadFishingbox3");
		table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, 0.2);
        table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, "AdvancedFishing.LeadFishingbox4");
		table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, 0.2);
        table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, "AdvancedFishing.LeadFishingbox5");
		table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, 0.2);
        table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, "AdvancedFishing.FishingBox");
        table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, 0.8);
        table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, "AdvancedFishing.FishingBox2");
        table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, 0.4);
        table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, "AdvancedFishing.FishingBox3");
        table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, 0.2);
        table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, "AdvancedFishing.Boya1");
        table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, 0.2);
        table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, "AdvancedFishing.Boya2");
        table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, 0.2);
        table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, "AdvancedFishing.Boya3");
        table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, 0.2);
		table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, "AdvancedFishing.BoyaPack1");
        table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, 0.2);
        table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, "AdvancedFishing.BoyaPack2");
        table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, 0.2);
        table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, "AdvancedFishing.BoyaPack3");
        table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, 0.2);
		table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, "AdvancedFishing.MediumHook");
        table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, 3);
        table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, "AdvancedFishing.SmallHook");
        table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, 5);
        table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, "AdvancedFishing.BigHook");
        table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, 1);
        table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, "AdvancedFishing.Leader");
        table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, 2);
        table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, "AdvancedFishing.LeaderPacket");
        table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, 1);
        table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, "AdvancedFishing.FishingLine2");
        table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, 1);
        table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, "AdvancedFishing.FishingLine3");
        table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, 0.5);
		table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, "AdvancedFishing.SportFishingBook");
		table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, 0.005);
		table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, "Base.BearTrap");
		table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, 1);
		table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, "Base.BearTrap");
		table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, 1);
		table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, "Base.LgBinoculars");
		table.insert(SuburbsDistributions["fishingstorestorage"]["crate"].items, 3);

        table.insert(SuburbsDistributions["fishingstorestorage"]["counter"].items, "AdvancedFishing.LeadFishingbox");
		table.insert(SuburbsDistributions["fishingstorestorage"]["counter"].items, 0.2);
        table.insert(SuburbsDistributions["fishingstorestorage"]["counter"].items, "AdvancedFishing.LeadFishingbox2");
		table.insert(SuburbsDistributions["fishingstorestorage"]["counter"].items, 0.2);
        table.insert(SuburbsDistributions["fishingstorestorage"]["counter"].items, "AdvancedFishing.LeadFishingbox3");
		table.insert(SuburbsDistributions["fishingstorestorage"]["counter"].items, 0.2);
        table.insert(SuburbsDistributions["fishingstorestorage"]["counter"].items, "AdvancedFishing.LeadFishingbox4");
		table.insert(SuburbsDistributions["fishingstorestorage"]["counter"].items, 0.2);
        table.insert(SuburbsDistributions["fishingstorestorage"]["counter"].items, "AdvancedFishing.LeadFishingbox5");
		table.insert(SuburbsDistributions["fishingstorestorage"]["counter"].items, 0.2);
        table.insert(SuburbsDistributions["fishingstorestorage"]["counter"].items, "AdvancedFishing.FishingBox");
        table.insert(SuburbsDistributions["fishingstorestorage"]["counter"].items, 0.8);
        table.insert(SuburbsDistributions["fishingstorestorage"]["counter"].items, "AdvancedFishing.FishingBox2");
        table.insert(SuburbsDistributions["fishingstorestorage"]["counter"].items, 0.4);
        table.insert(SuburbsDistributions["fishingstorestorage"]["counter"].items, "AdvancedFishing.FishingBox3");
        table.insert(SuburbsDistributions["fishingstorestorage"]["counter"].items, 0.2);
        table.insert(SuburbsDistributions["fishingstorestorage"]["counter"].items, "AdvancedFishing.Boya1");
        table.insert(SuburbsDistributions["fishingstorestorage"]["counter"].items, 0.2);
        table.insert(SuburbsDistributions["fishingstorestorage"]["counter"].items, "AdvancedFishing.Boya2");
        table.insert(SuburbsDistributions["fishingstorestorage"]["counter"].items, 0.2);
        table.insert(SuburbsDistributions["fishingstorestorage"]["counter"].items, "AdvancedFishing.Boya3");
        table.insert(SuburbsDistributions["fishingstorestorage"]["counter"].items, 0.2);
		table.insert(SuburbsDistributions["fishingstorestorage"]["counter"].items, "AdvancedFishing.BoyaPack1");
        table.insert(SuburbsDistributions["fishingstorestorage"]["counter"].items, 0.2);
        table.insert(SuburbsDistributions["fishingstorestorage"]["counter"].items, "AdvancedFishing.BoyaPack2");
        table.insert(SuburbsDistributions["fishingstorestorage"]["counter"].items, 0.2);
        table.insert(SuburbsDistributions["fishingstorestorage"]["counter"].items, "AdvancedFishing.BoyaPack3");
        table.insert(SuburbsDistributions["fishingstorestorage"]["counter"].items, 0.2);
		table.insert(SuburbsDistributions["fishingstorestorage"]["counter"].items, "AdvancedFishing.MediumHook");
        table.insert(SuburbsDistributions["fishingstorestorage"]["counter"].items, 3);
        table.insert(SuburbsDistributions["fishingstorestorage"]["counter"].items, "AdvancedFishing.SmallHook");
        table.insert(SuburbsDistributions["fishingstorestorage"]["counter"].items, 5);
        table.insert(SuburbsDistributions["fishingstorestorage"]["counter"].items, "AdvancedFishing.BigHook");
        table.insert(SuburbsDistributions["fishingstorestorage"]["counter"].items, 1);
        table.insert(SuburbsDistributions["fishingstorestorage"]["counter"].items, "AdvancedFishing.Leader");
        table.insert(SuburbsDistributions["fishingstorestorage"]["counter"].items, 2);
        table.insert(SuburbsDistributions["fishingstorestorage"]["counter"].items, "AdvancedFishing.LeaderPacket");
        table.insert(SuburbsDistributions["fishingstorestorage"]["counter"].items, 1);
        table.insert(SuburbsDistributions["fishingstorestorage"]["counter"].items, "AdvancedFishing.FishingLine2");
        table.insert(SuburbsDistributions["fishingstorestorage"]["counter"].items, 1);
        table.insert(SuburbsDistributions["fishingstorestorage"]["counter"].items, "AdvancedFishing.FishingLine3");
        table.insert(SuburbsDistributions["fishingstorestorage"]["counter"].items, 0.5);
		table.insert(SuburbsDistributions["fishingstorestorage"]["counter"].items, "AdvancedFishing.SportFishingBook");
		table.insert(SuburbsDistributions["fishingstorestorage"]["counter"].items, 0.005);
		table.insert(SuburbsDistributions["fishingstorestorage"]["counter"].items, "Base.BearTrap");
		table.insert(SuburbsDistributions["fishingstorestorage"]["counter"].items, 1);
		table.insert(SuburbsDistributions["fishingstorestorage"]["counter"].items, "Base.BearTrap");
		table.insert(SuburbsDistributions["fishingstorestorage"]["counter"].items, 1);

		table.insert(SuburbsDistributions["fishingstorestorage"]["shelves"].items, "Base.HuntingCard1");
		table.insert(SuburbsDistributions["fishingstorestorage"]["shelves"].items, 0.2);
		table.insert(SuburbsDistributions["fishingstorestorage"]["shelves"].items, "Base.HuntingCard2");
		table.insert(SuburbsDistributions["fishingstorestorage"]["shelves"].items, 0.2);
		table.insert(SuburbsDistributions["fishingstorestorage"]["shelves"].items, "Base.HuntingCard3");
		table.insert(SuburbsDistributions["fishingstorestorage"]["shelves"].items, 0.2);
		table.insert(SuburbsDistributions["fishingstorestorage"]["shelves"].items, "Base.HuntingCard4");
		table.insert(SuburbsDistributions["fishingstorestorage"]["shelves"].items, 0.2);
		table.insert(SuburbsDistributions["fishingstorestorage"]["shelves"].items, "Base.HuntingCard5");
		table.insert(SuburbsDistributions["fishingstorestorage"]["shelves"].items, 0.2);
		table.insert(SuburbsDistributions["fishingstorestorage"]["shelves"].items, "Base.HuntingCard6");
		table.insert(SuburbsDistributions["fishingstorestorage"]["shelves"].items, 0.2);
		table.insert(SuburbsDistributions["fishingstorestorage"]["shelves"].items, "Base.HuntingCard7");
		table.insert(SuburbsDistributions["fishingstorestorage"]["shelves"].items, 0.2);
		table.insert(SuburbsDistributions["fishingstorestorage"]["shelves"].items, "Base.HuntingCard8");
		table.insert(SuburbsDistributions["fishingstorestorage"]["shelves"].items, 0.2);
		table.insert(SuburbsDistributions["fishingstorestorage"]["shelves"].items, "Base.HuntingCard9");
		table.insert(SuburbsDistributions["fishingstorestorage"]["shelves"].items, 0.2);
		table.insert(SuburbsDistributions["fishingstorestorage"]["shelves"].items, "Base.HuntingCard10");
		table.insert(SuburbsDistributions["fishingstorestorage"]["shelves"].items, 0.2);

        table.insert(SuburbsDistributions["fishingstore"]["shelves"].items, "AdvancedFishing.LeadFishingbox");
		table.insert(SuburbsDistributions["fishingstore"]["shelves"].items, 0.2);
        table.insert(SuburbsDistributions["fishingstore"]["shelves"].items, "AdvancedFishing.LeadFishingbox2");
		table.insert(SuburbsDistributions["fishingstore"]["shelves"].items, 0.2);
        table.insert(SuburbsDistributions["fishingstore"]["shelves"].items, "AdvancedFishing.LeadFishingbox3");
		table.insert(SuburbsDistributions["fishingstore"]["shelves"].items, 0.2);
        table.insert(SuburbsDistributions["fishingstore"]["shelves"].items, "AdvancedFishing.LeadFishingbox4");
		table.insert(SuburbsDistributions["fishingstore"]["shelves"].items, 0.2);
        table.insert(SuburbsDistributions["fishingstore"]["shelves"].items, "AdvancedFishing.LeadFishingbox5");
		table.insert(SuburbsDistributions["fishingstore"]["shelves"].items, 0.2);
        table.insert(SuburbsDistributions["fishingstore"]["shelves"].items, "AdvancedFishing.FishingBox");
        table.insert(SuburbsDistributions["fishingstore"]["shelves"].items, 0.8);
        table.insert(SuburbsDistributions["fishingstore"]["shelves"].items, "AdvancedFishing.FishingBox2");
        table.insert(SuburbsDistributions["fishingstore"]["shelves"].items, 0.4);
        table.insert(SuburbsDistributions["fishingstore"]["shelves"].items, "AdvancedFishing.FishingBox3");
        table.insert(SuburbsDistributions["fishingstore"]["shelves"].items, 0.2);
        table.insert(SuburbsDistributions["fishingstore"]["shelves"].items, "AdvancedFishing.Boya1");
        table.insert(SuburbsDistributions["fishingstore"]["shelves"].items, 0.2);
        table.insert(SuburbsDistributions["fishingstore"]["shelves"].items, "AdvancedFishing.Boya2");
        table.insert(SuburbsDistributions["fishingstore"]["shelves"].items, 0.2);
        table.insert(SuburbsDistributions["fishingstore"]["shelves"].items, "AdvancedFishing.Boya3");
        table.insert(SuburbsDistributions["fishingstore"]["shelves"].items, 0.2);
		table.insert(SuburbsDistributions["fishingstore"]["shelves"].items, "AdvancedFishing.BoyaPack1");
        table.insert(SuburbsDistributions["fishingstore"]["shelves"].items, 0.2);
        table.insert(SuburbsDistributions["fishingstore"]["shelves"].items, "AdvancedFishing.BoyaPack2");
        table.insert(SuburbsDistributions["fishingstore"]["shelves"].items, 0.2);
        table.insert(SuburbsDistributions["fishingstore"]["shelves"].items, "AdvancedFishing.BoyaPack3");
        table.insert(SuburbsDistributions["fishingstore"]["shelves"].items, 0.2);
		table.insert(SuburbsDistributions["fishingstore"]["shelves"].items, "AdvancedFishing.MediumHook");
        table.insert(SuburbsDistributions["fishingstore"]["shelves"].items, 3);
        table.insert(SuburbsDistributions["fishingstore"]["shelves"].items, "AdvancedFishing.SmallHook");
        table.insert(SuburbsDistributions["fishingstore"]["shelves"].items, 5);
        table.insert(SuburbsDistributions["fishingstore"]["shelves"].items, "AdvancedFishing.BigHook");
        table.insert(SuburbsDistributions["fishingstore"]["shelves"].items, 1);
        table.insert(SuburbsDistributions["fishingstore"]["shelves"].items, "AdvancedFishing.Leader");
        table.insert(SuburbsDistributions["fishingstore"]["shelves"].items, 2);
        table.insert(SuburbsDistributions["fishingstore"]["shelves"].items, "AdvancedFishing.LeaderPacket");
        table.insert(SuburbsDistributions["fishingstore"]["shelves"].items, 1);
        table.insert(SuburbsDistributions["fishingstore"]["shelves"].items, "AdvancedFishing.FishingLine2");
        table.insert(SuburbsDistributions["fishingstore"]["shelves"].items, 1);
        table.insert(SuburbsDistributions["fishingstore"]["shelves"].items, "AdvancedFishing.FishingLine3");
        table.insert(SuburbsDistributions["fishingstore"]["shelves"].items, 0.5);
		table.insert(SuburbsDistributions["fishingstore"]["shelves"].items, "AdvancedFishing.SportFishingBook");
		table.insert(SuburbsDistributions["fishingstore"]["shelves"].items, 0.005);

        table.insert(SuburbsDistributions["fishingstore"]["displaycase"].items, "AdvancedFishing.LeadFishingbox");
		table.insert(SuburbsDistributions["fishingstore"]["displaycase"].items, 0.2);
        table.insert(SuburbsDistributions["fishingstore"]["displaycase"].items, "AdvancedFishing.LeadFishingbox2");
		table.insert(SuburbsDistributions["fishingstore"]["displaycase"].items, 0.2);
        table.insert(SuburbsDistributions["fishingstore"]["displaycase"].items, "AdvancedFishing.LeadFishingbox3");
		table.insert(SuburbsDistributions["fishingstore"]["displaycase"].items, 0.2);
        table.insert(SuburbsDistributions["fishingstore"]["displaycase"].items, "AdvancedFishing.LeadFishingbox4");
		table.insert(SuburbsDistributions["fishingstore"]["displaycase"].items, 0.2);
        table.insert(SuburbsDistributions["fishingstore"]["displaycase"].items, "AdvancedFishing.LeadFishingbox5");
		table.insert(SuburbsDistributions["fishingstore"]["displaycase"].items, 0.2);
        table.insert(SuburbsDistributions["fishingstore"]["displaycase"].items, "AdvancedFishing.FishingBox");
        table.insert(SuburbsDistributions["fishingstore"]["displaycase"].items, 0.8);
        table.insert(SuburbsDistributions["fishingstore"]["displaycase"].items, "AdvancedFishing.FishingBox2");
        table.insert(SuburbsDistributions["fishingstore"]["displaycase"].items, 0.4);
        table.insert(SuburbsDistributions["fishingstore"]["displaycase"].items, "AdvancedFishing.FishingBox3");
        table.insert(SuburbsDistributions["fishingstore"]["displaycase"].items, 0.2);
        table.insert(SuburbsDistributions["fishingstore"]["displaycase"].items, "AdvancedFishing.Boya1");
        table.insert(SuburbsDistributions["fishingstore"]["displaycase"].items, 0.2);
        table.insert(SuburbsDistributions["fishingstore"]["displaycase"].items, "AdvancedFishing.Boya2");
        table.insert(SuburbsDistributions["fishingstore"]["displaycase"].items, 0.2);
        table.insert(SuburbsDistributions["fishingstore"]["displaycase"].items, "AdvancedFishing.Boya3");
        table.insert(SuburbsDistributions["fishingstore"]["displaycase"].items, 0.2);
		table.insert(SuburbsDistributions["fishingstore"]["displaycase"].items, "AdvancedFishing.BoyaPack1");
        table.insert(SuburbsDistributions["fishingstore"]["displaycase"].items, 0.2);
        table.insert(SuburbsDistributions["fishingstore"]["displaycase"].items, "AdvancedFishing.BoyaPack2");
        table.insert(SuburbsDistributions["fishingstore"]["displaycase"].items, 0.2);
        table.insert(SuburbsDistributions["fishingstore"]["displaycase"].items, "AdvancedFishing.BoyaPack3");
        table.insert(SuburbsDistributions["fishingstore"]["displaycase"].items, 0.2);
		table.insert(SuburbsDistributions["fishingstore"]["displaycase"].items, "AdvancedFishing.MediumHook");
        table.insert(SuburbsDistributions["fishingstore"]["displaycase"].items, 3);
        table.insert(SuburbsDistributions["fishingstore"]["displaycase"].items, "AdvancedFishing.SmallHook");
        table.insert(SuburbsDistributions["fishingstore"]["displaycase"].items, 5);
        table.insert(SuburbsDistributions["fishingstore"]["displaycase"].items, "AdvancedFishing.BigHook");
        table.insert(SuburbsDistributions["fishingstore"]["displaycase"].items, 1);
        table.insert(SuburbsDistributions["fishingstore"]["displaycase"].items, "AdvancedFishing.Leader");
        table.insert(SuburbsDistributions["fishingstore"]["displaycase"].items, 2);
        table.insert(SuburbsDistributions["fishingstore"]["displaycase"].items, "AdvancedFishing.LeaderPacket");
        table.insert(SuburbsDistributions["fishingstore"]["displaycase"].items, 1);
        table.insert(SuburbsDistributions["fishingstore"]["displaycase"].items, "AdvancedFishing.FishingLine2");
        table.insert(SuburbsDistributions["fishingstore"]["displaycase"].items, 1);
        table.insert(SuburbsDistributions["fishingstore"]["displaycase"].items, "AdvancedFishing.FishingLine3");
        table.insert(SuburbsDistributions["fishingstore"]["displaycase"].items, 0.5);
		table.insert(SuburbsDistributions["fishingstore"]["displaycase"].items, "AdvancedFishing.SportFishingBook");
		table.insert(SuburbsDistributions["fishingstore"]["displaycase"].items, 0.005);

		table.insert(SuburbsDistributions["fishingstore"]["shelvesmag"].items, "Base.HuntingCard1");
		table.insert(SuburbsDistributions["fishingstore"]["shelvesmag"].items, 0.2);
		table.insert(SuburbsDistributions["fishingstore"]["shelvesmag"].items, "Base.HuntingCard2");
		table.insert(SuburbsDistributions["fishingstore"]["shelvesmag"].items, 0.2);
		table.insert(SuburbsDistributions["fishingstore"]["shelvesmag"].items, "Base.HuntingCard3");
		table.insert(SuburbsDistributions["fishingstore"]["shelvesmag"].items, 0.2);
		table.insert(SuburbsDistributions["fishingstore"]["shelvesmag"].items, "Base.HuntingCard4");
		table.insert(SuburbsDistributions["fishingstore"]["shelvesmag"].items, 0.2);
		table.insert(SuburbsDistributions["fishingstore"]["shelvesmag"].items, "Base.HuntingCard5");
		table.insert(SuburbsDistributions["fishingstore"]["shelvesmag"].items, 0.2);
		table.insert(SuburbsDistributions["fishingstore"]["shelvesmag"].items, "Base.HuntingCard6");
		table.insert(SuburbsDistributions["fishingstore"]["shelvesmag"].items, 0.2);
		table.insert(SuburbsDistributions["fishingstore"]["shelvesmag"].items, "Base.HuntingCard7");
		table.insert(SuburbsDistributions["fishingstore"]["shelvesmag"].items, 0.2);
		table.insert(SuburbsDistributions["fishingstore"]["shelvesmag"].items, "Base.HuntingCard8");
		table.insert(SuburbsDistributions["fishingstore"]["shelvesmag"].items, 0.2);
		table.insert(SuburbsDistributions["fishingstore"]["shelvesmag"].items, "Base.HuntingCard9");
		table.insert(SuburbsDistributions["fishingstore"]["shelvesmag"].items, 0.2);
		table.insert(SuburbsDistributions["fishingstore"]["shelvesmag"].items, "Base.HuntingCard10");
		table.insert(SuburbsDistributions["fishingstore"]["shelvesmag"].items, 0.2);

		table.insert(SuburbsDistributions["huntingstore"]["displaycase"].items, "Base.BearTrap");
		table.insert(SuburbsDistributions["huntingstore"]["displaycase"].items, 1);
		table.insert(SuburbsDistributions["huntingstore"]["displaycase"].items, "Base.BearTrap");
		table.insert(SuburbsDistributions["huntingstore"]["displaycase"].items, 1);
		table.insert(SuburbsDistributions["huntingstore"]["displaycase"].items, "Base.BearTrap");
		table.insert(SuburbsDistributions["huntingstore"]["displaycase"].items, 1);
		table.insert(SuburbsDistributions["huntingstore"]["displaycase"].items, "Base.BearTrap");
		table.insert(SuburbsDistributions["huntingstore"]["displaycase"].items, 1);
		table.insert(SuburbsDistributions["huntingstore"]["displaycase"].items, "Base.LgBinoculars");
		table.insert(SuburbsDistributions["huntingstore"]["displaycase"].items, 1);
		
		
		if LCLootInsertion then
			table.insert(LobiiCityCustomLoot["fishingstorage"]["shelves"].items, "AdvancedFishing.LeadFishingbox");
			table.insert(LobiiCityCustomLoot["fishingstorage"]["shelves"].items, 0.2);
			table.insert(LobiiCityCustomLoot["fishingstorage"]["shelves"].items, "AdvancedFishing.LeadFishingbox2");
			table.insert(LobiiCityCustomLoot["fishingstorage"]["shelves"].items, 0.2);
			table.insert(LobiiCityCustomLoot["fishingstorage"]["shelves"].items, "AdvancedFishing.LeadFishingbox3");
			table.insert(LobiiCityCustomLoot["fishingstorage"]["shelves"].items, 0.2);
			table.insert(LobiiCityCustomLoot["fishingstorage"]["shelves"].items, "AdvancedFishing.LeadFishingbox4");
			table.insert(LobiiCityCustomLoot["fishingstorage"]["shelves"].items, 0.2);
			table.insert(LobiiCityCustomLoot["fishingstorage"]["shelves"].items, "AdvancedFishing.LeadFishingbox5");
			table.insert(LobiiCityCustomLoot["fishingstorage"]["shelves"].items, 0.2);
			table.insert(LobiiCityCustomLoot["fishingstorage"]["shelves"].items, "AdvancedFishing.FishingBox");
			table.insert(LobiiCityCustomLoot["fishingstorage"]["shelves"].items, 0.8);
			table.insert(LobiiCityCustomLoot["fishingstorage"]["shelves"].items, "AdvancedFishing.FishingBox2");
			table.insert(LobiiCityCustomLoot["fishingstorage"]["shelves"].items, 0.4);
			table.insert(LobiiCityCustomLoot["fishingstorage"]["shelves"].items, "AdvancedFishing.FishingBox3");
			table.insert(LobiiCityCustomLoot["fishingstorage"]["shelves"].items, 0.2);
			table.insert(LobiiCityCustomLoot["fishingstorage"]["shelves"].items, "AdvancedFishing.Boya1");
			table.insert(LobiiCityCustomLoot["fishingstorage"]["shelves"].items, 0.2);
			table.insert(LobiiCityCustomLoot["fishingstorage"]["shelves"].items, "AdvancedFishing.Boya2");
			table.insert(LobiiCityCustomLoot["fishingstorage"]["shelves"].items, 0.2);
			table.insert(LobiiCityCustomLoot["fishingstorage"]["shelves"].items, "AdvancedFishing.Boya3");
			table.insert(LobiiCityCustomLoot["fishingstorage"]["shelves"].items, 0.2);
			table.insert(LobiiCityCustomLoot["fishingstorage"]["shelves"].items, "AdvancedFishing.BoyaPack1");
			table.insert(LobiiCityCustomLoot["fishingstorage"]["shelves"].items, 0.2);
			table.insert(LobiiCityCustomLoot["fishingstorage"]["shelves"].items, "AdvancedFishing.BoyaPack2");
			table.insert(LobiiCityCustomLoot["fishingstorage"]["shelves"].items, 0.2);
			table.insert(LobiiCityCustomLoot["fishingstorage"]["shelves"].items, "AdvancedFishing.BoyaPack3");
			table.insert(LobiiCityCustomLoot["fishingstorage"]["shelves"].items, 0.2);
			table.insert(LobiiCityCustomLoot["fishingstorage"]["shelves"].items, "AdvancedFishing.MediumHook");
			table.insert(LobiiCityCustomLoot["fishingstorage"]["shelves"].items, 3);
			table.insert(LobiiCityCustomLoot["fishingstorage"]["shelves"].items, "AdvancedFishing.SmallHook");
			table.insert(LobiiCityCustomLoot["fishingstorage"]["shelves"].items, 5);
			table.insert(LobiiCityCustomLoot["fishingstorage"]["shelves"].items, "AdvancedFishing.BigHook");
			table.insert(LobiiCityCustomLoot["fishingstorage"]["shelves"].items, 1);
			table.insert(LobiiCityCustomLoot["fishingstorage"]["shelves"].items, "AdvancedFishing.Leader");
			table.insert(LobiiCityCustomLoot["fishingstorage"]["shelves"].items, 2);
			table.insert(LobiiCityCustomLoot["fishingstorage"]["shelves"].items, "AdvancedFishing.LeaderPacket");
			table.insert(LobiiCityCustomLoot["fishingstorage"]["shelves"].items, 1);
			table.insert(LobiiCityCustomLoot["fishingstorage"]["shelves"].items, "AdvancedFishing.FishingLine2");
			table.insert(LobiiCityCustomLoot["fishingstorage"]["shelves"].items, 1);
			table.insert(LobiiCityCustomLoot["fishingstorage"]["shelves"].items, "AdvancedFishing.FishingLine3");
			table.insert(LobiiCityCustomLoot["fishingstorage"]["shelves"].items, 0.5);
			table.insert(LobiiCityCustomLoot["fishingstorage"]["shelves"].items, "AdvancedFishing.SportFishingBook");
			table.insert(LobiiCityCustomLoot["fishingstorage"]["shelves"].items, 0.005);

			table.insert(SuburbsDistributions["fishingbook"]["shelvesmag"].items, "AdvancedFishing.OldMagazine");
			table.insert(SuburbsDistributions["fishingbook"]["shelvesmag"].items, 0.2);
			table.insert(SuburbsDistributions["fishingbook"]["shelvesmag"].items, "AdvancedFishing.OldMagazine");
			table.insert(SuburbsDistributions["fishingbook"]["shelvesmag"].items, 0.2);
			table.insert(SuburbsDistributions["fishingbook"]["shelvesmag"].items, "AdvancedFishing.OldMagazine2");
			table.insert(SuburbsDistributions["fishingbook"]["shelvesmag"].items, 0.2);
			table.insert(SuburbsDistributions["fishingbook"]["shelvesmag"].items, "AdvancedFishing.OldMagazine2");
			table.insert(SuburbsDistributions["fishingbook"]["shelvesmag"].items, 0.2);
			table.insert(SuburbsDistributions["fishingbook"]["shelvesmag"].items, "AdvancedFishing.OldMagazine3");
			table.insert(SuburbsDistributions["fishingbook"]["shelvesmag"].items, 0.2);
			table.insert(SuburbsDistributions["fishingbook"]["shelvesmag"].items, "AdvancedFishing.OldMagazine3");
			table.insert(SuburbsDistributions["fishingbook"]["shelvesmag"].items, 0.2);

			table.insert(SuburbsDistributions["fishingbook"]["shelvesmag"].items, "AdvancedFishing.FishingEncyclopedia");
			table.insert(SuburbsDistributions["fishingbook"]["shelvesmag"].items, 5);
			table.insert(SuburbsDistributions["fishingbook"]["shelvesmag"].items, "AdvancedFishing.FishingEncyclopedia2");
			table.insert(SuburbsDistributions["fishingbook"]["shelvesmag"].items, 4);
			table.insert(SuburbsDistributions["fishingbook"]["shelvesmag"].items, "AdvancedFishing.FishingEncyclopedia3");
			table.insert(SuburbsDistributions["fishingbook"]["shelvesmag"].items, 3);
			table.insert(SuburbsDistributions["fishingbook"]["shelvesmag"].items, "AdvancedFishing.FishingEncyclopedia4");
			table.insert(SuburbsDistributions["fishingbook"]["shelvesmag"].items, 2);
			table.insert(SuburbsDistributions["fishingbook"]["shelvesmag"].items, "AdvancedFishing.FishingEncyclopedia5");
			table.insert(SuburbsDistributions["fishingbook"]["shelvesmag"].items, 1);

			table.insert(SuburbsDistributions["LCkitchen"]["counter"].items, "Base.MilkPowder");
			table.insert(SuburbsDistributions["LCkitchen"]["counter"].items, 0.2);
			table.insert(SuburbsDistributions["LCkitchen"]["counter"].items, "Base.MoldesMagBox");
			table.insert(SuburbsDistributions["LCkitchen"]["counter"].items, 0.01);
			table.insert(SuburbsDistributions["LCkitchen"]["counter"].items, "Base.WaffleMachine");
			table.insert(SuburbsDistributions["LCkitchen"]["counter"].items, 0.002);
			table.insert(SuburbsDistributions["LCkitchen"]["counter"].items, "Base.KitchenBrush");
			table.insert(SuburbsDistributions["LCkitchen"]["counter"].items, 0.5);
			table.insert(SuburbsDistributions["LCkitchen"]["counter"].items, "Base.LacticFerment");
			table.insert(SuburbsDistributions["LCkitchen"]["counter"].items, 0.2);
			table.insert(SuburbsDistributions["LCkitchen"]["counter"].items, "Base.CitricAcid");
			table.insert(SuburbsDistributions["LCkitchen"]["counter"].items, 0.2);
			table.insert(SuburbsDistributions["LCkitchen"]["counter"].items, "Base.Gelatine");
			table.insert(SuburbsDistributions["LCkitchen"]["counter"].items, 1);
			table.insert(SuburbsDistributions["LCkitchen"]["counter"].items, "Base.EdibleDyeYellow");
			table.insert(SuburbsDistributions["LCkitchen"]["counter"].items, 0.2);
			table.insert(SuburbsDistributions["LCkitchen"]["counter"].items, "Base.EdibleDyeRed");
			table.insert(SuburbsDistributions["LCkitchen"]["counter"].items, 0.2);
			table.insert(SuburbsDistributions["LCkitchen"]["counter"].items, "Base.EdibleDyeOrange");
			table.insert(SuburbsDistributions["LCkitchen"]["counter"].items, 0.2);


			table.insert(SuburbsDistributions["LCkitchen"]["other"].items, "Base.MilkPowder");
			table.insert(SuburbsDistributions["LCkitchen"]["other"].items, 0.2);
			table.insert(SuburbsDistributions["LCkitchen"]["other"].items, "Base.MoldesMagBox");
			table.insert(SuburbsDistributions["LCkitchen"]["other"].items, 0.01);
			table.insert(SuburbsDistributions["LCkitchen"]["other"].items, "Base.WaffleMachine");
			table.insert(SuburbsDistributions["LCkitchen"]["other"].items, 0.01);
			table.insert(SuburbsDistributions["LCkitchen"]["other"].items, "Base.ManualMeatMincer");
			table.insert(SuburbsDistributions["LCkitchen"]["other"].items, 0.01);
			table.insert(SuburbsDistributions["LCkitchen"]["other"].items, "Base.ElectricMeatMincer");
			table.insert(SuburbsDistributions["LCkitchen"]["other"].items, 0.001);
			table.insert(SuburbsDistributions["LCkitchen"]["other"].items, "Base.CheeseMoldEmpty");
			table.insert(SuburbsDistributions["LCkitchen"]["other"].items, 0.5);
			table.insert(SuburbsDistributions["LCkitchen"]["other"].items, "Base.CheeseMoldEmpty2");
			table.insert(SuburbsDistributions["LCkitchen"]["other"].items, 1);
			table.insert(SuburbsDistributions["LCkitchen"]["other"].items, "Base.CheeseMoldEmpty3");
			table.insert(SuburbsDistributions["LCkitchen"]["other"].items, 1);
			table.insert(SuburbsDistributions["LCkitchen"]["other"].items, "Base.MolinoCoffee");
			table.insert(SuburbsDistributions["LCkitchen"]["other"].items, 1);

			table.insert(SuburbsDistributions["gigamart"]["shelves"].items, "Base.MilkPowder");
			table.insert(SuburbsDistributions["gigamart"]["shelves"].items, 2);
			table.insert(SuburbsDistributions["gigamart"]["shelves"].items, "Base.MoldesMagBox");
			table.insert(SuburbsDistributions["gigamart"]["shelves"].items, 0.2);
			table.insert(SuburbsDistributions["gigamart"]["shelves"].items, "Base.CheeseMoldEmpty");
			table.insert(SuburbsDistributions["gigamart"]["shelves"].items, 0.1);
			table.insert(SuburbsDistributions["gigamart"]["shelves"].items, "Base.CheeseMoldEmpty2");
			table.insert(SuburbsDistributions["gigamart"]["shelves"].items, 0.2);
			table.insert(SuburbsDistributions["gigamart"]["shelves"].items, "Base.CheeseMoldEmpty3");
			table.insert(SuburbsDistributions["gigamart"]["shelves"].items, 0.1);
			table.insert(SuburbsDistributions["gigamart"]["shelves"].items, "Base.EdibleDyeYellow");
			table.insert(SuburbsDistributions["gigamart"]["shelves"].items, 0.2);
			table.insert(SuburbsDistributions["gigamart"]["shelves"].items, "Base.EdibleDyeRed");
			table.insert(SuburbsDistributions["gigamart"]["shelves"].items, 0.2);
			table.insert(SuburbsDistributions["gigamart"]["shelves"].items, "Base.LacticFerment");
			table.insert(SuburbsDistributions["gigamart"]["shelves"].items, 0.2);
			table.insert(SuburbsDistributions["gigamart"]["shelves"].items, "Base.CitricAcid");
			table.insert(SuburbsDistributions["gigamart"]["shelves"].items, 0.5);
			table.insert(SuburbsDistributions["gigamart"]["shelves"].items, "Base.Gelatine");
			table.insert(SuburbsDistributions["gigamart"]["shelves"].items, 1);
			table.insert(SuburbsDistributions["gigamart"]["shelves"].items, "Base.EdibleDyeOrange");
			table.insert(SuburbsDistributions["gigamart"]["shelves"].items, 0.2);

			table.insert(SuburbsDistributions["gigamart"]["counter"].items, "Base.MilkPowder");
			table.insert(SuburbsDistributions["gigamart"]["counter"].items, 2);
			table.insert(SuburbsDistributions["gigamart"]["counter"].items, "Base.MoldesMagBox");
			table.insert(SuburbsDistributions["gigamart"]["counter"].items, 0.2);
			table.insert(SuburbsDistributions["gigamart"]["counter"].items, "Base.CheeseMoldEmpty");
			table.insert(SuburbsDistributions["gigamart"]["counter"].items, 0.1);
			table.insert(SuburbsDistributions["gigamart"]["counter"].items, "Base.CheeseMoldEmpty2");
			table.insert(SuburbsDistributions["gigamart"]["counter"].items, 0.2);
			table.insert(SuburbsDistributions["gigamart"]["counter"].items, "Base.CheeseMoldEmpty3");
			table.insert(SuburbsDistributions["gigamart"]["counter"].items, 0.1);

			table.insert(SuburbsDistributions["gigamartcarn"]["displaycase"].items, "Base.PackSalchichas");
			table.insert(SuburbsDistributions["gigamartcarn"]["displaycase"].items, 5);
			table.insert(SuburbsDistributions["gigamartcarn"]["displaycase"].items, "Base.ElectricMeatMincer");
			table.insert(SuburbsDistributions["gigamartcarn"]["displaycase"].items, 1);
			table.insert(SuburbsDistributions["gigamartcarn"]["displaycase"].items, "Base.KnifeDepostador");
			table.insert(SuburbsDistributions["gigamartcarn"]["displaycase"].items, 1);
			table.insert(SuburbsDistributions["gigamartcarn"]["fridge"].items, "Base.PackSalchichas");
			table.insert(SuburbsDistributions["gigamartcarn"]["fridge"].items, 5);
			table.insert(SuburbsDistributions["gigamartcarn"]["freezer"].items, "Base.PackSalchichas");
			table.insert(SuburbsDistributions["gigamartcarn"]["freezer"].items, 5);

			table.insert(SuburbsDistributions["elevator"]["crate"].items, "Base.BearTrap");
			table.insert(SuburbsDistributions["elevator"]["crate"].items, 2);


			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, "legourmet.JuiceBox2");
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, "legourmet.JuiceBox3");
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, "legourmet.JuiceBox4");
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, "legourmet.JuiceBox5");
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, "legourmet.Wine3");
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, "legourmet.Soda01");
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, "legourmet.Soda02");
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, "legourmet.Soda03");
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, "legourmet.Soda04");
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, "legourmet.Soda05");
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, "legourmet.Soda06");
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, "legourmet.Soda07");
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, "legourmet.Soda08");
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, "legourmet.Soda09");
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, "legourmet.Soda10");
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, "legourmet.Soda11");
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, "legourmet.Soda12");
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, "legourmet.PopLemon");
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, "legourmet.PopOrange");
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, "legourmet.ColaBottle");
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, 3);
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, "legourmet.EnergyDrinkBottle");
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, 3);
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, "legourmet.EnergyDrink");
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, 3);
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, "legourmet.EnergyDrink2");
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, 3);
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, "legourmet.EnergyDrink3");
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, 3);
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, "legourmet.EnergyDrink4");
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, 3);
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, "legourmet.EnergyDrink5");
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, 3);
			
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, "legourmet.BeerSixPack1");
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, 1);
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, "legourmet.BeerSixPack2");
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, 1);
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, "legourmet.BeerSixPack3");
			table.insert(SuburbsDistributions["gigamartdrink"]["fridge"].items, 1);

			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, "legourmet.JuiceBox2");
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, "legourmet.JuiceBox3");
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, "legourmet.JuiceBox4");
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, "legourmet.JuiceBox5");
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, "legourmet.Wine3");
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, "legourmet.Soda01");
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, "legourmet.Soda02");
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, "legourmet.Soda03");
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, "legourmet.Soda04");
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, "legourmet.Soda05");
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, "legourmet.Soda06");
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, "legourmet.Soda07");
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, "legourmet.Soda08");
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, "legourmet.Soda09");
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, "legourmet.Soda10");
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, "legourmet.Soda11");
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, "legourmet.Soda12");
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, "legourmet.PopLemon");
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, "legourmet.PopOrange");
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, "legourmet.ColaBottle");
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, 3);
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, "legourmet.EnergyDrinkBottle");
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, 3);
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, "legourmet.EnergyDrink");
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, 3);
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, "legourmet.EnergyDrink2");
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, 3);
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, "legourmet.EnergyDrink3");
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, 3);
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, "legourmet.EnergyDrink4");
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, 3);
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, "legourmet.EnergyDrink5");
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, 3);
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, "legourmet.IceCubes");
			table.insert(SuburbsDistributions["gigamartdrink"]["freezer"].items, 3);

			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, "legourmet.JuiceBox2");
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, "legourmet.JuiceBox3");
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, "legourmet.JuiceBox4");
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, "legourmet.JuiceBox5");
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, "legourmet.Wine3");
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, "legourmet.Soda01");
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, "legourmet.Soda02");
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, "legourmet.Soda03");
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, "legourmet.Soda04");
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, "legourmet.Soda05");
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, "legourmet.Soda06");
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, "legourmet.Soda07");
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, "legourmet.Soda08");
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, "legourmet.Soda09");
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, "legourmet.Soda10");
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, "legourmet.Soda11");
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, "legourmet.Soda12");
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, "legourmet.PopLemon");
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, "legourmet.PopOrange");
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, 1.4);
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, "legourmet.ColaBottle");
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, 3);
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, "legourmet.EnergyDrinkBottle");
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, 3);
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, "legourmet.EnergyDrink");
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, 3);
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, "legourmet.EnergyDrink2");
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, 3);
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, "legourmet.EnergyDrink3");
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, 3);
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, "legourmet.EnergyDrink4");
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, 3);
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, "legourmet.EnergyDrink5");
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, 3);

			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, "legourmet.BeerSixPack1");
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, 1);
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, "legourmet.BeerSixPack2");
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, 1);
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, "legourmet.BeerSixPack3");
			table.insert(SuburbsDistributions["gigamartdrink"]["shelves"].items, 1);

			table.insert(SuburbsDistributions["farmstore"]["shelves"].items, "legourmetfarming.BeanBagSeed");
			table.insert(SuburbsDistributions["farmstore"]["shelves"].items, 1);
			table.insert(SuburbsDistributions["farmstore"]["shelves"].items, "legourmetfarming.BellPepperBagSeed");
			table.insert(SuburbsDistributions["farmstore"]["shelves"].items, 1);
			table.insert(SuburbsDistributions["farmstore"]["shelves"].items, "legourmetfarming.EggplantBagSeed");
			table.insert(SuburbsDistributions["farmstore"]["shelves"].items, 1);
			table.insert(SuburbsDistributions["farmstore"]["shelves"].items, "legourmetfarming.GrapeBagSeed");
			table.insert(SuburbsDistributions["farmstore"]["shelves"].items, 1);
			table.insert(SuburbsDistributions["farmstore"]["shelves"].items, "legourmetfarming.LeekBagSeed");
			table.insert(SuburbsDistributions["farmstore"]["shelves"].items, 1);
			table.insert(SuburbsDistributions["farmstore"]["shelves"].items, "legourmetfarming.LettuceBagSeed");
			table.insert(SuburbsDistributions["farmstore"]["shelves"].items, 1);
			table.insert(SuburbsDistributions["farmstore"]["shelves"].items, "legourmetfarming.OnionBagSeed");
			table.insert(SuburbsDistributions["farmstore"]["shelves"].items, 1);
			table.insert(SuburbsDistributions["farmstore"]["shelves"].items, "legourmetfarming.PeaBagSeed");
			table.insert(SuburbsDistributions["farmstore"]["shelves"].items, 1);
			table.insert(SuburbsDistributions["farmstore"]["shelves"].items, "legourmetfarming.PeanutBagSeed");
			table.insert(SuburbsDistributions["farmstore"]["shelves"].items, 1);
			table.insert(SuburbsDistributions["farmstore"]["shelves"].items, "legourmetfarming.PumpkinBagSeed");
			table.insert(SuburbsDistributions["farmstore"]["shelves"].items, 1);
			table.insert(SuburbsDistributions["farmstore"]["shelves"].items, "legourmetfarming.WatermelonBagSeed");
			table.insert(SuburbsDistributions["farmstore"]["shelves"].items, 1);
			table.insert(SuburbsDistributions["farmstore"]["shelves"].items, "legourmetfarming.ZucchiniBagSeed");
			table.insert(SuburbsDistributions["farmstore"]["shelves"].items, 1);
			table.insert(SuburbsDistributions["farmstore"]["shelves"].items, "legourmetfarming.CornBagSeed");
			table.insert(SuburbsDistributions["farmstore"]["shelves"].items, 1);
			table.insert(SuburbsDistributions["farmstore"]["shelves"].items, "legourmetfarming.RiceBagSeed");
			table.insert(SuburbsDistributions["farmstore"]["shelves"].items, 1);
			table.insert(SuburbsDistributions["farmstore"]["shelves"].items, "legourmetfarming.PineappleBagSeed");
			table.insert(SuburbsDistributions["farmstore"]["shelves"].items, 1);
			table.insert(SuburbsDistributions["farmstore"]["shelves"].items, "legourmetfarming.ChiliBagSeed");
			table.insert(SuburbsDistributions["farmstore"]["shelves"].items, 1);
			table.insert(SuburbsDistributions["farmstore"]["shelves"].items, "legourmetfarming.HabaneroBagSeed");
			table.insert(SuburbsDistributions["farmstore"]["shelves"].items, 1);
			table.insert(SuburbsDistributions["farmstore"]["shelves"].items, "legourmetfarming.JalapenoBagSeed");
			table.insert(SuburbsDistributions["farmstore"]["shelves"].items, 1);
			table.insert(SuburbsDistributions["farmstore"]["shelves"].items, "Base.CoffeeBag");
			table.insert(SuburbsDistributions["farmstore"]["shelves"].items, 1);
			table.insert(SuburbsDistributions["farmstore"]["shelves"].items, "legourmetfarming.SunFlowerBagSeed");
			table.insert(SuburbsDistributions["farmstore"]["shelves"].items, 1);
			table.insert(SuburbsDistributions["farmstore"]["shelves"].items, "legourmetfarming.SugarcaneBagSeed");
			table.insert(SuburbsDistributions["farmstore"]["shelves"].items, 1);
			table.insert(SuburbsDistributions["farmstore"]["shelves"].items, "legourmetfarming.TobaccoBagSeed");
			table.insert(SuburbsDistributions["farmstore"]["shelves"].items, 1);

			table.insert(SuburbsDistributions["farmstore"]["crate"].items, "legourmetfarming.BeanBagSeed");
			table.insert(SuburbsDistributions["farmstore"]["crate"].items, 1);
			table.insert(SuburbsDistributions["farmstore"]["crate"].items, "legourmetfarming.BellPepperBagSeed");
			table.insert(SuburbsDistributions["farmstore"]["crate"].items, 1);
			table.insert(SuburbsDistributions["farmstore"]["crate"].items, "legourmetfarming.EggplantBagSeed");
			table.insert(SuburbsDistributions["farmstore"]["crate"].items, 1);
			table.insert(SuburbsDistributions["farmstore"]["crate"].items, "legourmetfarming.GrapeBagSeed");
			table.insert(SuburbsDistributions["farmstore"]["crate"].items, 1);
			table.insert(SuburbsDistributions["farmstore"]["crate"].items, "legourmetfarming.LeekBagSeed");
			table.insert(SuburbsDistributions["farmstore"]["crate"].items, 1);
			table.insert(SuburbsDistributions["farmstore"]["crate"].items, "legourmetfarming.LettuceBagSeed");
			table.insert(SuburbsDistributions["farmstore"]["crate"].items, 1);
			table.insert(SuburbsDistributions["farmstore"]["crate"].items, "legourmetfarming.OnionBagSeed");
			table.insert(SuburbsDistributions["farmstore"]["crate"].items, 1);
			table.insert(SuburbsDistributions["farmstore"]["crate"].items, "legourmetfarming.PeaBagSeed");
			table.insert(SuburbsDistributions["farmstore"]["crate"].items, 1);
			table.insert(SuburbsDistributions["farmstore"]["crate"].items, "legourmetfarming.PeanutBagSeed");
			table.insert(SuburbsDistributions["farmstore"]["crate"].items, 1);
			table.insert(SuburbsDistributions["farmstore"]["crate"].items, "legourmetfarming.PumpkinBagSeed");
			table.insert(SuburbsDistributions["farmstore"]["crate"].items, 1);
			table.insert(SuburbsDistributions["farmstore"]["crate"].items, "legourmetfarming.WatermelonBagSeed");
			table.insert(SuburbsDistributions["farmstore"]["crate"].items, 1);
			table.insert(SuburbsDistributions["farmstore"]["crate"].items, "legourmetfarming.ZucchiniBagSeed");
			table.insert(SuburbsDistributions["farmstore"]["crate"].items, 1);
			table.insert(SuburbsDistributions["farmstore"]["crate"].items, "legourmetfarming.CornBagSeed");
			table.insert(SuburbsDistributions["farmstore"]["crate"].items, 1);
			table.insert(SuburbsDistributions["farmstore"]["crate"].items, "legourmetfarming.RiceBagSeed");
			table.insert(SuburbsDistributions["farmstore"]["crate"].items, 1);
			table.insert(SuburbsDistributions["farmstore"]["crate"].items, "legourmetfarming.PineappleBagSeed");
			table.insert(SuburbsDistributions["farmstore"]["crate"].items, 1);
			table.insert(SuburbsDistributions["farmstore"]["crate"].items, "legourmetfarming.ChiliBagSeed");
			table.insert(SuburbsDistributions["farmstore"]["crate"].items, 1);
			table.insert(SuburbsDistributions["farmstore"]["crate"].items, "legourmetfarming.HabaneroBagSeed");
			table.insert(SuburbsDistributions["farmstore"]["crate"].items, 1);
			table.insert(SuburbsDistributions["farmstore"]["crate"].items, "legourmetfarming.JalapenoBagSeed");
			table.insert(SuburbsDistributions["farmstore"]["crate"].items, 1);
			table.insert(SuburbsDistributions["farmstore"]["crate"].items, "legourmetfarming.SugarcaneBagSeed");
			table.insert(SuburbsDistributions["farmstore"]["crate"].items, 1);
			table.insert(SuburbsDistributions["farmstore"]["crate"].items, "legourmetfarming.SunFlowerBagSeed");
			table.insert(SuburbsDistributions["farmstore"]["crate"].items, 1);
			table.insert(SuburbsDistributions["farmstore"]["crate"].items, "legourmetfarming.TobaccoBagSeed");
			table.insert(SuburbsDistributions["farmstore"]["crate"].items, 1);

			table.insert(SuburbsDistributions["farmstore"]["shelvesmag"].items, "legourmetfarming.LgFarmMag1");
			table.insert(SuburbsDistributions["farmstore"]["shelvesmag"].items, 2);
			
			table.insert(SuburbsDistributions["cheesestore"]["counter"].items, "Base.CheeseMoldEmpty");
			table.insert(SuburbsDistributions["cheesestore"]["counter"].items, 3);
			table.insert(SuburbsDistributions["cheesestore"]["counter"].items, "Base.CheeseMoldEmpty2");
			table.insert(SuburbsDistributions["cheesestore"]["counter"].items, 4);
			table.insert(SuburbsDistributions["cheesestore"]["counter"].items, "Base.CheeseMoldEmpty3");
			table.insert(SuburbsDistributions["cheesestore"]["counter"].items, 5);
			table.insert(SuburbsDistributions["cheesestore"]["counter"].items, "Base.LacticFerment");
			table.insert(SuburbsDistributions["cheesestore"]["counter"].items, 1);
			table.insert(SuburbsDistributions["cheesestore"]["counter"].items, "Base.CitricAcid");
			table.insert(SuburbsDistributions["cheesestore"]["counter"].items, 1);
			table.insert(SuburbsDistributions["cheesestore"]["counter"].items, "Base.Gelatine");
			table.insert(SuburbsDistributions["cheesestore"]["counter"].items, 4);
			table.insert(SuburbsDistributions["cheesestore"]["counter"].items, "Base.EdibleDyeYellow");
			table.insert(SuburbsDistributions["cheesestore"]["counter"].items, 1);
			table.insert(SuburbsDistributions["cheesestore"]["counter"].items, "Base.EdibleDyeRed");
			table.insert(SuburbsDistributions["cheesestore"]["counter"].items, 1);
			table.insert(SuburbsDistributions["cheesestore"]["counter"].items, "Base.EdibleDyeOrange");
			table.insert(SuburbsDistributions["cheesestore"]["counter"].items, 1);
			table.insert(SuburbsDistributions["cheesestore"]["counter"].items, "Base.MilkPowder");
			table.insert(SuburbsDistributions["cheesestore"]["counter"].items, 10);

			table.insert(SuburbsDistributions["cheesestore"]["fridge"].items, "Base.HandmadeCheese");
			table.insert(SuburbsDistributions["cheesestore"]["fridge"].items, 0.5);
			table.insert(SuburbsDistributions["cheesestore"]["freezer"].items, "Base.RCheese3");
			table.insert(SuburbsDistributions["cheesestore"]["freezer"].items, 0.5);

			table.insert(SuburbsDistributions["cheesestore"]["shelves"].items, "Base.CheeseMoldEmpty");
			table.insert(SuburbsDistributions["cheesestore"]["shelves"].items, 3);
			table.insert(SuburbsDistributions["cheesestore"]["shelves"].items, "Base.LGCookingMag5");
			table.insert(SuburbsDistributions["cheesestore"]["shelves"].items, 2);
			table.insert(SuburbsDistributions["cheesestore"]["shelves"].items, "Base.CheeseMoldEmpty2");
			table.insert(SuburbsDistributions["cheesestore"]["shelves"].items, 4);
			table.insert(SuburbsDistributions["cheesestore"]["shelves"].items, "Base.CheeseMoldEmpty3");
			table.insert(SuburbsDistributions["cheesestore"]["shelves"].items, 5);
			table.insert(SuburbsDistributions["cheesestore"]["shelves"].items, "Base.LacticFerment");
			table.insert(SuburbsDistributions["cheesestore"]["shelves"].items, 1);
			table.insert(SuburbsDistributions["cheesestore"]["shelves"].items, "Base.CitricAcid");
			table.insert(SuburbsDistributions["cheesestore"]["shelves"].items, 1);
			table.insert(SuburbsDistributions["cheesestore"]["shelves"].items, "Base.Gelatine");
			table.insert(SuburbsDistributions["cheesestore"]["shelves"].items, 4);
			table.insert(SuburbsDistributions["cheesestore"]["shelves"].items, "Base.EdibleDyeYellow");
			table.insert(SuburbsDistributions["cheesestore"]["shelves"].items, 1);
			table.insert(SuburbsDistributions["cheesestore"]["shelves"].items, "Base.EdibleDyeRed");
			table.insert(SuburbsDistributions["cheesestore"]["shelves"].items, 1);
			table.insert(SuburbsDistributions["cheesestore"]["shelves"].items, "Base.EdibleDyeOrange");
			table.insert(SuburbsDistributions["cheesestore"]["shelves"].items, 1);
			table.insert(SuburbsDistributions["cheesestore"]["shelves"].items, "Base.MilkPowder");
			table.insert(SuburbsDistributions["cheesestore"]["shelves"].items, 10);
		end
	end
	if WSCLootInsertion then
		table.insert(SuburbsDistributions["stripcenterhuntingtoolstorage"]["other"].items, "Base.BearTrap");
		table.insert(SuburbsDistributions["stripcenterhuntingtoolstorage"]["other"].items, 1);
		table.insert(SuburbsDistributions["stripcenterhuntingtoolstore"]["counter"].items, "Base.BearTrap");
		table.insert(SuburbsDistributions["stripcenterhuntingtoolstore"]["counter"].items, 1);
		table.insert(SuburbsDistributions["survivalsuitstorage"]["all"].items, "Base.BearTrap");
		table.insert(SuburbsDistributions["survivalsuitstorage"]["all"].items, 0.5);
	end
	if MCLInsertion then
		table.insert(SuburbsDistributions["trainingcamp"]["metal_shelves"].items, "Base.BearTrap");
		table.insert(SuburbsDistributions["trainingcamp"]["metal_shelves"].items, 1);
		table.insert(SuburbsDistributions["trainingcamp"]["metal_shelves"].items, "Base.BearTrap");
		table.insert(SuburbsDistributions["trainingcamp"]["metal_shelves"].items, 1);
		table.insert(SuburbsDistributions["trainingcamp"]["crate"].items, "Base.BearTrap");
		table.insert(SuburbsDistributions["trainingcamp"]["crate"].items, 0.5);
		table.insert(SuburbsDistributions["trainingcamp"]["crate"].items, "Base.LgBinoculars");
		table.insert(SuburbsDistributions["trainingcamp"]["crate"].items, 10);

	end
	if FDLootInsertion then
		table.insert(SuburbsDistributions["dockfirstfloor"]["security_box"].items, "AdvancedFishing.FishingAnglerBook1");
		table.insert(SuburbsDistributions["dockfirstfloor"]["security_box"].items, 50);
		table.insert(SuburbsDistributions["dockfirstfloor"]["security_box"].items, "AdvancedFishing.FishingAnglerBook2");
		table.insert(SuburbsDistributions["dockfirstfloor"]["security_box"].items, 40);
		table.insert(SuburbsDistributions["dockfirstfloor"]["security_box"].items, "AdvancedFishing.FishingAnglerBook3");
		table.insert(SuburbsDistributions["dockfirstfloor"]["security_box"].items, 30);
		table.insert(SuburbsDistributions["dockfirstfloor"]["security_box"].items, "AdvancedFishing.FishingAnglerBook4");
		table.insert(SuburbsDistributions["dockfirstfloor"]["security_box"].items, 20);
		table.insert(SuburbsDistributions["dockfirstfloor"]["security_box"].items, "AdvancedFishing.FishingAnglerBook5");
		table.insert(SuburbsDistributions["dockfirstfloor"]["security_box"].items, 10);
		table.insert(SuburbsDistributions["dockfirstfloor"]["security_box"].items, "AdvancedFishing.FishingAnglerBook6");
		table.insert(SuburbsDistributions["dockfirstfloor"]["security_box"].items, 5);
		table.insert(SuburbsDistributions["dockfirstfloor"]["security_box"].items, "AdvancedFishing.FishingAnglerBook7");
		table.insert(SuburbsDistributions["dockfirstfloor"]["security_box"].items, 2);
		
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, "AdvancedFishing.LeadFishingbox");
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, 0.2);
        table.insert(SuburbsDistributions["dock2"]["displaycase"].items, "AdvancedFishing.LeadFishingbox2");
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, 0.2);
        table.insert(SuburbsDistributions["dock2"]["displaycase"].items, "AdvancedFishing.LeadFishingbox3");
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, 0.2);
        table.insert(SuburbsDistributions["dock2"]["displaycase"].items, "AdvancedFishing.LeadFishingbox4");
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, 0.2);
        table.insert(SuburbsDistributions["dock2"]["displaycase"].items, "AdvancedFishing.LeadFishingbox5");
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, 0.2);
        table.insert(SuburbsDistributions["dock2"]["displaycase"].items, "AdvancedFishing.FishingBox");
        table.insert(SuburbsDistributions["dock2"]["displaycase"].items, 0.8);
        table.insert(SuburbsDistributions["dock2"]["displaycase"].items, "AdvancedFishing.FishingBox2");
        table.insert(SuburbsDistributions["dock2"]["displaycase"].items, 0.4);
        table.insert(SuburbsDistributions["dock2"]["displaycase"].items, "AdvancedFishing.FishingBox3");
        table.insert(SuburbsDistributions["dock2"]["displaycase"].items, 0.2);
        table.insert(SuburbsDistributions["dock2"]["displaycase"].items, "AdvancedFishing.Boya1");
        table.insert(SuburbsDistributions["dock2"]["displaycase"].items, 0.2);
        table.insert(SuburbsDistributions["dock2"]["displaycase"].items, "AdvancedFishing.Boya2");
        table.insert(SuburbsDistributions["dock2"]["displaycase"].items, 0.2);
        table.insert(SuburbsDistributions["dock2"]["displaycase"].items, "AdvancedFishing.Boya3");
        table.insert(SuburbsDistributions["dock2"]["displaycase"].items, 0.2);
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, "AdvancedFishing.BoyaPack1");
        table.insert(SuburbsDistributions["dock2"]["displaycase"].items, 0.2);
        table.insert(SuburbsDistributions["dock2"]["displaycase"].items, "AdvancedFishing.BoyaPack2");
        table.insert(SuburbsDistributions["dock2"]["displaycase"].items, 0.2);
        table.insert(SuburbsDistributions["dock2"]["displaycase"].items, "AdvancedFishing.BoyaPack3");
        table.insert(SuburbsDistributions["dock2"]["displaycase"].items, 0.2);
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, "AdvancedFishing.MediumHook");
        table.insert(SuburbsDistributions["dock2"]["displaycase"].items, 3);
        table.insert(SuburbsDistributions["dock2"]["displaycase"].items, "AdvancedFishing.SmallHook");
        table.insert(SuburbsDistributions["dock2"]["displaycase"].items, 5);
        table.insert(SuburbsDistributions["dock2"]["displaycase"].items, "AdvancedFishing.BigHook");
        table.insert(SuburbsDistributions["dock2"]["displaycase"].items, 1);
        table.insert(SuburbsDistributions["dock2"]["displaycase"].items, "AdvancedFishing.Leader");
        table.insert(SuburbsDistributions["dock2"]["displaycase"].items, 2);
        table.insert(SuburbsDistributions["dock2"]["displaycase"].items, "AdvancedFishing.LeaderPacket");
        table.insert(SuburbsDistributions["dock2"]["displaycase"].items, 1);
        table.insert(SuburbsDistributions["dock2"]["displaycase"].items, "AdvancedFishing.FishingLine2");
        table.insert(SuburbsDistributions["dock2"]["displaycase"].items, 1);
        table.insert(SuburbsDistributions["dock2"]["displaycase"].items, "AdvancedFishing.FishingLine3");
        table.insert(SuburbsDistributions["dock2"]["displaycase"].items, 0.5);
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, "AdvancedFishing.GTPopper");
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, 5);
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, "AdvancedFishing.JitterBug");
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, 5);
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, "AdvancedFishing.Alfers");
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, 5);
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, "AdvancedFishing.StormFlutterstick");
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, 5);
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, "AdvancedFishing.RattlinRap");
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, 5);
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, "AdvancedFishing.SwimJig");
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, 5);
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, "AdvancedFishing.SwimJig2");
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, 5);
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, "AdvancedFishing.SwimJig3");
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, 5);
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, "AdvancedFishing.SpoonLure1");
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, 5);
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, "AdvancedFishing.SpoonLure2");
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, 5);
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, "AdvancedFishing.SpoonLure3");
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, 5);
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, "AdvancedFishing.Crankbait");
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, 5);
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, "AdvancedFishing.SwimShad");
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, 5);
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, "AdvancedFishing.GTPopper");
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, 2);
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, "AdvancedFishing.JitterBug");
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, 2);
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, "AdvancedFishing.Alfers");
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, 2);
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, "AdvancedFishing.StormFlutterstick");
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, 2);
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, "AdvancedFishing.RattlinRap");
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, 2);
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, "AdvancedFishing.SwimJig");
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, 2);
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, "AdvancedFishing.SwimJig2");
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, 2);
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, "AdvancedFishing.SwimJig3");
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, 2);
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, "AdvancedFishing.SpoonLure1");
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, 2);
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, "AdvancedFishing.SpoonLure2");
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, 2);
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, "AdvancedFishing.SpoonLure3");
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, 2);
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, "AdvancedFishing.Crankbait");
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, 2);
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, "AdvancedFishing.SwimShad");
		table.insert(SuburbsDistributions["dock2"]["displaycase"].items, 2);
		table.insert(SuburbsDistributions["dock2"]["shelvesmag"].items, "AdvancedFishing.SportFishingBook");
		table.insert(SuburbsDistributions["dock2"]["shelvesmag"].items, 0.02);

		table.insert(SuburbsDistributions["dock2"]["shelves"].items, "AdvancedFishing.LeadFishingbox");
		table.insert(SuburbsDistributions["dock2"]["shelves"].items, 0.2);
        table.insert(SuburbsDistributions["dock2"]["shelves"].items, "AdvancedFishing.LeadFishingbox2");
		table.insert(SuburbsDistributions["dock2"]["shelves"].items, 0.2);
        table.insert(SuburbsDistributions["dock2"]["shelves"].items, "AdvancedFishing.LeadFishingbox3");
		table.insert(SuburbsDistributions["dock2"]["shelves"].items, 0.2);
        table.insert(SuburbsDistributions["dock2"]["shelves"].items, "AdvancedFishing.LeadFishingbox4");
		table.insert(SuburbsDistributions["dock2"]["shelves"].items, 0.2);
        table.insert(SuburbsDistributions["dock2"]["shelves"].items, "AdvancedFishing.LeadFishingbox5");
		table.insert(SuburbsDistributions["dock2"]["shelves"].items, 0.2);
        table.insert(SuburbsDistributions["dock2"]["shelves"].items, "AdvancedFishing.FishingBox");
        table.insert(SuburbsDistributions["dock2"]["shelves"].items, 0.8);
        table.insert(SuburbsDistributions["dock2"]["shelves"].items, "AdvancedFishing.FishingBox2");
        table.insert(SuburbsDistributions["dock2"]["shelves"].items, 0.4);
        table.insert(SuburbsDistributions["dock2"]["shelves"].items, "AdvancedFishing.FishingBox3");
        table.insert(SuburbsDistributions["dock2"]["shelves"].items, 0.2);
        table.insert(SuburbsDistributions["dock2"]["shelves"].items, "AdvancedFishing.Boya1");
        table.insert(SuburbsDistributions["dock2"]["shelves"].items, 1);
        table.insert(SuburbsDistributions["dock2"]["shelves"].items, "AdvancedFishing.Boya2");
        table.insert(SuburbsDistributions["dock2"]["shelves"].items, 1);
        table.insert(SuburbsDistributions["dock2"]["shelves"].items, "AdvancedFishing.Boya3");
        table.insert(SuburbsDistributions["dock2"]["shelves"].items, 1);
		table.insert(SuburbsDistributions["dock2"]["shelves"].items, "AdvancedFishing.Boya1");
        table.insert(SuburbsDistributions["dock2"]["shelves"].items, 1);
        table.insert(SuburbsDistributions["dock2"]["shelves"].items, "AdvancedFishing.Boya2");
        table.insert(SuburbsDistributions["dock2"]["shelves"].items, 1);
        table.insert(SuburbsDistributions["dock2"]["shelves"].items, "AdvancedFishing.Boya3");
        table.insert(SuburbsDistributions["dock2"]["shelves"].items, 1);
		table.insert(SuburbsDistributions["dock2"]["shelves"].items, "AdvancedFishing.BoyaPack1");
        table.insert(SuburbsDistributions["dock2"]["shelves"].items, 0.5);
        table.insert(SuburbsDistributions["dock2"]["shelves"].items, "AdvancedFishing.BoyaPack2");
        table.insert(SuburbsDistributions["dock2"]["shelves"].items, 0.5);
        table.insert(SuburbsDistributions["dock2"]["shelves"].items, "AdvancedFishing.BoyaPack3");
        table.insert(SuburbsDistributions["dock2"]["shelves"].items, 0.5);
		table.insert(SuburbsDistributions["dock2"]["shelves"].items, "AdvancedFishing.MediumHook");
        table.insert(SuburbsDistributions["dock2"]["shelves"].items, 3);
        table.insert(SuburbsDistributions["dock2"]["shelves"].items, "AdvancedFishing.SmallHook");
        table.insert(SuburbsDistributions["dock2"]["shelves"].items, 5);
        table.insert(SuburbsDistributions["dock2"]["shelves"].items, "AdvancedFishing.BigHook");
        table.insert(SuburbsDistributions["dock2"]["shelves"].items, 1);
        table.insert(SuburbsDistributions["dock2"]["shelves"].items, "AdvancedFishing.Leader");
        table.insert(SuburbsDistributions["dock2"]["shelves"].items, 2);
        table.insert(SuburbsDistributions["dock2"]["shelves"].items, "AdvancedFishing.LeaderPacket");
        table.insert(SuburbsDistributions["dock2"]["shelves"].items, 1);
        table.insert(SuburbsDistributions["dock2"]["shelves"].items, "AdvancedFishing.FishingLine2");
        table.insert(SuburbsDistributions["dock2"]["shelves"].items, 1);
        table.insert(SuburbsDistributions["dock2"]["shelves"].items, "AdvancedFishing.FishingLine3");
        table.insert(SuburbsDistributions["dock2"]["shelves"].items, 0.5);
		table.insert(SuburbsDistributions["dock2"]["shelves"].items, "AdvancedFishing.GTPopper");
		table.insert(SuburbsDistributions["dock2"]["shelves"].items, 2);
		table.insert(SuburbsDistributions["dock2"]["shelves"].items, "AdvancedFishing.JitterBug");
		table.insert(SuburbsDistributions["dock2"]["shelves"].items, 2);
		table.insert(SuburbsDistributions["dock2"]["shelves"].items, "AdvancedFishing.Alfers");
		table.insert(SuburbsDistributions["dock2"]["shelves"].items, 2);
		table.insert(SuburbsDistributions["dock2"]["shelves"].items, "AdvancedFishing.StormFlutterstick");
		table.insert(SuburbsDistributions["dock2"]["shelves"].items, 2);
		table.insert(SuburbsDistributions["dock2"]["shelves"].items, "AdvancedFishing.RattlinRap");
		table.insert(SuburbsDistributions["dock2"]["shelves"].items, 2);
		table.insert(SuburbsDistributions["dock2"]["shelves"].items, "AdvancedFishing.SwimJig");
		table.insert(SuburbsDistributions["dock2"]["shelves"].items, 2);
		table.insert(SuburbsDistributions["dock2"]["shelves"].items, "AdvancedFishing.SwimJig2");
		table.insert(SuburbsDistributions["dock2"]["shelves"].items, 2);
		table.insert(SuburbsDistributions["dock2"]["shelves"].items, "AdvancedFishing.SwimJig3");
		table.insert(SuburbsDistributions["dock2"]["shelves"].items, 2);
		table.insert(SuburbsDistributions["dock2"]["shelves"].items, "AdvancedFishing.SpoonLure1");
		table.insert(SuburbsDistributions["dock2"]["shelves"].items, 2);
		table.insert(SuburbsDistributions["dock2"]["shelves"].items, "AdvancedFishing.SpoonLure2");
		table.insert(SuburbsDistributions["dock2"]["shelves"].items, 2);
		table.insert(SuburbsDistributions["dock2"]["shelves"].items, "AdvancedFishing.SpoonLure3");
		table.insert(SuburbsDistributions["dock2"]["shelves"].items, 2);
		table.insert(SuburbsDistributions["dock2"]["shelves"].items, "AdvancedFishing.Crankbait");
		table.insert(SuburbsDistributions["dock2"]["shelves"].items, 2);
		table.insert(SuburbsDistributions["dock2"]["shelves"].items, "AdvancedFishing.SwimShad");
		table.insert(SuburbsDistributions["dock2"]["shelves"].items, 2);
		table.insert(SuburbsDistributions["dock2"]["shelves"].items, "AdvancedFishing.SmallHookPacket");
		table.insert(SuburbsDistributions["dock2"]["shelves"].items, 2);
		table.insert(SuburbsDistributions["dock2"]["shelves"].items, "AdvancedFishing.MediumHookPacket");
		table.insert(SuburbsDistributions["dock2"]["shelves"].items, 2);
		table.insert(SuburbsDistributions["dock2"]["shelves"].items, "AdvancedFishing.BigHookPacket");
		table.insert(SuburbsDistributions["dock2"]["shelves"].items, 2);
		
		table.insert(SuburbsDistributions["dock2"]["shelvesmag"].items, "AdvancedFishing.FishingEncyclopedia");
		table.insert(SuburbsDistributions["dock2"]["shelvesmag"].items, 0.5);
		table.insert(SuburbsDistributions["dock2"]["shelvesmag"].items, "AdvancedFishing.FishingEncyclopedia2");
		table.insert(SuburbsDistributions["dock2"]["shelvesmag"].items, 0.4);
		table.insert(SuburbsDistributions["dock2"]["shelvesmag"].items, "AdvancedFishing.FishingEncyclopedia3");
		table.insert(SuburbsDistributions["dock2"]["shelvesmag"].items, 0.3);
		table.insert(SuburbsDistributions["dock2"]["shelvesmag"].items, "AdvancedFishing.FishingEncyclopedia4");
		table.insert(SuburbsDistributions["dock2"]["shelvesmag"].items, 0.2);
		table.insert(SuburbsDistributions["dock2"]["shelvesmag"].items, "AdvancedFishing.FishingEncyclopedia5");
		table.insert(SuburbsDistributions["dock2"]["shelvesmag"].items, 0.1);
		table.insert(SuburbsDistributions["dock2"]["shelvesmag"].items, "AdvancedFishing.FishingEncyclopedia5");
		table.insert(SuburbsDistributions["dock2"]["shelvesmag"].items, 0.1);
		table.insert(SuburbsDistributions["dock2"]["shelvesmag"].items, "AdvancedFishing.FishingEncyclopedia5");
		table.insert(SuburbsDistributions["dock2"]["shelvesmag"].items, 0.1);
		table.insert(SuburbsDistributions["dock2"]["shelvesmag"].items, "AdvancedFishing.FishingAnglerBook1");
		table.insert(SuburbsDistributions["dock2"]["shelvesmag"].items, 0.1);
		table.insert(SuburbsDistributions["dock2"]["shelvesmag"].items, "AdvancedFishing.FishingAnglerBook2");
		table.insert(SuburbsDistributions["dock2"]["shelvesmag"].items, 0.1);
		table.insert(SuburbsDistributions["dock2"]["shelvesmag"].items, "AdvancedFishing.FishingAnglerBook3");
		table.insert(SuburbsDistributions["dock2"]["shelvesmag"].items, 0.1);
		table.insert(SuburbsDistributions["dock2"]["shelvesmag"].items, "AdvancedFishing.FishingAnglerBook4");
		table.insert(SuburbsDistributions["dock2"]["shelvesmag"].items, 0.1);
		table.insert(SuburbsDistributions["dock2"]["shelvesmag"].items, "AdvancedFishing.FishingAnglerBook5");
		table.insert(SuburbsDistributions["dock2"]["shelvesmag"].items, 0.1);
		table.insert(SuburbsDistributions["dock2"]["shelvesmag"].items, "AdvancedFishing.FishingAnglerBook6");
		table.insert(SuburbsDistributions["dock2"]["shelvesmag"].items, 0.1);
		table.insert(SuburbsDistributions["dock2"]["shelvesmag"].items, "AdvancedFishing.FishingAnglerBook7");
		table.insert(SuburbsDistributions["dock2"]["shelvesmag"].items, 0.1);
	end
	if MoneyMod == nil then
		table.insert(SuburbsDistributions["all"]["vendingpop"].items, "legourmet.EnergyDrinkBottle");
		table.insert(SuburbsDistributions["all"]["vendingpop"].items, 3);
		table.insert(SuburbsDistributions["all"]["vendingpop"].items, "legourmet.EnergyDrink");
		table.insert(SuburbsDistributions["all"]["vendingpop"].items, 3);
		table.insert(SuburbsDistributions["all"]["vendingpop"].items, "legourmet.EnergyDrink2");
		table.insert(SuburbsDistributions["all"]["vendingpop"].items, 3);
		table.insert(SuburbsDistributions["all"]["vendingpop"].items, "legourmet.EnergyDrink3");
		table.insert(SuburbsDistributions["all"]["vendingpop"].items, 3);
		table.insert(SuburbsDistributions["all"]["vendingpop"].items, "legourmet.EnergyDrink4");
		table.insert(SuburbsDistributions["all"]["vendingpop"].items, 3);
		table.insert(SuburbsDistributions["all"]["vendingpop"].items, "legourmet.EnergyDrink5");
		table.insert(SuburbsDistributions["all"]["vendingpop"].items, 3);
		table.insert(SuburbsDistributions["all"]["vendingpop"].items, "legourmet.EnergyDrink");
		table.insert(SuburbsDistributions["all"]["vendingpop"].items, 1);
		table.insert(SuburbsDistributions["all"]["vendingpop"].items, "legourmet.EnergyDrink2");
		table.insert(SuburbsDistributions["all"]["vendingpop"].items, 1);
		table.insert(SuburbsDistributions["all"]["vendingpop"].items, "legourmet.EnergyDrink3");
		table.insert(SuburbsDistributions["all"]["vendingpop"].items, 1);
		table.insert(SuburbsDistributions["all"]["vendingpop"].items, "legourmet.EnergyDrink4");
		table.insert(SuburbsDistributions["all"]["vendingpop"].items, 1);
		table.insert(SuburbsDistributions["all"]["vendingpop"].items, "legourmet.EnergyDrink5");
		table.insert(SuburbsDistributions["all"]["vendingpop"].items, 1);

		-- More Pop
		table.insert(SuburbsDistributions["all"]["vendingpop"].items, "legourmet.PopLemon");
		table.insert(SuburbsDistributions["all"]["vendingpop"].items, 3);
		table.insert(SuburbsDistributions["all"]["vendingpop"].items, "legourmet.PopLemon");
		table.insert(SuburbsDistributions["all"]["vendingpop"].items, 3);
		table.insert(SuburbsDistributions["all"]["vendingpop"].items, "legourmet.PopLemon");
		table.insert(SuburbsDistributions["all"]["vendingpop"].items, 3);
		table.insert(SuburbsDistributions["all"]["vendingpop"].items, "legourmet.PopOrange");
		table.insert(SuburbsDistributions["all"]["vendingpop"].items, 3);
		table.insert(SuburbsDistributions["all"]["vendingpop"].items, "legourmet.PopOrange");
		table.insert(SuburbsDistributions["all"]["vendingpop"].items, 3);
		table.insert(SuburbsDistributions["all"]["vendingpop"].items, "legourmet.PopOrange");
		table.insert(SuburbsDistributions["all"]["vendingpop"].items, 3);
		
		table.insert(SuburbsDistributions["all"]["vendingpop"].items, "legourmet.ColaBottle");
		table.insert(SuburbsDistributions["all"]["vendingpop"].items, 3);

		-- Vending Machine
		table.insert(SuburbsDistributions["all"]["vendingsnack"].items, "legourmet.Crisps5");
		table.insert(SuburbsDistributions["all"]["vendingsnack"].items, 1);
		table.insert(SuburbsDistributions["all"]["vendingsnack"].items, "legourmet.Crisps6");
		table.insert(SuburbsDistributions["all"]["vendingsnack"].items, 1);
		table.insert(SuburbsDistributions["all"]["vendingsnack"].items, "legourmet.Crisps7");
		table.insert(SuburbsDistributions["all"]["vendingsnack"].items, 1);
		table.insert(SuburbsDistributions["all"]["vendingsnack"].items, "legourmet.Crisps8");
		table.insert(SuburbsDistributions["all"]["vendingsnack"].items, 1);
		table.insert(SuburbsDistributions["all"]["vendingsnack"].items, "legourmet.Crisps9");
		table.insert(SuburbsDistributions["all"]["vendingsnack"].items, 1);
	end
	if LootFixerCustomLoot then
	end
	if RGunstoreLootInsertion then
		table.insert(SuburbsDistributions["riversidegunstore"]["displaycase"].items, "Base.LgBinoculars");
		table.insert(SuburbsDistributions["riversidegunstore"]["displaycase"].items, 0.5);
		table.insert(SuburbsDistributions["riversidegunstore"]["counter"].items, "Base.LgBinoculars");
		table.insert(SuburbsDistributions["riversidegunstore"]["counter"].items, 0.5);
	end
	if FactoryLootInsertion then
		table.insert(SuburbsDistributions["bossoffice"]["bar_furniture"].items, "legourmet.FernetFull");
		table.insert(SuburbsDistributions["bossoffice"]["bar_furniture"].items, 20);
		table.insert(SuburbsDistributions["bossoffice"]["bar_furniture"].items, "legourmet.ColaBottle");
		table.insert(SuburbsDistributions["bossoffice"]["bar_furniture"].items, 20);
		table.insert(SuburbsDistributions["bossoffice"]["bar_furniture"].items, "legourmet.FernetFull");
		table.insert(SuburbsDistributions["bossoffice"]["bar_furniture"].items, 20);
		table.insert(SuburbsDistributions["bossoffice"]["bar_furniture"].items, "legourmet.ColaBottle");
		table.insert(SuburbsDistributions["bossoffice"]["bar_furniture"].items, 20);	
		table.insert(SuburbsDistributions["bossoffice"]["bar_furniture"].items, "legourmet.FernetFull");
		table.insert(SuburbsDistributions["bossoffice"]["bar_furniture"].items, 20);
		table.insert(SuburbsDistributions["bossoffice"]["bar_furniture"].items, "legourmet.ColaBottle");
		table.insert(SuburbsDistributions["bossoffice"]["bar_furniture"].items, 20);	
		table.insert(SuburbsDistributions["bossoffice"]["bar_furniture"].items, "legourmet.FernetFull");
		table.insert(SuburbsDistributions["bossoffice"]["bar_furniture"].items, 20);
		table.insert(SuburbsDistributions["bossoffice"]["bar_furniture"].items, "legourmet.ColaBottle");
		table.insert(SuburbsDistributions["bossoffice"]["bar_furniture"].items, 20);	
		table.insert(SuburbsDistributions["bossoffice"]["bar_furniture"].items, "legourmet.FernetFull");
		table.insert(SuburbsDistributions["bossoffice"]["bar_furniture"].items, 20);
		table.insert(SuburbsDistributions["bossoffice"]["bar_furniture"].items, "legourmet.ColaBottle");
		table.insert(SuburbsDistributions["bossoffice"]["bar_furniture"].items, 20);	
		table.insert(SuburbsDistributions["bossoffice"]["bar_furniture"].items, "legourmet.FernetFull");
		table.insert(SuburbsDistributions["bossoffice"]["bar_furniture"].items, 20);
		table.insert(SuburbsDistributions["bossoffice"]["bar_furniture"].items, "legourmet.ColaBottle");
		table.insert(SuburbsDistributions["bossoffice"]["bar_furniture"].items, 20);	

		table.insert(SuburbsDistributions["bossoffice"]["security_box"].items, "Base.LGCookingMag9");
		table.insert(SuburbsDistributions["bossoffice"]["security_box"].items, 500);
		table.insert(SuburbsDistributions["bossoffice"]["security_box"].items, "legourmet.YerbaMate");
		table.insert(SuburbsDistributions["bossoffice"]["security_box"].items, 500);
		table.insert(SuburbsDistributions["bossoffice"]["security_box"].items, "legourmet.YerbaMate");
		table.insert(SuburbsDistributions["bossoffice"]["security_box"].items, 200);
		table.insert(SuburbsDistributions["bossoffice"]["security_box"].items, "legourmet.YerbaMate");
		table.insert(SuburbsDistributions["bossoffice"]["security_box"].items, 100);
		table.insert(SuburbsDistributions["bossoffice"]["security_box"].items, "legourmet.VacuumFlaskEmpty");
		table.insert(SuburbsDistributions["bossoffice"]["security_box"].items, 500);
		table.insert(SuburbsDistributions["bossoffice"]["security_box"].items, "legourmet.MateEmpty");
		table.insert(SuburbsDistributions["bossoffice"]["security_box"].items, 500);
	end
	table.insert(SuburbsDistributions.Bag_InmateEscapedBag.items, "Base.TeaBagEmpty");
	table.insert(SuburbsDistributions.Bag_InmateEscapedBag.items, 5);
	table.insert(SuburbsDistributions.Bag_InmateEscapedBag.items, "legourmet.YerbaMate");
	table.insert(SuburbsDistributions.Bag_InmateEscapedBag.items, 10);
	table.insert(SuburbsDistributions.Bag_InmateEscapedBag.items, "legourmet.MateEmpty");
	table.insert(SuburbsDistributions.Bag_InmateEscapedBag.items, 10);
	table.insert(SuburbsDistributions.Bag_SurvivorBag.items, "Base.TeaBagEmpty");
	table.insert(SuburbsDistributions.Bag_SurvivorBag.items, 10);
	table.insert(SuburbsDistributions.Bag_SurvivorBag.items, "Base.TeaBagBox");
	table.insert(SuburbsDistributions.Bag_SurvivorBag.items, 20);
end

local function lgpostDistributionMerge()
    RemoveItemFromDistribution(SuburbsDistributions, "FishingTackle");
	RemoveItemFromDistribution(SuburbsDistributions, "FishingTackle2");
	
	RemoveItemFromDistribution(ProceduralDistributions, "FishingTackle");
	RemoveItemFromDistribution(ProceduralDistributions, "FishingTackle2");
end
Events.OnDistributionMerge.Add(lgmergeDistributions);
Events.OnPostDistributionMerge.Add(lgpostDistributionMerge);