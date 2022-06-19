-- define weapons to be attached to zombies when creating them
-- random knives inside their neck, spear in their stomach, meatcleaver in their back...
-- this is used in IsoZombie.addRandomAttachedWeapon()

AttachedWeaponDefinitions = AttachedWeaponDefinitions or {};

AttachedWeaponDefinitions.chanceOfAttachedWeapon = 6; -- Global chance of having an attached weapon, if we pass this we gonna add randomly one from the list

-- meat cleaver & some others low weapons (Hand Axes..) in the back
AttachedWeaponDefinitions.CFBackLowQuality = {
	chance = 1,
	weaponLocation = {"MeatCleaver in Back"},
	bloodLocations = {"Back"},
	addHoles = true,
	daySurvived = 0,
	weapons = {
		"CFWeapons.cfcombataxe",

	},
}

-- Better weapons in the back
AttachedWeaponDefinitions.CFBack = {
	chance = 1,
	weaponLocation = {"MeatCleaver in Back"},
	bloodLocations = {"Back"},
	addHoles = true,
	daySurvived = 0,
	weapons = {
		"CFWeapons.cfcombataxe",

	},
}

-- Axe in the back
AttachedWeaponDefinitions.CFAxeBack = {
	chance = 1,
	weaponLocation = {"Axe Back"},
	bloodLocations = {"Back"},
	addHoles = true,
	daySurvived = 0,
	weapons = {
		"CFWeapons.cflongreachaxe",
		
	},
}

-- random weapon in stomach
AttachedWeaponDefinitions.CFAxeInStomach = {
	chance = 1,
	weaponLocation = {"Knife Stomach"},
	bloodLocations = {"Torso_Lower", "Back"},
	addHoles = true,
	daySurvived = 0,
	weapons = {
		"CFWeapons.cflongreachaxe",
		
	},
}

-- random construction tools on construction worker
AttachedWeaponDefinitions.CFconstructionWorker = {
	chance = 80,
	outfit = {"ConstructionWorker", "Foreman"},
	weaponLocation = {"Belt Left", "Belt Right"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"CFWeapons.cfcombataxe",
	
	},
}

-- hand axe on lumberjack
AttachedWeaponDefinitions.CFlumberjack = {
	chance = 80,
	outfit = {"McCoys"},
	weaponLocation = {"Belt Left", "Belt Right"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"CFWeapons.cfcombataxe",
	
	},
}

-- hammer/axe in belt left (so we keep knives for belt right if we got multiple items)
AttachedWeaponDefinitions.CFhammerBelt = {
	chance = 80,
	outfit = {"Bandit"},
	weaponLocation = {"Belt Left"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"CFWeapons.cfcombataxe",
		
	},
}
