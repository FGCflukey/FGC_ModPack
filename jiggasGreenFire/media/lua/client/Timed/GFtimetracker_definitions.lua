--[[

Life is number of (in game)hours to live before turning into "TurnInto"
for example 0.5 would be 30 in game minutes, 0.25 would be 15 minutes, 24.0 would be one day

TurnInto is the item that it will turn into after the amount of life time has expired

Make sure each you have ItemTimeTrackerMod["ItemCodeNameHERE"] = {}; before the Life and TurnInto lines (see examples below)
 
]]
if ProceduralDistributions ~= nil then
if isClient() then return end
end

if ItemTimeTrackerMod == nil then
ItemTimeTrackerMod = {}; -- DONT delete this!
end

local div = 1;

if SandboxVars.Farming == 1 then
	div = 6;
elseif SandboxVars.Farming == 2 then
	div = 4.5;
elseif SandboxVars.Farming == 3 then
	div = 3;
elseif SandboxVars.Farming == 4 then
	div = 1.5;
elseif SandboxVars.Farming == 5 then
	div = 1;
end

--11 to 17 days to dry if untrimmed
ItemTimeTrackerMod["FreshUnCanna"] = {};
ItemTimeTrackerMod["FreshUnCanna"]["Life"] = ZombRand(264, 408)/div;
ItemTimeTrackerMod["FreshUnCanna"]["TurnInto"] = "Greenfire.DryUnCanna";
--5 to 14 days to dry if trimmed
ItemTimeTrackerMod["FreshTCanna"] = {};
ItemTimeTrackerMod["FreshTCanna"]["Life"] = ZombRand(120, 336)/div;
ItemTimeTrackerMod["FreshTCanna"]["TurnInto"] = "Greenfire.DryTCanna";
--2 to 3 weeks to cure
ItemTimeTrackerMod["UnCannaJar"] = {};
ItemTimeTrackerMod["UnCannaJar"]["Life"] = ZombRand(336, 504)/div;
ItemTimeTrackerMod["UnCannaJar"]["TurnInto"] = "Greenfire.CannaJar";
ItemTimeTrackerMod["UnCannaJar2"] = {};
ItemTimeTrackerMod["UnCannaJar2"]["Life"] = ZombRand(336, 504)/div;
ItemTimeTrackerMod["UnCannaJar2"]["TurnInto"] = "Greenfire.CannaJar2";
ItemTimeTrackerMod["UnCannaJar3"] = {};
ItemTimeTrackerMod["UnCannaJar3"]["Life"] = ZombRand(336, 504)/div;
ItemTimeTrackerMod["UnCannaJar3"]["TurnInto"] = "Greenfire.CannaJar3";
ItemTimeTrackerMod["UnCannaJar4"] = {};
ItemTimeTrackerMod["UnCannaJar4"]["Life"] = ZombRand(336, 504)/div;
ItemTimeTrackerMod["UnCannaJar4"]["TurnInto"] = "Greenfire.CannaJar4";
--4 to 8 weeks to dry tobacco
ItemTimeTrackerMod["FreshBTobacco"] = {};
ItemTimeTrackerMod["FreshBTobacco"]["Life"] = ZombRand(672, 1344)/div;
ItemTimeTrackerMod["FreshBTobacco"]["TurnInto"] = "Greenfire.DryBTobacco";
--2 to 3 days to dry
ItemTimeTrackerMod["FreshCannabisFanLeaf"] = {};
ItemTimeTrackerMod["FreshCannabisFanLeaf"]["Life"] = ZombRand(48, 60)/div;
ItemTimeTrackerMod["FreshCannabisFanLeaf"]["TurnInto"] = "Greenfire.DryCannabisFanLeaf";
--2 to 3 days to dry
ItemTimeTrackerMod["FreshCannabisSugarLeaf"] = {};
ItemTimeTrackerMod["FreshCannabisSugarLeaf"]["Life"] = ZombRand(48, 60)/div;
ItemTimeTrackerMod["FreshCannabisSugarLeaf"]["TurnInto"] = "Greenfire.DryCannabisSugarLeaf";
--1 to 2 weeks to cure
ItemTimeTrackerMod["UncuredCigar"] = {};
ItemTimeTrackerMod["UncuredCigar"]["Life"] = ZombRand(168, 336)/div;
ItemTimeTrackerMod["UncuredCigar"]["TurnInto"] = "Greenfire.GFCigar";
ItemTimeTrackerMod["UncuredCannaCigar"] = {};
ItemTimeTrackerMod["UncuredCannaCigar"]["Life"] = ZombRand(168, 336)/div;
ItemTimeTrackerMod["UncuredCannaCigar"]["TurnInto"] = "Greenfire.CannaCigar";
ItemTimeTrackerMod["UncuredPreCannaCigar"] = {};
ItemTimeTrackerMod["UncuredPreCannaCigar"]["Life"] = ZombRand(168, 336)/div;
ItemTimeTrackerMod["UncuredPreCannaCigar"]["TurnInto"] = "Greenfire.PreCannaCigar";
ItemTimeTrackerMod["UncuredDelCannaCigar"] = {};
ItemTimeTrackerMod["UncuredDelCannaCigar"]["Life"] = ZombRand(168, 336)/div;
ItemTimeTrackerMod["UncuredDelCannaCigar"]["TurnInto"] = "Greenfire.DelCannaCigar";
ItemTimeTrackerMod["UncuredResCannaCigar"] = {};
ItemTimeTrackerMod["UncuredResCannaCigar"]["Life"] = ZombRand(168, 336)/div;
ItemTimeTrackerMod["UncuredResCannaCigar"]["TurnInto"] = "Greenfire.ResCannaCigar";