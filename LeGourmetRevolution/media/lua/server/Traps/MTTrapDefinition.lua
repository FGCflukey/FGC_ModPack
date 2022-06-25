require "Traps/TrapDefinition"

local bearTrap = {};
bearTrap.type = "Base.BearTrap";
bearTrap.sprite = "constructedobjects_01_20";
bearTrap.closedSprite = "constructedobjects_01_21";
bearTrap.trapStrength = 50;
bearTrap.destroyItem = "Base.BrokenBearTrap";
table.insert(Traps, bearTrap);

local chancho = {};
chancho.type = "chancho";
-- after how many hour the animal will start to destroy the cage/escape
chancho.strength = 24;
-- item given to the player
chancho.item = "Base.DeadPork";
-- hour this animal will be out and when you can catch it
chancho.minHour = 19;
chancho.maxHour = 6;
-- min and max "size" (understand hunger reduction) of the animal
chancho.minSize = 35;
chancho.maxSize = 160;

chancho.weightChange = 4;

-- chance to get the animals per zone
chancho.zone = {};
chancho.zone["FarmLand"] = 15;
chancho.zone["TownZone"] = 2;
chancho.zone["TrailerPark"] = 2;
chancho.zone["Vegitation"] = 5;
chancho.zone["Forest"] = 10;
chancho.zone["DeepForest"] = 20;
-- chance to get animals for each trap
chancho.traps = {};
chancho.traps["Base.BearTrap"] = 5;
-- chance to attract animal per bait
chancho.baits = {};
chancho.baits["Base.Smallanimalmeat"] = 20;
chancho.baits["Base.Smallbirdmeat"] = 20;
chancho.baits["Base.Rabbitmeat"] = 20;
chancho.baits["Base.BaitFish"] = 20;
chancho.baits["Base.FrogMeat"] = 20;
chancho.baits["Base.Orange"] = 10;
chancho.baits["legourmetfarming.NaturalOrange"] = 10;
chancho.baits["farming.Apple"] = 10;
chancho.baits["legourmetfarming.NaturalApple"] = 10;
chancho.baits["farming.Tomato"] = 10;
chancho.baits["Base.RCheese1"] = 30;
chancho.baits["Base.RCheese2"] = 25;
chancho.baits["Base.Trout"] = 20;
chancho.baits["Base.Salmon"] = 20;

local vaca = {};
vaca.type = "vaca";
-- after how many hour the animal will start to destroy the cage/escape
vaca.strength = 24;
-- item given to the player
vaca.item = "Base.DeadCow";
-- hour this animal will be out and when you can catch it
vaca.minHour = 8;
vaca.maxHour = 16;
-- min and max "size" (understand hunger reduction) of the animal
vaca.minSize = 35;
vaca.maxSize = 160;

vaca.weightChange = 4;

-- chance to get the animals per zone
vaca.zone = {};
vaca.zone["FarmLand"] = 15;
vaca.zone["TownZone"] = 2;
vaca.zone["TrailerPark"] = 2;
vaca.zone["Vegitation"] = 10;
vaca.zone["Forest"] = 8;
vaca.zone["DeepForest"] = 5;
-- chance to get animals for each trap
vaca.traps = {};
vaca.traps["Base.BearTrap"] = 5;
-- chance to attract animal per bait
vaca.baits = {};
vaca.baits["Base.Alfalfa"] = 20;
vaca.baits["Base.Corn"] = 15;
vaca.baits["Base.Cereal"] = 10;
vaca.baits["Base.Rosehips"] = 15;

local lgchicken = {};
lgchicken.type = "lgchicken";
lgchicken.item = "Base.ChickenDead";
lgchicken.minHour = 6;
lgchicken.maxHour = 19;
lgchicken.minSize = 35;
lgchicken.maxSize = 65;
lgchicken.weightChange = 50;
lgchicken.zone = {};
lgchicken.zone["FarmLand"] = 35;
lgchicken.zone["TownZone"] = 5;
lgchicken.zone["TrailerPark"] = 10;
lgchicken.zone["Vegitation"] = 20;
lgchicken.zone["Forest"] = 20;
lgchicken.zone["DeepForest"] = 15;
lgchicken.traps = {};
lgchicken.traps["Base.TrapBox"] = 30;
lgchicken.traps["Base.TrapCage"] = 20;
lgchicken.traps["Base.TrapCrate"] = 15;
lgchicken.traps["Base.TrapSnare"] = 10;
lgchicken.baits = {};
lgchicken.baits["Base.Corn"] = 30;
lgchicken.baits["Base.Cereal"] = 25;
lgchicken.baits["Base.Rosehips"] = 15;
lgchicken.baits["Base.Worm"] = 20;
lgchicken.baits["Base.Grasshopper"] = 30;
lgchicken.baits["Base.Cockroach"] = 20;
lgchicken.baits["Base.Cricket"] = 30;
lgchicken.baits["Base.BaitFish"] = 25;

local bear = {};
bear.type = "bear";
-- after how many hour the animal will start to destroy the cage/escape
bear.strength = 24;
-- item given to the player
bear.item = "Base.DeadBear";
-- hour this animal will be out and when you can catch it
bear.minHour = 0;
bear.maxHour = 0;
-- min and max "size" (understand hunger reduction) of the animal
bear.minSize = 35;
bear.maxSize = 160;

bear.weightChange = 4;

-- chance to get the animals per zone
bear.zone = {};
bear.zone["FarmLand"] = 15;
bear.zone["TownZone"] = 5;
bear.zone["TrailerPark"] = 10;
bear.zone["Vegitation"] = 5;
bear.zone["Forest"] = 15;
bear.zone["DeepForest"] = 18;
-- chance to get animals for each trap
bear.traps = {};
bear.traps["Base.BearTrap"] = 5;
-- chance to attract animal per bait
bear.baits = {};
bear.baits["Base.Smallanimalmeat"] = 10;
bear.baits["Base.Smallbirdmeat"] = 10;
bear.baits["Base.Rabbitmeat"] = 10;
bear.baits["Base.BaitFish"] = 10;
bear.baits["Base.FrogMeat"] = 10;
bear.baits["Base.Orange"] = 5;
bear.baits["legourmetfarming.NaturalOrange"] = 5;
bear.baits["farming.Apple"] = 5;
bear.baits["legourmetfarming.NaturalApple"] = 5;
bear.baits["Base.Trout"] = 15;
bear.baits["Base.Salmon"] = 15;
bear.baits["AdvancedFishing.Dorado"] = 20;
bear.baits["AdvancedFishing.FSalmon"] = 25;
bear.baits["AdvancedFishing.RainbowTrout"] = 25;

local crow = {};
crow.type = "crow";
crow.item = "Base.DeadCrow";
crow.minHour = 0;
crow.maxHour = 0;
crow.minSize = 5;
crow.maxSize = 10;
crow.weightChange = 100;
crow.zone = {};
crow.zone["FarmLand"] = 35;
crow.zone["TownZone"] = 35;
crow.zone["Vegitation"] = 35;
crow.zone["TrailerPark"] = 25;
crow.zone["Forest"] = 25;
crow.zone["DeepForest"] = 25;
crow.traps = {};
crow.traps["Base.TrapStick"] = 30;
crow.baits = {};
crow.baits["Base.Bread"] = 30;
crow.baits["Base.BreadSlices"] = 30;
crow.baits["Base.Worm"] = 30;
crow.baits["Base.Corn"] = 25;
crow.baits["Base.Cereal"] = 25;
crow.baits["Base.Smallanimalmeat"] = 35;
crow.baits["Base.Smallbirdmeat"] = 35;
crow.baits["Base.Rabbitmeat"] = 35;
crow.baits["Base.BaitFish"] = 25;
crow.baits["Base.FrogMeat"] = 35;
crow.baits["Base.Grasshopper"] = 20;
crow.baits["Base.Cockroach"] = 20;

table.insert(Animals, chancho);
table.insert(Animals, vaca);
table.insert(Animals, lgchicken);
table.insert(Animals, bear);
table.insert(Animals, crow);

function getAnimal(Animals, nombre)
    local LgChoose = -1;
    for x=1, #Animals do
        if Animals[x].type == nombre then
            LgChoose = x;
		end		
    end
    return LgChoose;
end

-- Sistema de cambio de peso:
Animals[getAnimal(Animals, "rat")]["weightChange"] = 90;
Animals[getAnimal(Animals, "rat")]["maxSize"] = 20;
Animals[getAnimal(Animals, "rat")].baits["legourmetfarming.NaturalOrange"] = 15;
Animals[getAnimal(Animals, "rat")].baits["legourmetfarming.NaturalApple"] = 15;
Animals[getAnimal(Animals, "mouse")]["weightChange"] = 90;
Animals[getAnimal(Animals, "mouse")].baits["legourmetfarming.NaturalOrange"] = 15;
Animals[getAnimal(Animals, "mouse")].baits["legourmetfarming.NaturalApple"] = 15;
Animals[getAnimal(Animals, "rabbit")]["weightChange"] = 80;
Animals[getAnimal(Animals, "rabbit")]["maxSize"] = 50;
Animals[getAnimal(Animals, "rabbit")].baits["legourmetfarming.NaturalPeach"] = 15;
Animals[getAnimal(Animals, "rabbit")].baits["legourmetfarming.NaturalApple"] = 15;
Animals[getAnimal(Animals, "rabbit")].baits["legourmetfarming.NaturalBanana"] = 15;
Animals[getAnimal(Animals, "squirrel")]["weightChange"] = 80;
Animals[getAnimal(Animals, "squirrel")]["maxSize"] = 40;
Animals[getAnimal(Animals, "squirrel")].baits["legourmetfarming.NaturalPeach"] = 15;
Animals[getAnimal(Animals, "squirrel")].baits["legourmetfarming.NaturalApple"] = 20;
Animals[getAnimal(Animals, "squirrel")].baits["legourmetfarming.NaturalOrange"] = 20;


-- Bird Balance
Animals[getAnimal(Animals, "bird")]["weightChange"] = 150;
Animals[getAnimal(Animals, "bird")]["maxSize"] = 20;
Animals[getAnimal(Animals, "bird")]["minHour"] = 7;
Animals[getAnimal(Animals, "bird")]["maxHour"] = 18;
if Animals[getAnimal(Animals, "bird")].traps["Base.TrapStick"] ~= nil then
	if Animals[getAnimal(Animals, "bird")].traps["Base.TrapStick"] > 25 then
		Animals[getAnimal(Animals, "bird")].traps["Base.TrapStick"] = 25;
	end
end
birdfood = {}
birdfood.food = {"Base.Bread", "Base.BreadSlices", "Base.Worm", "Base.Grasshopper", "Base.Cockroach", "Base.Cricket", "Base.Corn", "Base.Cereal"}
birdfood.value = {25, 25, 25, 25, 25, 25, 15, 15}

local function MakeBalance(Anm)
	local index = 0;
	for i = 1, #birdfood.food do
		index = index +1;
		local food = birdfood.food[index];
		local value = birdfood.value[index];
		if Animals[getAnimal(Animals, Anm)].baits[food] ~= nil then
			if Animals[getAnimal(Animals, Anm)].baits[food] > value then
				Animals[getAnimal(Animals, Anm)].baits[food] = value;
			end
		else
			Animals[getAnimal(Animals, Anm)].baits[food] = value;
		end
	end
end

MakeBalance("bird");

--Debugging Function
-- function talkkey(key)
    -- local pl = getPlayer();
	-- if key == 82 then
		-- local food = birdfood.food[1];
		-- local text1 = food;
		-- local text2 = Animals[getAnimal(Animals, "bird")].baits[food]
		-- pl:Say(text1 .. " " .. tostring(text2))
	-- end
-- end

-- local function initbirddata()
	-- Events.OnKeyPressed.Add(talkkey);
-- end

--Events.OnGameStart.Add(initbirddata)