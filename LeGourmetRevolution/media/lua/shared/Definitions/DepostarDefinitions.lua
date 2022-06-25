DepostarDefinitions = {};

--Sistema de depostar animales.
DepostarDefinitions["DeadPork"] = {items={}, head="Base.BoarHead"};
DepostarDefinitions["DeadCow"] = {items={}, head="Base.CowHead", skin = "Base.CowSkin"};
DepostarDefinitions["DeadBison"] = {items={}, head="Base.BisonHead"};
DepostarDefinitions["DeadBear"] = {items={}, head="Base.BearHead", skin = "Base.BearSkin"};
DepostarDefinitions["DeadMoose"] = {items={}, head="Base.MooseHead"};
DepostarDefinitions["DeadDeer"] = {items={}, head="Base.DeerHead", skin = "Base.DeerSkin"};
DepostarDefinitions["DeadSheep"] = {items={}};

-- Jabalí

--Chuletas de cerdo mal cortadas
local BadPorkChop = {};
BadPorkChop.type = "Base.BadPorkChop";
BadPorkChop.minCount = 1;
BadPorkChop.maxCount = 4;
BadPorkChop.minSkill = 0;
BadPorkChop.maxSkill = 4;
BadPorkChop.DataName = "BadFilletData";

--Chuletas de cerdo mal cortadas
local BadPorkChopB = {};
BadPorkChopB.type = "Base.BadPorkChop";
BadPorkChopB.minCount = 1;
BadPorkChopB.maxCount = 2;
BadPorkChopB.minSkill = 5;
BadPorkChopB.maxSkill = 6;
BadPorkChopB.DataName = "BadFilletDataB";


--Chuletas de cerdo mal cortadas
local BadPorkChopC = {};
BadPorkChopC.type = "Base.BadPorkChop";
BadPorkChopC.minCount = 1;
BadPorkChopC.maxCount = 1;
BadPorkChopC.minSkill = 7;
BadPorkChopC.maxSkill = 9;
BadPorkChopC.DataName = "BadFilletDataC";

--Chuletas de cerdo
local PorkChop = {};
PorkChop.type = "Base.PorkChop";
PorkChop.minCount = 1;
PorkChop.maxCount = 4;
PorkChop.minSkill = 3;
PorkChop.maxSkill = 10;
PorkChop.DataName = "FilletData";

--Chuletas de cerdo
local PorkChopB = {};
PorkChopB.type = "Base.PorkChop";
PorkChopB.minCount = 1;
PorkChopB.maxCount = 2;
PorkChopB.minSkill = 5;
PorkChopB.maxSkill = 10;
PorkChopB.DataName = "FilletDataB";

--Chuletas de cerdo
local PorkChopC = {};
PorkChopC.type = "Base.PorkChop";
PorkChopC.minCount = 1;
PorkChopC.maxCount = 2;
PorkChopC.minSkill = 7;
PorkChopC.maxSkill = 10;
PorkChopC.DataName = "FilletDataC";

--Jamón
local Ham = {};
Ham.type = "Base.Ham";
Ham.minCount = 1;
Ham.maxCount = 2;
Ham.minSkill = 6;
Ham.maxSkill = 10;
Ham.DataName = "Ham";

--Tripas
local HogCasings = {};
HogCasings.type = "Base.HogCasings";
HogCasings.minCount = 1;
HogCasings.maxCount = 2;
HogCasings.minSkill = 0;
HogCasings.maxSkill = 10;
HogCasings.DataName = "Hog";

--Bacon
local Bacon = {};
Bacon.type = "farming.Bacon";
Bacon.minCount = 1;
Bacon.maxCount = 2;
Bacon.minSkill = 7;
Bacon.maxSkill = 10;
Bacon.DataName = "Bacon";

--Tendon
local Tendon = {};
Tendon.type = "Base.Tendon";
Tendon.minCount = 1;
Tendon.maxCount = 4;
Tendon.minSkill = 0;
Tendon.maxSkill = 10;
Tendon.DataName = "Tendon";



--------------------------------------------------------------------

local BadCowChop = {};
BadCowChop.type = "Base.BadCowChop";
BadCowChop.minCount = 1;
BadCowChop.maxCount = 4;
BadCowChop.minSkill = 0;
BadCowChop.maxSkill = 4;
BadCowChop.DataName = "BadCowFilletData";

--Chuletas de vacuno mal cortadas
local BadCowChopB = {};
BadCowChopB.type = "Base.BadCowChop";
BadCowChopB.minCount = 1;
BadCowChopB.maxCount = 2;
BadCowChopB.minSkill = 5;
BadCowChopB.maxSkill = 6;
BadCowChopB.DataName = "BadCowFilletDataaB";

--Chuletas de vacuno mal cortadas
local BadCowChopC = {};
BadCowChopC.type = "Base.BadCowChop";
BadCowChopC.minCount = 1;
BadCowChopC.maxCount = 1;
BadCowChopC.minSkill = 7;
BadCowChopC.maxSkill = 9;
BadCowChopC.DataName = "BadCowFilletDataC";

local Steak = {};
Steak.type = "Base.Steak";
Steak.minCount = 1;
Steak.maxCount = 4;
Steak.minSkill = 3;
Steak.maxSkill = 10;
Steak.DataName = "SteakData";

local SteakB = {};
SteakB.type = "Base.Steak";
SteakB.minCount = 1;
SteakB.maxCount = 2;
SteakB.minSkill = 6;
SteakB.maxSkill = 10;
SteakB.DataName = "SteakDataB";

local SteakC = {};
SteakC.type = "Base.Steak";
SteakC.minCount = 1;
SteakC.maxCount = 2;
SteakC.minSkill = 8;
SteakC.maxSkill = 10;
SteakC.DataName = "SteakDataC";

local Cowribs = {};
Cowribs.type = "Base.Cowribs";
Cowribs.minCount = 1;
Cowribs.maxCount = 2;
Cowribs.minSkill = 6;
Cowribs.maxSkill = 10;
Cowribs.DataName = "Cowribs";


--Chuletas de cordero mal cortados
local BadMuttonChop = {};
BadMuttonChop.type = "Base.BadMuttonChop";
BadMuttonChop.minCount = 1;
BadMuttonChop.maxCount = 4;
BadMuttonChop.minSkill = 0;
BadMuttonChop.maxSkill = 4;
BadMuttonChop.DataName = "BadMuttonFilletData";

--Chuletas de cordero mal cortados
local BadMuttonChopB = {};
BadMuttonChopB.type = "Base.BadMuttonChop";
BadMuttonChopB.minCount = 1;
BadMuttonChopB.maxCount = 2;
BadMuttonChopB.minSkill = 5;
BadMuttonChopB.maxSkill = 6;
BadMuttonChopB.DataName = "BadMuttonFilletDataB";

--Chuletas de cordero mal cortados
local BadMuttonChopC = {};
BadMuttonChopC.type = "Base.BadMuttonChop";
BadMuttonChopC.minCount = 1;
BadMuttonChopC.maxCount = 1;
BadMuttonChopC.minSkill = 7;
BadMuttonChopC.maxSkill = 9;
BadMuttonChopC.DataName = "BadMuttonFilletDataC";


--Chuletas de cordero
local MuttonChop = {};
MuttonChop.type = "Base.MuttonChop";
MuttonChop.minCount = 1;
MuttonChop.maxCount = 4;
MuttonChop.minSkill = 3;
MuttonChop.maxSkill = 10;
MuttonChop.DataName = "MuttonData";

local MuttonChopB = {};
MuttonChopB.type = "Base.MuttonChop";
MuttonChopB.minCount = 1;
MuttonChopB.maxCount = 2;
MuttonChopB.minSkill = 6;
MuttonChopB.maxSkill = 10;
MuttonChopB.DataName = "MuttonDataB";

local MuttonChopC = {};
MuttonChopC.type = "Base.MuttonChop";
MuttonChopC.minCount = 1;
MuttonChopC.maxCount = 2;
MuttonChopC.minSkill = 8;
MuttonChopC.maxSkill = 10;
MuttonChopC.DataName = "MuttonDataC";

--Bear
--Chuletas de oso mal cortados
local BadBearChop = {};
BadBearChop.type = "Base.BadBearChop";
BadBearChop.minCount = 1;
BadBearChop.maxCount = 4;
BadBearChop.minSkill = 0;
BadBearChop.maxSkill = 4;
BadBearChop.DataName = "BadBearFilletData";

--Chuletas de oso mal cortados
local BadBearChopB = {};
BadBearChopB.type = "Base.BadBearChop";
BadBearChopB.minCount = 1;
BadBearChopB.maxCount = 2;
BadBearChopB.minSkill = 5;
BadBearChopB.maxSkill = 6;
BadBearChopB.DataName = "BadBearFilletDataB";

--Chuletas de oso mal cortados
local BadBearChopC = {};
BadBearChopC.type = "Base.BadBearChop";
BadBearChopC.minCount = 1;
BadBearChopC.maxCount = 1;
BadBearChopC.minSkill = 7;
BadBearChopC.maxSkill = 9;
BadBearChopC.DataName = "BadBearFilletDataC";

local BearSteak = {};
BearSteak.type = "Base.BearSteak";
BearSteak.minCount = 1;
BearSteak.maxCount = 2;
BearSteak.minSkill = 3;
BearSteak.maxSkill = 10;
BearSteak.DataName = "BearSteakData";

local BearSteakB = {};
BearSteakB.type = "Base.BearSteak";
BearSteakB.minCount = 1;
BearSteakB.maxCount = 2;
BearSteakB.minSkill = 6;
BearSteakB.maxSkill = 10;
BearSteakB.DataName = "BearSteakDataB";

local BearSteakC = {};
BearSteakC.type = "Base.BearSteak";
BearSteakC.minCount = 1;
BearSteakC.maxCount = 2;
BearSteakC.minSkill = 8;
BearSteakC.maxSkill = 10;
BearSteakC.DataName = "BearSteakDataC";

--Bison
--Chuletas de Bisonte mal cortados
local BadBisonChop = {};
BadBisonChop.type = "Base.BadBisonChop";
BadBisonChop.minCount = 1;
BadBisonChop.maxCount = 4;
BadBisonChop.minSkill = 0;
BadBisonChop.maxSkill = 4;
BadBisonChop.DataName = "BadBisonFilletData";

--Chuletas de Bisonte mal cortados
local BadBisonChopB = {};
BadBisonChopB.type = "Base.BadBisonChop";
BadBisonChopB.minCount = 1;
BadBisonChopB.maxCount = 2;
BadBisonChopB.minSkill = 5;
BadBisonChopB.maxSkill = 6;
BadBisonChopB.DataName = "BadBisonFilletDataB";

--Chuletas de Bisonte mal cortados
local BadBisonChopC = {};
BadBisonChopC.type = "Base.BadBisonChop";
BadBisonChopC.minCount = 1;
BadBisonChopC.maxCount = 1;
BadBisonChopC.minSkill = 7;
BadBisonChopC.maxSkill = 9;
BadBisonChopC.DataName = "BadBisonFilletDataC";

local BisonSteak = {};
BisonSteak.type = "Base.BisonSteak";
BisonSteak.minCount = 1;
BisonSteak.maxCount = 4;
BisonSteak.minSkill = 3;
BisonSteak.maxSkill = 10;
BisonSteak.DataName = "BisonSteakData";

local BisonSteakB = {};
BisonSteakB.type = "Base.BisonSteak";
BisonSteakB.minCount = 1;
BisonSteakB.maxCount = 2;
BisonSteakB.minSkill = 6;
BisonSteakB.maxSkill = 10;
BisonSteakB.DataName = "BisonSteakDataB";

local BisonSteakC = {};
BisonSteakC.type = "Base.BisonSteak";
BisonSteakC.minCount = 1;
BisonSteakC.maxCount = 2;
BisonSteakC.minSkill = 8;
BisonSteakC.maxSkill = 10;
BisonSteakC.DataName = "BisonSteakDataC";

-- Moose
--Chuletas de Bisonte mal cortados
local BadMooseChop = {};
BadMooseChop.type = "Base.BadMooseChop";
BadMooseChop.minCount = 1;
BadMooseChop.maxCount = 4;
BadMooseChop.minSkill = 0;
BadMooseChop.maxSkill = 4;
BadMooseChop.DataName = "BadMooseFilletData";

--Chuletas de Bisonte mal cortados
local BadMooseChopB = {};
BadMooseChopB.type = "Base.BadMooseChop";
BadMooseChopB.minCount = 1;
BadMooseChopB.maxCount = 2;
BadMooseChopB.minSkill = 5;
BadMooseChopB.maxSkill = 6;
BadMooseChopB.DataName = "BadMooseFilletDataB";

--Chuletas de Bisonte mal cortados
local BadMooseChopC = {};
BadMooseChopC.type = "Base.BadMooseChop";
BadMooseChopC.minCount = 1;
BadMooseChopC.maxCount = 1;
BadMooseChopC.minSkill = 7;
BadMooseChopC.maxSkill = 9;
BadMooseChopC.DataName = "BadMooseFilletDataC";

local MooseSteak = {};
MooseSteak.type = "Base.MooseSteak";
MooseSteak.minCount = 1;
MooseSteak.maxCount = 4;
MooseSteak.minSkill = 3;
MooseSteak.maxSkill = 10;
MooseSteak.DataName = "MooseSteakData";

local MooseSteakB = {};
MooseSteakB.type = "Base.MooseSteak";
MooseSteakB.minCount = 1;
MooseSteakB.maxCount = 2;
MooseSteakB.minSkill = 6;
MooseSteakB.maxSkill = 10;
MooseSteakB.DataName = "MooseSteakDataB";

local MooseSteakC = {};
MooseSteakC.type = "Base.MooseSteak";
MooseSteakC.minCount = 1;
MooseSteakC.maxCount = 2;
MooseSteakC.minSkill = 8;
MooseSteakC.maxSkill = 10;
MooseSteakC.DataName = "MooseSteakDataC";

--Deer DeerChop
--Chuletas de venado mal cortados
local BadDeerChop = {};
BadDeerChop.type = "Base.BadDeerChop";
BadDeerChop.minCount = 1;
BadDeerChop.maxCount = 4;
BadDeerChop.minSkill = 0;
BadDeerChop.maxSkill = 4;
BadDeerChop.DataName = "BadDeerFilletData";

--Chuletas de venado mal cortados
local BadDeerChopB = {};
BadDeerChopB.type = "Base.BadDeerChop";
BadDeerChopB.minCount = 1;
BadDeerChopB.maxCount = 2;
BadDeerChopB.minSkill = 5;
BadDeerChopB.maxSkill = 6;
BadDeerChopB.DataName = "BadDeerFilletDataB";

--Chuletas de venado mal cortados
local BadDeerChopC = {};
BadDeerChopC.type = "Base.BadDeerChop";
BadDeerChopC.minCount = 1;
BadDeerChopC.maxCount = 1;
BadDeerChopC.minSkill = 7;
BadDeerChopC.maxSkill = 9;
BadDeerChopC.DataName = "BadDeerFilletDataC";

local DeerChop = {};
DeerChop.type = "Base.DeerChop";
DeerChop.minCount = 1;
DeerChop.maxCount = 4;
DeerChop.minSkill = 4;
DeerChop.maxSkill = 10;
DeerChop.DataName = "DeerChopData";

local DeerChopB = {};
DeerChopB.type = "Base.DeerChop";
DeerChopB.minCount = 1;
DeerChopB.maxCount = 2;
DeerChopB.minSkill = 6;
DeerChopB.maxSkill = 10;
DeerChopB.DataName = "DeerChopDataB";

local DeerChopC = {};
DeerChopC.type = "Base.DeerChop";
DeerChopC.minCount = 1;
DeerChopC.maxCount = 2;
DeerChopC.minSkill = 8;
DeerChopC.maxSkill = 10;
DeerChopC.DataName = "DeerChopDataC";
----- Old
local Bisonmeat = {};
Bisonmeat.type = "Base.Bisonmeat";
Bisonmeat.minCount = 1;
Bisonmeat.maxCount = 1;
Bisonmeat.skill = 0;

local ChickenMeat = {};
ChickenMeat.type = "Base.ChickenMeat";
ChickenMeat.minCount = 1;
ChickenMeat.maxCount = 1;
ChickenMeat.skill = 0;

local BearMeat = {};
BearMeat.type = "Base.BearMeat";
BearMeat.minCount = 1;
BearMeat.maxCount = 1;
BearMeat.skill = 0;

local MooseMeat = {};
MooseMeat.type = "Base.MooseMeat";
MooseMeat.minCount = 1;
MooseMeat.maxCount = 1;
MooseMeat.skill = 0;

local DeerMeat = {};
DeerMeat.type = "Base.DeerMeat";
DeerMeat.minCount = 1;
DeerMeat.maxCount = 1;
DeerMeat.skill = 0;

local SheepMeat = {};
SheepMeat.type = "Base.SheepMeat";
SheepMeat.minCount = 1;
SheepMeat.maxCount = 1;
SheepMeat.skill = 0;

-- Jabalí
table.insert(DepostarDefinitions["DeadPork"].items, BadPorkChop);
table.insert(DepostarDefinitions["DeadPork"].items, BadPorkChopB);
table.insert(DepostarDefinitions["DeadPork"].items, BadPorkChopC);
table.insert(DepostarDefinitions["DeadPork"].items, PorkChop);
table.insert(DepostarDefinitions["DeadPork"].items, PorkChopB);
table.insert(DepostarDefinitions["DeadPork"].items, PorkChopC);
table.insert(DepostarDefinitions["DeadPork"].items, Ham);
table.insert(DepostarDefinitions["DeadPork"].items, Tendon);
table.insert(DepostarDefinitions["DeadPork"].items, Bacon);
table.insert(DepostarDefinitions["DeadPork"].items, HogCasings);

-- Vaca
table.insert(DepostarDefinitions["DeadCow"].items, BadCowChop);
table.insert(DepostarDefinitions["DeadCow"].items, BadCowChopB);
table.insert(DepostarDefinitions["DeadCow"].items, BadCowChopC);
table.insert(DepostarDefinitions["DeadCow"].items, Steak);
table.insert(DepostarDefinitions["DeadCow"].items, SteakB);
table.insert(DepostarDefinitions["DeadCow"].items, SteakC);
table.insert(DepostarDefinitions["DeadCow"].items, Cowmeat);
table.insert(DepostarDefinitions["DeadCow"].items, Tendon);
table.insert(DepostarDefinitions["DeadCow"].items, HogCasings);
table.insert(DepostarDefinitions["DeadCow"].items, Cowribs);

--Sheep
table.insert(DepostarDefinitions["DeadSheep"].items, BadMuttonChop);
table.insert(DepostarDefinitions["DeadSheep"].items, BadMuttonChopB);
table.insert(DepostarDefinitions["DeadSheep"].items, BadMuttonChopC);
table.insert(DepostarDefinitions["DeadSheep"].items, MuttonChop);
table.insert(DepostarDefinitions["DeadSheep"].items, MuttonChopB);
table.insert(DepostarDefinitions["DeadSheep"].items, MuttonChopC);
table.insert(DepostarDefinitions["DeadSheep"].items, Tendon);
table.insert(DepostarDefinitions["DeadSheep"].items, HogCasings);

--Bear
table.insert(DepostarDefinitions["DeadBear"].items, BadBearChop);
table.insert(DepostarDefinitions["DeadBear"].items, BadBearChopB);
table.insert(DepostarDefinitions["DeadBear"].items, BadBearChopC);
table.insert(DepostarDefinitions["DeadBear"].items, BearSteak);
table.insert(DepostarDefinitions["DeadBear"].items, BearSteakB);
table.insert(DepostarDefinitions["DeadBear"].items, BearSteakC);
table.insert(DepostarDefinitions["DeadBear"].items, Tendon);

--Bison
table.insert(DepostarDefinitions["DeadBison"].items, BadBisonChop);
table.insert(DepostarDefinitions["DeadBison"].items, BadBisonChopB);
table.insert(DepostarDefinitions["DeadBison"].items, BadBisonChopC);
table.insert(DepostarDefinitions["DeadBison"].items, BisonSteak);
table.insert(DepostarDefinitions["DeadBison"].items, BisonSteakB);
table.insert(DepostarDefinitions["DeadBison"].items, BisonSteakC);
table.insert(DepostarDefinitions["DeadBison"].items, Tendon);
table.insert(DepostarDefinitions["DeadBison"].items, HogCasings);

--Moose
table.insert(DepostarDefinitions["DeadMoose"].items, BadMooseChop);
table.insert(DepostarDefinitions["DeadMoose"].items, BadMooseChopB);
table.insert(DepostarDefinitions["DeadMoose"].items, BadMooseChopC);
table.insert(DepostarDefinitions["DeadMoose"].items, MooseSteak);
table.insert(DepostarDefinitions["DeadMoose"].items, MooseSteakB);
table.insert(DepostarDefinitions["DeadMoose"].items, MooseSteakC);
table.insert(DepostarDefinitions["DeadMoose"].items, Tendon);
table.insert(DepostarDefinitions["DeadMoose"].items, HogCasings);

table.insert(DepostarDefinitions["DeadDeer"].items, BadDeerChop);
table.insert(DepostarDefinitions["DeadDeer"].items, BadDeerChopB);
table.insert(DepostarDefinitions["DeadDeer"].items, BadDeerChopC);
table.insert(DepostarDefinitions["DeadDeer"].items, DeerChop);
table.insert(DepostarDefinitions["DeadDeer"].items, DeerChopB);
table.insert(DepostarDefinitions["DeadDeer"].items, DeerChopC);
table.insert(DepostarDefinitions["DeadDeer"].items, Tendon);
table.insert(DepostarDefinitions["DeadDeer"].items, HogCasings);