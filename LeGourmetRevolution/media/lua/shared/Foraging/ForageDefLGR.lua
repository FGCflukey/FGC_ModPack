require "Foraging/forageDefinitions"

scavenges.Seeds = {};
scavenges.Metals = {};
scavenges.Mining = {};
--local icons = {
--	Dyes = getTexture("media/textures/Foraging/pinIconDyes.png"),
--};
local function iterList(_list)
	local list = _list;
	local size = list:size() - 1;
	local i = -1;
	return function()
		i = i + 1;
		if i <= size and not list:isEmpty() then
			return list:get(i), i;
		end;
	end;
end

local function doGenericItemSpawnB(_character, _inventory, _itemDef, _items)
	for item in iterList(_items) do
		if item:IsDrainable() then
			item:setUsedDelta(ZombRandFloat(0.0, 1.0)); -- Randomize the item uses remaining
		end;
		local conditionMax = item:getConditionMax();
		if conditionMax > 0 then
			item:setCondition(ZombRand(conditionMax) + 1); -- Randomize the weapon condition
		end;
	end;
	return _items; --custom spawn scripts must return an arraylist of items (or nil)
end

local function doJunkWeaponSpawnB(_character, _inventory, _itemDef, _items)
	for item in iterList(_items) do
		local conditionMax = item:getConditionMax();
		if conditionMax > 0 then
			item:setCondition(ZombRand(conditionMax) + 1); -- Randomize the weapon condition
		end;
	end;
	return _items; --custom spawn scripts must return an arraylist of items (or nil)
end

if not forageDefaultDefs.defaultItemDef.itemHands then
	forageDefaultDefs.defaultItemDef.itemHands = {}
end

if not forageDefaultDefs.defaultItemDef.weaponHands then
	forageDefaultDefs.defaultItemDef.weaponHands = {}
end

if forageSkills then
	forageSkills.Detectorist = {
		name                    = "Detectorist",
		type                    = "trait",
		visionBonus             = 0.2,
		weatherEffect           = 0,
		darknessEffect          = 0,
		specialisations         = {
			["Trash"]               = 30,
			["Junk"]                = 30,
			["Metals"]              = 100,
		},
	}
	forageSkills.Caveman = {
		name                    = "Caveman",
		type                    = "trait",
		visionBonus             = 0,
		weatherEffect           = 0,
		darknessEffect          = 0,
		specialisations         = {
			["Stones"]               = 10,
			["Firewood"]             = 10,
		},
	}
	forageSkills.HunterExpert = {
		name                    = "HunterExpert",
		type                    = "trait",
		visionBonus             = 0,
		weatherEffect           = 0,
		darknessEffect          = 0,
		specialisations         = {
			["DeadAnimals"]               = 5,
			["Animals"]               = 5,
		},
	}
	forageSkills.farmerexp = {
		name                    = "farmerexp",
		type                    = "trait",
		visionBonus             = 0,
		weatherEffect           = 0,
		darknessEffect          = 0,
		specialisations         = {
			["Seeds"]               = 10,
			["Fruits"]              = 5,
			["Vegetables"]          = 5,
		},
	}

end

local function addSpecDef(_tname, _tspec, value)
	if forageSkills then
		if forageSkills[_tname] then
			if forageSkills[_tname].specialisations then
				if not forageSkills[_tname].specialisations[_tspec] then
					forageSkills[_tname].specialisations[_tspec] = value;
				end
			end
		end
	end
end

addSpecDef("unemployed", "Metals", 10)
addSpecDef("repairman", "Metals", 33)
addSpecDef("mechanics", "Metals", 33)
addSpecDef("electrician", "Metals", 20)
addSpecDef("engineer", "Metals", 10)
addSpecDef("metalworker", "Metals", 50)
addSpecDef("constructionworker", "Metals", 10)
addSpecDef("farmer", "Seeds", 15)
addSpecDef("Gardener", "Seeds", 10)
addSpecDef("Herbalist", "Seeds", 10)
addSpecDef("Formerscout", "Mining", 10)
addSpecDef("Hiker", "Mining", 10)


if forageCategories then
	forageCategories["Seeds"] = {
		name                    = "Seeds",
		typeCategory            = "Other",
		identifyCategoryPerk    = "PlantScavenging",
		identifyCategoryLevel   = 3,
		categoryHidden          = false,
		validFloors             = { "floors_exterior_natural", "blends_natural" },
		zoneChance              = {
            DeepForest      = 25,
            Forest          = 20,
            Vegitation      = 30,
            FarmLand        = 35,
            Farm            = 35,
            TrailerPark     = 10,
            TownZone        = 0,
            Nav             = 0,
		},
		focusChanceMin			= 10.0,
		focusChanceMax			= 25.0,
	}
	forageCategories["Metals"] = {
		name                    = "Metals",
		typeCategory            = "Other",
		identifyCategoryPerk    = "PlantScavenging",
		identifyCategoryLevel   = 4,
		categoryHidden          = false,
        validFloors = { "ANY" },
        zoneChance = {
            DeepForest      = 20,
            Forest          = 20,
            Vegitation      = 20,
            FarmLand        = 20,
            Farm            = 20,
            TrailerPark     = 60,
            TownZone        = 60,
            Nav             = 50,
        },
		focusChanceMin			= 15.0,
		focusChanceMax			= 33.0,
	}
	forageCategories["Mining"] = {
		name                    = "Mining",
		typeCategory            = "Other",
		identifyCategoryPerk    = "PlantScavenging",
		identifyCategoryLevel   = 5,
		categoryHidden          = false,
        validFloors = { "floors_exterior_natural", "blends_natural" },
        zoneChance = {
            DeepForest      = 30,
            Forest          = 25,
            Vegitation      = 20,
            FarmLand        = 10,
            Farm            = 10,
            TrailerPark     = 0,
            TownZone        = 0,
            Nav             = 0,
        },
		focusChanceMin			= 15.0,
		focusChanceMax			= 33.0,
	}
end


if forageDefs then

	-- Seeds
	forageDefs.UnknownSeed = {
		type = "legourmetfarming.UnknownSeed",
		minCount = 1,
		maxCount = 5,
		skill = 0,
		perks       = { "PlantScavenging" },
		chance      = 80,
		xp          = 2,
		rainChance  = 0,
		snowChance  = -10,
		recipes     = { "Herbalist" },
		categories  = { "Seeds" },
        zones = {
            Forest      = 5,
            DeepForest  = 5,
            FarmLand    = 15,
            Farm        = 15,
			Vegitation  = 5,
        },
		months      = { 3, 4, 5, 6, 7, 8, 9, 10, 11 },
		bonusMonths = { 7, 8, 9 },
		malusMonths = { 3, 4 },
		spawnFunc	= nil,
	}

	forageDefs.CafeSeed = {
		type = "legourmetfarming.CafeSeed",
		minCount = 1,
		maxCount = 3,
		skill = 6,
		perks       = { "PlantScavenging" },
		chance      = 30,
		xp          = 2,
		rainChance  = 0,
		snowChance  = -10,
		recipes     = { "Herbalist" },
		categories  = { "Seeds" },
        zones = {
            Forest      = 5,
            DeepForest  = 5,
            FarmLand    = 15,
            Farm        = 15,
			Vegitation  = 5,
        },
		months      = { 3, 4, 5, 6, 7, 8, 9, 10, 11 },
		bonusMonths = { 7, 8, 9 },
		malusMonths = { 3, 4 },
		spawnFunc	= nil,
	}

	forageDefs.MustardSeeds = {
		type = "Base.MustardSeeds",
		minCount = 1,
		maxCount = 3,
		skill = 3,
		perks       = { "PlantScavenging" },
		chance      = 2,
		xp          = 2,
		rainChance  = 0,
		snowChance  = -10,
		recipes     = { "Herbalist" },
		categories  = { "Seeds" },
        zones = {
            Forest      = 2,
            DeepForest  = 2,
            FarmLand    = 5,
            Farm        = 5,
			Vegitation  = 2,
        },
		months      = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
		bonusMonths = {},
		malusMonths = { 1, 2, 3, 4 },
		spawnFunc	= nil,
	}

	-- Metals
	forageDefs.TinCanEmpty = {
		type = "Base.TinCanEmpty",
		minCount = 1,
		maxCount = 1,
		skill = 0,
		perks       = { "PlantScavenging" },
		chance      = 10,
		xp          = 2,
		rainChance  = 0,
		snowChance  = -10,
		itemHands    = { "MetalDetector" },
		recipes     = {},
		categories  = { "Metals" },
        zones = {
            Forest      = 10,
            DeepForest  = 10,
			Vegitation  = 10,
            FarmLand    = 10,
            Farm        = 10,
			TownZone    = 10,
			TrailerPark = 10,
			Nav         = 10,
        },
		months      = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
		bonusMonths = {},
		malusMonths = {},
		spawnFunc	= nil,
	}

	forageDefs.RustyPaperclip = {
		type = "AdvancedFishing.RustyPaperclip",
		minCount = 1,
		maxCount = 1,
		skill = 1,
		perks       = { "PlantScavenging" },
		chance      = 15,
		xp          = 2,
		rainChance  = 0,
		snowChance  = -10,
		itemHands    = { "MetalDetector" },
		recipes     = {},
		categories  = { "Metals" },
        zones = {
            Forest      = 10,
            DeepForest  = 10,
			Vegitation  = 10,
            FarmLand    = 10,
            Farm        = 10,
			TownZone    = 10,
			TrailerPark = 10,
			Nav         = 10,
        },
		months      = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
		bonusMonths = {},
		malusMonths = {},
		spawnFunc	= nil,
	}

	forageDefs.HiddenBox = {
		type = "AdvancedFishing.HiddenBox",
		minCount = 1,
		maxCount = 1,
		skill = 1,
		perks       = { "PlantScavenging" },
		chance      = 10,
		xp          = 5,
		rainChance  = 0,
		snowChance  = -10,
		itemHands    = { "MetalDetector" },
		recipes     = {},
		categories  = { "Metals" },
        zones = {
            Forest      = 10,
            DeepForest  = 10,
			Vegitation  = 10,
            FarmLand    = 10,
            Farm        = 10,
			TownZone    = 10,
			TrailerPark = 10,
			Nav         = 10,
        },
		months      = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
		bonusMonths = {},
		malusMonths = {},
		spawnFunc	= nil,
	}

	forageDefs.RustySmallHook = {
		type = "AdvancedFishing.RustySmallHook",
		minCount = 1,
		maxCount = 1,
		skill = 4,
		perks       = { "PlantScavenging" },
		chance      = 30,
		xp          = 2,
		rainChance  = 0,
		snowChance  = -10,
		itemHands    = { "MetalDetector" },
		recipes     = {},
		categories  = { "Metals" },
        zones = {
            Forest      = 10,
            DeepForest  = 10,
			Vegitation  = 10,
            FarmLand    = 10,
            Farm        = 10,
			TownZone    = 10,
			TrailerPark = 10,
			Nav         = 10,
        },
		months      = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
		bonusMonths = {},
		malusMonths = {},
		spawnFunc	= nil,
	}

	forageDefs.RustySmallSheetMetal = {
		type = "AdvancedFishing.RustySmallSheetMetal",
		minCount = 1,
		maxCount = 2,
		skill = 3,
		perks       = { "PlantScavenging" },
		chance      = 20,
		xp          = 2,
		rainChance  = 0,
		snowChance  = -10,
		itemHands    = { "MetalDetector" },
		recipes     = {},
		categories  = { "Metals" },
        zones = {
            Forest      = 10,
            DeepForest  = 10,
			Vegitation  = 10,
            FarmLand    = 10,
            Farm        = 10,
			TownZone    = 10,
			TrailerPark = 10,
			Nav         = 10,
        },
		months      = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
		bonusMonths = {},
		malusMonths = {},
		spawnFunc	= nil,
	}

	forageDefs.RustySheetMetal = {
		type = "AdvancedFishing.RustySheetMetal",
		minCount = 1,
		maxCount = 2,
		skill = 4,
		perks       = { "PlantScavenging" },
		chance      = 20,
		xp          = 5,
		rainChance  = 0,
		snowChance  = -10,
		itemHands    = { "MetalDetector" },
		recipes     = {},
		categories  = { "Metals" },
        zones = {
            Forest      = 10,
            DeepForest  = 10,
			Vegitation  = 10,
            FarmLand    = 10,
            Farm        = 10,
			TownZone    = 10,
			TrailerPark = 10,
			Nav         = 10,
        },
		months      = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
		bonusMonths = {},
		malusMonths = {},
		spawnFunc	= nil,
	}

	forageDefs.RustyMediumHook = {
		type = "AdvancedFishing.RustyMediumHook",
		minCount = 1,
		maxCount = 2,
		skill = 5,
		perks       = { "PlantScavenging" },
		chance      = 10,
		xp          = 10,
		rainChance  = 0,
		snowChance  = -10,
		itemHands    = { "MetalDetector" },
		recipes     = {},
		categories  = { "Metals" },
        zones = {
            Forest      = 10,
            DeepForest  = 10,
			Vegitation  = 10,
            FarmLand    = 10,
            Farm        = 10,
			TownZone    = 10,
			TrailerPark = 10,
			Nav         = 10,
        },
		months      = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
		bonusMonths = {},
		malusMonths = {},
		spawnFunc	= nil,
	}

	forageDefs.RustyBigHook = {
		type = "AdvancedFishing.RustyBigHook",
		minCount = 1,
		maxCount = 1,
		skill = 6,
		perks       = { "PlantScavenging" },
		chance      = 10,
		xp          = 2,
		rainChance  = 0,
		snowChance  = -10,
		itemHands    = { "MetalDetector" },
		recipes     = {},
		categories  = { "Metals" },
        zones = {
            Forest      = 10,
            DeepForest  = 10,
			Vegitation  = 10,
            FarmLand    = 10,
            Farm        = 10,
			TownZone    = 10,
			TrailerPark = 10,
			Nav         = 10,
        },
		months      = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
		bonusMonths = {},
		malusMonths = {},
		spawnFunc	= nil,
	}

	forageDefs.RustyMetalBar = {
		type = "AdvancedFishing.RustyMetalBar",
		minCount = 1,
		maxCount = 1,
		skill = 4,
		perks       = { "PlantScavenging" },
		chance      = 5,
		xp          = 2,
		rainChance  = 0,
		snowChance  = -10,
		itemHands    = { "MetalDetector" },
		recipes     = {},
		categories  = { "Metals" },
        zones = {
            Forest      = 10,
            DeepForest  = 10,
			Vegitation  = 10,
            FarmLand    = 10,
            Farm        = 10,
			TownZone    = 10,
			TrailerPark = 10,
			Nav         = 10,
        },
		months      = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
		bonusMonths = {},
		malusMonths = {},
		spawnFunc	= nil,
	}

	forageDefs.RustyBarbedWire = {
		type = "AdvancedFishing.RustyBarbedWire",
		minCount = 1,
		maxCount = 1,
		skill = 7,
		perks       = { "PlantScavenging" },
		chance      = 10,
		xp          = 2,
		rainChance  = 0,
		snowChance  = -10,
		itemHands    = { "MetalDetector" },
		recipes     = {},
		categories  = { "Metals" },
        zones = {
            Forest      = 10,
            DeepForest  = 10,
			Vegitation  = 10,
            FarmLand    = 10,
            Farm        = 10,
			TownZone    = 10,
			TrailerPark = 10,
			Nav         = 10,
        },
		months      = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
		bonusMonths = {},
		malusMonths = {},
		spawnFunc	= nil,
	}

	forageDefs.RustyMetalPipe = {
		type = "AdvancedFishing.RustyMetalPipe",
		minCount = 1,
		maxCount = 1,
		skill = 7,
		perks       = { "PlantScavenging" },
		chance      = 5,
		xp          = 2,
		rainChance  = 0,
		snowChance  = -10,
		itemHands    = { "MetalDetector" },
		recipes     = {},
		categories  = { "Metals" },
        zones = {
            Forest      = 10,
            DeepForest  = 10,
			Vegitation  = 10,
            FarmLand    = 10,
            Farm        = 10,
			TownZone    = 10,
			TrailerPark = 10,
			Nav         = 10,
        },
		months      = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
		bonusMonths = {},
		malusMonths = {},
		spawnFunc	= nil,
	}

	forageDefs.RustyWire = {
		type = "AdvancedFishing.RustyWire",
		minCount = 1,
		maxCount = 1,
		skill = 8,
		perks       = { "PlantScavenging" },
		chance      = 10,
		xp          = 2,
		rainChance  = 0,
		snowChance  = -10,
		itemHands    = { "MetalDetector" },
		recipes     = {},
		categories  = { "Metals" },
        zones = {
            Forest      = 10,
            DeepForest  = 10,
			Vegitation  = 10,
            FarmLand    = 10,
            Farm        = 10,
			TownZone    = 10,
			TrailerPark = 10,
			Nav         = 10,
        },
		months      = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
		bonusMonths = {},
		malusMonths = {},
		spawnFunc	= nil,
	}

	forageDefs.RustyEngineParts = {
		type = "AdvancedFishing.RustyEngineParts",
		minCount = 1,
		maxCount = 5,
		skill = 7,
		perks       = { "PlantScavenging" },
		chance      = 30,
		xp          = 2,
		rainChance  = 0,
		snowChance  = -10,
		itemHands    = { "MetalDetector" },
		recipes     = {},
		categories  = { "Metals" },
        zones = {
            Forest      = 10,
            DeepForest  = 10,
			Vegitation  = 10,
            FarmLand    = 10,
            Farm        = 10,
			TownZone    = 10,
			TrailerPark = 10,
			Nav         = 10,
        },
		months      = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
		bonusMonths = {},
		malusMonths = {},
		spawnFunc	= nil,
	}

	forageDefs.SmallSheetMetal = {
		type = "Base.SmallSheetMetal",
		minCount = 1,
		maxCount = 1,
		skill = 10,
		perks       = { "PlantScavenging" },
		chance      = 30,
		xp          = 5,
		rainChance  = 0,
		snowChance  = -10,
		itemHands    = { "MetalDetector" },
		recipes     = {},
		categories  = { "Metals" },
        zones = {
            Forest      = 10,
            DeepForest  = 10,
			Vegitation  = 10,
            FarmLand    = 10,
            Farm        = 10,
			TownZone    = 10,
			TrailerPark = 10,
			Nav         = 10,
        },
		months      = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
		bonusMonths = {},
		malusMonths = {},
		spawnFunc	= nil,
	}

	-- Mining
	forageDefs.SaltStone = {
		type = "Base.SaltStone",
		minCount = 1,
		maxCount = 2,
		skill = 4,
		perks       = { "PlantScavenging" },
		chance      = 10,
		xp          = 2,
		rainChance  = 0,
		snowChance  = -10,
		weaponHands    = { "PickAxe", "StonePickaxe" },
		recipes     = {},
		categories  = { "Mining" },
        zones = {
            Forest      = 10,
            DeepForest  = 10,
			Vegitation  = 10,
        },
		months      = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
		bonusMonths = {},
		malusMonths = {},
		spawnFunc	= nil,
	}

	forageDefs.Gypsum1 = {
		type = "Mining.Gypsum1",
		minCount = 1,
		maxCount = 1,
		skill = 6,
		perks       = { "PlantScavenging" },
		chance      = 30,
		xp          = 5,
		rainChance  = 0,
		snowChance  = -10,
		weaponHands    = { "PickAxe", "StonePickaxe" },
		recipes     = {},
		categories  = { "Mining" },
        zones = {
            Forest      = 10,
            DeepForest  = 10,
			Vegitation  = 10,
        },
		months      = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
		bonusMonths = {},
		malusMonths = {},
		spawnFunc	= nil,
	}

	forageDefs.SulfurStone = {
		type = "Mining.SulfurStone",
		minCount = 1,
		maxCount = 1,
		skill = 8,
		perks       = { "PlantScavenging" },
		chance      = 30,
		xp          = 5,
		rainChance  = 0,
		snowChance  = -10,
		weaponHands    = { "PickAxe", "StonePickaxe" },
		recipes     = {},
		categories  = { "Mining" },
        zones = {
            Forest      = 10,
            DeepForest  = 10,
			Vegitation  = 10,
        },
		months      = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
		bonusMonths = {},
		malusMonths = {},
		spawnFunc	= nil,
	}

	forageDefs.PotassiumNitrate = {
		type = "Mining.PotassiumNitrate",
		minCount = 1,
		maxCount = 1,
		skill = 10,
		perks       = { "PlantScavenging" },
		chance      = 30,
		xp          = 5,
		rainChance  = 0,
		snowChance  = -10,
		weaponHands = { "PickAxe", "StonePickaxe" },
		recipes     = {},
		categories  = { "Mining" },
        zones = {
            Forest      = 10,
            DeepForest  = 10,
			Vegitation  = 10,
        },
		months      = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
		bonusMonths = {},
		malusMonths = {},
		spawnFunc	= nil,
	}
	
	--Fruits
    forageDefs.GreenOlives2 = {
        type        = "legourmet.GreenOlives2",
        minCount    = 1,
        maxCount    = 3,
        skill       = 4,
        perks       = { "PlantScavenging" },
        chance      = 5,
        xp          = 2,
        rainChance  = 0,
        snowChance  = -10,
        categories  = { "Fruits" },
        zones = {
            Forest      = 5,
            DeepForest  = 5,
            FarmLand    = 15,
            Farm        = 15,
        },
        months      = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
        bonusMonths = { 1, 2, 12 },
        malusMonths = { 3, 4, 10, 11 },
        spawnFunc   = doWildFoodSpawn,
    }

	--Medicinal Plants
    forageDefs.Pepperplant = {
        type        = "Base.Pepperplant",
        minCount    = 1,
        maxCount    = 2,
        skill       = 4,
        perks       = { "PlantScavenging" },
        chance      = 5,
        xp          = 2,
        rainChance  = 10,
        snowChance  = -10,
        categories  = { "MedicinalPlants" },
        zones = {
            Forest      = 10,
            DeepForest  = 15,
            Vegitation  = 5,
            FarmLand    = 5,
            Farm        = 5,
        },
        months      = { 3, 4, 5, 6, 7, 8, 9, 10, 11 },
        bonusMonths = { 5, 6, 7 },
        malusMonths = { 3, 4 },
        spawnFunc   = doWildFoodSpawn,
    }

    forageDefs.Mint = {
        type        = "legourmet.Mint",
        minCount    = 1,
        maxCount    = 3,
        skill       = 2,
        perks       = { "PlantScavenging" },
        chance      = 10,
        xp          = 2,
        rainChance  = 10,
        snowChance  = -10,
        categories  = { "MedicinalPlants" },
        zones = {
            Forest      = 10,
            DeepForest  = 15,
            Vegitation  = 5,
            FarmLand    = 5,
            Farm        = 5,
        },
        months      = { 3, 4, 5, 6, 7, 8, 9, 10, 11 },
        bonusMonths = { 5, 6, 7 },
        malusMonths = { 3, 4 },
        spawnFunc   = doWildFoodSpawn,
    }

    forageDefs.Garlic = {
        type        = "legourmet.Garlic",
        minCount    = 1,
        maxCount    = 1,
        skill       = 7,
        perks       = { "PlantScavenging" },
        chance      = 10,
        xp          = 2,
        rainChance  = 10,
        snowChance  = -10,
        categories  = { "MedicinalPlants" },
        zones = {
            Forest      = 10,
            DeepForest  = 15,
            Vegitation  = 5,
            FarmLand    = 5,
            Farm        = 5,
        },
        months      = { 3, 4, 5, 6, 7, 8, 9, 10, 11 },
        bonusMonths = { 5, 6, 7 },
        malusMonths = { 3, 4 },
        spawnFunc   = doWildFoodSpawn,
    }

    forageDefs.MelisaHerb = {
        type        = "Base.MelisaHerb",
        minCount    = 1,
        maxCount    = 2,
        skill       = 6,
        perks       = { "PlantScavenging" },
        chance      = 10,
        xp          = 2,
        rainChance  = 0,
        snowChance  = -10,
        recipes     = { "Herbalist" },
        categories  = { "MedicinalPlants" },
        zones = {
            Forest      = 10,
            DeepForest  = 15,
        },
        months      = { 3, 4, 5, 6, 7, 8, 9, 10, 11 },
        bonusMonths = { 7, 8, 9 },
        malusMonths = { 3, 4 },
    }

    forageDefs.Tobacco = {
        type        = "legourmetfarming.Tobacco",
        minCount    = 1,
        maxCount    = 2,
        skill       = 7,
        perks       = { "PlantScavenging" },
        chance      = 10,
        xp          = 5,
        rainChance  = 0,
        snowChance  = -10,
        recipes     = { "Herbalist" },
        categories  = { "MedicinalPlants" },
        zones = {
            Forest      = 10,
            DeepForest  = 15,
        },
        months      = { 3, 4, 5, 6, 7, 8, 9, 10, 11 },
        bonusMonths = { 7, 8, 9 },
        malusMonths = { 3, 4 },
    }

	-- Animals
    forageDefs.RedWorm = {
        type        = "AdvancedFishing.RedWorm",
        minCount    = 1,
        maxCount    = 2,
        skill       = 3,
        perks       = { "PlantScavenging" },
        chance      = 5,
        xp          = 2,
        rainChance  = 50,
        snowChance  = -20,
		itemTags = { "DigPlow" },
        categories = { "FishBait" },
        zones = {
            Forest      = 10,
            DeepForest  = 15,
            Vegitation  = 5,
            FarmLand    = 5,
            Farm        = 5,
        },
        months      = { 3, 4, 5, 6, 7, 8, 9, 10, 11 },
        bonusMonths = {},
        malusMonths = { 3, 4 },
    }
	
	-- ForestGoods
    forageDefs.SugarcaneDry = {
        type        = "Base.SugarcaneDry",
        minCount    = 1,
        maxCount    = 3,
        skill       = 6,
        perks       = { "PlantScavenging" },
        chance      = 5,
        xp          = 2,
        categories  = { "Firewood" },
        zones = {
            Forest      = 3,
            DeepForest  = 2,
            Vegitation  = 2,
        },
        months      = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
        bonusMonths = { 9, 10, 11 },
        malusMonths = {},
    }

    forageDefs.Sugarcane = {
        type        = "Base.Sugarcane",
        minCount    = 1,
        maxCount    = 3,
        skill       = 5,
        perks       = { "PlantScavenging" },
        chance      = 7,
        xp          = 2,
        categories  = { "Firewood" },
        zones = {
            Forest      = 5,
            DeepForest  = 5,
            Vegitation  = 2,
        },
        months      = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
        bonusMonths = { 9, 10, 11 },
        malusMonths = {},
    }
	--Stone
    forageDefs.SmallStone      = {
        type        = "Base.SmallStone",
        minCount    = 1,
        maxCount    = 3,
        skill       = 0,
        perks       = { "PlantScavenging" },
        chance      = 20,
        xp          = 2,
        rainChance  = 0,
        snowChance  = -10,
        categories  = { "Stones" },
        zones = {
            Forest      = 10,
            DeepForest  = 15,
            Vegitation  = 5,
            FarmLand    = 5,
            Farm        = 5,
        },
        months      = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
        bonusMonths = {},
        malusMonths = {},
    }

	--FOREST RARITIES
    forageDefs.BearTrap       = {
        type       = "Base.BearTrap",
        minCount   = 1,
        maxCount   = 1,
        skill      = 8,
        perks      = { "PlantScavenging" },
        chance     = 1,
        xp         = 10,
        categories = { "ForestRarities" },
        zones = {
            DeepForest  = 5,
        },
        months     = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
    }

	--Trash Items
    forageDefs.BrokenBearTrap       = {
		type       = "Base.BrokenBearTrap",
		minCount   = 1,
		maxCount   = 1,
		skill      = 0,
		perks      = { "PlantScavenging" },
		chance     = 5,
		xp         = 5,
		categories = { "Junk", "Trash", "Metals" },
        zones = {
            Forest      = 10,
            DeepForest  = 15,
            Vegitation  = 5,
            FarmLand    = 5,
            Farm        = 5,
        },
		months     = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
    }

    forageDefs.KnifeDepostador       = {
		type       = "Base.KnifeDepostador",
		minCount   = 1,
		maxCount   = 1,
		skill      = 0,
		perks      = { "PlantScavenging" },
		xp         = 5,
		categories = { "JunkWeapons" },
        zones = {
			DeepForest  = 15,
			Forest      = 15,
			Vegitation  = 15,
			FarmLand    = 15,
			Farm        = 15,
			TrailerPark = 15,
			TownZone    = 15,
			Nav         = 15,
        },
		spawnFuncs = { doJunkWeaponSpawnB },
		forceOutside = false,
		canBeAboveFloor = true,
		itemSizeModifier = 0.5,
		isItemOverrideSize = true,
    }

end

local function generateLGRCustomDefs()
	local magsItems = {
        uncommon = {
            chance = 50,
            xp = 5,
            items = {
				MedicalHose          = "Base.MedicalHose",
                magnifyingglass      = "Base.magnifyingglass",
                HuntingCard1         = "Base.HuntingCard1",
                HuntingCard2         = "Base.HuntingCard2",
                HuntingCard3         = "Base.HuntingCard3",
				HuntingCard4         = "Base.HuntingCard4",
				HuntingCard5         = "Base.HuntingCard5",
				HuntingCard6         = "Base.HuntingCard6",
				HuntingCard7         = "Base.HuntingCard7",
				HuntingCard8         = "Base.HuntingCard8",
				HuntingCard9         = "Base.HuntingCard9",
				HuntingCard10        = "Base.HuntingCard10",
            },
        },
		rare = {
			chance = 15,
			xp = 10,
			items = {
				LGCookingMag         = "Base.LGCookingMag",
				LGCookingMag2        = "Base.LGCookingMag2",
				LGCookingMag3        = "Base.LGCookingMag3",
				LGCookingMag4        = "Base.LGCookingMag4",
				LGCookingMag5        = "Base.LGCookingMag5",
				LGCookingMag6        = "Base.LGCookingMag6",
				LGCookingMag7        = "Base.LGCookingMag7",
				LGCookingMag8        = "Base.LGCookingMag8",
				LGCookingMag9        = "Base.LGCookingMag9",
				LGClimatologyMag     = "Base.LGClimatologyMag",
				FishingEncyclopedia  = "AdvancedFishing.FishingEncyclopedia",
				FishingEncyclopedia2 = "AdvancedFishing.FishingEncyclopedia2",
				FishingEncyclopedia3 = "AdvancedFishing.FishingEncyclopedia3",
				FishingEncyclopedia4 = "AdvancedFishing.FishingEncyclopedia4",
				FishingEncyclopedia5 = "AdvancedFishing.FishingEncyclopedia5",
				SportFishingBook     = "AdvancedFishing.SportFishingBook",
				MiningMag1           = "Mining.MiningMag1",
				SurvivalistMag1      = "Base.SurvivalistMag1",
				SurvivalistMag2      = "Base.SurvivalistMag2",
				SurvivalistMag3      = "Base.SurvivalistMag3",
				SurvivalistMag4      = "Base.SurvivalistMag4",
				SurvivalistMag5      = "Base.SurvivalistMag5",
				SurvivalistMag6      = "Base.SurvivalistMag6",
				EnergyMagazine       = "legourmet.EnergyMagazine",
				DrinksMag2           = "legourmet.DrinksMag2",
				LgFarmMag1           = "legourmetfarming.LgFarmMag1",
			},
		},
		epic = {
			chance = 5,
			xp = 20,
			items = {
				FishingAnglerBook1     = "AdvancedFishing.FishingAnglerBook1",
				FishingAnglerBook2     = "AdvancedFishing.FishingAnglerBook2",
				FishingAnglerBook3     = "AdvancedFishing.FishingAnglerBook3",
				FishingAnglerBook4     = "AdvancedFishing.FishingAnglerBook4",
				FishingAnglerBook5     = "AdvancedFishing.FishingAnglerBook5",
				FishingAnglerBook6     = "AdvancedFishing.FishingAnglerBook6",
				FishingAnglerBook7     = "AdvancedFishing.FishingAnglerBook7",
				LgBinoculars           = "Base.LgBinoculars",
				MetalDetector          = "AdvancedFishing.MetalDetector",
				ManualMeatMincer       = "Base.ManualMeatMincer",
				ElectricMeatMincer     = "Base.ElectricMeatMincer",
				MolinoCoffee           = "Base.MolinoCoffee",
				CheeseMoldEmpty        = "Base.CheeseMoldEmpty",
				CheeseMoldEmpty2       = "Base.CheeseMoldEmpty2",
				CheeseMoldEmpty3       = "Base.CheeseMoldEmpty3",
				WaffleMachine          = "Base.WaffleMachine",
				SeedBook               = "legourmetfarming.SeedBook",
			},
		},
	};
    for _, spawnTable in pairs(magsItems) do
        for itemName, itemFullName in pairs(spawnTable.items) do
            forageDefs[itemName] = {
                type = itemFullName,
                skill = 4,
                xp = spawnTable.xp,
                categories = { "Junk" },
                zones = {
                    Forest      = spawnTable.chance,
                    DeepForest  = spawnTable.chance,
                    Vegitation  = spawnTable.chance,
                    FarmLand    = spawnTable.chance,
                    Farm        = spawnTable.chance,
                    TrailerPark = spawnTable.chance,
                    TownZone    = spawnTable.chance,
                    Nav         = spawnTable.chance,
                },
                spawnFuncs = { doJunkWeaponSpawn },
                forceOutside = false,
                canBeAboveFloor = true,
            };
        end;
    end;
	local AnotherJunkItems = {
		rare = {
			chance = 15,
			xp = 5,
			items = {
				StormFlutterstick    = "AdvancedFishing.StormFlutterstick",
				RattlinRap           = "AdvancedFishing.RattlinRap",
				SwimJig              = "AdvancedFishing.SwimJig",
				SwimJig2             = "AdvancedFishing.SwimJig2",
				SwimJig3             = "AdvancedFishing.SwimJig3",
				GTPopper             = "AdvancedFishing.GTPopper",
				SpoonLure1           = "AdvancedFishing.SpoonLure1",
				SpoonLure2           = "AdvancedFishing.SpoonLure2",
				SpoonLure3           = "AdvancedFishing.SpoonLure3",
				JitterBug            = "AdvancedFishing.JitterBug",
				Crankbait            = "AdvancedFishing.Crankbait",
				SwimShad             = "AdvancedFishing.SwimShad",
				Alfers               = "AdvancedFishing.Alfers",
				Spinnerbait          = "AdvancedFishing.Spinnerbait",
			},
		},
		epic = {
			chance = 10,
			xp = 10,
			items = {
				LeadFishingbox    = "AdvancedFishing.LeadFishingbox",
				LeadFishingbox2   = "AdvancedFishing.LeadFishingbox2",
				LeadFishingbox3   = "AdvancedFishing.LeadFishingbox3",
				LeadFishingbox4   = "AdvancedFishing.LeadFishingbox4",
				LeadFishingbox5   = "AdvancedFishing.LeadFishingbox5",
				Fishinglurebox    = "AdvancedFishing.Fishinglurebox",
			},
		},
	};
    for _, spawnTable in pairs(AnotherJunkItems) do
        for itemName, itemFullName in pairs(spawnTable.items) do
            forageDefs[itemName] = {
                type = itemFullName,
                skill = 4,
                xp = spawnTable.xp,
                categories = { "Junk" },
                zones = {
                    Forest      = spawnTable.chance,
                    DeepForest  = spawnTable.chance,
                    Vegitation  = spawnTable.chance,
                    FarmLand    = spawnTable.chance,
                    Farm        = spawnTable.chance,
                    TrailerPark = spawnTable.chance,
                    TownZone    = spawnTable.chance,
                    Nav         = spawnTable.chance,
                },
                spawnFuncs = { doGenericItemSpawnB },
                forceOutside = false,
                canBeAboveFloor = true,
            };
        end;
    end;
end

generateLGRCustomDefs();
