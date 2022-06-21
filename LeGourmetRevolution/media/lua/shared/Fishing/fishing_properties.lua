-----------------------------------------------------------------------
--                      ROBERT JOHNSON                               --
-----------------------------------------------------------------------

----- how it works :
----- You have 3 type of size per fish : little, medium and big
----- All type have a minimum size and a maximum size
----- We choose a random number between this range to get the size of the fish
----- then, all fish have a weight change, like 60 for trout mean a trout of 30 cm / weight change (60) = 0.5 kg
----- then hunger reduction is weight * 10 (ex : 2kg * 10 = 20 hunger reduction)
-----

Fishing = Fishing or {}
trashItems = Fishing.trashItems or {};
--- Array who contains all our fish
fishes = Fishing.fishes or {};
--- Pike :
local pike = {};
pike.name = "Pike";
pike.item = "Base.Pike";
pike.lure = {};
table.insert(pike.lure, "JitterBug");
table.insert(pike.lure, "Alfers");
table.insert(pike.lure, "SwimShad");
table.insert(pike.lure, "Worm");
table.insert(pike.lure, "SilkMothCaterpillar");
table.insert(pike.lure, "SwallowtailCaterpillar");
table.insert(pike.lure, "MonarchCaterpillar");
table.insert(pike.lure, "AmericanLadyCaterpillar");
table.insert(pike.lure, "BandedWoolyBearCaterpillar");
table.insert(pike.lure, "BaitFish");
table.insert(pike.lure, "RWormMediumfloaterline");
table.insert(pike.lure, "BfishMediumfloaterline");
table.insert(pike.lure, "WormMediumfloaterline");
table.insert(pike.lure, "DentMediumdeepline");
table.insert(pike.lure, "PejeMediumdeepline");
table.insert(pike.lure, "TurtleMediumdeepline");
pike.little = {};
pike.medium = {};
pike.big = {};
pike.trophy = {};
pike.little.minSize = 50;
pike.little.maxSize = 65;
pike.medium.minSize = 65;
pike.medium.maxSize = 90;
pike.big.minSize = 90;
pike.big.maxSize = 120;
pike.trophy.minSize = 120;
pike.trophy.maxSize = 150;
pike.little.weightChange = 23;
pike.medium.weightChange = 18;
pike.big.weightChange = 8;
pike.trophy.weightChange = 6;
table.insert(fishes, pike);
--- Trout :
local trout = {};
trout.name = "Trout";
trout.item = "Base.Trout";
trout.lure = {};
table.insert(trout.lure, "Cricket");
table.insert(trout.lure, "Grasshopper");
table.insert(trout.lure, "SawflyLarva");
table.insert(trout.lure, "Maggots");
table.insert(trout.lure, "SpoonLure1");
table.insert(trout.lure, "SpoonLure2");
table.insert(trout.lure, "SpoonLure3");
table.insert(trout.lure, "Spinnerbait");
trout.little = {};
trout.medium = {};
trout.big = {};
trout.trophy = {};
trout.little.minSize = 30;
trout.little.maxSize = 40;
trout.medium.minSize = 40;
trout.medium.maxSize = 50;
trout.big.minSize = 50;
trout.big.maxSize = 70;
trout.trophy.minSize = 70;
trout.trophy.maxSize = 80;
trout.little.weightChange = 60;
trout.medium.weightChange = 45;
trout.big.weightChange = 30;
trout.trophy.weightChange = 25;
table.insert(fishes, trout);
--- Bass :
local bass = {};
bass.name = "Bass";
bass.item = "Base.Bass";
bass.lure = {};
table.insert(bass.lure, "JitterBug");
table.insert(bass.lure, "Crankbait");
table.insert(bass.lure, "GTPopper");
table.insert(bass.lure, "SpoonLure1");
table.insert(bass.lure, "SwimJig3");
table.insert(bass.lure, "SwimShad");
table.insert(bass.lure, "StormFlutterstick");
table.insert(bass.lure, "Worm");
table.insert(bass.lure, "Cricket");
table.insert(bass.lure, "Grasshopper");
table.insert(bass.lure, "SilkMothCaterpillar");
table.insert(bass.lure, "SwallowtailCaterpillar");
table.insert(bass.lure, "MonarchCaterpillar");
table.insert(bass.lure, "AmericanLadyCaterpillar");
table.insert(bass.lure, "BandedWoolyBearCaterpillar");
table.insert(bass.lure, "Snail");
table.insert(bass.lure, "Pillbug");
table.insert(bass.lure, "BfishMediumfloaterline");
table.insert(bass.lure, "CricketMediumfloaterline");
table.insert(bass.lure, "GHopperMediumfloaterline");
table.insert(bass.lure, "WormMediumfloaterline");
table.insert(bass.lure, "DentMediumfloaterline");
table.insert(bass.lure, "DentMediumdeepline");
table.insert(bass.lure, "PejeMediumdeepline");
table.insert(bass.lure, "TurtleMediumdeepline");
bass.little = {};
bass.medium = {};
bass.big = {};
bass.trophy = {};
bass.little.minSize = 25;
bass.little.maxSize = 35;
bass.medium.minSize = 35;
bass.medium.maxSize = 55;
bass.big.minSize = 55;
bass.big.maxSize = 75;
bass.trophy.minSize = 75;
bass.trophy.maxSize = 85;
bass.little.weightChange = 50;
bass.medium.weightChange = 40;
bass.big.weightChange = 30;
bass.trophy.weightChange = 25;
table.insert(fishes, bass);
--- Cat fish :
local catfish = {};
catfish.name = "CatFish";
catfish.item = "Base.Catfish";
catfish.lure = {};
table.insert(catfish.lure, "Worm");
table.insert(catfish.lure, "Cricket");
table.insert(catfish.lure, "Grasshopper");
table.insert(catfish.lure, "Cockroach");
table.insert(catfish.lure, "SilkMothCaterpillar");
table.insert(catfish.lure, "SwallowtailCaterpillar");
table.insert(catfish.lure, "MonarchCaterpillar");
table.insert(catfish.lure, "AmericanLadyCaterpillar");
table.insert(catfish.lure, "BandedWoolyBearCaterpillar");
table.insert(catfish.lure, "Snail");
table.insert(catfish.lure, "Slug");
table.insert(catfish.lure, "Slug2");
table.insert(catfish.lure, "SwimJig");
table.insert(catfish.lure, "SwimJig2");
table.insert(catfish.lure, "SwimJig3");
table.insert(catfish.lure, "SwimShad");
table.insert(catfish.lure, "FishingDough");
table.insert(catfish.lure, "StrongFishingDough");
table.insert(catfish.lure, "DoughMediumfloaterline");
table.insert(catfish.lure, "FDoughMediumfloaterline");
table.insert(catfish.lure, "WormMediumfloaterline");
table.insert(catfish.lure, "RWormMediumfloaterline");
table.insert(catfish.lure, "BfishMediumfloaterline");
table.insert(catfish.lure, "DentMediumfloaterline");
table.insert(catfish.lure, "DentMediumdeepline");
table.insert(catfish.lure, "PejeMediumdeepline");
table.insert(catfish.lure, "DoughMediumdeepline");
table.insert(catfish.lure, "FDoughMediumdeepline");
table.insert(catfish.lure, "TurtleMediumdeepline");
table.insert(catfish.lure, "PeachMediumdeepline");
--table.insert(catfish.lure, "BaitFish");
catfish.little = {};
catfish.medium = {};
catfish.big = {};
catfish.trophy = {};
catfish.little.minSize = 15;
catfish.little.maxSize = 25;
catfish.medium.minSize = 25;
catfish.medium.maxSize = 35;
catfish.big.minSize = 35;
catfish.big.maxSize = 55;
catfish.trophy.minSize = 55;
catfish.trophy.maxSize = 65;
catfish.little.weightChange = 50;
catfish.medium.weightChange = 40;
catfish.big.weightChange = 30;
catfish.trophy.weightChange = 25;
table.insert(fishes, catfish);
--- Crappie fish :
local crappie = {};
crappie.name = "Crappie fish";
crappie.item = "Base.Crappie";
crappie.lure = {};
table.insert(crappie.lure, "JitterBug");
table.insert(crappie.lure, "SwimShad");
table.insert(crappie.lure, "StormFlutterstick");
table.insert(crappie.lure, "Worm");
table.insert(crappie.lure, "WormSmallfloaterline");
table.insert(crappie.lure, "Cricket");
table.insert(crappie.lure, "FishingDough");
table.insert(crappie.lure, "StrongFishingDough");
table.insert(crappie.lure, "CricketSmallfloaterline");
table.insert(crappie.lure, "Grasshopper");
table.insert(crappie.lure, "GHopperSmallfloaterline");
table.insert(crappie.lure, "Cockroach");
table.insert(crappie.lure, "SilkMothCaterpillar");
table.insert(crappie.lure, "SwallowtailCaterpillar");
table.insert(crappie.lure, "MonarchCaterpillar");
table.insert(crappie.lure, "AmericanLadyCaterpillar");
table.insert(crappie.lure, "BandedWoolyBearCaterpillar");
table.insert(crappie.lure, "Snail");
table.insert(crappie.lure, "Slug");
table.insert(crappie.lure, "Slug2");
table.insert(crappie.lure, "Millipede");
table.insert(crappie.lure, "Millipede2");
table.insert(crappie.lure, "Centipede");
table.insert(crappie.lure, "Centipede2");
table.insert(crappie.lure, "Pillbug");
table.insert(crappie.lure, "Termites");
table.insert(crappie.lure, "RoachSmallfloaterline");
table.insert(crappie.lure, "DoughSmallfloaterline");
table.insert(crappie.lure, "FDoughSmallfloaterline");
table.insert(crappie.lure, "DoughSmalldeepline");
table.insert(crappie.lure, "FDoughSmalldeepline");
table.insert(crappie.lure, "CricketSmalldeepline");
table.insert(crappie.lure, "WormSmalldeepline");
table.insert(crappie.lure, "RWormSmalldeepline");
table.insert(crappie.lure, "GHopperSmalldeepline");
table.insert(crappie.lure, "RoachSmalldeepline");
crappie.little = {};
crappie.medium = {};
crappie.big = {};
crappie.trophy = {};
crappie.little.minSize = 15;
crappie.little.maxSize = 20;
crappie.medium.minSize = 20;
crappie.medium.maxSize = 25;
crappie.big.minSize = 25;
crappie.big.maxSize = 35;
crappie.trophy.minSize = 35;
crappie.trophy.maxSize = 40;
crappie.little.weightChange = 50;
crappie.medium.weightChange = 40;
crappie.big.weightChange = 30;
crappie.trophy.weightChange = 25;
table.insert(fishes, crappie);
--- Panfish :
local panfish = {};
panfish.name = "PanFish";
panfish.item = "Base.Panfish";
panfish.lure = {};
table.insert(panfish.lure, "Worm");
table.insert(panfish.lure, "WormSmallfloaterline");
table.insert(panfish.lure, "Cricket");
table.insert(panfish.lure, "CricketSmallfloaterline");
table.insert(panfish.lure, "Grasshopper");
table.insert(panfish.lure, "GHopperSmallfloaterline");
table.insert(panfish.lure, "Cockroach");
table.insert(panfish.lure, "Millipede");
table.insert(panfish.lure, "Millipede2");
table.insert(panfish.lure, "Centipede");
table.insert(panfish.lure, "Centipede2");
table.insert(panfish.lure, "Pillbug");
table.insert(panfish.lure, "Termites");
table.insert(panfish.lure, "SawflyLarva");
table.insert(panfish.lure, "Maggots");
table.insert(panfish.lure, "RoachSmallfloaterline");
table.insert(panfish.lure, "RoachSmalldeepline");
table.insert(panfish.lure, "GHopperSmalldeepline");
table.insert(panfish.lure, "CricketSmalldeepline");
table.insert(panfish.lure, "WormSmalldeepline");
panfish.little = {};
panfish.medium = {};
panfish.big = {};
panfish.trophy = {};
panfish.little.minSize = 15;
panfish.little.maxSize = 20;
panfish.medium.minSize = 20;
panfish.medium.maxSize = 25;
panfish.big.minSize = 25;
panfish.big.maxSize = 35;
panfish.trophy.minSize = 35;
panfish.trophy.maxSize = 40;
panfish.little.weightChange = 40;
panfish.medium.weightChange = 35;
panfish.big.weightChange = 30;
panfish.trophy.weightChange = 25;
table.insert(fishes, panfish);
--- Perch :
local perch = {};
perch.name = "Perch";
perch.item = "Base.Perch";
perch.lure = {};
table.insert(perch.lure, "Crankbait");
table.insert(perch.lure, "GTPopper");
table.insert(perch.lure, "SpoonLure2");
table.insert(perch.lure, "StormFlutterstick");
table.insert(perch.lure, "Worm");
table.insert(perch.lure, "Cricket");
table.insert(perch.lure, "Grasshopper");
table.insert(perch.lure, "Millipede");
table.insert(perch.lure, "Millipede2");
table.insert(perch.lure, "Centipede");
table.insert(perch.lure, "Centipede2");
table.insert(perch.lure, "Termites");
table.insert(perch.lure, "SawflyLarva");
table.insert(perch.lure, "Maggots");
table.insert(perch.lure, "Snail");
table.insert(perch.lure, "Slug");
table.insert(perch.lure, "Slug2");
table.insert(perch.lure, "Pillbug");
table.insert(perch.lure, "BfishMediumfloaterline");
table.insert(perch.lure, "CricketMediumfloaterline");
table.insert(perch.lure, "GHopperMediumfloaterline");
table.insert(perch.lure, "WormMediumfloaterline");
table.insert(perch.lure, "DentMediumfloaterline");
table.insert(perch.lure, "WormMediumfloaterline");
table.insert(perch.lure, "DentMediumfloaterline");
table.insert(perch.lure, "DentMediumdeepline");
perch.little = {};
perch.medium = {};
perch.big = {};
perch.trophy = {};
perch.little.minSize = 20;
perch.little.maxSize = 30;
perch.medium.minSize = 30;
perch.medium.maxSize = 40;
perch.big.minSize = 40;
perch.big.maxSize = 60;
perch.trophy.minSize = 60;
perch.trophy.maxSize = 70;
perch.little.weightChange = 20;
perch.medium.weightChange = 16;
perch.big.weightChange = 12;
perch.trophy.weightChange = 10;
table.insert(fishes, perch);

local walleye = {};
walleye.name = "Walleye";
walleye.item = "AdvancedFishing.Walleye";
walleye.lure = {};
table.insert(walleye.lure, "SwimJig");
table.insert(walleye.lure, "SwimJig2");
table.insert(walleye.lure, "SwimJig3");
table.insert(walleye.lure, "Crankbait");
table.insert(walleye.lure, "Alfers");
table.insert(walleye.lure, "Worm");
table.insert(walleye.lure, "SilkMothCaterpillar");
table.insert(walleye.lure, "SwallowtailCaterpillar");
table.insert(walleye.lure, "MonarchCaterpillar");
table.insert(walleye.lure, "AmericanLadyCaterpillar");
table.insert(walleye.lure, "BandedWoolyBearCaterpillar");
table.insert(walleye.lure, "SawflyLarva");
table.insert(walleye.lure, "Maggots");
table.insert(walleye.lure, "Snail");
table.insert(walleye.lure, "Slug");
table.insert(walleye.lure, "Slug2");
table.insert(walleye.lure, "WormSmallfloaterline");
table.insert(walleye.lure, "WormMediumfloaterline");
table.insert(walleye.lure, "Cricket");
table.insert(walleye.lure, "CricketSmallfloaterline");
table.insert(walleye.lure, "CricketMediumfloaterline");
table.insert(walleye.lure, "Grasshopper");
table.insert(walleye.lure, "GHopperSmallfloaterline");
table.insert(walleye.lure, "GHopperMediumfloaterline");
table.insert(walleye.lure, "Cockroach");
table.insert(walleye.lure, "RoachSmallfloaterline");
table.insert(walleye.lure, "RoachMediumfloaterline");
table.insert(walleye.lure, "PejeMediumdeepline");
table.insert(walleye.lure, "TurtleMediumdeepline");
walleye.little = {};
walleye.medium = {};
walleye.big = {};
walleye.trophy = {};
walleye.little.minSize = 15;
walleye.little.maxSize = 25;
walleye.medium.minSize = 25;
walleye.medium.maxSize = 45;
walleye.big.minSize = 45;
walleye.big.maxSize = 55;
walleye.trophy.minSize = 55;
walleye.trophy.maxSize = 65;
walleye.little.weightChange = 50;
walleye.medium.weightChange = 40;
walleye.big.weightChange = 30;
walleye.trophy.weightChange = 25;
table.insert(fishes, walleye);
--- Walleye :
--walleye = {};
--walleye.name = "Walleye";
--walleye.icon = "TZ_WalleyeFish";
--walleye.fishPicture = "PicWalleye.png";
--walleye.little = {};
--walleye.medium = {};
--walleye.big = {};
--walleye.little.minSize = 40;
--walleye.little.maxSize = 50;
--walleye.medium.minSize = 50;
--walleye.medium.maxSize = 60;
--walleye.big.minSize = 60;
--walleye.big.maxSize = 75;
--walleye.little.weightChange = 20;
--walleye.medium.weightChange = 15;
--walleye.big.weightChange = 10;
--fishes["walleye"] = walleye;
--Bait fish
local baitfish = {};
baitfish.item = "Base.BaitFish";
baitfish.lure = {};
table.insert(baitfish.lure, "Worm");
table.insert(baitfish.lure, "WormSmallfloaterline");
table.insert(baitfish.lure, "Cricket");
table.insert(baitfish.lure, "CricketSmallfloaterline");
table.insert(baitfish.lure, "Grasshopper");
table.insert(baitfish.lure, "GHopperSmallfloaterline");
table.insert(baitfish.lure, "Cockroach");
table.insert(baitfish.lure, "Millipede");
table.insert(baitfish.lure, "Millipede2");
table.insert(baitfish.lure, "Centipede");
table.insert(baitfish.lure, "Centipede2");
table.insert(baitfish.lure, "Termites");
table.insert(baitfish.lure, "Pillbug");
table.insert(baitfish.lure, "RoachSmallfloaterline");
table.insert(baitfish.lure, "CricketSmalldeepline");
table.insert(baitfish.lure, "WormSmalldeepline");
table.insert(baitfish.lure, "RWormSmalldeepline");
table.insert(baitfish.lure, "GHopperSmalldeepline");
table.insert(baitfish.lure, "RoachSmalldeepline");
table.insert(fishes, baitfish);
-- Trash Items
-- Socks
local socks = {};
socks.item = "Base.Socks_Ankle";
socks.lure = {};
table.insert(socks.lure, "Worm");
table.insert(socks.lure, "Cricket");
table.insert(socks.lure, "Grasshopper");
table.insert(socks.lure, "Cockroach");
table.insert(socks.lure, "BaitFish");
table.insert(socks.lure, "SilkMothCaterpillar");
table.insert(socks.lure, "SwallowtailCaterpillar");
table.insert(socks.lure, "MonarchCaterpillar");
table.insert(socks.lure, "AmericanLadyCaterpillar");
table.insert(socks.lure, "BandedWoolyBearCaterpillar");
table.insert(socks.lure, "Centipede");
table.insert(socks.lure, "Centipede2");
table.insert(socks.lure, "Maggots");
table.insert(socks.lure, "Millipede");
table.insert(socks.lure, "Millipede2");
table.insert(socks.lure, "Pillbug");
table.insert(socks.lure, "SawflyLarva");
table.insert(socks.lure, "Slug");
table.insert(socks.lure, "Slug2");
table.insert(socks.lure, "Snail");
table.insert(socks.lure, "Termites");
table.insert(socks.lure, "0Smallfloaterline");
table.insert(socks.lure, "Mediumfloaterline");
table.insert(socks.lure, "Bigfloaterline");
table.insert(socks.lure, "DentBigfloaterline");
table.insert(socks.lure, "FrogBigfloaterline");
table.insert(socks.lure, "RatBigfloaterline");
table.insert(socks.lure, "MouseBigfloaterline");
table.insert(socks.lure, "CrabBigfloaterline");
table.insert(socks.lure, "PejeBigfloaterline");
table.insert(socks.lure, "SmallDeepline");
table.insert(socks.lure, "DoughSmalldeepline");
table.insert(socks.lure, "FDoughSmalldeepline");
table.insert(socks.lure, "CricketSmalldeepline");
table.insert(socks.lure, "WormSmalldeepline");
table.insert(socks.lure, "RWormSmalldeepline");
table.insert(socks.lure, "GHopperSmalldeepline");
table.insert(socks.lure, "RoachSmalldeepline");
table.insert(socks.lure, "BfishSmalldeepline");
table.insert(trashItems, socks);

local shoes = {};
shoes.item = "Base.Shoes_Random";
shoes.lure = {};
table.insert(shoes.lure, "Worm");
table.insert(shoes.lure, "Cricket");
table.insert(shoes.lure, "Grasshopper");
table.insert(shoes.lure, "Cockroach");
table.insert(shoes.lure, "BaitFish");
table.insert(shoes.lure, "SilkMothCaterpillar");
table.insert(shoes.lure, "SwallowtailCaterpillar");
table.insert(shoes.lure, "MonarchCaterpillar");
table.insert(shoes.lure, "AmericanLadyCaterpillar");
table.insert(shoes.lure, "BandedWoolyBearCaterpillar");
table.insert(shoes.lure, "Centipede");
table.insert(shoes.lure, "Centipede2");
table.insert(shoes.lure, "Maggots");
table.insert(shoes.lure, "Millipede");
table.insert(shoes.lure, "Millipede2");
table.insert(shoes.lure, "Pillbug");
table.insert(shoes.lure, "SawflyLarva");
table.insert(shoes.lure, "Slug");
table.insert(shoes.lure, "Slug2");
table.insert(shoes.lure, "Snail");
table.insert(shoes.lure, "Termites");
table.insert(shoes.lure, "0Smallfloaterline");
table.insert(shoes.lure, "Mediumfloaterline");
table.insert(shoes.lure, "Bigfloaterline");
table.insert(shoes.lure, "DentBigfloaterline");
table.insert(shoes.lure, "FrogBigfloaterline");
table.insert(shoes.lure, "RatBigfloaterline");
table.insert(shoes.lure, "MouseBigfloaterline");
table.insert(shoes.lure, "CrabBigfloaterline");
table.insert(shoes.lure, "PejeBigfloaterline");
table.insert(shoes.lure, "SmallDeepline");
table.insert(shoes.lure, "DoughSmalldeepline");
table.insert(shoes.lure, "FDoughSmalldeepline");
table.insert(shoes.lure, "CricketSmalldeepline");
table.insert(shoes.lure, "WormSmalldeepline");
table.insert(shoes.lure, "RWormSmalldeepline");
table.insert(shoes.lure, "GHopperSmalldeepline");
table.insert(shoes.lure, "RoachSmalldeepline");
table.insert(shoes.lure, "BfishSmalldeepline");
table.insert(trashItems, shoes);



--------------------- LURE PROPERTIES -----------------------
lure = Fishing.lure or {};

local worm = {};
worm.item = "Worm";
worm.plastic = false;
worm.chanceOfBreak = 15;
lure["Worm"] = worm;

local cricket = {}
cricket.item = "Cricket";
cricket.plastic = false;
cricket.chanceOfBreak = 15;
lure["Cricket"] = cricket;

local grasshopper = {};
grasshopper.item = "Grasshopper";
grasshopper.plastic = false;
grasshopper.chanceOfBreak = 15;
lure["Grasshopper"] = grasshopper;

local cockroach = {};
cockroach.item = "Cockroach";
cockroach.plastic = false;
cockroach.chanceOfBreak = 15;
lure["Cockroach"] = cockroach;

local lureItems = {
    "AmericanLadyCaterpillar",
    "BandedWoolyBearCaterpillar",
    "Centipede",
    "Centipede2",
    "Maggots",
    "Millipede",
    "Millipede2",
    "MonarchCaterpillar",
    "Pillbug",
    "SawflyLarva",
    "SilkMothCaterpillar",
    "Slug",
    "Slug2",
    "Snail",
    "SwallowtailCaterpillar",
    "Termites",
}

for _,itemType in ipairs(lureItems) do
    local lure2 = {};
    lure2.item = itemType;
    lure2.plastic = false;
    lure2.chanceOfBreak = 15;
    lure[itemType] = lure2;
    -- -- FIXME: Add to every type of fish/trash, perhaps this isn't wanted?
    -- for _,fish in ipairs(fishes) do
        -- table.insert(fish.lure, itemType)
    -- end
end

local fishingTackle = {};
fishingTackle.item = "FishingTackle";
fishingTackle.plastic = true;
fishingTackle.chanceOfBreak = 1;
lure["FishingTackle"] = fishingTackle;

local fishingTackle2 = {};
fishingTackle2.item = "FishingTackle2";
fishingTackle2.plastic = true;
fishingTackle2.chanceOfBreak = 1;
lure["FishingTackle2"] = fishingTackle2;

local baitFish = {};
baitFish.item = "BaitFish";
baitFish.plastic = false;
baitFish.chanceOfBreak = 3;
lure["BaitFish"] = baitFish;

Fishing.fishes = fishes
Fishing.lure = lure
Fishing.trashItems = trashItems

--used for fish created in the world (OnCreate)
Fishing.OnCreateFish = function(_item)
    if not _item then return; end;
    local item = _item;
    local itemType = item:getFullType();
    local fish;
    for _, fishDef in ipairs(fishes) do
        if fishDef.item == itemType then
            fish = fishDef;
        end;
    end;
    if not fish then print("[Fishing][OnCreateFish] no fish definition found for item type : " .. itemType); return; end;
    --
    local sizeName = "Small";
    local fishSizeNumber = ZombRand(100);
	if fishSizeNumber <= 1 then
        sizeName = "Trophy";
    elseif fishSizeNumber <= 20 then
        sizeName = "Big";
    elseif fishSizeNumber <= 30 then
        sizeName = "Medium";
    end;
    local baseWeightLb = item:getActualWeight();
    local size = nil;
    local maxSize = nil;
    local minSize = nil;
    local weightKg = nil;
    local baseScale = 1;
	local customscale = false;
    -- now we set the size (for the name) and weight (for hunger) according to his size (little, medium and big)
    if sizeName == "Small" then
        size = ZombRand(fish.little.minSize, fish.little.maxSize);
        maxSize = fish.little.maxSize;
        minSize = fish.little.minSize;
        weightKg = size / fish.little.weightChange;
		if fish.little.scale then
			baseScale = fish.little.scale;
			customscale = true;
		end
    elseif sizeName == "Medium" then
        size = ZombRand(fish.medium.minSize, fish.medium.maxSize);
        maxSize = fish.medium.maxSize;
        minSize = fish.medium.minSize;
        weightKg = size / fish.medium.weightChange;
		if fish.medium.scale then
			baseScale = fish.medium.scale;
			customscale = true;
		else
			baseScale = 1.2;
		end
    elseif sizeName == "Big" then
        size = ZombRand(fish.big.minSize, fish.big.maxSize);
        maxSize = fish.big.maxSize;
        minSize = fish.big.minSize;
        weightKg = size / fish.big.weightChange;
		if fish.big.scale then
			baseScale = fish.big.scale;
			customscale = true;
		else
			baseScale = 1.4;
		end
	else
        size = ZombRand(fish.trophy.minSize, fish.trophy.maxSize);
		maxSize = fish.trophy.maxSize;
        minSize = fish.trophy.minSize;
        weightKg = size / fish.trophy.weightChange;
		if fish.trophy.scale then
			baseScale = fish.trophy.scale;
			customscale = true;
		else
			baseScale = 1.6;
		end
    end

    local scaleMod = (((size - minSize) + 1) / ((maxSize - minSize) + 1) / 2);
    local nutritionFactor = 2.2 * weightKg / baseWeightLb;
    item:setCalories(item:getCalories() * nutritionFactor);
    item:setLipids(item:getLipids() * nutritionFactor);
    item:setCarbohydrates(item:getCarbohydrates() * nutritionFactor);
    item:setProteins(item:getProteins() * nutritionFactor);
    item:setWorldScale(scaleMod + baseScale);

     --the fish name is like : Big Trout - 26cm
    --if not fish.noNameChange then
    --    item:setName(getText("IGUI_Fish_" .. sizeName) .. " " .. getText("IGUI_Fish_" .. string.gsub(fish.name, "%s+", "")) .. " - " .. size .. "cm");
    --end
	local data = item:getModData();
	if not data.alive then
		data.alive = 0;
	end
    -- hunger reduction is weight of the fish div by 6, and set it to negative
    item:setBaseHunger(- weightKg / 6);
    item:setHungChange(item:getBaseHunger());
    -- weight is kg * 2.2 (in pound)
    item:setActualWeight(weightKg * 2.2);
    item:setCustomWeight(true);
end