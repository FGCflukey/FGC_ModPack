require 'Items/SuburbsDistributions'
require 'Vehicles/VehicleDistributions'
require 'Items/ItemPicker'
--require 'Items/ProceduralDistributions'
--table.insert(ProceduralDistributions.list["CrateFarming"].items, "Greenfire.CannabisBagSeed");
--table.insert(ProceduralDistributions.list["CrateFarming"].items, 0.5);

local vehicmod = 1/(2^(SandboxVars.CarSpawnRate-2));
local chancefoodmodifier = 1;
local chanceothermodifier = 1;
local multip = 1/2;
if ZomboidGlobals.FoodLootModifier == 5 then
	chancefoodmodifier = 2^1000
elseif ZomboidGlobals.FoodLootModifier == 4 then
	chancefoodmodifier = 2^512/(1*(SandboxVars.OtherLoot/15 + SandboxVars.MedicalLoot/15 + SandboxVars.LiteratureLoot/15));
elseif ZomboidGlobals.FoodLootModifier == 3 then
	chancefoodmodifier = 0.67/(1*(SandboxVars.OtherLoot/15 + SandboxVars.MedicalLoot/15 + SandboxVars.LiteratureLoot/15));
elseif ZomboidGlobals.FoodLootModifier == 2 then
	chancefoodmodifier = 0.6/(0.5*(SandboxVars.OtherLoot/15 + SandboxVars.MedicalLoot/15 + SandboxVars.LiteratureLoot/15));
elseif ZomboidGlobals.FoodLootModifier == 1 then
	chancefoodmodifier = 0.2/(0.4*(SandboxVars.OtherLoot/15 + SandboxVars.MedicalLoot/15 + SandboxVars.LiteratureLoot/15));
end
if ZomboidGlobals.OtherLootModifier == 5 then
	chanceothermodifier = 2^1000;
elseif ZomboidGlobals.OtherLootModifier == 4 then
	chanceothermodifier = 2^512;
elseif ZomboidGlobals.OtherLootModifier == 3 then
	chanceothermodifier = 0.67;
elseif ZomboidGlobals.OtherLootModifier == 2 then
	chanceothermodifier = 0.6/0.5;
elseif ZomboidGlobals.OtherLootModifier == 1 then
	chanceothermodifier = 0.2/0.4;
end

local function insertGFVItems(items)
  local chance_corpse = -1 * (0.1 / ZomboidGlobals.OtherLootModifier ) * 1;
  local chance_other = 0.7;
  local rare = 0.1;
  local lotto = 0.001;
  local extreme = 0.0001;
  local astronomical = 0.00001;
  local cannachance = 0.0000000001 / chancefoodmodifier;
	if ProceduralDistributions ~= nil then
		cannachance = 1;
	end
	for i=1, #items, 2 do
		local itemName = items[i];
		if itemName == "CreditCard" then
			table.insert(items, "Greenfire.TobaccoSeed");
			table.insert(items, cannachance);
			table.insert(items, "Greenfire.CannabisSeed");
			table.insert(items, cannachance);
			table.insert(items, "Greenfire.GFCigar");
			table.insert(items, chance_corpse);
			table.insert(items, "Greenfire.HalfCigar");
			table.insert(items, chance_corpse);
			table.insert(items, "Greenfire.BluntCigar");
			table.insert(items, chance_corpse);
			table.insert(items, "Greenfire.HalfBluntCigar");
			table.insert(items, chance_corpse);
			table.insert(items, "Greenfire.Blunt");
			table.insert(items, cannachance);
			table.insert(items, "Greenfire.HalfBlunt");
			table.insert(items, cannachance);
			table.insert(items, "Greenfire.Joint");
			table.insert(items, cannachance);
			table.insert(items, "Greenfire.HalfJoint");
			table.insert(items, cannachance);
			table.insert(items, "Greenfire.Cannabis");
			table.insert(items, cannachance);
			table.insert(items, "Greenfire.SmokingPipe");
			table.insert(items, astronomical / chanceothermodifier);
			table.insert(items, "Greenfire.RollingPapers");
			table.insert(items, extreme / chanceothermodifier);
			table.insert(items, "Greenfire.PipeTobaccoBag");
			table.insert(items, astronomical / chanceothermodifier);
			table.insert(items, "Greenfire.Spliff");
			table.insert(items, cannachance);
      			break
    		elseif itemName == "Cockroach" or itemName == "Extinguisher" then
			table.insert(items, "Greenfire.CannabisSeed");
			table.insert(items, cannachance);
			table.insert(items, "Greenfire.TobaccoSeed");
			table.insert(items, cannachance);
			table.insert(items, "Greenfire.PipeTobaccoBag");
        		table.insert(items, cannachance);
        		table.insert(items, "Greenfire.SmokingPipe");
        		table.insert(items, 0.1/chanceothermodifier);
        		table.insert(items, "Greenfire.RollingPapers");
        		table.insert(items, 0.1/chanceothermodifier);
        		table.insert(items, "Greenfire.BluntCigar");
        		table.insert(items, 1);
        		table.insert(items, "Greenfire.GFCigar");
        		table.insert(items, cannachance);
        		table.insert(items, "Greenfire.BluntWrap");
        		table.insert(items, 0.1/chanceothermodifier);
        		table.insert(items, "Greenfire.GFCigaretteCarton");
        		table.insert(items, cannachance);
        		table.insert(items, "Greenfire.GFUsedCigaretteCarton");
        		table.insert(items, cannachance);
        		table.insert(items, "Greenfire.GFEmptyCigaretteCarton");
        		table.insert(items, cannachance);
			table.insert(items, "Greenfire.Joint");
			table.insert(items, cannachance);
			table.insert(items, "Greenfire.Blunt");
			table.insert(items, cannachance);
			table.insert(items, "Greenfire.Cannabis");
			table.insert(items, cannachance);
			table.insert(items, "Greenfire.OzCannabis");
			table.insert(items, astronomical / chancefoodmodifier);
			table.insert(items, "Greenfire.GFMystery1");
			table.insert(items, cannachance);
			table.insert(items, "Greenfire.Spliff");
			table.insert(items, cannachance);
      			break
		end
	end
end

if ProceduralDistributions == nil then
for k1,v1 in pairs(VehicleDistributions) do
  local items = v1["items"];
  
  if items then
    insertGFVItems(items);
  else
    for k2,v2 in pairs(v1) do
      items = v2["items"];
      if items then
        insertGFVItems(items);
      end
    end
  end
end
else
			table.insert(VehicleDistributions.GloveBox.items, "Greenfire.CannabisSeed");
			table.insert(VehicleDistributions.GloveBox.items, vehicmod*0.03/chanceothermodifier);
			table.insert(VehicleDistributions.GloveBox.items, "Greenfire.TobaccoSeed");
			table.insert(VehicleDistributions.GloveBox.items, vehicmod*0.06/chanceothermodifier);
			table.insert(VehicleDistributions.GloveBox.items, "Greenfire.PipeTobaccoBag");
        		table.insert(VehicleDistributions.GloveBox.items, vehicmod*0.1/chancefoodmodifier);
        		table.insert(VehicleDistributions.GloveBox.items, "Greenfire.SmokingPipe");
        		table.insert(VehicleDistributions.GloveBox.items, vehicmod*0.1/chanceothermodifier);
        		table.insert(VehicleDistributions.GloveBox.items, "Greenfire.RollingPapers");
        		table.insert(VehicleDistributions.GloveBox.items, vehicmod*0.1/chanceothermodifier);
        		table.insert(VehicleDistributions.GloveBox.items, "Greenfire.BluntCigar");
        		table.insert(VehicleDistributions.GloveBox.items, vehicmod*multip/chanceothermodifier);
        		table.insert(VehicleDistributions.GloveBox.items, "Greenfire.GFCigar");
        		table.insert(VehicleDistributions.GloveBox.items, vehicmod*multip/chancefoodmodifier);
        		table.insert(VehicleDistributions.GloveBox.items, "Greenfire.BluntWrap");
        		table.insert(VehicleDistributions.GloveBox.items, vehicmod*0.1/chanceothermodifier);
        		table.insert(VehicleDistributions.GloveBox.items, "Greenfire.GFCigaretteCarton");
        		table.insert(VehicleDistributions.GloveBox.items, vehicmod*0.1 / chanceothermodifier);
        		table.insert(VehicleDistributions.GloveBox.items, "Greenfire.GFUsedCigaretteCarton");
        		table.insert(VehicleDistributions.GloveBox.items, vehicmod*0.3 / chanceothermodifier);
        		table.insert(VehicleDistributions.GloveBox.items, "Greenfire.GFEmptyCigaretteCarton");
        		table.insert(VehicleDistributions.GloveBox.items, vehicmod*multip / chanceothermodifier);
			table.insert(VehicleDistributions.GloveBox.items, "Greenfire.GFSuspect1");
			table.insert(VehicleDistributions.GloveBox.items, vehicmod*multip / chancefoodmodifier);
			table.insert(VehicleDistributions.GloveBox.items, "Greenfire.Cannabis");
			table.insert(VehicleDistributions.GloveBox.items, vehicmod*multip / chancefoodmodifier);
			table.insert(VehicleDistributions.GloveBox.items, "Greenfire.OzCannabis");
			table.insert(VehicleDistributions.GloveBox.items, vehicmod*0.001 / chancefoodmodifier);
			table.insert(VehicleDistributions.GloveBox.items, "Greenfire.GFMystery1");
			table.insert(VehicleDistributions.GloveBox.items, vehicmod*0.1 / chanceothermodifier);
			table.insert(VehicleDistributions.GloveBox.items, "Greenfire.GFGrinder");
			table.insert(VehicleDistributions.GloveBox.items, vehicmod*0.01 / chanceothermodifier);
			table.insert(VehicleDistributions.TrunkStandard.items, "Greenfire.GFMystery1");
			table.insert(VehicleDistributions.TrunkStandard.items, vehicmod*0.1/chanceothermodifier);
			table.insert(VehicleDistributions.TrunkStandard.items, "Greenfire.GFGrinder");
			table.insert(VehicleDistributions.TrunkStandard.items, vehicmod*0.01/chanceothermodifier);
			table.insert(VehicleDistributions.TrunkStandard.items, "Greenfire.TobaccoBagSeed");
			table.insert(VehicleDistributions.TrunkStandard.items, vehicmod*0.1/chanceothermodifier);
			table.insert(VehicleDistributions.TrunkStandard.items, "Greenfire.CannabisBagSeed");
			table.insert(VehicleDistributions.TrunkStandard.items, vehicmod*0.01/chanceothermodifier);
			table.insert(VehicleDistributions.TrunkStandard.items, "Greenfire.GFCigaretteCarton");
			table.insert(VehicleDistributions.TrunkStandard.items, vehicmod*0.01/chanceothermodifier);
			table.insert(VehicleDistributions.TrunkStandard.items, "Greenfire.GFUsedCigaretteCarton");
			table.insert(VehicleDistributions.TrunkStandard.items, vehicmod*0.1/chanceothermodifier);
			table.insert(VehicleDistributions.TrunkStandard.items, "Greenfire.GFEmptyCigaretteCarton");
			table.insert(VehicleDistributions.TrunkStandard.items, vehicmod*0.01/chanceothermodifier);
			table.insert(VehicleDistributions.TrunkSports.items, "Greenfire.GFMystery1");
			table.insert(VehicleDistributions.TrunkSports.items, vehicmod*0.1/chanceothermodifier);
			table.insert(VehicleDistributions.TrunkSports.items, "Greenfire.GFGrinder");
			table.insert(VehicleDistributions.TrunkSports.items, vehicmod*0.01/chanceothermodifier);
			table.insert(VehicleDistributions.TrunkSports.items, "Greenfire.TobaccoBagSeed");
			table.insert(VehicleDistributions.TrunkSports.items, vehicmod*0.1/chanceothermodifier);
			table.insert(VehicleDistributions.TrunkSports.items, "Greenfire.CannabisBagSeed");
			table.insert(VehicleDistributions.TrunkSports.items, vehicmod*0.01/chanceothermodifier);
			table.insert(VehicleDistributions.TrunkSports.items, "Greenfire.GFCigaretteCarton");
			table.insert(VehicleDistributions.TrunkSports.items, vehicmod*0.01/chanceothermodifier);
			table.insert(VehicleDistributions.TrunkSports.items, "Greenfire.GFUsedCigaretteCarton");
			table.insert(VehicleDistributions.TrunkSports.items, vehicmod*0.1/chanceothermodifier);
			table.insert(VehicleDistributions.TrunkSports.items, "Greenfire.GFEmptyCigaretteCarton");
			table.insert(VehicleDistributions.TrunkSports.items, vehicmod*0.01/chanceothermodifier);
end


