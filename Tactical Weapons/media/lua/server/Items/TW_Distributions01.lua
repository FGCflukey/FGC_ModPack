Distributions = Distributions or {};

local distributionTable = {
		
    Bag_SurvivorBag = {
        rolls = 5,
        items = {
			"TWeapons.LongSword", 0.5,
			"TWeapons.TacticalBlade", 0.5,
			"TWeapons.TacticalMachete", 4,
			"TWeapons.TacticalKnife", 2,
			"TWeapons.MilitaryKnife", 2,
			"TWeapons.TacticalTomahawk", 1,
			"TWeapons.TacticalAxe", 1,							
        },
        fillRand = 0,
    },

    ShotgunCache1 = {
        ShotgunBox = {
            rolls = 1,
            items = {	
				"TWeapons.LongSword", 0.2,
				"TWeapons.TacticalBlade", 0.2,
				"TWeapons.TacticalMachete", 1,
				"TWeapons.TacticalKnife", 2,
				"TWeapons.MilitaryKnife", 2,
				"TWeapons.TacticalTomahawk", 1,
				"TWeapons.TacticalAxe", 0.5,								
            },
        },
    
        Bag_DuffelBagTINT = {
            rolls = 1,
            items = {
				"TWeapons.LongSword", 0.2,
				"TWeapons.TacticalBlade", 0.2,
				"TWeapons.TacticalMachete", 1,
				"TWeapons.TacticalKnife", 2,
				"TWeapons.MilitaryKnife", 2,
				"TWeapons.TacticalTomahawk", 1,
				"TWeapons.TacticalAxe", 0.5,							
            },
            fillRand=3,
        },
    },

    ShotgunCache2 = {
        ShotgunBox = {
            rolls = 1,
            items = {
				"TWeapons.LongSword", 0.2,
				"TWeapons.TacticalBlade", 0.2,
				"TWeapons.TacticalMachete", 1,
				"TWeapons.TacticalKnife", 2,
				"TWeapons.MilitaryKnife", 2,
				"TWeapons.TacticalTomahawk", 1,
				"TWeapons.TacticalAxe", 0.5,								
            },
        },

        counter = {
            rolls = 1,
            items = {
				"TWeapons.LongSword", 0.2,
				"TWeapons.TacticalBlade", 0.2,
				"TWeapons.TacticalMachete", 1,
				"TWeapons.TacticalKnife", 2,
				"TWeapons.MilitaryKnife", 2,
				"TWeapons.TacticalTomahawk", 1,
				"TWeapons.TacticalAxe", 0.5,								
            },
        },
    },

    GunCache1 = {
        GunBox = {
            rolls = 1,
            items = {
				"TWeapons.LongSword", 0.2,
				"TWeapons.TacticalBlade", 0.2,
				"TWeapons.TacticalMachete", 1,
				"TWeapons.TacticalKnife", 2,
				"TWeapons.MilitaryKnife", 2,
				"TWeapons.TacticalTomahawk", 1,
				"TWeapons.TacticalAxe", 0.5,							
            },
        },

        counter = {
            rolls = 1,
            items = {
				"TWeapons.LongSword", 0.2,
				"TWeapons.TacticalBlade", 0.2,
				"TWeapons.TacticalMachete", 1,
				"TWeapons.TacticalKnife", 2,
				"TWeapons.MilitaryKnife", 2,
				"TWeapons.TacticalTomahawk", 1,
				"TWeapons.TacticalAxe", 0.5,							
            },
        },
    
        Bag_DuffelBagTINT = {
            rolls = 1,
            items = {
				"TWeapons.LongSword", 0.2,
				"TWeapons.TacticalBlade", 0.2,
				"TWeapons.TacticalMachete", 1,
				"TWeapons.TacticalKnife", 2,
				"TWeapons.MilitaryKnife", 2,
				"TWeapons.TacticalTomahawk", 1,
				"TWeapons.TacticalAxe", 0.5,							
            },
            fillRand = 3,
        },
    },

    GunCache2 = {
        GunBox = {
            rolls = 1,
            items = {
				"TWeapons.LongSword", 0.2,
				"TWeapons.TacticalBlade", 0.2,
				"TWeapons.TacticalMachete", 1,
				"TWeapons.TacticalKnife", 2,
				"TWeapons.MilitaryKnife", 2,
				"TWeapons.TacticalTomahawk", 1,
				"TWeapons.TacticalAxe", 0.5,						
            },
        },
    
        Bag_DuffelBagTINT = {
            rolls = 1,
            items = {
				"TWeapons.LongSword", 0.2,
				"TWeapons.TacticalBlade", 0.2,
				"TWeapons.TacticalMachete", 1,
				"TWeapons.TacticalKnife", 2,
				"TWeapons.MilitaryKnife", 2,
				"TWeapons.TacticalTomahawk", 1,
				"TWeapons.TacticalAxe", 0.5,							
            },
            fillRand=3,
        },
    },		
    	
		
	Carpenter = {
        counter = {
            rolls = 3,
            items = {
                "TWeapons.TacticalTomahawk", 3,                
                "TWeapons.TacticalAxe", 2,
            }
        },
    },
	
	ToolsCache1 = {
        ToolsBox = {
            rolls = 1,
            items = {
                "TWeapons.TacticalTomahawk", 3,                
                "TWeapons.TacticalAxe", 2,
            },
        },
        
        counter = {
            rolls = 1,
            items = {
                "TWeapons.TacticalTomahawk", 3,                
                "TWeapons.TacticalAxe", 2,
            },
        },
        
        Bag_DuffelBagTINT = {
            rolls = 1,
            items = {
                "TWeapons.TacticalTomahawk", 3,                
                "TWeapons.TacticalAxe", 2,
            },
            fillRand = 1,
        },
    },
	
	all = {
        crate = {
            rolls = 1,
            items = {
                "TWeapons.TacticalAxe", 0.05,
                "TWeapons.TacticalTomahawk", 0.05,
            }
        },
        
        counter = {
            rolls = 1,
            items = {
                "TWeapons.TacticalKnife", 0.05,
				"TWeapons.MilitaryKnife", 0.05,
                "TWeapons.CHockeyStick", 0.1,
            },
        },
        
        metal_shelves ={
            rolls = 1,
            items = {                
                "TWeapons.TacticalTomahawk", 0.05,
            }
        },
    }, 
	
}

table.insert(Distributions, 1, distributionTable);
