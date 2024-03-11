require "Items/Distributions"
require "Items/SuburbsDistributions"
require "Items/ProceduralDistributions"
require "Vehicles/VehicleDistributions"
require "Items/ItemPicker"	

-- PROCEDURALDISTRIBUTIONS.LUA for Lumber and Stuff --

table.insert(ProceduralDistributions.list["BookstoreBooks"].items, "FLUKEY.FlukeysRules");
table.insert(ProceduralDistributions.list["BookstoreBooks"].items, 0.5);
table.insert(ProceduralDistributions.list["BookstoreBooks"].items, "FLUKEY.FlukeysInfo");
table.insert(ProceduralDistributions.list["BookstoreBooks"].items, 0.5);

table.insert(ProceduralDistributions.list["LibraryBooks"].items, "FLUKEY.FlukeysRules");
table.insert(ProceduralDistributions.list["LibraryBooks"].items, 0.5);
table.insert(ProceduralDistributions.list["LibraryBooks"].items, "FLUKEY.FlukeysInfo");
table.insert(ProceduralDistributions.list["LibraryBooks"].items, 0.5);

table.insert(ProceduralDistributions.list["JanitorTools"].items, "Base.Handdolly");
table.insert(ProceduralDistributions.list["JanitorTools"].items, 4);
table.insert(ProceduralDistributions.list["JanitorTools"].items, "Base.Pushcart");
table.insert(ProceduralDistributions.list["JanitorTools"].items, 4);

table.insert(ProceduralDistributions.list["CrateLumber"].items, "Base.Sawlumber");
table.insert(ProceduralDistributions.list["CrateLumber"].items, 5);

table.insert(ProceduralDistributions.list["GarageTools"].items, "Base.Handdolly");
table.insert(ProceduralDistributions.list["GarageTools"].items, 4);
table.insert(ProceduralDistributions.list["GarageTools"].items, "Base.Sawlumber");
table.insert(ProceduralDistributions.list["GarageTools"].items, 5);
table.insert(ProceduralDistributions.list["GarageTools"].items, "Base.Superglue");
table.insert(ProceduralDistributions.list["GarageTools"].items, 5);
table.insert(ProceduralDistributions.list["GarageTools"].items, "Base.Rubbercement");
table.insert(ProceduralDistributions.list["GarageTools"].items, 5);

table.insert(ProceduralDistributions.list["GardenStoreTools"].items, "Base.Sawlumber");
table.insert(ProceduralDistributions.list["GardenStoreTools"].items, 5);
table.insert(ProceduralDistributions.list["GardenStoreTools"].items, "Base.Superglue");
table.insert(ProceduralDistributions.list["GardenStoreTools"].items, 5);
table.insert(ProceduralDistributions.list["GardenStoreTools"].items, "Base.Rubbercement");
table.insert(ProceduralDistributions.list["GardenStoreTools"].items, 5);
table.insert(ProceduralDistributions.list["GardenStoreTools"].items, "Base.Shoppingcart");
table.insert(ProceduralDistributions.list["GardenStoreTools"].items, 4);

table.insert(ProceduralDistributions.list["GigamartTools"].items, "Base.Sawlumber");
table.insert(ProceduralDistributions.list["GigamartTools"].items, 3);
table.insert(ProceduralDistributions.list["GigamartTools"].items, "Base.Superglue");
table.insert(ProceduralDistributions.list["GigamartTools"].items, 5);
table.insert(ProceduralDistributions.list["GigamartTools"].items, "Base.Toywagon");
table.insert(ProceduralDistributions.list["GigamartTools"].items, 4);
table.insert(ProceduralDistributions.list["GigamartTools"].items, "Base.Rubbercement");
table.insert(ProceduralDistributions.list["GigamartTools"].items, 5);
table.insert(ProceduralDistributions.list["GigamartTools"].items, "Base.Shoppingcart");
table.insert(ProceduralDistributions.list["GigamartTools"].items, 3);
table.insert(ProceduralDistributions.list["GigamartTools"].items, "Base.Pushcart");
table.insert(ProceduralDistributions.list["GigamartTools"].items, 3);


table.insert(ProceduralDistributions.list["ToolStoreTools"].items, "Base.Sawlumber");
table.insert(ProceduralDistributions.list["ToolStoreTools"].items, 5);
table.insert(ProceduralDistributions.list["ToolStoreTools"].items, "Base.Handdolly");
table.insert(ProceduralDistributions.list["ToolStoreTools"].items, 4);
table.insert(ProceduralDistributions.list["ToolStoreTools"].items, "Base.Superglue");
table.insert(ProceduralDistributions.list["ToolStoreTools"].items, 5);
table.insert(ProceduralDistributions.list["ToolStoreTools"].items, "Base.Rubbercement");
table.insert(ProceduralDistributions.list["ToolStoreTools"].items, 5);
table.insert(ProceduralDistributions.list["ToolStoreTools"].items, "Base.Shoppingcart");
table.insert(ProceduralDistributions.list["ToolStoreTools"].items, 3);
table.insert(ProceduralDistributions.list["ToolStoreTools"].items, "Base.Pushcart");
table.insert(ProceduralDistributions.list["ToolStoreTools"].items, 3);

table.insert(ProceduralDistributions.list["ToolStoreCarpentry"].items, "Base.Sawlumber");
table.insert(ProceduralDistributions.list["ToolStoreCarpentry"].items, 5);
table.insert(ProceduralDistributions.list["ToolStoreCarpentry"].items, "Base.Handdolly");
table.insert(ProceduralDistributions.list["ToolStoreCarpentry"].items, 4);
table.insert(ProceduralDistributions.list["ToolStoreCarpentry"].items, "Base.Superglue");
table.insert(ProceduralDistributions.list["ToolStoreCarpentry"].items, 5);
table.insert(ProceduralDistributions.list["ToolStoreCarpentry"].items, "Base.Rubbercement");
table.insert(ProceduralDistributions.list["ToolStoreCarpentry"].items, 5);
table.insert(ProceduralDistributions.list["ToolStoreCarpentry"].items, "Base.Shoppingcart");
table.insert(ProceduralDistributions.list["ToolStoreCarpentry"].items, 4);
table.insert(ProceduralDistributions.list["ToolStoreCarpentry"].items, "Base.Pushcart");
table.insert(ProceduralDistributions.list["ToolStoreCarpentry"].items, 4);

-- PROCEDURALDISTRIBUTIONS.LUA for Glue spawns

table.insert(ProceduralDistributions.list["BathroomCounter"].items, "Base.Superglue");
table.insert(ProceduralDistributions.list["BathroomCounter"].items, 5);
table.insert(ProceduralDistributions.list["BathroomCounter"].items, "Base.Rubbercement");
table.insert(ProceduralDistributions.list["BathroomCounter"].items, 5);

table.insert(ProceduralDistributions.list["BarCounterMisc"].items, "Base.Superglue");
table.insert(ProceduralDistributions.list["BarCounterMisc"].items, 5);
table.insert(ProceduralDistributions.list["BarCounterMisc"].items, "Base.Rubbercement");
table.insert(ProceduralDistributions.list["BarCounterMisc"].items, 5);

table.insert(ProceduralDistributions.list["ClothingStorageFootwear"].items, "Base.Rubbercement");
table.insert(ProceduralDistributions.list["ClothingStorageFootwear"].items, 5);

table.insert(ProceduralDistributions.list["CrateCarpentry"].items, "Base.Superglue");
table.insert(ProceduralDistributions.list["CrateCarpentry"].items, 5);

table.insert(ProceduralDistributions.list["CrateMechanics"].items, "Base.Superglue");
table.insert(ProceduralDistributions.list["CrateMechanics"].items, 5);
table.insert(ProceduralDistributions.list["CrateMechanics"].items, "Base.Rubbercement");
table.insert(ProceduralDistributions.list["CrateMechanics"].items, 5);

table.insert(ProceduralDistributions.list["MechanicShelfMisc"].items, "Base.Superglue");
table.insert(ProceduralDistributions.list["MechanicShelfMisc"].items, 5);
table.insert(ProceduralDistributions.list["MechanicShelfMisc"].items, "Base.Rubbercement");
table.insert(ProceduralDistributions.list["MechanicShelfMisc"].items, 5);

table.insert(ProceduralDistributions.list["CrateMetalwork"].items, "Base.Superglue");
table.insert(ProceduralDistributions.list["CrateMetalwork"].items, 5);
table.insert(ProceduralDistributions.list["CrateMetalwork"].items, "Base.Rubbercement");
table.insert(ProceduralDistributions.list["CrateMetalwork"].items, 5);

table.insert(ProceduralDistributions.list["CrateOfficeSupplies"].items, "Base.Superglue");
table.insert(ProceduralDistributions.list["CrateOfficeSupplies"].items, 5);
table.insert(ProceduralDistributions.list["CrateOfficeSupplies"].items, "Base.Rubbercement");
table.insert(ProceduralDistributions.list["CrateOfficeSupplies"].items, 5);

table.insert(ProceduralDistributions.list["DeskGeneric"].items, "Base.Superglue");
table.insert(ProceduralDistributions.list["DeskGeneric"].items, 5);
table.insert(ProceduralDistributions.list["DeskGeneric"].items, "Base.Rubbercement");
table.insert(ProceduralDistributions.list["DeskGeneric"].items, 5);

table.insert(ProceduralDistributions.list["KitchenRandom"].items, "Base.Superglue");
table.insert(ProceduralDistributions.list["KitchenRandom"].items, 4);
table.insert(ProceduralDistributions.list["KitchenRandom"].items, "Base.Rubbercement");
table.insert(ProceduralDistributions.list["KitchenRandom"].items, 4);

table.insert(ProceduralDistributions.list["WardrobeMan"].items, "Base.Toywagon");
table.insert(ProceduralDistributions.list["WardrobeMan"].items, 4);

table.insert(ProceduralDistributions.list["WardrobeRedneck"].items, "Base.Toywagon");
table.insert(ProceduralDistributions.list["WardrobeRedneck"].items, 4);

table.insert(ProceduralDistributions.list["WardrobeWoman"].items, "Base.Toywagon");
table.insert(ProceduralDistributions.list["WardrobeWoman"].items, 4);

-- PROCEDURALDISTRIBUTIONS.LUA for Milk and Coco

table.insert(ProceduralDistributions.list["BurgerKitchenFridge"].items, "QOLfixers.MySoymilk");
table.insert(ProceduralDistributions.list["BurgerKitchenFridge"].items, 8);

table.insert(ProceduralDistributions.list["CafeKitchenFridge"].items, "QOLfixers.MySoymilk");
table.insert(ProceduralDistributions.list["CafeKitchenFridge"].items, 8);

table.insert(ProceduralDistributions.list["CrepeKitchenFridge"].items, "QOLfixers.MySoymilk");
table.insert(ProceduralDistributions.list["CafeKitchenFridge"].items, 8);

table.insert(ProceduralDistributions.list["DinerKitchenFridge"].items, "QOLfixers.MySoymilk");
table.insert(ProceduralDistributions.list["DinerKitchenFridge"].items, 8);

table.insert(ProceduralDistributions.list["SpiffosKitchenFridge"].items, "QOLfixers.MySoymilk");
table.insert(ProceduralDistributions.list["SpiffosKitchenFridge"].items, 8);

table.insert(ProceduralDistributions.list["RestaurantKitchenFridge"].items, "QOLfixers.MySoymilk");
table.insert(ProceduralDistributions.list["RestaurantKitchenFridge"].items, 8);

table.insert(ProceduralDistributions.list["PizzaKitchenFridge"].items, "QOLfixers.MySoymilk");
table.insert(ProceduralDistributions.list["PizzaKitchenFridge"].items, 8);

table.insert(ProceduralDistributions.list["JaysKitchenFridge"].items, "QOLfixers.MySoymilk");
table.insert(ProceduralDistributions.list["JaysKitchenFridge"].items, 8);

table.insert(ProceduralDistributions.list["FridgeOther"].items, "QOLfixers.MySoymilk");
table.insert(ProceduralDistributions.list["FridgeOther"].items, 6);

table.insert(ProceduralDistributions.list["FridgeBreakRoom"].items, "QOLfixers.MySoymilk");
table.insert(ProceduralDistributions.list["FridgeBreakRoom"].items, 6);

table.insert(ProceduralDistributions.list["CrateCannedFood"].items, "QOLfixers.MySoymilk");
table.insert(ProceduralDistributions.list["CrateCannedFood"].items, 4);

table.insert(ProceduralDistributions.list["GigamartCannedFood"].items, "QOLfixers.MySoymilk");
table.insert(ProceduralDistributions.list["GigamartCannedFood"].items, 4);

table.insert(ProceduralDistributions.list["KitchenCannedFood"].items, "QOLfixers.MySoymilk");
table.insert(ProceduralDistributions.list["KitchenCannedFood"].items, 4);

-- PROCEDURALDISTRIBUTIONS.LUA for Coco

table.insert(ProceduralDistributions.list["FridgeBreakRoom"].items, "QOLfixers.MyCoco");
table.insert(ProceduralDistributions.list["FridgeBreakRoom"].items, 5);

table.insert(ProceduralDistributions.list["BreakRoomCounter"].items, "QOLfixers.MyCoco");
table.insert(ProceduralDistributions.list["BreakRoomCounter"].items, 5);

table.insert(ProceduralDistributions.list["BarCounterMisc"].items, "QOLfixers.MyCoco");
table.insert(ProceduralDistributions.list["BarCounterMisc"].items, 5);

table.insert(ProceduralDistributions.list["StoreKitchenCafe"].items, "QOLfixers.MyCoco");
table.insert(ProceduralDistributions.list["StoreKitchenCafe"].items, 5);

table.insert(ProceduralDistributions.list["KitchenBreakfast"].items, "QOLfixers.MyCoco");
table.insert(ProceduralDistributions.list["KitchenBreakfast"].items, 5);

table.insert(ProceduralDistributions.list["KitchenCannedFood"].items, "QOLfixers.MyCoco");
table.insert(ProceduralDistributions.list["KitchenCannedFood"].items, 4);

table.insert(ProceduralDistributions.list["KitchenDryFood"].items, "QOLfixers.MyCoco");
table.insert(ProceduralDistributions.list["KitchenDryFood"].items, 4);

table.insert(ProceduralDistributions.list["KitchenRandom"].items, "QOLfixers.MyCoco");
table.insert(ProceduralDistributions.list["KitchenRandom"].items, 4);

-- PROCEDURALDISTRIBUTIONS.LUA for Canteen

table.insert(ProceduralDistributions.list["CrateCamping"].items, "Base.MyCanteen");
table.insert(ProceduralDistributions.list["CrateCamping"].items, 4);

table.insert(ProceduralDistributions.list["CrateFarming"].items, "Base.MyCanteen");
table.insert(ProceduralDistributions.list["CrateFarming"].items, 4);

table.insert(ProceduralDistributions.list["CrateMechanics"].items, "Base.MyCanteen");
table.insert(ProceduralDistributions.list["CrateMechanics"].items, 4);

table.insert(ProceduralDistributions.list["CrateSports"].items, "Base.MyCanteen");
table.insert(ProceduralDistributions.list["CrateSports"].items, 4);

table.insert(ProceduralDistributions.list["WardrobeMan"].items, "Base.MyCanteen");
table.insert(ProceduralDistributions.list["WardrobeMan"].items, 4);

table.insert(ProceduralDistributions.list["WardrobeManClassy"].items, "Base.MyCanteen");
table.insert(ProceduralDistributions.list["WardrobeMan"].items, 4);

table.insert(ProceduralDistributions.list["WardrobeRedneck"].items, "Base.MyCanteen");
table.insert(ProceduralDistributions.list["WardrobeRedneck"].items, 4);

table.insert(ProceduralDistributions.list["WardrobeWoman"].items, "Base.MyCanteen");
table.insert(ProceduralDistributions.list["WardrobeWoman"].items, 4);

table.insert(ProceduralDistributions.list["FactoryLockers"].items, "Base.MyCanteen");
table.insert(ProceduralDistributions.list["FactoryLockers"].items, 4);

table.insert(ProceduralDistributions.list["FireDeptLockers"].items, "Base.MyCanteen");
table.insert(ProceduralDistributions.list["FireDeptLockers"].items, 4);

table.insert(ProceduralDistributions.list["Locker"].items, "Base.MyCanteen");
table.insert(ProceduralDistributions.list["Locker"].items, 2);

table.insert(ProceduralDistributions.list["LockerClassy"].items, "Base.MyCanteen");
table.insert(ProceduralDistributions.list["LockerClassy"].items, 4);

-- PROCEDURALDISTRIBUTIONS.LUA for Garbagebag Box

table.insert(ProceduralDistributions.list["JanitorCleaning"].items, "Base.MyGarbagebagbox");
table.insert(ProceduralDistributions.list["JanitorCleaning"].items, 6);

table.insert(ProceduralDistributions.list["JanitorMisc"].items, "Base.MyGarbagebagbox");
table.insert(ProceduralDistributions.list["JanitorMisc"].items, 6);

table.insert(ProceduralDistributions.list["LaundryCleaning"].items, "Base.MyGarbagebagbox");
table.insert(ProceduralDistributions.list["LaundryCleaning"].items, 6);

table.insert(ProceduralDistributions.list["MechanicShelfMisc"].items, "Base.MyGarbagebagbox");
table.insert(ProceduralDistributions.list["MechanicShelfMisc"].items, 6);

table.insert(ProceduralDistributions.list["StoreCounterCleaning"].items, "Base.MyGarbagebagbox");
table.insert(ProceduralDistributions.list["StoreCounterCleaning"].items, 6);

table.insert(ProceduralDistributions.list["KitchenDryFood"].items, "Base.MyGarbagebagbox");
table.insert(ProceduralDistributions.list["KitchenDryFood"].items, 6);

table.insert(ProceduralDistributions.list["MedicalStorageTools"].items, "Base.MyGarbagebagbox");
table.insert(ProceduralDistributions.list["MedicalStorageTools"].items, 6);

table.insert(ProceduralDistributions.list["BarCounterMisc"].items, "Base.MyGarbagebagbox");
table.insert(ProceduralDistributions.list["BarCounterMisc"].items, 6);

table.insert(ProceduralDistributions.list["GardenStoreTools"].items, "Base.MyGarbagebagbox");
table.insert(ProceduralDistributions.list["GardenStoreTools"].items, 6);

table.insert(ProceduralDistributions.list["GigamartDryGoods"].items, "Base.MyGarbagebagbox");
table.insert(ProceduralDistributions.list["GigamartDryGoods"].items, 6);

table.insert(ProceduralDistributions.list["StoreCounterBags"].items, "Base.MyGarbagebagbox");
table.insert(ProceduralDistributions.list["StoreCounterBags"].items, 6);

-- PROCEDURALDISTRIBUTIONS.LUA for Jar boxes and Food Jars

table.insert(ProceduralDistributions.list["BarCounterMisc"].items, "Base.DozenJarsBox");
table.insert(ProceduralDistributions.list["BarCounterMisc"].items, 4);

table.insert(ProceduralDistributions.list["CrateCanning"].items, "Base.DozenJarsBox");
table.insert(ProceduralDistributions.list["CrateCanning"].items, 4);

table.insert(ProceduralDistributions.list["KitchenRandom"].items, "Base.DozenJarsBox");
table.insert(ProceduralDistributions.list["KitchenRandom"].items, 2);

table.insert(ProceduralDistributions.list["GardenStoreMisc"].items, "Base.DozenJarsBox");
table.insert(ProceduralDistributions.list["GardenStoreMisc"].items, 4);

table.insert(ProceduralDistributions.list["GigamartHousewares"].items, "Base.DozenJarsBox");
table.insert(ProceduralDistributions.list["GigamartHousewares"].items, 4);

table.insert(ProceduralDistributions.list["GigamartPots"].items, "Base.DozenJarsBox");
table.insert(ProceduralDistributions.list["GigamartPots"].items, 4);

table.insert(ProceduralDistributions.list["KitchenDishes"].items, "Base.DozenJarsBox");
table.insert(ProceduralDistributions.list["KitchenDishes"].items, 4);

table.insert(ProceduralDistributions.list["GardenStoreMisc"].items, "Base.DozenJarsBox");
table.insert(ProceduralDistributions.list["GardenStoreMisc"].items, 2);

-- PROCEDURALDISTRIBUTIONS.LUA for Sheet Metal

table.insert(ProceduralDistributions.list["CrateMetalwork"].items, "Base.SmallMetalSheetBox");
table.insert(ProceduralDistributions.list["CrateMetalwork"].items, 3);

table.insert(ProceduralDistributions.list["CrateMetalwork"].items, "Base.SmallMetalSheetStack");
table.insert(ProceduralDistributions.list["CrateMetalwork"].items, 3);

table.insert(ProceduralDistributions.list["CrateMetalwork"].items, "Base.MetalSheetBox");
table.insert(ProceduralDistributions.list["CrateMetalwork"].items, 3);

table.insert(ProceduralDistributions.list["CrateMetalwork"].items, "Base.MetalPipeBox");
table.insert(ProceduralDistributions.list["CrateMetalwork"].items, 3);

table.insert(ProceduralDistributions.list["CrateMetalwork"].items, "Base.MetalBarBox");
table.insert(ProceduralDistributions.list["CrateMetalwork"].items, 3);

table.insert(ProceduralDistributions.list["GarageMetalwork"].items, "Base.SmallMetalSheetBox");
table.insert(ProceduralDistributions.list["GarageMetalwork"].items, 2);

table.insert(ProceduralDistributions.list["GarageMetalwork"].items, "Base.SmallMetalSheetStack");
table.insert(ProceduralDistributions.list["GarageMetalwork"].items, 2);

table.insert(ProceduralDistributions.list["GarageMetalwork"].items, "Base.MetalSheetBox");
table.insert(ProceduralDistributions.list["GarageMetalwork"].items, 2);

table.insert(ProceduralDistributions.list["GarageMetalwork"].items, "Base.MetalPipeBox");
table.insert(ProceduralDistributions.list["GarageMetalwork"].items, 2);

table.insert(ProceduralDistributions.list["GarageMetalwork"].items, "Base.MetalBarBox");
table.insert(ProceduralDistributions.list["GarageMetalwork"].items, 2);

table.insert(ProceduralDistributions.list["ToolStoreMetalwork"].items, "Base.SmallMetalSheetBox");
table.insert(ProceduralDistributions.list["ToolStoreMetalwork"].items, 2);

table.insert(ProceduralDistributions.list["ToolStoreMetalwork"].items, "Base.SmallMetalSheetStack");
table.insert(ProceduralDistributions.list["ToolStoreMetalwork"].items, 2);

table.insert(ProceduralDistributions.list["ToolStoreMetalwork"].items, "Base.MetalSheetBox");
table.insert(ProceduralDistributions.list["ToolStoreMetalwork"].items, 2);

table.insert(ProceduralDistributions.list["ToolStoreMetalwork"].items, "Base.MetalPipeBox");
table.insert(ProceduralDistributions.list["ToolStoreMetalwork"].items, 2);

table.insert(ProceduralDistributions.list["ToolStoreMetalwork"].items, "Base.MetalBarBox");
table.insert(ProceduralDistributions.list["ToolStoreMetalwork"].items, 2);


-- PROCEDURALDISTRIBUTIONS.LUA for Spare Engine Parts

table.insert(ProceduralDistributions.list["ArmyHangarTools"].items, "Base.10xSpareEngineParts");
table.insert(ProceduralDistributions.list["ArmyHangarTools"].items, 5);
table.insert(ProceduralDistributions.list["ArmyHangarTools"].items, "Base.20xSpareEngineParts");
table.insert(ProceduralDistributions.list["ArmyHangarTools"].items, 3);


table.insert(ProceduralDistributions.list["GarageTools"].items, "Base.10xSpareEngineParts");
table.insert(ProceduralDistributions.list["GarageTools"].items, 5);
table.insert(ProceduralDistributions.list["GarageTools"].items, "Base.20xSpareEngineParts");
table.insert(ProceduralDistributions.list["GarageTools"].items, 3);
table.insert(ProceduralDistributions.list["GarageTools"].items, "Base.30xSpareEngineParts");
table.insert(ProceduralDistributions.list["GarageTools"].items, 2);


table.insert(ProceduralDistributions.list["CrateMechanics"].items, "Base.10xSpareEngineParts");
table.insert(ProceduralDistributions.list["CrateMechanics"].items, 3);
table.insert(ProceduralDistributions.list["CrateMechanics"].items, "Base.20xSpareEngineParts");
table.insert(ProceduralDistributions.list["CrateMechanics"].items, 4);
table.insert(ProceduralDistributions.list["CrateMechanics"].items, "Base.30xSpareEngineParts");
table.insert(ProceduralDistributions.list["CrateMechanics"].items, 5);


table.insert(ProceduralDistributions.list["CrateMetalwork"].items, "Base.10xSpareEngineParts");
table.insert(ProceduralDistributions.list["CrateMetalwork"].items, 4);
table.insert(ProceduralDistributions.list["CrateMetalwork"].items, "Base.20xSpareEngineParts");
table.insert(ProceduralDistributions.list["CrateMetalwork"].items, 3);


table.insert(ProceduralDistributions.list["MechanicShelfMisc"].items, "Base.10xSpareEngineParts");
table.insert(ProceduralDistributions.list["MechanicShelfMisc"].items, 3);


table.insert(ProceduralDistributions.list["MechanicShelfTools"].items, "Base.20xSpareEngineParts");
table.insert(ProceduralDistributions.list["MechanicShelfTools"].items, 4);


table.insert(ProceduralDistributions.list["StoreShelfMechanics"].items, "Base.20xSpareEngineParts");
table.insert(ProceduralDistributions.list["StoreShelfMechanics"].items, 4);


table.insert(ProceduralDistributions.list["GarageMechanics"].items, "Base.10xSpareEngineParts");
table.insert(ProceduralDistributions.list["GarageMechanics"].items, 5);
table.insert(ProceduralDistributions.list["GarageMechanics"].items, "Base.20xSpareEngineParts");
table.insert(ProceduralDistributions.list["GarageMechanics"].items, 5);
table.insert(ProceduralDistributions.list["GarageMechanics"].items, "Base.30xSpareEngineParts");
table.insert(ProceduralDistributions.list["GarageMechanics"].items, 5);

-- PROCEDURALDISTRIBUTIONS.LUA for Door Hinges Box

table.insert(ProceduralDistributions.list["JanitorTools"].items, "Base.DoorHingesBox");
table.insert(ProceduralDistributions.list["JanitorTools"].items, 3);

table.insert(ProceduralDistributions.list["GigamartTools"].items, "Base.DoorHingesBox");
table.insert(ProceduralDistributions.list["GigamartTools"].items, 3);

table.insert(ProceduralDistributions.list["ToolStoreTools"].items, "Base.DoorHingesBox");
table.insert(ProceduralDistributions.list["ToolStoreTools"].items, 5);

table.insert(ProceduralDistributions.list["ToolStoreCarpentry"].items, "Base.DoorHingesBox");
table.insert(ProceduralDistributions.list["ToolStoreCarpentry"].items, 5);

table.insert(ProceduralDistributions.list["JanitorCleaning"].items, "Base.DoorHingesBox");
table.insert(ProceduralDistributions.list["JanitorCleaning"].items, 3);

table.insert(ProceduralDistributions.list["GarageTools"].items, "Base.DoorHingesBox");
table.insert(ProceduralDistributions.list["GarageTools"].items, 4);

table.insert(ProceduralDistributions.list["ArmyHangarTools"].items, "Base.DoorHingesBox");
table.insert(ProceduralDistributions.list["ArmyHangarTools"].items, 3);

table.insert(ProceduralDistributions.list["GarageCarpentry"].items, "Base.DoorHingesBox");
table.insert(ProceduralDistributions.list["GarageCarpentry"].items, 5);

table.insert(ProceduralDistributions.list["ToolStoreAccessories"].items, "Base.DoorHingesBox");
table.insert(ProceduralDistributions.list["ToolStoreAccessories"].items, 5);

table.insert(ProceduralDistributions.list["ToolStoreMisc"].items, "Base.DoorHingesBox");
table.insert(ProceduralDistributions.list["ToolStoreMisc"].items, 3);

table.insert(ProceduralDistributions.list["CabinetFactoryTools"].items, "Base.DoorHingesBox");
table.insert(ProceduralDistributions.list["CabinetFactoryTools"].items, 5);

-- PROCEDURALDISTRIBUTIONS.LUA for Doorknobs Box

table.insert(ProceduralDistributions.list["JanitorTools"].items, "Base.DoorknobsBox");
table.insert(ProceduralDistributions.list["JanitorTools"].items, 3);

table.insert(ProceduralDistributions.list["GigamartTools"].items, "Base.DoorknobsBox");
table.insert(ProceduralDistributions.list["GigamartTools"].items, 3);

table.insert(ProceduralDistributions.list["ToolStoreTools"].items, "Base.DoorknobsBox");
table.insert(ProceduralDistributions.list["ToolStoreTools"].items, 4);

table.insert(ProceduralDistributions.list["ToolStoreCarpentry"].items, "Base.DoorknobsBox");
table.insert(ProceduralDistributions.list["ToolStoreCarpentry"].items, 4);

table.insert(ProceduralDistributions.list["JanitorCleaning"].items, "Base.DoorknobsBox");
table.insert(ProceduralDistributions.list["JanitorCleaning"].items, 3);

table.insert(ProceduralDistributions.list["GarageTools"].items, "Base.DoorknobsBox");
table.insert(ProceduralDistributions.list["GarageTools"].items, 4);

table.insert(ProceduralDistributions.list["ArmyHangarTools"].items, "Base.DoorknobsBox");
table.insert(ProceduralDistributions.list["ArmyHangarTools"].items, 3);

table.insert(ProceduralDistributions.list["GarageCarpentry"].items, "Base.DoorknobsBox");
table.insert(ProceduralDistributions.list["GarageCarpentry"].items, 4);

table.insert(ProceduralDistributions.list["ToolStoreAccessories"].items, "Base.DoorknobsBox");
table.insert(ProceduralDistributions.list["ToolStoreAccessories"].items, 4);

table.insert(ProceduralDistributions.list["ToolStoreMisc"].items, "Base.DoorknobsBox");
table.insert(ProceduralDistributions.list["ToolStoreMisc"].items, 3);

table.insert(ProceduralDistributions.list["CabinetFactoryTools"].items, "Base.DoorknobsBox");
table.insert(ProceduralDistributions.list["CabinetFactoryTools"].items, 4);

-- PROCEDURALDISTRIBUTIONS.LUA for LightBulb Box

table.insert(ProceduralDistributions.list["GarageTools"].items, "Base.LightBulbSixPack");
table.insert(ProceduralDistributions.list["GarageTools"].items, 2);
table.insert(ProceduralDistributions.list["GarageTools"].items, "Base.LightBulbTwelvePack");
table.insert(ProceduralDistributions.list["GarageTools"].items, 2);

table.insert(ProceduralDistributions.list["GarageCarpentry"].items, "Base.LightBulbSixPack");
table.insert(ProceduralDistributions.list["GarageCarpentry"].items, 2);
table.insert(ProceduralDistributions.list["GarageCarpentry"].items, "Base.LightBulbTwelvePack");
table.insert(ProceduralDistributions.list["GarageCarpentry"].items, 2);

table.insert(ProceduralDistributions.list["ToolStoreAccessories"].items, "Base.LightBulbSixPack");
table.insert(ProceduralDistributions.list["ToolStoreAccessories"].items, 2);
table.insert(ProceduralDistributions.list["ToolStoreAccessories"].items, "Base.LightBulbTwelvePack");
table.insert(ProceduralDistributions.list["ToolStoreAccessories"].items, 2);

table.insert(ProceduralDistributions.list["JanitorTools"].items, "Base.LightBulbSixPack");
table.insert(ProceduralDistributions.list["JanitorTools"].items, 3);
table.insert(ProceduralDistributions.list["JanitorTools"].items, "Base.LightBulbTwelvePack");
table.insert(ProceduralDistributions.list["JanitorTools"].items, 4);

table.insert(ProceduralDistributions.list["GigamartTools"].items, "Base.LightBulbSixPack");
table.insert(ProceduralDistributions.list["GigamartTools"].items, 3);
table.insert(ProceduralDistributions.list["GigamartTools"].items, "Base.LightBulbTwelvePack");
table.insert(ProceduralDistributions.list["GigamartTools"].items, 2);

table.insert(ProceduralDistributions.list["KitchenDryFood"].items, "Base.LightBulbSixPack");
table.insert(ProceduralDistributions.list["KitchenDryFood"].items, 3);
table.insert(ProceduralDistributions.list["KitchenDryFood"].items, "Base.LightBulbTwelvePack");
table.insert(ProceduralDistributions.list["KitchenDryFood"].items, 2);

table.insert(ProceduralDistributions.list["GarageMechanics"].items, "Base.LightBulbSixPack");
table.insert(ProceduralDistributions.list["GarageMechanics"].items, 3);
table.insert(ProceduralDistributions.list["GarageMechanics"].items, "Base.LightBulbTwelvePack");
table.insert(ProceduralDistributions.list["GarageMechanics"].items, 2);

-- PROCEDURALDISTRIBUTIONS.LUA for Car Stuff

table.insert(ProceduralDistributions.list["MechanicShelfTools"].items, "Base.BatteryCleaner");
table.insert(ProceduralDistributions.list["MechanicShelfTools"].items, 1);
table.insert(ProceduralDistributions.list["MechanicShelfTools"].items, "Base.BatteryCleaner");
table.insert(ProceduralDistributions.list["MechanicShelfTools"].items, 1);
table.insert(ProceduralDistributions.list["MechanicShelfTools"].items, "Base.BatteryCleaner");
table.insert(ProceduralDistributions.list["MechanicShelfTools"].items, 1);
table.insert(ProceduralDistributions.list["MechanicShelfElectric"].items, "Base.BatteryCleaner");
table.insert(ProceduralDistributions.list["MechanicShelfElectric"].items, 1);
table.insert(ProceduralDistributions.list["CrateMechanics"].items, "Base.BatteryCleaner");
table.insert(ProceduralDistributions.list["CrateMechanics"].items, 1);
table.insert(ProceduralDistributions.list["GarageMechanics"].items, "Base.BatteryCleaner");
table.insert(ProceduralDistributions.list["GarageMechanics"].items, 2);
table.insert(ProceduralDistributions.list["StoreShelfMechanics"].items, "Base.BatteryCleaner");
table.insert(ProceduralDistributions.list["StoreShelfMechanics"].items, 1);
table.insert(ProceduralDistributions.list["ToolStoreMisc"].items, "Base.BatteryCleaner");
table.insert(ProceduralDistributions.list["ToolStoreMisc"].items, 2);

table.insert(ProceduralDistributions.list["GarageMechanics"].items, "Base.BigGlassPanel");
table.insert(ProceduralDistributions.list["GarageMechanics"].items, 3);
table.insert(ProceduralDistributions.list["GarageMechanics"].items, "Base.SmallGlassPanel");
table.insert(ProceduralDistributions.list["GarageMechanics"].items, 3);
table.insert(ProceduralDistributions.list["CrateMechanics"].items, "Base.SmallGlassPanel");
table.insert(ProceduralDistributions.list["CrateMechanics"].items, 3);
table.insert(ProceduralDistributions.list["CrateMechanics"].items, "Base.BigGlassPanel");
table.insert(ProceduralDistributions.list["CrateMechanics"].items, 3);
table.insert(ProceduralDistributions.list["GigamartTools"].items, "Base.BigGlassPanel");
table.insert(ProceduralDistributions.list["GigamartTools"].items, 2);
table.insert(ProceduralDistributions.list["GigamartTools"].items, "Base.BigGlassPanel");
table.insert(ProceduralDistributions.list["GigamartTools"].items, 2);

table.insert(ProceduralDistributions.list["GarageTools"].items, "Base.GlassCutter");
table.insert(ProceduralDistributions.list["GarageTools"].items, 1);
table.insert(ProceduralDistributions.list["GigamartTools"].items, "Base.GlassCutter");
table.insert(ProceduralDistributions.list["GigamartTools"].items, 2);
table.insert(ProceduralDistributions.list["CarSupplyTools"].items, "Base.GlassCutter");
table.insert(ProceduralDistributions.list["CarSupplyTools"].items, 2);
table.insert(ProceduralDistributions.list["CrateTools"].items, "Base.GlassCutter");
table.insert(ProceduralDistributions.list["CrateTools"].items, 2);
table.insert(ProceduralDistributions.list["CrateMechanics"].items, "Base.GlassCutter");
table.insert(ProceduralDistributions.list["CrateMechanics"].items, 3);