--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

if isClient() then return end

require "Farming/SFarmingSystem"
require "Farming/farming_vegetableconf"
require "Farming/LGfarming_vegetableconf"

local function noise(message) SFarmingSystem.instance:noise(message) end

local function randomSeedType()
	local seedTypes = {}
	for seedType,itemSprite in pairs(farming_vegetableconf.icons) do
		if seedType == "Tomato" 
		  or seedType == "Chili"
		  or seedType == "Habanero"
		  or seedType == "Jalapeno"
		  or seedType == "Eggplant"
		  or seedType == "Bean"
		  or seedType == "Grape"
		  or seedType == "Pea"
		  or seedType == "BellPepper"
		  or seedType == "Pumpkin" 
		  or seedType == "Watermelon" 
		  or seedType == "Rice" 
		  or seedType == "Lemon" 
		  or seedType == "Orange" 
		  or seedType == "Apple"
		  or seedType == "Pear"
		  or seedType == "Peach" 
		  or seedType == "Banana" 
		  or seedType == "Lime" 
		  or seedType == "Cherry" 
		  or seedType == "Pineapple" 
		  or seedType == "Avocado" 
		  or seedType == "Coffee" 
		  or seedType == "Wheat" 
		  or seedType == "Sugarcane" 
		  or seedType == "Sunflower" 
		  or seedType == "Tobacco"
		  or seedType == "Mango" 
		  or seedType == "GrapeFruit" then
			--nothing
		else
			table.insert(seedTypes, seedType)
		end
	end
	return seedTypes[ZombRand(#seedTypes)+1]
end

local function removeExistingLuaObject(square)
	local luaObject = SFarmingSystem.instance:getLuaObjectOnSquare(square)
	if luaObject then
		noise('removing luaObject at same location as newly-loaded isoObject')
		SFarmingSystem.instance:removeLuaObject(luaObject)
	end
end

local function NewPlow(isoObject)
	local square = isoObject:getSquare()
	removeExistingLuaObject(square)
	SPlantGlobalObject.initModData(isoObject:getModData())
	isoObject:getModData().exterior = square:isOutside()
	isoObject:setName(getText("Farming_Plowed_Land"))
end

local function NewDestroyed(isoObject)
	local square = isoObject:getSquare()
	removeExistingLuaObject(square)
	local modData = isoObject:getModData()
	SPlantGlobalObject.initModData(modData)
	modData.spriteName = isoObject:getSprite():getName()
	modData.state = "destroy"
	modData.exterior = square:isOutside()
	local typeOfSeed = nil
	if isoObject:getSprite():getName() == "vegetation_farming_01_14" then
		local seed = {"Tomato", "Chili", "Habanero", "Jalapeno"};
		typeOfSeed = seed[ZombRand(1, #seed +1)];
	elseif isoObject:getSprite():getName() == "LegourmetFarming_02_33" then
		local seed = {"BellPepper", "Pea"};
		typeOfSeed = seed[ZombRand(1, #seed +1)];
	elseif isoObject:getSprite():getName() == "LegourmetFarming_02_37" then
		typeOfSeed = "Grape";
	elseif isoObject:getSprite():getName() == "LegourmetFarming_02_34" then
		typeOfSeed = "Bean";
	elseif isoObject:getSprite():getName() == "LegourmetFarming_02_38" then
		typeOfSeed = "Eggplant";
	elseif isoObject:getSprite():getName() == "LegourmetFarming_02_41" then
		local seed = {"Pumpkin", "Watermelon"};
		typeOfSeed = seed[ZombRand(1, #seed +1)];
	elseif isoObject:getSprite():getName() == "LegourmetFarming_02_50" then
		typeOfSeed = "Rice";
	elseif isoObject:getSprite():getName() == "LegourmetFarming_03_50" then
		typeOfSeed = "Lemon";
	elseif isoObject:getSprite():getName() == "LegourmetFarming_03_52" then
		local seed = {"Orange", "GrapeFruit"};
		typeOfSeed = seed[ZombRand(1, #seed +1)];
	elseif isoObject:getSprite():getName() == "LegourmetFarming_03_54" then
		local seed = {"Apple", "Peach", "Pear", "Mango"};
		typeOfSeed = seed[ZombRand(1, #seed +1)];
	elseif isoObject:getSprite():getName() == "LegourmetFarming_03_55" then
		typeOfSeed = "Banana";
	elseif isoObject:getSprite():getName() == "LegourmetFarming_03_57" then
		local seed = {"Cherry", "Lime"};
		typeOfSeed = seed[ZombRand(1, #seed +1)];
	elseif isoObject:getSprite():getName() == "LegourmetFarming_03_59" then
		typeOfSeed = "Pineapple";
	elseif isoObject:getSprite():getName() == "LegourmetFarming_03_77" then
		typeOfSeed = "Avocado";
	elseif isoObject:getSprite():getName() == "LegourmetFarming_02_69" then
		typeOfSeed = "Coffee";
	elseif isoObject:getSprite():getName() == "LegourmetFarming_01_72" then
		typeOfSeed = "Wheat";
	elseif isoObject:getSprite():getName() == "vegetation_farming_01_4" then
		local seed = {"Sugarcane", "Sunflower", "Tobacco"};
		typeOfSeed = seed[ZombRand(1, #seed +1)];
	else
		-- We don't know what type of plant this was, pick a random one.
		typeOfSeed = randomSeedType()
	end
	isoObject:setName(getText("Farming_Destroyed") .. " " .. getText("Farming_" .. typeOfSeed))
	-- deadPlant()
	modData.typeOfSeed = typeOfSeed
	modData.nextGrowing = 0
	modData.waterLvl = 0
	modData.nbOfGrow = 0
	modData.mildewLvl = 0
	modData.aphidLvl = 0
	modData.fliesLvl = 0
	modData.health = 0
end

local function NewPlant(isoObject, typeOfSeed)
	local square = isoObject:getSquare()
	removeExistingLuaObject(square)

	local spriteName = isoObject:getSprite():getName()
	local luaObject = SFarmingSystem.instance:newLuaObjectOnSquare(square)
	luaObject:initNew()
	luaObject.exterior = square:isOutside()
	isoObject:setSpecialTooltip(true)

	luaObject:seed(typeOfSeed)
	luaObject.waterLvl = ZombRand(luaObject.waterNeeded, luaObject.waterNeededMax or 100)

	-- plow: nbOfGrow == -1
	-- seed: nbOfGrow == 0 -> 1
	-- rotten: nbOfGrow == 1

	local sprites = farming_vegetableconf.sprite[typeOfSeed]
	local nbOfGrow = 1
	for i=1,#sprites do
		if sprites[i] == spriteName then
			break
		end
		nbOfGrow = nbOfGrow + 1
	end

	for i=1,nbOfGrow-1 do
		SFarmingSystem.instance:growPlant(luaObject, nil, true)
		luaObject.waterLvl = ZombRand(luaObject.waterNeeded, luaObject.waterNeededMax or 100)
	end

	isoObject:setName(luaObject.objectName)
	isoObject:setSprite(luaObject.spriteName)
	luaObject:toModData(isoObject:getModData())
	noise('created luaObject from pre-existing isoObject '..luaObject.x..','..luaObject.y)
end

local function NewBroccoli(isoObject)
	NewPlant(isoObject, "Broccoli")
end

local function NewCarrots(isoObject)
	NewPlant(isoObject, "Carrots")
end

local function NewCabbages(isoObject)
	NewPlant(isoObject, "Cabbages")
end

local function NewRadishes(isoObject)
	NewPlant(isoObject, "Radishes")
end

local function NewStrawberry(isoObject)
	NewPlant(isoObject, "Strawberry plant")
end

local function NewPotatoes(isoObject)
	NewPlant(isoObject, "Potatoes")
end

local function NewTomato(isoObject)
	NewPlant(isoObject, "Tomato")
end

local function NewCoffee(isoObject)
	NewPlant(isoObject, "Coffee")
end

local function NewLeek(isoObject)
	NewPlant(isoObject, "Leek")
end

local function NewLettuce(isoObject)
	NewPlant(isoObject, "Lettuce")
end

local function NewOnion(isoObject)
	NewPlant(isoObject, "Onion")
end

local function NewPeanut(isoObject)
	NewPlant(isoObject, "Peanut")
end

local function NewPumpkin(isoObject)
	NewPlant(isoObject, "Pumpkin")
end

local function NewWatermelon(isoObject)
	NewPlant(isoObject, "Watermelon")
end

local function NewZucchini(isoObject)
	NewPlant(isoObject, "Zucchini")
end

local function NewCorn(isoObject)
	NewPlant(isoObject, "Corn")
end

local function NewRice(isoObject)
	NewPlant(isoObject, "Rice")
end

local function NewBean(isoObject)
	NewPlant(isoObject, "Bean")
end

local function NewBellPepper(isoObject)
	NewPlant(isoObject, "BellPepper")
end

local function NewEggplant(isoObject)
	NewPlant(isoObject, "Eggplant")
end

local function NewWheat(isoObject)
	NewPlant(isoObject, "Wheat")
end

local function NewSugarcane(isoObject)
	NewPlant(isoObject, "Sugarcane")
end

local function NewSunflower(isoObject)
	NewPlant(isoObject, "Sunflower")
end

local function NewTobacco(isoObject)
	NewPlant(isoObject, "Tobacco")
end

local function NewGrape(isoObject)
	NewPlant(isoObject, "Grape")
end

local function NewPea(isoObject)
	NewPlant(isoObject, "Pea")
end

local function NewLemon(isoObject)
	NewPlant(isoObject, "Lemon")
end

local function NewOrange(isoObject)
	NewPlant(isoObject, "Orange")
end

local function NewApple(isoObject)
	NewPlant(isoObject, "Apple")
end

local function NewPear(isoObject)
	NewPlant(isoObject, "Pear")
end

local function NewPeach(isoObject)
	NewPlant(isoObject, "Peach")
end

local function NewBanana(isoObject)
	NewPlant(isoObject, "Banana")
end

local function NewCherry(isoObject)
	NewPlant(isoObject, "Cherry")
end

local function NewPineapple(isoObject)
	NewPlant(isoObject, "Pineapple")
end

local function NewLime(isoObject)
	NewPlant(isoObject, "Lime")
end

local function NewAvocado(isoObject)
	NewPlant(isoObject, "Avocado")
end

local function NewChili(isoObject)
	NewPlant(isoObject, "Chili")
end

local function NewJalapeno(isoObject)
	NewPlant(isoObject, "Jalapeno")
end

local function NewHabanero(isoObject)
	NewPlant(isoObject, "Habanero")
end

local function NewMango(isoObject)
	NewPlant(isoObject, "Mango")
end

local function NewGrapeFruit(isoObject)
	NewPlant(isoObject, "GrapeFruit")
end

local PRIORITY = 5

MapObjects.OnNewWithSprite("vegetation_farming_01_1", NewPlow, PRIORITY)
MapObjects.OnNewWithSprite("vegetation_farming_01_13", NewDestroyed, PRIORITY)
MapObjects.OnNewWithSprite("vegetation_farming_01_14", NewDestroyed, PRIORITY)
MapObjects.OnNewWithSprite("LegourmetFarming_02_33", NewDestroyed, PRIORITY)
MapObjects.OnNewWithSprite("LegourmetFarming_02_37", NewDestroyed, PRIORITY)
MapObjects.OnNewWithSprite("LegourmetFarming_02_34", NewDestroyed, PRIORITY)
MapObjects.OnNewWithSprite("LegourmetFarming_02_38", NewDestroyed, PRIORITY)
MapObjects.OnNewWithSprite("LegourmetFarming_02_41", NewDestroyed, PRIORITY)
MapObjects.OnNewWithSprite("LegourmetFarming_02_50", NewDestroyed, PRIORITY)
MapObjects.OnNewWithSprite("LegourmetFarming_03_50", NewDestroyed, PRIORITY)
MapObjects.OnNewWithSprite("LegourmetFarming_03_52", NewDestroyed, PRIORITY)
MapObjects.OnNewWithSprite("LegourmetFarming_03_54", NewDestroyed, PRIORITY)
MapObjects.OnNewWithSprite("LegourmetFarming_03_55", NewDestroyed, PRIORITY)
MapObjects.OnNewWithSprite("LegourmetFarming_03_57", NewDestroyed, PRIORITY)
MapObjects.OnNewWithSprite("LegourmetFarming_03_59", NewDestroyed, PRIORITY)
MapObjects.OnNewWithSprite("LegourmetFarming_03_77", NewDestroyed, PRIORITY)
MapObjects.OnNewWithSprite("LegourmetFarming_02_69", NewDestroyed, PRIORITY)
MapObjects.OnNewWithSprite("LegourmetFarming_01_72", NewDestroyed, PRIORITY)
MapObjects.OnNewWithSprite("vegetation_farming_01_4", NewDestroyed, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Broccoli, NewBroccoli, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Cabbages, NewCabbages, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Carrots, NewCarrots, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Potatoes, NewPotatoes, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Radishes, NewRadishes, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite["Strawberry plant"], NewStrawberry, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Tomato, NewTomato, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Coffee, NewCoffee, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Leek, NewLeek, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Lettuce, NewLettuce, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Onion, NewOnion, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Peanut, NewPeanut, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Pumpkin, NewPumpkin, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Watermelon, NewWatermelon, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Zucchini, NewZucchini, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Corn, NewCorn, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Rice, NewRice, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Bean, NewBean, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.BellPepper, NewBellPepper, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Eggplant, NewEggplant, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Wheat, NewWheat, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Sugarcane, NewSugarcane, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Sunflower, NewSunflower, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Grape, NewGrape, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Pea, NewPea, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Lemon, NewLemon, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Orange, NewOrange, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Apple, NewApple, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Pear, NewPear, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Peach, NewPeach, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Banana, NewBanana, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Cherry, NewCherry, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Pineapple, NewPineapple, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Lime, NewLime, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Avocado, NewAvocado, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Chili, NewChili, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Habanero, NewHabanero, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Jalapeno, NewJalapeno, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Tobacco, NewTobacco, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.Mango, NewMango, PRIORITY)
MapObjects.OnNewWithSprite(farming_vegetableconf.sprite.GrapeFruit, NewGrapeFruit, PRIORITY)

-- -- -- -- --

local function LoadPlow(isoObject)
	if not SFarmingSystem.instance:isValidIsoObject(isoObject) then
		noise("couldn't find valid modData for existing isoObject; recreating it")
		NewPlow(isoObject)
	end
	SFarmingSystem.instance:loadIsoObject(isoObject)
end

local function LoadDestroyed(isoObject)
	if not SFarmingSystem.instance:isValidIsoObject(isoObject) then
		noise("couldn't find valid modData for existing isoObject; recreating it")
		NewDestroyed(isoObject)
	end
	SFarmingSystem.instance:loadIsoObject(isoObject)
end

local function LoadPlant(isoObject, typeOfSeed)
	if not SFarmingSystem.instance:isValidIsoObject(isoObject) then
		noise("couldn't find valid modData for existing isoObject; recreating it")
		NewPlant(isoObject, typeOfSeed)
	end
	SFarmingSystem.instance:loadIsoObject(isoObject)
end

local function LoadBroccoli(isoObject)
	LoadPlant(isoObject, "Broccoli")
end

local function LoadCarrots(isoObject)
	LoadPlant(isoObject, "Carrots")
end

local function LoadCabbages(isoObject)
	LoadPlant(isoObject, "Cabbages")
end

local function LoadRadishes(isoObject)
	LoadPlant(isoObject, "Radishes")
end

local function LoadStrawberry(isoObject)
	LoadPlant(isoObject, "Strawberry plant")
end

local function LoadPotatoes(isoObject)
	LoadPlant(isoObject, "Potatoes")
end

local function LoadTomato(isoObject)
	LoadPlant(isoObject, "Tomato")
end

local function LoadCoffee(isoObject)
	LoadPlant(isoObject, "Coffee")
end

local function LoadLeek(isoObject)
	LoadPlant(isoObject, "Leek")
end

local function LoadLettuce(isoObject)
	LoadPlant(isoObject, "Lettuce")
end

local function LoadOnion(isoObject)
	LoadPlant(isoObject, "Onion")
end

local function LoadPeanut(isoObject)
	LoadPlant(isoObject, "Peanut")
end

local function LoadPumpkin(isoObject)
	LoadPlant(isoObject, "Pumpkin")
end

local function LoadWatermelon(isoObject)
	LoadPlant(isoObject, "Watermelon")
end

local function LoadZucchini(isoObject)
	LoadPlant(isoObject, "Zucchini")
end

local function LoadCorn(isoObject)
	LoadPlant(isoObject, "Corn")
end

local function LoadRice(isoObject)
	LoadPlant(isoObject, "Rice")
end

local function LoadBean(isoObject)
	LoadPlant(isoObject, "Bean")
end

local function LoadBellPepper(isoObject)
	LoadPlant(isoObject, "BellPepper")
end

local function LoadEggplant(isoObject)
	LoadPlant(isoObject, "Eggplant")
end

local function LoadWheat(isoObject)
	LoadPlant(isoObject, "Wheat")
end

local function LoadSugarcane(isoObject)
	LoadPlant(isoObject, "Sugarcane")
end

local function LoadSunflower(isoObject)
	LoadPlant(isoObject, "Sunflower")
end

local function LoadPea(isoObject)
	LoadPlant(isoObject, "Pea")
end

local function LoadLemon(isoObject)
	LoadPlant(isoObject, "Lemon")
end

local function LoadOrange(isoObject)
	LoadPlant(isoObject, "Orange")
end

local function LoadApple(isoObject)
	LoadPlant(isoObject, "Apple")
end

local function LoadPear(isoObject)
	LoadPlant(isoObject, "Pear")
end

local function LoadPeach(isoObject)
	LoadPlant(isoObject, "Peach")
end

local function LoadBanana(isoObject)
	LoadPlant(isoObject, "Banana")
end

local function LoadCherry(isoObject)
	LoadPlant(isoObject, "Cherry")
end

local function LoadPineapple(isoObject)
	LoadPlant(isoObject, "Pineapple")
end

local function LoadLime(isoObject)
	LoadPlant(isoObject, "Lime")
end

local function LoadAvocado(isoObject)
	LoadPlant(isoObject, "Avocado")
end

local function LoadChili(isoObject)
	LoadPlant(isoObject, "Chili")
end

local function LoadJalapeno(isoObject)
	LoadPlant(isoObject, "Jalapeno")
end

local function LoadHabanero(isoObject)
	LoadPlant(isoObject, "Habanero")
end

local function LoadGrape(isoObject)
	LoadPlant(isoObject, "Grape")
end

local function LoadTobacco(isoObject)
	LoadPlant(isoObject, "Tobacco")
end

local function LoadMango(isoObject)
	LoadPlant(isoObject, "Mango")
end

local function LoadGrapeFruit(isoObject)
	LoadPlant(isoObject, "GrapeFruit")
end

MapObjects.OnLoadWithSprite("vegetation_farming_01_1", LoadPlow, PRIORITY)
MapObjects.OnLoadWithSprite("vegetation_farming_01_13", LoadDestroyed, PRIORITY)
MapObjects.OnLoadWithSprite("vegetation_farming_01_14", LoadDestroyed, PRIORITY)
MapObjects.OnLoadWithSprite("LegourmetFarming_02_33", LoadDestroyed, PRIORITY)
MapObjects.OnLoadWithSprite("LegourmetFarming_02_37", LoadDestroyed, PRIORITY)
MapObjects.OnLoadWithSprite("LegourmetFarming_02_34", LoadDestroyed, PRIORITY)
MapObjects.OnLoadWithSprite("LegourmetFarming_02_38", LoadDestroyed, PRIORITY)
MapObjects.OnLoadWithSprite("LegourmetFarming_02_41", LoadDestroyed, PRIORITY)
MapObjects.OnLoadWithSprite("LegourmetFarming_02_50", LoadDestroyed, PRIORITY)
MapObjects.OnLoadWithSprite("LegourmetFarming_03_50", LoadDestroyed, PRIORITY)
MapObjects.OnLoadWithSprite("LegourmetFarming_03_52", LoadDestroyed, PRIORITY)
MapObjects.OnLoadWithSprite("LegourmetFarming_03_54", LoadDestroyed, PRIORITY)
MapObjects.OnLoadWithSprite("LegourmetFarming_03_55", LoadDestroyed, PRIORITY)
MapObjects.OnLoadWithSprite("LegourmetFarming_03_57", LoadDestroyed, PRIORITY)
MapObjects.OnLoadWithSprite("LegourmetFarming_03_59", LoadDestroyed, PRIORITY)
MapObjects.OnLoadWithSprite("LegourmetFarming_03_77", LoadDestroyed, PRIORITY)
MapObjects.OnLoadWithSprite("LegourmetFarming_02_69", LoadDestroyed, PRIORITY)
MapObjects.OnLoadWithSprite("LegourmetFarming_01_72", LoadDestroyed, PRIORITY)
MapObjects.OnLoadWithSprite("vegetation_farming_01_4", LoadDestroyed, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Broccoli, LoadBroccoli, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Cabbages, LoadCabbages, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Carrots, LoadCarrots, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Potatoes, LoadPotatoes, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Radishes, LoadRadishes, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite["Strawberry plant"], LoadStrawberry, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Tomato, LoadTomato, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Coffee, LoadCoffee, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Leek, LoadLeek, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Lettuce, LoadLettuce, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Onion, LoadOnion, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Peanut, LoadPeanut, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Pumpkin, LoadPumpkin, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Watermelon, LoadWatermelon, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Zucchini, LoadZucchini, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Corn, LoadCorn, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Rice, LoadRice, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Bean, LoadBean, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.BellPepper, LoadBellPepper, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Eggplant, LoadEggplant, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Wheat, LoadWheat, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Sugarcane, LoadSugarcane, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Sunflower, LoadSunflower, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Grape, LoadGrape, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Pea, LoadPea, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Lemon, LoadLemon, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Orange, LoadOrange, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Apple, LoadApple, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Pear, LoadPear, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Peach, LoadPeach, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Banana, LoadBanana, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Cherry, LoadCherry, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Pineapple, LoadPineapple, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Lime, LoadLime, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Avocado, LoadAvocado, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Chili, LoadChili, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Jalapeno, LoadJalapeno, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Habanero, LoadHabanero, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Tobacco, LoadTobacco, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.Mango, LoadMango, PRIORITY)
MapObjects.OnLoadWithSprite(farming_vegetableconf.sprite.GrapeFruit, LoadGrapeFruit, PRIORITY)
