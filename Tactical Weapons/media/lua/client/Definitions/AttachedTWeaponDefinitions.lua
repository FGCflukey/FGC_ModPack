-- define weapons to be attached to zombies when creating them
-- random knives inside their neck, spear in their stomach, meatcleaver in their back...
-- this is used in IsoZombie.addRandomAttachedWeapon()

AttachedWeaponDefinitions = AttachedWeaponDefinitions or {};

AttachedWeaponDefinitions.chanceOfAttachedWeapon = 6; -- Global chance of having an attached weapon, if we pass this we gonna add randomly one from the list

-- random spear in the stomach
AttachedWeaponDefinitions.TWspearStomach = {
	chance = 2, -- chance is total, we'll get the chance of every definition and take one from there
	weaponLocation = {"Stomach"}, -- defined in AttachedLocations.lua
	bloodLocations = {"Torso_Lower","Back"}, -- we add blood & hole on this part
	addHoles = true, -- if true, you need at least one bloodLocation
	daySurvived = 30, -- needed day of survival before seeing this one
	weapons = { -- list of possible weapons, we'll take one randomly from there
		"TWeapons.SpearTKnife",		
	},
}

-- katana in stomach
AttachedWeaponDefinitions.TWkatanaStomach = {
	chance = 1,
	weaponLocation = {"Stomach"},
	bloodLocations = {"Torso_Lower","Back"},
	addHoles = true,
	daySurvived = 60,
	weapons = {
		"TWeapons.LongSword",
		"TWeapons.TacticalBlade",
	},
}

-- meat cleaver & some others low weapons (Hand Axes..) in the back
AttachedWeaponDefinitions.TWmeatCleaverBackLowQuality = {
	chance = 2,
	weaponLocation = {"MeatCleaver in Back"},
	bloodLocations = {"Back"},
	addHoles = true,
	daySurvived = 0,
	weapons = {
		"TWeapons.TacticalTomahawk",
	},
}

-- Better weapons in the back
AttachedWeaponDefinitions.TWmeatCleaverBack = {
	chance = 1,
	weaponLocation = {"MeatCleaver in Back"},
	bloodLocations = {"Back"},
	addHoles = true,
	daySurvived = 20,
	weapons = {
		"TWeapons.TacticalMachete",
	},
}

-- Axe in the back
AttachedWeaponDefinitions.TWaxeBack = {
	chance = 2,
	weaponLocation = {"Axe Back"},
	bloodLocations = {"Back"},
	addHoles = true,
	daySurvived = 15,
	weapons = {
		"TWeapons.TacticalAxe",
	},
}

-- random knife (better quality) in the back
AttachedWeaponDefinitions.TWknifeBack = {
	chance = 2,
	weaponLocation = {"Knife in Back"},
	bloodLocations = {"Back"},
	addHoles = false,
	daySurvived = 10,
	weapons = {
		"TWeapons.TacticalKnife",
		"TWeapons.MilitaryKnife",		
	},
}

-- random knife (better quality) in the left leg
AttachedWeaponDefinitions.TWknifeLeftLeg = {
	chance = 2,
	weaponLocation = {"Knife Left Leg"},
	bloodLocations = {"UpperLeg_L"},
	addHoles = false,
	daySurvived = 10,
	weapons = {
		"TWeapons.TacticalKnife",
		"TWeapons.MilitaryKnife",
	},
}

-- random knife (better quality) in the right leg
AttachedWeaponDefinitions.TWknifeRightLeg = {
	chance = 2,
	weaponLocation = {"Knife Right Leg"},
	bloodLocations = {"UpperRight_L"},
	addHoles = false,
	daySurvived = 10,
	weapons = {
		"TWeapons.TacticalKnife",
		"TWeapons.MilitaryKnife",
	},
}

-- random knife (better quality) in the shoulder
AttachedWeaponDefinitions.TWknifeShoulder = {
	chance = 2,
	weaponLocation = {"Knife Shoulder"},
	bloodLocations = {"UpperArm_L", "Torso_Upper"},
	addHoles = false,
	daySurvived = 10,
	weapons = {
		"TWeapons.TacticalKnife",
		"TWeapons.MilitaryKnife",
	},
}

-- Machete in shoulder
AttachedWeaponDefinitions.TWMacheteShoulder = {
	chance = 1,
	weaponLocation = {"Knife Shoulder"},
	bloodLocations = {"UpperArm_L", "Torso_Upper"},
	addHoles = true,
	daySurvived = 20,
	weapons = {
		"TWeapons.TacticalMachete",
	},
}

-- random knife (better quality) in the stomach
AttachedWeaponDefinitions.TWknifeStomach = {
	chance = 2,
	weaponLocation = {"Knife Stomach"},
	bloodLocations = {"Torso_Lower", "Back"},
	addHoles = false,
	daySurvived = 10,
	weapons = {
		"TWeapons.TacticalKnife",
		"TWeapons.MilitaryKnife",
	},
}

-- hand axe on lumberjack
AttachedWeaponDefinitions.TWlumberjack = {
	chance = 50,
	outfit = {"McCoys"},
	weaponLocation = {"Belt Left", "Belt Right"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"TWeapons.TacticalTomahawk",
	},
}

-- various melee weapon attached in back
AttachedWeaponDefinitions.TWmeleeInBack = {
	chance = 50,
	outfit = {"Bandit"},
	weaponLocation = {"Shovel Back"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"TWeapons.CHockeyStick",
		"TWeapons.CHockeyStickWire",
	},
}

-- more melee in back!
AttachedWeaponDefinitions.TWmelee2InBack = {
	chance = 60,
	outfit = {"Bandit"},
	weaponLocation = {"Big Weapon On Back"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"TWeapons.CHockeyStick",
		"TWeapons.CHockeyStickWire",
	},
}

-- hammer/axe in belt left (so we keep knives for belt right if we got multiple items)
AttachedWeaponDefinitions.TWhammerBelt = {
	chance = 50,
	outfit = {"Bandit"},
	weaponLocation = {"Belt Left"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"TWeapons.TacticalTomahawk",
	},
}

-- knives in belt right
AttachedWeaponDefinitions.TWknivesBelt = {
	chance = 50,
	outfit = {"Bandit"},
	weaponLocation = {"Belt Right Upside"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"TWeapons.TacticalKnife",
	},
}

-- crowbar or machete in back
AttachedWeaponDefinitions.TWbladeInBack = {
	chance = 20,
	outfit = {"Bandit"},
	weaponLocation = {"Blade On Back"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"TWeapons.TacticalMachete",
	},
}

-- machete in back
AttachedWeaponDefinitions.TWmacheteInBack = {
	chance = 20,
	outfit = {"HockeyPsycho"},
	weaponLocation = {"Blade On Back"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"TWeapons.TacticalMachete",
	},
}
