require 'Items/SuburbsDistributions'

local chancefoodmodifier = 1;
local chanceothermodifier = 1;
if ZomboidGlobals.FoodLootModifier == 5 then
	chancefoodmodifier = 2^1000;
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

local seedchance = 0.0000000001 / chanceothermodifier;
local cannachance = 0.000000001 / chancefoodmodifier;
local bongchance = 0.000000001 / chanceothermodifier;
local grinderchance = 0.0000000001 / chanceothermodifier;
local multip = 1/2;
if ProceduralDistributions ~= nil then
	seedchance = (SandboxVars.SurvivalGearsLoot/15 + SandboxVars.MedicalLoot/15 + SandboxVars.LiteratureLoot/15)*multip*0.3 / chanceothermodifier;
	cannachance = multip*0.1 / chancefoodmodifier;
	bongchance = (SandboxVars.MedicalLoot/10 + SandboxVars.LiteratureLoot/10)*multip*0.75 / chanceothermodifier;
	grinderchance = (SandboxVars.MedicalLoot/10 + SandboxVars.LiteratureLoot/10)*multip*0.003 / chanceothermodifier;
end

local function insertGFItems(items)
  local chance_corpse = -1 * (0.1 / ZomboidGlobals.OtherLootModifier ) * 1;
  local chance_other = 1;
  local uncommon = 0.5;
  local rare = 0.1;
  local lotto = 0.001;
  local extreme = 0.0001;
  local astronomical = 0.0000001;
	for i=1, #items, 2 do
		local itemName = items[i];
		if itemName == "CreditCard" then
			table.insert(items, "Greenfire.TobaccoSeed");
			table.insert(items, seedchance);
			table.insert(items, "Greenfire.CannabisSeed");
			table.insert(items, seedchance);
			table.insert(items, "Greenfire.GFCigar");
			table.insert(items, lotto/chancefoodmodifier);
			table.insert(items, "Greenfire.HalfCigar");
			table.insert(items, lotto/chancefoodmodifier);
			table.insert(items, "Greenfire.BluntCigar");
			table.insert(items, lotto/chancefoodmodifier);
			table.insert(items, "Greenfire.HalfBluntCigar");
			table.insert(items, lotto/chancefoodmodifier);
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
			table.insert(items, extreme/chanceothermodifier);
			table.insert(items, "Greenfire.RollingPapers");
			table.insert(items, extreme/chanceothermodifier);
			table.insert(items, "Greenfire.PipeTobaccoBag");
			table.insert(items, astronomical/chanceothermodifier);
			table.insert(items, "Greenfire.Spliff");
			table.insert(items, cannachance);
      			break
    		elseif itemName == "Cigarettes" then
			table.insert(items, "Greenfire.PipeTobaccoBag");
        		table.insert(items, astronomical/chanceothermodifier);
        		table.insert(items, "Greenfire.SmokingPipe");
        		table.insert(items, 1);
        		table.insert(items, "Greenfire.RollingPapers");
        		table.insert(items, 2);
        		table.insert(items, "Greenfire.BluntCigar");
        		table.insert(items, 1);
        		table.insert(items, "Greenfire.GFCigar");
        		table.insert(items, 1);
        		table.insert(items, "Greenfire.BluntWrap");
        		table.insert(items, 1/chanceothermodifier);
			if not getActivatedMods():contains("Hydrocraft") then
        			table.insert(items, "Greenfire.GFCigaretteCarton");
        			table.insert(items, 0.000003/chanceothermodifier);
        			table.insert(items, "Greenfire.GFUsedCigaretteCarton");
        			table.insert(items, 0.000002/chanceothermodifier);
        			table.insert(items, "Greenfire.GFEmptyCigaretteCarton");
        			table.insert(items, 0.000001/chanceothermodifier);
			end
      			break
		elseif itemName == "Magazine" then
			table.insert(items, "Greenfire.AficMag1");
        		table.insert(items, 0.1/chanceothermodifier);
			table.insert(items, "Greenfire.CannaMag1");
        		table.insert(items, 0.2/chanceothermodifier);
			table.insert(items, "Greenfire.CannaMag2");
        		table.insert(items, 0.1/chanceothermodifier);
			table.insert(items, "Greenfire.CannaMag3");
        		table.insert(items, 0.1/chanceothermodifier);
			break
		elseif itemName == "Chocolate" then
			table.insert(items, "Greenfire.Marshmallows");
			table.insert(items, 3);
			table.insert(items, "Greenfire.Marshmallows");
			table.insert(items, 3);
			break
		elseif itemName == "KnittingNeedles" then
			table.insert(items, "Greenfire.RollNylon");
			table.insert(items, 8/chanceothermodifier);
			break
		elseif itemName == "Underwear1" or itemName == "Underwear2" then
			table.insert(items, "Greenfire.CannabisSeed");
			table.insert(items, seedchance);
			table.insert(items, "Greenfire.TobaccoSeed");
			table.insert(items, seedchance);
			break
		elseif itemName == "EmptyJar" then
			table.insert(items, "Base.EmptyJar");
			table.insert(items, 2);
			table.insert(items, "Base.JarLid");
			table.insert(items, 2);
			break
		elseif itemName == "BoxOfJars" then
			table.insert(items, "Base.BoxOfJars");
			table.insert(items, 1);
			table.insert(items, "Base.EmptyJar");
			table.insert(items, 2);
			table.insert(items, "Base.JarLid");
			table.insert(items, 2);
			break
		elseif itemName == "WaterBottleEmpty" then
			if not getActivatedMods():contains("Hydrocraft") then
        			table.insert(items, "Greenfire.GFUsedCigaretteCarton");
        			table.insert(items, astronomical/chanceothermodifier);
			end
        		table.insert(items, "Greenfire.GFEmptyCigaretteCarton");
        		table.insert(items, 5/chanceothermodifier);
			break
		end
	end
end

local function insertGFPItems(items)
--[[
  local chance_corpse = -1 * (0.1 / ZomboidGlobals.OtherLootModifier ) * 1;
  local chance_other = 1;
  local uncommon = 0.5;
  local rare = 0.1;
  local lotto = 0.001;
  local extreme = 0.0001;
  local astronomical = 0.00001;
	for i=1, #items, 2 do
		local itemName = items[i];
		if itemName == "CreditCard" then
			table.insert(items, "Greenfire.TobaccoSeed");
			table.insert(items, chance_corpse);
			table.insert(items, "Greenfire.CannabisSeed");
			table.insert(items, chance_corpse);
			table.insert(items, "Greenfire.GFCigar");
			table.insert(items, chance_corpse);
			table.insert(items, "Greenfire.HalfCigar");
			table.insert(items, chance_corpse);
			table.insert(items, "Greenfire.BluntCigar");
			table.insert(items, chance_corpse);
			table.insert(items, "Greenfire.HalfBluntCigar");
			table.insert(items, chance_corpse);
			table.insert(items, "Greenfire.Blunt");
			table.insert(items, chance_corpse);
			table.insert(items, "Greenfire.HalfBlunt");
			table.insert(items, chance_corpse);
			table.insert(items, "Greenfire.Joint");
			table.insert(items, chance_corpse);
			table.insert(items, "Greenfire.HalfJoint");
			table.insert(items, chance_corpse);
			table.insert(items, "Greenfire.Cannabis");
			table.insert(items, chance_corpse);
			table.insert(items, "Greenfire.SmokingPipe");
			table.insert(items, chance_corpse);
			table.insert(items, "Greenfire.RollingPapers");
			table.insert(items, chance_corpse);
			table.insert(items, "Greenfire.PipeTobaccoBag");
			table.insert(items, chance_corpse);
			table.insert(items, "Greenfire.Spliff");
			table.insert(items, chance_corpse);
      			break
    		elseif itemName == "Cigarettes" then
			table.insert(items, "Greenfire.PipeTobaccoBag");
        		table.insert(items, 0.6);
        		table.insert(items, "Greenfire.SmokingPipe");
        		table.insert(items, 1);
        		table.insert(items, "Greenfire.BluntCigar");
        		table.insert(items, 1);
        		table.insert(items, "Greenfire.BluntWrap");
        		table.insert(items, 1);
        		table.insert(items, "Greenfire.GFCigar");
        		table.insert(items, 1);
        		table.insert(items, "Greenfire.RollingPapers");
        		table.insert(items, 5);
			if not getActivatedMods():contains("Hydrocraft") then
        			table.insert(items, "Greenfire.GFCigaretteCarton");
        			table.insert(items, 0.3);
        			table.insert(items, "Greenfire.GFUsedCigaretteCarton");
        			table.insert(items, 0.2);
        			table.insert(items, "Greenfire.GFEmptyCigaretteCarton");
        			table.insert(items, 0.1);
			end
      			break
		elseif itemName == "Chocolate" then
			table.insert(items, "Greenfire.Marshmallows");
			table.insert(items, 3);
			table.insert(items, "Greenfire.Marshmallows");
			table.insert(items, 3);
			break
		elseif itemName == "KnittingNeedles" then
			table.insert(items, "Greenfire.RollNylon");
			table.insert(items, 8);
			break
		elseif itemName == "EmptyJar" then
			table.insert(items, "Base.EmptyJar");
			table.insert(items, 2);
			table.insert(items, "Base.JarLid");
			table.insert(items, 2);
			break
		elseif itemName == "BoxOfJars" then
			table.insert(items, "Base.BoxOfJars");
			table.insert(items, 1);
			table.insert(items, "Base.EmptyJar");
			table.insert(items, 2);
			table.insert(items, "Base.JarLid");
			table.insert(items, 2);
			break
		elseif itemName == "Underwear1" or itemName == "Underwear2" then
			table.insert(items, "Greenfire.CannabisSeed");
			table.insert(items, extreme);
			table.insert(items, "Greenfire.TobaccoSeed");
			table.insert(items, rare);
			break
		elseif itemName == "WaterBottleEmpty" then
			if not getActivatedMods():contains("Hydrocraft") then
        			table.insert(items, "Greenfire.GFUsedCigaretteCarton");
        			table.insert(items, rare);
			end
        		table.insert(items, "Greenfire.GFEmptyCigaretteCarton");
        		table.insert(items, 5);
			break
		end
	end
	--]]
end



if ProceduralDistributions ~= nil then
	require 'Items/ProceduralDistributions'
	--[[
	for k1,v1 in pairs(ProceduralDistributions) do
		local items = v1["items"];
		if items then
			insertGFPItems(items);
  		else
    			for k2,v2 in pairs(v1) do
				items = v2["items"];
				if items then
					insertGFPItems(items);
				end
			end
		end
	end
	--]]
	local recipelit = (SandboxVars.LiteratureLoot/5)*0.3*multip/chanceothermodifier;

	local recipeLocale = {"OfficeDrawers", "FilingCabinetGeneric", "StoreCounterTobacco", "BedroomSideTable", "MagazineRackMixed", "DeskGeneric", "OtherGeneric", "CrateMagazines", "BookstoreBooks", "LibraryBooks", "BarCounterMisc", "BinBar", "PostOfficeMagazines"}
	for i in pairs(recipeLocale) do
		if ProceduralDistributions.list[recipeLocale[i]] == nil then
			print("FAILURE -- could not find " .. recipeLocale[i] .. "!");
		else
			if ProceduralDistributions.list[recipeLocale[i]].items == nil then
				print("FAILURE -- could not find " .. recipeLocale[i] .. "!");
			else
			table.insert(ProceduralDistributions.list[recipeLocale[i]].items, "Greenfire.AficMag1");
			table.insert(ProceduralDistributions.list[recipeLocale[i]].items, recipelit);
			table.insert(ProceduralDistributions.list[recipeLocale[i]].items, "Greenfire.CannaMag1");
			table.insert(ProceduralDistributions.list[recipeLocale[i]].items, recipelit);
			table.insert(ProceduralDistributions.list[recipeLocale[i]].items, "Greenfire.CannaMag2");
			table.insert(ProceduralDistributions.list[recipeLocale[i]].items, recipelit);
			table.insert(ProceduralDistributions.list[recipeLocale[i]].items, "Greenfire.CannaMag3");
			table.insert(ProceduralDistributions.list[recipeLocale[i]].items, recipelit);
			--print("Loading recipe magazines to " .. recipeLocale[i] .. " ....... SUCCESS!");
			end
		end
	end

	local recipeLocale2 = {"GigamartFarming", "GardenStoreMisc"}
	for i in pairs(recipeLocale2) do
		if ProceduralDistributions.list[recipeLocale2[i]] == nil then
			print("FAILURE -- could not find " .. recipeLocale2[i] .. "!");
		else
			if ProceduralDistributions.list[recipeLocale2[i]].items == nil then
				print("FAILURE -- could not find " .. recipeLocale2[i] .. "!");
			else
			table.insert(ProceduralDistributions.list[recipeLocale2[i]].items, "Greenfire.CannaMag1");
			table.insert(ProceduralDistributions.list[recipeLocale2[i]].items, multip*recipelit);
			table.insert(ProceduralDistributions.list[recipeLocale2[i]].items, "Greenfire.AficMag1");
			table.insert(ProceduralDistributions.list[recipeLocale2[i]].items, multip*recipelit);
			--print("Loading " .. "recipe magazines " .. "to " .. recipeLocale2[i] .. " ....... SUCCESS!");
			end
		end
	end

	local tobaccoLocale = {"StoreCounterTobacco", "CrateCigarettes", "OtherGeneric", "BarCounterMisc"}
	for i in pairs(tobaccoLocale) do
		if ProceduralDistributions.list[tobaccoLocale[i]] == nil then
			print("FAILURE -- could not find " .. tobaccoLocale[i] .. "!");
		else
			if ProceduralDistributions.list[tobaccoLocale[i]].items == nil then
				print("FAILURE -- could not find " .. tobaccoLocale[i] .. "!");
			else
			table.insert(ProceduralDistributions.list[tobaccoLocale[i]].items, "Greenfire.PipeTobaccoBag");
			table.insert(ProceduralDistributions.list[tobaccoLocale[i]].items, 0.6*multip/chanceothermodifier);
			table.insert(ProceduralDistributions.list[tobaccoLocale[i]].items, "Greenfire.SmokingPipe");
			table.insert(ProceduralDistributions.list[tobaccoLocale[i]].items, multip/chanceothermodifier);
			table.insert(ProceduralDistributions.list[tobaccoLocale[i]].items, "Greenfire.BluntCigar");
			table.insert(ProceduralDistributions.list[tobaccoLocale[i]].items, multip/chancefoodmodifier);
			table.insert(ProceduralDistributions.list[tobaccoLocale[i]].items, "Greenfire.BluntWrap");
			table.insert(ProceduralDistributions.list[tobaccoLocale[i]].items, multip/chanceothermodifier);
			table.insert(ProceduralDistributions.list[tobaccoLocale[i]].items, "Greenfire.GFCigar");
			table.insert(ProceduralDistributions.list[tobaccoLocale[i]].items, multip/chancefoodmodifier);
			table.insert(ProceduralDistributions.list[tobaccoLocale[i]].items, "Greenfire.RollingPapers");
			table.insert(ProceduralDistributions.list[tobaccoLocale[i]].items, 5*multip/chanceothermodifier);

			if not getActivatedMods():contains("Hydrocraft") then
				table.insert(ProceduralDistributions.list[tobaccoLocale[i]].items, "Greenfire.GFCigaretteCarton");
				table.insert(ProceduralDistributions.list[tobaccoLocale[i]].items, 0.3*multip/chanceothermodifier);
				table.insert(ProceduralDistributions.list[tobaccoLocale[i]].items, "Greenfire.GFUsedCigaretteCarton");
				table.insert(ProceduralDistributions.list[tobaccoLocale[i]].items, 0.2*multip/chanceothermodifier);
				table.insert(ProceduralDistributions.list[tobaccoLocale[i]].items, "Greenfire.GFEmptyCigaretteCarton");
				table.insert(ProceduralDistributions.list[tobaccoLocale[i]].items, 0.1*multip/chanceothermodifier);
			end
			--print("Loading tobacco items to " .. tobaccoLocale[i] .. " ....... SUCCESS!");
			end
		end
	end

	local tobaccoLocale2 = {"DeskGeneric", "JanitorMisc", "KitchenRandom", "BedroomSideTable", "OfficeDesk", "OfficeDeskHome", "DeskGeneric", "PlankStashGun", "PlankStashMagazine", "PlankStashMoney", "PoliceDesk", "PrisonCellRandom"}
	for i in pairs(tobaccoLocale2) do
		if ProceduralDistributions.list[tobaccoLocale2[i]] == nil then
			print("FAILURE -- could not find " .. tobaccoLocale2[i] .. "!");
		else
			if ProceduralDistributions.list[tobaccoLocale2[i]].junk.items == nil then
				print("FAILURE -- could not find " .. tobaccoLocale2[i] .. "!");
			else
			table.insert(ProceduralDistributions.list[tobaccoLocale2[i]].junk.items, "Greenfire.PipeTobaccoBag");
			table.insert(ProceduralDistributions.list[tobaccoLocale2[i]].junk.items, 0.3*multip/chanceothermodifier);
			table.insert(ProceduralDistributions.list[tobaccoLocale2[i]].junk.items, "Greenfire.SmokingPipe");
			table.insert(ProceduralDistributions.list[tobaccoLocale2[i]].junk.items, multip/chanceothermodifier);
			table.insert(ProceduralDistributions.list[tobaccoLocale2[i]].junk.items, "Greenfire.BluntCigar");
			table.insert(ProceduralDistributions.list[tobaccoLocale2[i]].junk.items, multip/chancefoodmodifier);
			table.insert(ProceduralDistributions.list[tobaccoLocale2[i]].junk.items, "Greenfire.BluntWrap");
			table.insert(ProceduralDistributions.list[tobaccoLocale2[i]].junk.items, multip/chanceothermodifier);
			table.insert(ProceduralDistributions.list[tobaccoLocale2[i]].junk.items, "Greenfire.GFCigar");
			table.insert(ProceduralDistributions.list[tobaccoLocale2[i]].junk.items, multip/chancefoodmodifier);
			table.insert(ProceduralDistributions.list[tobaccoLocale2[i]].junk.items, "Greenfire.RollingPapers");
			table.insert(ProceduralDistributions.list[tobaccoLocale2[i]].junk.items, 3*multip/chanceothermodifier);

			if not getActivatedMods():contains("Hydrocraft") then
				table.insert(ProceduralDistributions.list[tobaccoLocale2[i]].junk.items, "Greenfire.GFCigaretteCarton");
				table.insert(ProceduralDistributions.list[tobaccoLocale2[i]].junk.items, 0.1*multip/chanceothermodifier);
				table.insert(ProceduralDistributions.list[tobaccoLocale2[i]].junk.items, "Greenfire.GFUsedCigaretteCarton");
				table.insert(ProceduralDistributions.list[tobaccoLocale2[i]].junk.items, 0.3*multip/chanceothermodifier);
				table.insert(ProceduralDistributions.list[tobaccoLocale2[i]].junk.items, "Greenfire.GFEmptyCigaretteCarton");
				table.insert(ProceduralDistributions.list[tobaccoLocale2[i]].junk.items, 0.1*multip/chanceothermodifier);
			end
			--print("Loading tobacco items to " .. tobaccoLocale2[i] .. " ....... SUCCESS!");
			end
		end
	end

	local nylonLocale = {"CrateTailoring", "DresserGeneric", "BedroomDresser", "SewingStoreFabric"};
	for i in pairs(nylonLocale) do
		if ProceduralDistributions.list[nylonLocale[i]] == nil then
			print("FAILURE -- could not find " .. nylonLocale[i] .. "!");
		else
			if ProceduralDistributions.list[nylonLocale[i]].items == nil then
				print("FAILURE -- could not find " .. nylonLocale[i] .. "!");
			else
			table.insert(ProceduralDistributions.list[nylonLocale[i]].items, "Greenfire.RollNylon");
			table.insert(ProceduralDistributions.list[nylonLocale[i]].items, 2*multip/chanceothermodifier);
			--print("Loading " .. "RollNylon " .. "to " .. nylonLocale[i] .. " ....... SUCCESS!");
			end
		end
	end
	
	local marshmallowLocale = {"CrateMarshmallows", "KitchenBaking"};
	for i in pairs(marshmallowLocale) do
		if ProceduralDistributions.list[marshmallowLocale[i]] == nil then
			print("FAILURE -- could not find " .. marshmallowLocale[i] .. "!");
		else
			if ProceduralDistributions.list[marshmallowLocale[i]].items == nil then
				print("FAILURE -- could not find " .. marshmallowLocale[i] .. "!");
			else
			table.insert(ProceduralDistributions.list[marshmallowLocale[i]].items, "Greenfire.Marshmallows");
			table.insert(ProceduralDistributions.list[marshmallowLocale[i]].items, 5*multip/chancefoodmodifier);
			--print("Loading " .. "Bags of Marshmallows " .. "to " .. marshmallowLocale[i] .. " ....... SUCCESS!");
			end
		end
	end
	
	local corpsemod = 1/(2^(6-SandboxVars.Zombies));
if ZomboidGlobals.FoodLootModifier == 5 then
	corpsemod = 1;
end
if ZomboidGlobals.OtherLootModifier == 5 then
	corpsemod = 1;
end
	local allLocale0 = {"inventorymale", "inventoryfemale"};
	for i in pairs(allLocale0) do
		if SuburbsDistributions["all"][allLocale0[i]] == nil then
			print("FAILURE -- could not find (all, " .. allLocale0[i] .. ")!");
		else
			if SuburbsDistributions["all"][allLocale0[i]].items == nil then
				print("FAILURE -- could not find (all, " .. allLocale0[i] .. ")!");
			else
			table.insert(SuburbsDistributions["all"][allLocale0[i]].items, "Greenfire.AficMag1");
			table.insert(SuburbsDistributions["all"][allLocale0[i]].items, recipelit*corpsemod);
			table.insert(SuburbsDistributions["all"][allLocale0[i]].items, "Greenfire.CannaMag1");
			table.insert(SuburbsDistributions["all"][allLocale0[i]].items, recipelit*corpsemod);
			table.insert(SuburbsDistributions["all"][allLocale0[i]].items, "Greenfire.CannaMag2");
			table.insert(SuburbsDistributions["all"][allLocale0[i]].items, recipelit*corpsemod);
			table.insert(SuburbsDistributions["all"][allLocale0[i]].items, "Greenfire.CannaMag3");
			table.insert(SuburbsDistributions["all"][allLocale0[i]].items, recipelit*corpsemod);
			--print("Loading recipe magazines to (all, " .. allLocale0[i] .. ") ....... SUCCESS!");
			end
		end
	end

	local allLocale1 = {"postbox", "bin", "sidetable"};
	for i in pairs(allLocale1) do
		if SuburbsDistributions["all"][allLocale1[i]] == nil then
			print("FAILURE -- could not find (all, " .. allLocale1[i] .. ")!");
		else
			if SuburbsDistributions["all"][allLocale1[i]].items == nil then
				print("FAILURE -- could not find (all, " .. allLocale1[i] .. ")!");
			else
			table.insert(SuburbsDistributions["all"][allLocale1[i]].items, "Greenfire.AficMag1");
			table.insert(SuburbsDistributions["all"][allLocale1[i]].items, recipelit);
			table.insert(SuburbsDistributions["all"][allLocale1[i]].items, "Greenfire.CannaMag1");
			table.insert(SuburbsDistributions["all"][allLocale1[i]].items, recipelit);
			table.insert(SuburbsDistributions["all"][allLocale1[i]].items, "Greenfire.CannaMag2");
			table.insert(SuburbsDistributions["all"][allLocale1[i]].items, recipelit);
			table.insert(SuburbsDistributions["all"][allLocale1[i]].items, "Greenfire.CannaMag3");
			table.insert(SuburbsDistributions["all"][allLocale1[i]].items, recipelit);
			--print("Loading recipe magazines to (all, " .. allLocale1[i] .. ") ....... SUCCESS!");
			end
		end
	end

	local allLocale2 = {"inventorymale", "inventoryfemale"};
	for i in pairs(allLocale2) do
		if SuburbsDistributions["all"][allLocale2[i]] == nil then
			print("FAILURE -- could not find (all, " .. allLocale2[i] .. ")!");
		else
			if SuburbsDistributions["all"][allLocale2[i]].items == nil then
			print("FAILURE -- could not find (all, " .. allLocale2[i] .. ")!");
		else
			table.insert(SuburbsDistributions["all"][allLocale2[i]].items, "Greenfire.TobaccoSeed");
			table.insert(SuburbsDistributions["all"][allLocale2[i]].items, seedchance*corpsemod);
			table.insert(SuburbsDistributions["all"][allLocale2[i]].items, "Greenfire.CannabisSeed");
			table.insert(SuburbsDistributions["all"][allLocale2[i]].items, seedchance*corpsemod);
			table.insert(SuburbsDistributions["all"][allLocale2[i]].items, "Greenfire.GFCigar");
			table.insert(SuburbsDistributions["all"][allLocale2[i]].items, 0.5*multip*corpsemod/chancefoodmodifier);
			table.insert(SuburbsDistributions["all"][allLocale2[i]].items, "Greenfire.HalfCigar");
			table.insert(SuburbsDistributions["all"][allLocale2[i]].items, 0.5*multip*corpsemod/chancefoodmodifier);
			table.insert(SuburbsDistributions["all"][allLocale2[i]].items, "Greenfire.BluntCigar");
			table.insert(SuburbsDistributions["all"][allLocale2[i]].items, 0.5*multip*corpsemod/chancefoodmodifier);
			table.insert(SuburbsDistributions["all"][allLocale2[i]].items, "Greenfire.HalfBluntCigar");
			table.insert(SuburbsDistributions["all"][allLocale2[i]].items, 0.5*multip*corpsemod/chancefoodmodifier);
			table.insert(SuburbsDistributions["all"][allLocale2[i]].items, "Greenfire.GFSuspect1");
			table.insert(SuburbsDistributions["all"][allLocale2[i]].items, bongchance*corpsemod/3);

			table.insert(SuburbsDistributions["all"][allLocale2[i]].items, "Greenfire.Cannabis");
			table.insert(SuburbsDistributions["all"][allLocale2[i]].items, cannachance*corpsemod/3);
			table.insert(SuburbsDistributions["all"][allLocale2[i]].items, "Greenfire.SmokingPipe");
			table.insert(SuburbsDistributions["all"][allLocale2[i]].items, cannachance*corpsemod/2);
			table.insert(SuburbsDistributions["all"][allLocale2[i]].items, "Greenfire.GFGrinder");
			table.insert(SuburbsDistributions["all"][allLocale2[i]].items, grinderchance*corpsemod/4);

			table.insert(SuburbsDistributions["all"][allLocale2[i]].items, "Greenfire.PipeTobaccoBag");
			table.insert(SuburbsDistributions["all"][allLocale2[i]].items, grinderchance*corpsemod/4);
			table.insert(SuburbsDistributions["all"][allLocale2[i]].items, "Greenfire.RollingPapers");
			table.insert(SuburbsDistributions["all"][allLocale2[i]].items, 0.5*multip*corpsemod/chanceothermodifier);
			--print("Loading items to (all, " .. allLocale2[i] .. ") ....... SUCCESS!");
			end
		end
	end

	local allLocale3 = {"bin", "sidetable"};
	for i in pairs(allLocale3) do
		if SuburbsDistributions["all"][allLocale3[i]] == nil then
			print("FAILURE -- could not find (all, " .. allLocale2[i] .. ")!");
		else
			if SuburbsDistributions["all"][allLocale3[i]].items == nil then
			print("FAILURE -- could not find (all, " .. allLocale3[i] .. ")!");
		else
			table.insert(SuburbsDistributions["all"][allLocale3[i]].items, "Greenfire.TobaccoSeed");
			table.insert(SuburbsDistributions["all"][allLocale3[i]].items, seedchance);
			table.insert(SuburbsDistributions["all"][allLocale3[i]].items, "Greenfire.CannabisSeed");
			table.insert(SuburbsDistributions["all"][allLocale3[i]].items, seedchance);
			table.insert(SuburbsDistributions["all"][allLocale3[i]].items, "Greenfire.HalfCigar");
			table.insert(SuburbsDistributions["all"][allLocale3[i]].items, 0.5*multip/chancefoodmodifier);
			table.insert(SuburbsDistributions["all"][allLocale3[i]].items, "Greenfire.BluntCigar");
			table.insert(SuburbsDistributions["all"][allLocale3[i]].items, 0.5*multip/chancefoodmodifier);
			table.insert(SuburbsDistributions["all"][allLocale3[i]].items, "Greenfire.HalfBluntCigar");
			table.insert(SuburbsDistributions["all"][allLocale3[i]].items, 0.5*multip/chancefoodmodifier);
			table.insert(SuburbsDistributions["all"][allLocale3[i]].items, "Greenfire.HalfBlunt");
			table.insert(SuburbsDistributions["all"][allLocale3[i]].items, cannachance/3);
			table.insert(SuburbsDistributions["all"][allLocale3[i]].items, "Greenfire.HalfJoint");
			table.insert(SuburbsDistributions["all"][allLocale3[i]].items, cannachance/3);
			table.insert(SuburbsDistributions["all"][allLocale3[i]].items, "Greenfire.Cannabis");
			table.insert(SuburbsDistributions["all"][allLocale3[i]].items, cannachance/3);
			table.insert(SuburbsDistributions["all"][allLocale3[i]].items, "Greenfire.SmokingPipe");
			table.insert(SuburbsDistributions["all"][allLocale3[i]].items, cannachance/2);
			table.insert(SuburbsDistributions["all"][allLocale3[i]].items, "Greenfire.RollingPapers");
			table.insert(SuburbsDistributions["all"][allLocale3[i]].items, 0.5*multip/chanceothermodifier);
			--print("Loading items to (all, " .. allLocale3[i] .. ") ....... SUCCESS!");
			end
		end
	end

	local bedroomLocale = {"BedroomSideTable", "BedroomDresser", "DeskGeneric"};
	for i in pairs(bedroomLocale) do
		if ProceduralDistributions.list[bedroomLocale[i]] == nil then
			print("FAILURE -- could not find " .. bedroomLocale[i] .. "!");
		else
		if ProceduralDistributions.list[bedroomLocale[i]].items == nil then
			print("FAILURE -- could not find " .. bedroomLocale[i] .. "!");
		else
			table.insert(ProceduralDistributions.list[bedroomLocale[i]].items, "Greenfire.Cannabis");
			table.insert(ProceduralDistributions.list[bedroomLocale[i]].items, cannachance);
			table.insert(ProceduralDistributions.list[bedroomLocale[i]].items, "Greenfire.CannabisSeed");
			table.insert(ProceduralDistributions.list[bedroomLocale[i]].items, seedchance);
			table.insert(ProceduralDistributions.list[bedroomLocale[i]].items, "Greenfire.TobaccoSeed");
			table.insert(ProceduralDistributions.list[bedroomLocale[i]].items, seedchance);
			table.insert(ProceduralDistributions.list[bedroomLocale[i]].items, "Greenfire.GFSuspect1");
			table.insert(ProceduralDistributions.list[bedroomLocale[i]].items, bongchance);
			table.insert(ProceduralDistributions.list[bedroomLocale[i]].items, "Greenfire.BluntWrap");
			table.insert(ProceduralDistributions.list[bedroomLocale[i]].items, 0.3/chanceothermodifier);
			table.insert(ProceduralDistributions.list[bedroomLocale[i]].items, "Greenfire.GFGrinder");
			table.insert(ProceduralDistributions.list[bedroomLocale[i]].items, cannachance);
			table.insert(ProceduralDistributions.list[bedroomLocale[i]].items, "Greenfire.GFMystery1");
			table.insert(ProceduralDistributions.list[bedroomLocale[i]].items, bongchance);
			--print("Loading goodies to " .. bedroomLocale[i] .. " ....... SUCCESS!");
			end
		end
	end

	if ProceduralDistributions.list["CrateRandomJunk"] == nil then
		print("FAILURE -- could not find CrateRandomJunk!");
	else
	if ProceduralDistributions.list["CrateRandomJunk"].items == nil then
		print("FAILURE -- could not find CrateRandomJunk!");
	else
		table.insert(ProceduralDistributions.list["CrateRandomJunk"].items, "Greenfire.GFMystery1");
		table.insert(ProceduralDistributions.list["CrateRandomJunk"].items, bongchance);
		table.insert(ProceduralDistributions.list["CrateRandomJunk"].items, "Greenfire.GFGrinder");
		table.insert(ProceduralDistributions.list["CrateRandomJunk"].items, grinderchance);
		--print("Loading seed bags to CrateRandomJunk ....... SUCCESS!");
		end
	end

	if SuburbsDistributions["motelroomoccupied"]["sidetable"] == nil then
		print("FAILURE -- could not find (motelroomoccupied, sidetable)!");
	else
	if SuburbsDistributions["motelroomoccupied"]["sidetable"].items == nil then
		print("FAILURE -- could not find (motelroomoccupied, sidetable)!");
	else
		table.insert(SuburbsDistributions["motelroomoccupied"]["sidetable"].items, "Greenfire.AficMag1");
		table.insert(SuburbsDistributions["motelroomoccupied"]["sidetable"].items, recipelit);
		table.insert(SuburbsDistributions["motelroomoccupied"]["sidetable"].items, "Greenfire.CannaMag1");
		table.insert(SuburbsDistributions["motelroomoccupied"]["sidetable"].items, recipelit);
		table.insert(SuburbsDistributions["motelroomoccupied"]["sidetable"].items, "Greenfire.CannaMag2");
		table.insert(SuburbsDistributions["motelroomoccupied"]["sidetable"].items, recipelit);
		table.insert(SuburbsDistributions["motelroomoccupied"]["sidetable"].items, "Greenfire.CannaMag3");
		table.insert(SuburbsDistributions["motelroomoccupied"]["sidetable"].items, recipelit);
		--print("Loading recipe magazines to (motelroomoccupied, sidetable) ....... SUCCESS!");
		end
	end

	if SuburbsDistributions["Farmer"]["counter"] == nil then
		print("FAILURE -- could not find (Farmer, counter)!");
	else
	if SuburbsDistributions["Farmer"]["counter"].items == nil then
		print("FAILURE -- could not find (Farmer, counter)!");
	else
		table.insert(SuburbsDistributions["Farmer"]["counter"].items, "Greenfire.CannaMag1");
		table.insert(SuburbsDistributions["Farmer"]["counter"].items, recipelit);
		table.insert(SuburbsDistributions["Farmer"]["counter"].items, "Greenfire.AficMag1");
		table.insert(SuburbsDistributions["Farmer"]["counter"].items, recipelit);
		--print("Loading recipe magazines to (Farmer, counter) ....... SUCCESS!");
		end
	end

	if ProceduralDistributions.list["CrateFarming"] == nil then
		print("FAILURE -- could not find CrateFarming!");
	else
	if ProceduralDistributions.list["CrateFarming"].items == nil then
		print("FAILURE -- could not find CrateFarming!");
	else
		table.insert(ProceduralDistributions.list["CrateFarming"].items, "Greenfire.CannabisBagSeed");
		table.insert(ProceduralDistributions.list["CrateFarming"].items, 0.1);
		table.insert(ProceduralDistributions.list["CrateFarming"].items, "Greenfire.TobaccoBagSeed");
		table.insert(ProceduralDistributions.list["CrateFarming"].items, 0.5);
		--print("Loading seed bags to CrateFarming ....... SUCCESS!");
		end
	end
	

		if ProceduralDistributions.list["SafehouseMedical"] == nil then
			print("FAILURE -- could not find SafehouseMedical!");
		else
		if ProceduralDistributions.list["SafehouseMedical"].items == nil then
			print("FAILURE -- could not find SafehouseMedical!");
		else
			table.insert(ProceduralDistributions.list["SafehouseMedical"].items, "Greenfire.Cannabis");
			table.insert(ProceduralDistributions.list["SafehouseMedical"].items, 10*cannachance);
			table.insert(ProceduralDistributions.list["SafehouseMedical"].items, "Greenfire.CannabisSeed");
			table.insert(ProceduralDistributions.list["SafehouseMedical"].items, 10*seedchance);
			table.insert(ProceduralDistributions.list["SafehouseMedical"].items, "Greenfire.TobaccoSeed");
			table.insert(ProceduralDistributions.list["SafehouseMedical"].items, 10*seedchance);
		table.insert(ProceduralDistributions.list["SafehouseMedical"].items, "Greenfire.GFSuspect1");
		table.insert(ProceduralDistributions.list["SafehouseMedical"].items, 10*bongchance);
		table.insert(ProceduralDistributions.list["SafehouseMedical"].items, "Greenfire.GFMystery1");
		table.insert(ProceduralDistributions.list["SafehouseMedical"].items, 10*bongchance);
		table.insert(ProceduralDistributions.list["SafehouseMedical"].items, "Greenfire.BluntWrap");
		table.insert(ProceduralDistributions.list["SafehouseMedical"].items, 2*cannachance);
		table.insert(ProceduralDistributions.list["SafehouseMedical"].items, "Greenfire.GFGrinder");
		table.insert(ProceduralDistributions.list["SafehouseMedical"].items, 2*grinderchance);
		end
		end

	local lockerLocale = {"LockerClassy", "Locker"};
	for i in pairs(lockerLocale) do
		if ProceduralDistributions.list[lockerLocale[i]] == nil then
			print("FAILURE -- could not find " .. lockerLocale[i] .. "!");
		else
		if ProceduralDistributions.list[lockerLocale[i]].items == nil then
			print("FAILURE -- could not find " .. lockerLocale[i] .. "!");
		else
			table.insert(ProceduralDistributions.list[lockerLocale[i]].items, "Greenfire.Cannabis");
			table.insert(ProceduralDistributions.list[lockerLocale[i]].items, cannachance/3);
			table.insert(ProceduralDistributions.list[lockerLocale[i]].items, "Greenfire.CannabisSeed");
			table.insert(ProceduralDistributions.list[lockerLocale[i]].items, seedchance/3);
			table.insert(ProceduralDistributions.list[lockerLocale[i]].items, "Greenfire.TobaccoSeed");
			table.insert(ProceduralDistributions.list[lockerLocale[i]].items, seedchance*2/3);
			table.insert(ProceduralDistributions.list[lockerLocale[i]].items, "Greenfire.GFMystery1");
			table.insert(ProceduralDistributions.list[lockerLocale[i]].items, bongchance/3);
			table.insert(ProceduralDistributions.list[lockerLocale[i]].items, "Greenfire.GFSuspect1");
			table.insert(ProceduralDistributions.list[lockerLocale[i]].items, bongchance/3);
			table.insert(ProceduralDistributions.list[lockerLocale[i]].items, "Greenfire.BluntWrap");
			table.insert(ProceduralDistributions.list[lockerLocale[i]].items, cannachance/3);
			table.insert(ProceduralDistributions.list[lockerLocale[i]].items, "Greenfire.GFGrinder");
			table.insert(ProceduralDistributions.list[lockerLocale[i]].items, grinderchance/3);
			--print("Loading goodies to " .. lockerLocale[i] .. " ....... SUCCESS!");
			end
		end
	end

	local wardrobeLocale = {"WardrobeManClassy", "WardrobeWomanClassy", "WardrobeMan", "WardrobeWoman", "WardrobeRedneck"};
	for i in pairs(wardrobeLocale) do
		if ProceduralDistributions.list[wardrobeLocale[i]] == nil then
			print("FAILURE -- could not find " .. wardrobeLocale[i] .. "!");
		else
		if ProceduralDistributions.list[wardrobeLocale[i]].items == nil then
			print("FAILURE -- could not find " .. wardrobeLocale[i] .. "!");
		else
			table.insert(ProceduralDistributions.list[wardrobeLocale[i]].items, "Greenfire.Cannabis");
			table.insert(ProceduralDistributions.list[wardrobeLocale[i]].items, cannachance);
			table.insert(ProceduralDistributions.list[wardrobeLocale[i]].items, "Greenfire.CannabisSeed");
			table.insert(ProceduralDistributions.list[wardrobeLocale[i]].items, seedchance);
			table.insert(ProceduralDistributions.list[wardrobeLocale[i]].items, "Greenfire.TobaccoSeed");
			table.insert(ProceduralDistributions.list[wardrobeLocale[i]].items, seedchance*2);
			table.insert(ProceduralDistributions.list[wardrobeLocale[i]].items, "Greenfire.GFSuspect1");
			table.insert(ProceduralDistributions.list[wardrobeLocale[i]].items, bongchance);
			table.insert(ProceduralDistributions.list[wardrobeLocale[i]].items, "Greenfire.GFMystery1");
			table.insert(ProceduralDistributions.list[wardrobeLocale[i]].items, bongchance);
			table.insert(ProceduralDistributions.list[wardrobeLocale[i]].items, "Greenfire.BluntWrap");
			table.insert(ProceduralDistributions.list[wardrobeLocale[i]].items, cannachance);
			table.insert(ProceduralDistributions.list[wardrobeLocale[i]].items, "Greenfire.GFGrinder");
			table.insert(ProceduralDistributions.list[wardrobeLocale[i]].items, grinderchance);
			--print("Loading goodies to " .. wardrobeLocale[i] .. " ....... SUCCESS!");
			end
		end
	end
	
	if SuburbsDistributions["SeedBag"] == nil then
		print("FAILURE -- could not find SeedBag!");
	else
	if SuburbsDistributions["SeedBag"].items == nil then
		print("FAILURE -- could not find SeedBag!");
	else
		table.insert(SuburbsDistributions["SeedBag"].items, "Greenfire.TobaccoBagSeed");
		table.insert(SuburbsDistributions["SeedBag"].items, 1*multip);
		table.insert(SuburbsDistributions["SeedBag"].items, "Greenfire.CannabisBagSeed");
		table.insert(SuburbsDistributions["SeedBag"].items, 0.5*multip);
		--print("Loading seed bags to SeedBag ....... SUCCESS!");
		end
	end

	if ProceduralDistributions.list["GardenStoreMisc"] == nil then
		print("FAILURE -- could not find GardenStoreMisc!");
	else
	if ProceduralDistributions.list["GardenStoreMisc"].items == nil then
		print("FAILURE -- could not find GardenStoreMisc!");
	else
		table.insert(ProceduralDistributions.list["GardenStoreMisc"].items, "Greenfire.TobaccoBagSeed");
		table.insert(ProceduralDistributions.list["GardenStoreMisc"].items, 1);
		--print("Loading seed bags to GardenStoreMisc ....... SUCCESS!");
		end
	end

	if ProceduralDistributions.list["PoliceStorageOutfit"] == nil then
		print("FAILURE -- could not find PoliceStorageOutfit!");
	else
	if ProceduralDistributions.list["PoliceStorageOutfit"].items == nil then
		print("FAILURE -- could not find PoliceStorageOutfit!");
	else
		table.insert(ProceduralDistributions.list["PoliceStorageOutfit"].items, "Greenfire.Cannabis");
		table.insert(ProceduralDistributions.list["PoliceStorageOutfit"].items, cannachance);
		table.insert(ProceduralDistributions.list["PoliceStorageOutfit"].items, "Greenfire.CannabisSeed");
		table.insert(ProceduralDistributions.list["PoliceStorageOutfit"].items, seedchance);
		table.insert(ProceduralDistributions.list["PoliceStorageOutfit"].items, "Greenfire.TobaccoSeed");
		table.insert(ProceduralDistributions.list["PoliceStorageOutfit"].items, seedchance/2);
		table.insert(ProceduralDistributions.list["PoliceStorageOutfit"].items, "Greenfire.GFSuspect1");
		table.insert(ProceduralDistributions.list["PoliceStorageOutfit"].items, bongchance);
		table.insert(ProceduralDistributions.list["PoliceStorageOutfit"].items, "Greenfire.BluntWrap");
		table.insert(ProceduralDistributions.list["PoliceStorageOutfit"].items, cannachance);
		table.insert(ProceduralDistributions.list["PoliceStorageOutfit"].items, "Greenfire.GFGrinder");
		table.insert(ProceduralDistributions.list["PoliceStorageOutfit"].items, grinderchance);
		--print("Loading goodies to PoliceStorageOutfit ....... SUCCESS!");
		end
	end

	if ProceduralDistributions.list["BathroomCounter"] == nil then
		print("FAILURE -- could not find BathroomCounter!");
	else 
	if ProceduralDistributions.list["BathroomCounter"].items == nil then
		print("FAILURE -- could not find BathroomCounter!");
	else 
		table.insert(ProceduralDistributions.list["BathroomCounter"].items, "Greenfire.Cannabis");
		table.insert(ProceduralDistributions.list["BathroomCounter"].items, cannachance);
		table.insert(ProceduralDistributions.list["BathroomCounter"].items, "Greenfire.GFSuspect1");
		table.insert(ProceduralDistributions.list["BathroomCounter"].items, bongchance);
		table.insert(ProceduralDistributions.list["BathroomCounter"].items, "Greenfire.BluntWrap");
		table.insert(ProceduralDistributions.list["BathroomCounter"].items, cannachance);
		table.insert(ProceduralDistributions.list["BathroomCounter"].items, "Greenfire.GFMystery1");
		table.insert(ProceduralDistributions.list["BathroomCounter"].items, bongchance);
		table.insert(ProceduralDistributions.list["BathroomCounter"].items, "Greenfire.GFGrinder");
		table.insert(ProceduralDistributions.list["BathroomCounter"].items, grinderchance);
		table.insert(ProceduralDistributions.list["BathroomCounter"].items, "Greenfire.CannabisSeed");
		table.insert(ProceduralDistributions.list["BathroomCounter"].items, seedchance);
		table.insert(ProceduralDistributions.list["BathroomCounter"].items, "Greenfire.TobaccoSeed");
		table.insert(ProceduralDistributions.list["BathroomCounter"].items, seedchance*2);
		--print("Loading goodies to BathroomCounter ....... SUCCESS!");
		end
	end
--[[
	if ProceduralDistributions.list["PoliceStorageGuns"] == nil then
		print("FAILURE -- could not find PoliceStorageGuns!");
	else
		table.insert(ProceduralDistributions.list["PoliceStorageGuns"].items, "Greenfire.Cannabis");
		table.insert(ProceduralDistributions.list["PoliceStorageGuns"].items, 10*cannachance);
		table.insert(ProceduralDistributions.list["PoliceStorageGuns"].items, "Greenfire.CannabisBagSeed");
		table.insert(ProceduralDistributions.list["PoliceStorageGuns"].items, 10*seedchance);
		table.insert(ProceduralDistributions.list["PoliceStorageGuns"].items, "Greenfire.TobaccoBagSeed");
		table.insert(ProceduralDistributions.list["PoliceStorageGuns"].items, 20*seedchance);
		table.insert(ProceduralDistributions.list["PoliceStorageGuns"].items, "Greenfire.OzCannabis");
		table.insert(ProceduralDistributions.list["PoliceStorageGuns"].items, 10*cannachance);
		table.insert(ProceduralDistributions.list["PoliceStorageGuns"].items, "Greenfire.GFMystery1");
		table.insert(ProceduralDistributions.list["PoliceStorageGuns"].items, 10*bongchance);
		table.insert(ProceduralDistributions.list["PoliceStorageGuns"].items, "Greenfire.GFSuspect1");
		table.insert(ProceduralDistributions.list["PoliceStorageGuns"].items, 10*bongchance);
		table.insert(ProceduralDistributions.list["PoliceStorageGuns"].items, "Greenfire.GFGrinder");
		table.insert(ProceduralDistributions.list["PoliceStorageGuns"].items, 10*grinderchance);
		--print("Loading goodies to PoliceStorageGuns ....... SUCCESS!");
	end
--]]
else
	for k1,v1 in pairs(SuburbsDistributions) do
		local items = v1["items"];
  
		if items then
			insertGFItems(items);
		else
			for k2,v2 in pairs(v1) do
				items = v2["items"];
				if items then
        				insertGFItems(items);
      				end
    			end
		end
	end

	table.insert(SuburbsDistributions["farmstorage"]["all"].items, "Greenfire.TobaccoBagSeed");
	table.insert(SuburbsDistributions["farmstorage"]["all"].items, 0.2/chanceothermodifier);
	table.insert(SuburbsDistributions["farmstorage"]["all"].items, "Greenfire.CannabisBagSeed");
	table.insert(SuburbsDistributions["farmstorage"]["all"].items, 0.1/chanceothermodifier);
	table.insert(SuburbsDistributions["gardenstore"]["shelves"].items, "Greenfire.TobaccoBagSeed");
	table.insert(SuburbsDistributions["gardenstore"]["shelves"].items, 0.2/chanceothermodifier);
	table.insert(SuburbsDistributions["gardenstore"]["crate"].items, "Greenfire.TobaccoBagSeed");
	table.insert(SuburbsDistributions["gardenstore"]["crate"].items, 0.2/chanceothermodifier);
table.insert(SuburbsDistributions["bedroom"]["wardrobe"].items, "Greenfire.Cannabis");
table.insert(SuburbsDistributions["bedroom"]["wardrobe"].items, cannachance);
table.insert(SuburbsDistributions["bedroom"]["wardrobe"].items, "Greenfire.CannabisSeed");
table.insert(SuburbsDistributions["bedroom"]["wardrobe"].items, seedchance);
table.insert(SuburbsDistributions["bedroom"]["wardrobe"].items, "Greenfire.TobaccoSeed");
table.insert(SuburbsDistributions["bedroom"]["wardrobe"].items, seedchance);
table.insert(SuburbsDistributions["bedroom"]["wardrobe"].items, "Greenfire.GFSuspect1");
table.insert(SuburbsDistributions["bedroom"]["wardrobe"].items, bongchance);
table.insert(SuburbsDistributions["bedroom"]["wardrobe"].items, "Greenfire.BluntWrap");
table.insert(SuburbsDistributions["bedroom"]["wardrobe"].items, 0.3/chanceothermodifier);
table.insert(SuburbsDistributions["bedroom"]["wardrobe"].items, "Greenfire.GFGrinder");
table.insert(SuburbsDistributions["bedroom"]["wardrobe"].items, grinderchance);
table.insert(SuburbsDistributions["bedroom"]["wardrobe"].items, "Greenfire.GFMystery1");
table.insert(SuburbsDistributions["bedroom"]["wardrobe"].items, bongchance);
table.insert(SuburbsDistributions["all"]["wardrobe"].items, "Greenfire.Cannabis");
table.insert(SuburbsDistributions["all"]["wardrobe"].items, cannachance);
table.insert(SuburbsDistributions["all"]["wardrobe"].items, "Greenfire.CannabisSeed");
table.insert(SuburbsDistributions["all"]["wardrobe"].items, seedchance);
table.insert(SuburbsDistributions["all"]["wardrobe"].items, "Greenfire.TobaccoSeed");
table.insert(SuburbsDistributions["all"]["wardrobe"].items, seedchance);
table.insert(SuburbsDistributions["all"]["wardrobe"].items, "Greenfire.GFMystery1");
table.insert(SuburbsDistributions["all"]["wardrobe"].items, bongchance);
table.insert(SuburbsDistributions["all"]["wardrobe"].items, "Greenfire.GFSuspect1");
table.insert(SuburbsDistributions["all"]["wardrobe"].items, bongchance);
table.insert(SuburbsDistributions["all"]["wardrobe"].items, "Greenfire.BluntWrap");
table.insert(SuburbsDistributions["all"]["wardrobe"].items, 0.3/chanceothermodifier);
table.insert(SuburbsDistributions["all"]["wardrobe"].items, "Greenfire.GFGrinder");
table.insert(SuburbsDistributions["all"]["wardrobe"].items, grinderchance);
table.insert(SuburbsDistributions["all"]["locker"].items, "Greenfire.Cannabis");
table.insert(SuburbsDistributions["all"]["locker"].items, cannachance);
table.insert(SuburbsDistributions["all"]["locker"].items, "Greenfire.CannabisSeed");
table.insert(SuburbsDistributions["all"]["locker"].items, seedchance);
table.insert(SuburbsDistributions["all"]["locker"].items, "Greenfire.TobaccoSeed");
table.insert(SuburbsDistributions["all"]["locker"].items, seedchance);
table.insert(SuburbsDistributions["all"]["locker"].items, "Greenfire.GFMystery1");
table.insert(SuburbsDistributions["all"]["locker"].items, bongchance);
table.insert(SuburbsDistributions["all"]["locker"].items, "Greenfire.GFSuspect1");
table.insert(SuburbsDistributions["all"]["locker"].items, bongchance);
table.insert(SuburbsDistributions["all"]["locker"].items, "Greenfire.BluntWrap");
table.insert(SuburbsDistributions["all"]["locker"].items, 0.3/chanceothermodifier);
table.insert(SuburbsDistributions["all"]["locker"].items, "Greenfire.GFGrinder");
table.insert(SuburbsDistributions["all"]["locker"].items, grinderchance);
	table.insert(SuburbsDistributions["policestorage"]["all"].items, "Greenfire.Cannabis");
	table.insert(SuburbsDistributions["policestorage"]["all"].items, 2/chancefoodmodifier);
	table.insert(SuburbsDistributions["policestorage"]["all"].items, "Greenfire.CannabisBagSeed");
	table.insert(SuburbsDistributions["policestorage"]["all"].items, 1/chanceothermodifier);
	table.insert(SuburbsDistributions["policestorage"]["all"].items, "Greenfire.TobaccoBagSeed");
	table.insert(SuburbsDistributions["policestorage"]["all"].items, 1/chanceothermodifier);
	table.insert(SuburbsDistributions["policestorage"]["all"].items, "Greenfire.OzCannabis");
	table.insert(SuburbsDistributions["policestorage"]["all"].items, 1/chancefoodmodifier);
	table.insert(SuburbsDistributions["policestorage"]["all"].items, "Greenfire.GFSuspect1");
	table.insert(SuburbsDistributions["policestorage"]["all"].items, 1/chanceothermodifier);
	table.insert(SuburbsDistributions["policestorage"]["all"].items, "Greenfire.GFMystery1");
	table.insert(SuburbsDistributions["policestorage"]["all"].items, 0.5/chanceothermodifier);
	table.insert(SuburbsDistributions["policestorage"]["all"].items, "Greenfire.GFGrinder");
	table.insert(SuburbsDistributions["policestorage"]["all"].items, 1/chanceothermodifier);
	table.insert(SuburbsDistributions["bathroom"]["all"].items, "Greenfire.Cannabis");
	table.insert(SuburbsDistributions["bathroom"]["all"].items, cannachance);
	table.insert(SuburbsDistributions["bathroom"]["all"].items, "Greenfire.CannabisSeed");
	table.insert(SuburbsDistributions["bathroom"]["all"].items, seedchance);
	table.insert(SuburbsDistributions["bathroom"]["all"].items, "Greenfire.TobaccoSeed");
	table.insert(SuburbsDistributions["bathroom"]["all"].items, seedchance);
	table.insert(SuburbsDistributions["bathroom"]["all"].items, "Greenfire.GFSuspect1");
	table.insert(SuburbsDistributions["bathroom"]["all"].items, bongchance);
	table.insert(SuburbsDistributions["bathroom"]["all"].items, "Greenfire.BluntWrap");
	table.insert(SuburbsDistributions["bathroom"]["all"].items, 0.3/chanceothermodifier);
	table.insert(SuburbsDistributions["bathroom"]["all"].items, "Greenfire.GFGrinder");
	table.insert(SuburbsDistributions["bathroom"]["all"].items, grinderchance);
	table.insert(SuburbsDistributions["garagestorage"]["all"].items, "Greenfire.Cannabis");
	table.insert(SuburbsDistributions["garagestorage"]["all"].items, cannachance);
	table.insert(SuburbsDistributions["garagestorage"]["all"].items, "Greenfire.CannabisSeed");
	table.insert(SuburbsDistributions["garagestorage"]["all"].items, seedchance);
	table.insert(SuburbsDistributions["garagestorage"]["all"].items, "Greenfire.TobaccoSeed");
	table.insert(SuburbsDistributions["garagestorage"]["all"].items, seedchance);
	table.insert(SuburbsDistributions["garagestorage"]["all"].items, "Greenfire.GFMystery1");
	table.insert(SuburbsDistributions["garagestorage"]["all"].items, bongchance);
	table.insert(SuburbsDistributions["garagestorage"]["all"].items, "Greenfire.GFSuspect1");
	table.insert(SuburbsDistributions["garagestorage"]["all"].items, bongchance);
	table.insert(SuburbsDistributions["garagestorage"]["all"].items, "Greenfire.GFGrinder");
	table.insert(SuburbsDistributions["garagestorage"]["all"].items, grinderchance);
	table.insert(SuburbsDistributions["garagestorage"]["all"].items, "Greenfire.BluntWrap");
	table.insert(SuburbsDistributions["garagestorage"]["all"].items, 0.3/chanceothermodifier);
	table.insert(SuburbsDistributions["kitchen"]["counter"].items, "Greenfire.Cannabis");
	table.insert(SuburbsDistributions["kitchen"]["counter"].items, cannachance);
	table.insert(SuburbsDistributions["kitchen"]["counter"].items, "Greenfire.CannabisSeed");
	table.insert(SuburbsDistributions["kitchen"]["counter"].items, seedchance);
	table.insert(SuburbsDistributions["kitchen"]["counter"].items, "Greenfire.TobaccoSeed");
	table.insert(SuburbsDistributions["kitchen"]["counter"].items, seedchance);
	table.insert(SuburbsDistributions["kitchen"]["counter"].items, "Greenfire.CannabisBagSeed");
	table.insert(SuburbsDistributions["kitchen"]["counter"].items, seedchance);
	table.insert(SuburbsDistributions["kitchen"]["counter"].items, "Greenfire.TobaccoBagSeed");
	table.insert(SuburbsDistributions["kitchen"]["counter"].items, seedchance);
	table.insert(SuburbsDistributions["kitchen"]["counter"].items, "Greenfire.GFMystery1");
	table.insert(SuburbsDistributions["kitchen"]["counter"].items, bongchance);
	table.insert(SuburbsDistributions["kitchen"]["counter"].items, "Greenfire.GFSuspect1");
	table.insert(SuburbsDistributions["kitchen"]["counter"].items, bongchance);
	table.insert(SuburbsDistributions["kitchen"]["counter"].items, "Greenfire.BluntWrap");
	table.insert(SuburbsDistributions["kitchen"]["counter"].items, 0.3/chanceothermodifier);
	table.insert(SuburbsDistributions["kitchen"]["counter"].items, "Greenfire.GFGrinder");
	table.insert(SuburbsDistributions["kitchen"]["counter"].items, grinderchance);
	table.insert(SuburbsDistributions["shed"]["counter"].items, "Greenfire.Cannabis");
	table.insert(SuburbsDistributions["shed"]["counter"].items, cannachance);
	table.insert(SuburbsDistributions["shed"]["counter"].items, "Greenfire.CannabisSeed");
	table.insert(SuburbsDistributions["shed"]["counter"].items, seedchance);
	table.insert(SuburbsDistributions["shed"]["counter"].items, "Greenfire.TobaccoSeed");
	table.insert(SuburbsDistributions["shed"]["counter"].items, seedchance);
	table.insert(SuburbsDistributions["shed"]["counter"].items, "Greenfire.GFMystery1");
	table.insert(SuburbsDistributions["shed"]["counter"].items, bongchance);
	table.insert(SuburbsDistributions["shed"]["counter"].items, "Greenfire.GFSuspect1");
	table.insert(SuburbsDistributions["shed"]["counter"].items, bongchance);
	table.insert(SuburbsDistributions["shed"]["counter"].items, "Greenfire.BluntWrap");
	table.insert(SuburbsDistributions["shed"]["counter"].items, 0.3/chanceothermodifier);
	table.insert(SuburbsDistributions["shed"]["counter"].items, "Greenfire.GFGrinder");
	table.insert(SuburbsDistributions["shed"]["counter"].items, grinderchance);
	table.insert(SuburbsDistributions["SafehouseLoot"]["counter"].items, "Greenfire.GFMystery1");
	table.insert(SuburbsDistributions["SafehouseLoot"]["counter"].items, 2);
	table.insert(SuburbsDistributions["SafehouseLoot"]["counter"].items, "Greenfire.Cannabis");
	table.insert(SuburbsDistributions["SafehouseLoot"]["counter"].items, 1);
	table.insert(SuburbsDistributions["SafehouseLoot"]["counter"].items, "Greenfire.CannabisSeed");
	table.insert(SuburbsDistributions["SafehouseLoot"]["counter"].items, 0.5);
	table.insert(SuburbsDistributions["SafehouseLoot"]["counter"].items, "Greenfire.TobaccoSeed");
	table.insert(SuburbsDistributions["SafehouseLoot"]["counter"].items, 1);
	table.insert(SuburbsDistributions["SafehouseLoot"]["counter"].items, "Greenfire.GFSuspect1");
	table.insert(SuburbsDistributions["SafehouseLoot"]["counter"].items, 1);
	table.insert(SuburbsDistributions["SafehouseLoot"]["counter"].items, "Greenfire.BluntWrap");
	table.insert(SuburbsDistributions["SafehouseLoot"]["counter"].items, 1);
	table.insert(SuburbsDistributions["SafehouseLoot"]["counter"].items, "Greenfire.GFGrinder");
	table.insert(SuburbsDistributions["SafehouseLoot"]["counter"].items, 1);
	table.insert(SuburbsDistributions["SurvivorCache2"]["counter"].items, "Greenfire.GFMystery1");
	table.insert(SuburbsDistributions["SurvivorCache2"]["counter"].items, 4);
	table.insert(SuburbsDistributions["SurvivorCache2"]["counter"].items, "Greenfire.Cannabis");
	table.insert(SuburbsDistributions["SurvivorCache2"]["counter"].items, 2);
	table.insert(SuburbsDistributions["SurvivorCache2"]["counter"].items, "Greenfire.GFSuspect1");
	table.insert(SuburbsDistributions["SurvivorCache2"]["counter"].items, 2);
	table.insert(SuburbsDistributions["SurvivorCache2"]["counter"].items, "Greenfire.CannabisSeed");
	table.insert(SuburbsDistributions["SurvivorCache2"]["counter"].items, 1);
	table.insert(SuburbsDistributions["SurvivorCache2"]["counter"].items, "Greenfire.TobaccoSeed");
	table.insert(SuburbsDistributions["SurvivorCache2"]["counter"].items, 1);
	table.insert(SuburbsDistributions["SurvivorCache2"]["counter"].items, "Greenfire.BluntWrap");
	table.insert(SuburbsDistributions["SurvivorCache2"]["counter"].items, 5);
	table.insert(SuburbsDistributions["SurvivorCache2"]["counter"].items, "Greenfire.GFGrinder");
	table.insert(SuburbsDistributions["SurvivorCache2"]["counter"].items, 1);
	table.insert(SuburbsDistributions["SurvivorCache1"]["counter"].items, "Greenfire.GFMystery1");
	table.insert(SuburbsDistributions["SurvivorCache1"]["counter"].items, 4);
	table.insert(SuburbsDistributions["SurvivorCache1"]["counter"].items, "Greenfire.Cannabis");
	table.insert(SuburbsDistributions["SurvivorCache1"]["counter"].items, 2);
	table.insert(SuburbsDistributions["SurvivorCache1"]["counter"].items, "Greenfire.GFSuspect1");
	table.insert(SuburbsDistributions["SurvivorCache1"]["counter"].items, 2);
	table.insert(SuburbsDistributions["SurvivorCache1"]["counter"].items, "Greenfire.BluntWrap");
	table.insert(SuburbsDistributions["SurvivorCache1"]["counter"].items, 5);
	table.insert(SuburbsDistributions["SurvivorCache1"]["counter"].items, "Greenfire.GFGrinder");
	table.insert(SuburbsDistributions["SurvivorCache1"]["counter"].items, 1);
	
table.insert(SuburbsDistributions["shed"]["other"].items, "Greenfire.Cannabis");
table.insert(SuburbsDistributions["shed"]["other"].items, cannachance);
table.insert(SuburbsDistributions["shed"]["other"].items, "Greenfire.CannabisSeed");
table.insert(SuburbsDistributions["shed"]["other"].items, seedchance);
table.insert(SuburbsDistributions["shed"]["other"].items, "Greenfire.TobaccoSeed");
table.insert(SuburbsDistributions["shed"]["other"].items, seedchance);
table.insert(SuburbsDistributions["shed"]["other"].items, "Greenfire.GFMystery1");
table.insert(SuburbsDistributions["shed"]["other"].items, bongchance);
table.insert(SuburbsDistributions["shed"]["other"].items, "Greenfire.GFSuspect1");
table.insert(SuburbsDistributions["shed"]["other"].items, bongchance);
table.insert(SuburbsDistributions["shed"]["other"].items, "Greenfire.BluntWrap");
table.insert(SuburbsDistributions["shed"]["other"].items, 0.3/chanceothermodifier);
table.insert(SuburbsDistributions["shed"]["other"].items, "Greenfire.GFGrinder");
table.insert(SuburbsDistributions["shed"]["other"].items, grinderchance);
table.insert(SuburbsDistributions["grocers"]["smallcrate"].items, "Greenfire.TobaccoBagSeed");
table.insert(SuburbsDistributions["grocers"]["smallcrate"].items, seedchance);
table.insert(SuburbsDistributions["grocers"]["smallbox"].items, "Greenfire.TobaccoBagSeed");
table.insert(SuburbsDistributions["grocers"]["smallbox"].items, seedchance);
table.insert(SuburbsDistributions["storageunit"]["all"].items, "Greenfire.GFMystery1");
table.insert(SuburbsDistributions["storageunit"]["all"].items, bongchance);
table.insert(SuburbsDistributions["storageunit"]["all"].items, "Greenfire.GFGrinder");
table.insert(SuburbsDistributions["storageunit"]["all"].items, grinderchance);
table.insert(SuburbsDistributions["bedroom"]["sidetable"].items, "Greenfire.Cannabis");
table.insert(SuburbsDistributions["bedroom"]["sidetable"].items, cannachance);
table.insert(SuburbsDistributions["bedroom"]["sidetable"].items, "Greenfire.CannabisSeed");
table.insert(SuburbsDistributions["bedroom"]["sidetable"].items, seedchance);
table.insert(SuburbsDistributions["bedroom"]["sidetable"].items, "Greenfire.TobaccoSeed");
table.insert(SuburbsDistributions["bedroom"]["sidetable"].items, seedchance);
table.insert(SuburbsDistributions["bedroom"]["sidetable"].items, "Greenfire.GFSuspect1");
table.insert(SuburbsDistributions["bedroom"]["sidetable"].items, bongchance);
table.insert(SuburbsDistributions["bedroom"]["sidetable"].items, "Greenfire.BluntWrap");
table.insert(SuburbsDistributions["bedroom"]["sidetable"].items, 0.3/chanceothermodifier);
table.insert(SuburbsDistributions["bedroom"]["sidetable"].items, "Greenfire.GFGrinder");
table.insert(SuburbsDistributions["bedroom"]["sidetable"].items, cannachance);
table.insert(SuburbsDistributions["bedroom"]["sidetable"].items, "Greenfire.GFMystery1");
table.insert(SuburbsDistributions["bedroom"]["sidetable"].items, bongchance);
table.insert(SuburbsDistributions["all"]["desk"].items, "Greenfire.Cannabis");
table.insert(SuburbsDistributions["all"]["desk"].items, cannachance);
table.insert(SuburbsDistributions["all"]["desk"].items, "Greenfire.GFMystery1");
table.insert(SuburbsDistributions["all"]["desk"].items, bongchance);
table.insert(SuburbsDistributions["all"]["desk"].items, "Greenfire.GFSuspect1");
table.insert(SuburbsDistributions["all"]["desk"].items, bongchance);
table.insert(SuburbsDistributions["all"]["desk"].items, "Greenfire.BluntWrap");
table.insert(SuburbsDistributions["all"]["desk"].items, 0.3/chanceothermodifier);
table.insert(SuburbsDistributions["all"]["desk"].items, "Greenfire.GFGrinder");
table.insert(SuburbsDistributions["all"]["desk"].items, grinderchance);
table.insert(SuburbsDistributions["policestorage"]["metal_shelves"].items, "Greenfire.Cannabis");
table.insert(SuburbsDistributions["policestorage"]["metal_shelves"].items, 5);
table.insert(SuburbsDistributions["policestorage"]["metal_shelves"].items, "Greenfire.CannabisBagSeed");
table.insert(SuburbsDistributions["policestorage"]["metal_shelves"].items, 0.5);
table.insert(SuburbsDistributions["policestorage"]["metal_shelves"].items, "Greenfire.TobaccoBagSeed");
table.insert(SuburbsDistributions["policestorage"]["metal_shelves"].items, 1);
table.insert(SuburbsDistributions["policestorage"]["metal_shelves"].items, "Greenfire.OzCannabis");
table.insert(SuburbsDistributions["policestorage"]["metal_shelves"].items, 1);
table.insert(SuburbsDistributions["policestorage"]["metal_shelves"].items, "Greenfire.GFMystery1");
table.insert(SuburbsDistributions["policestorage"]["metal_shelves"].items, 1);
table.insert(SuburbsDistributions["policestorage"]["metal_shelves"].items, "Greenfire.GFSuspect1");
table.insert(SuburbsDistributions["policestorage"]["metal_shelves"].items, 1);
table.insert(SuburbsDistributions["policestorage"]["metal_shelves"].items, "Greenfire.GFGrinder");
table.insert(SuburbsDistributions["policestorage"]["metal_shelves"].items, 1);

end

if SuburbsDistributions["Farmer"]["counter"] == nil then
	print("FAILURE -- could not find (Farmer, counter)!");
else
if SuburbsDistributions["Farmer"]["counter"].items == nil then
	print("FAILURE -- could not find (Farmer, counter)!");
else
	table.insert(SuburbsDistributions["Farmer"]["counter"].items, "Greenfire.TobaccoBagSeed");
	table.insert(SuburbsDistributions["Farmer"]["counter"].items, 1);
	table.insert(SuburbsDistributions["Farmer"]["counter"].items, "Greenfire.CannabisBagSeed");
	table.insert(SuburbsDistributions["Farmer"]["counter"].items, 1/chanceothermodifier);
	--print("Loading seed bags to (Farmer, counter) ....... SUCCESS!");
	end
end

local allLocale2 = {"counter", "crate", "sidetable"};
for i in pairs(allLocale2) do
	if SuburbsDistributions["all"][allLocale2[i]] == nil then
		print("FAILURE -- could not find " .. allLocale2[i] .. "!");
	else
	if SuburbsDistributions["all"][allLocale2[i]].items == nil then
		print("FAILURE -- could not find " .. allLocale2[i] .. "!");
	else
		table.insert(SuburbsDistributions["all"][allLocale2[i]].items, "Greenfire.CannabisBagSeed");
		table.insert(SuburbsDistributions["all"][allLocale2[i]].items, seedchance);
		table.insert(SuburbsDistributions["all"][allLocale2[i]].items, "Greenfire.TobaccoBagSeed");
		table.insert(SuburbsDistributions["all"][allLocale2[i]].items, seedchance);
		--print("Loading seed bags to (all, " .. allLocale2[i] .. ") ....... SUCCESS!");
		end
	end
end

local allLocale3 = {"sidetable", "counter"};
for i in pairs(allLocale3) do
	if SuburbsDistributions["all"][allLocale3[i]] == nil then
		print("FAILURE -- could not find " .. allLocale3[i] .. "!");
	else
	if SuburbsDistributions["all"][allLocale3[i]].items == nil then
		print("FAILURE -- could not find " .. allLocale3[i] .. "!");
	else
		table.insert(SuburbsDistributions["all"][allLocale3[i]].items, "Greenfire.Cannabis");
		table.insert(SuburbsDistributions["all"][allLocale3[i]].items, cannachance);
		table.insert(SuburbsDistributions["all"][allLocale3[i]].items, "Greenfire.GFMystery1");
		table.insert(SuburbsDistributions["all"][allLocale3[i]].items, bongchance);
		table.insert(SuburbsDistributions["all"][allLocale3[i]].items, "Greenfire.GFSuspect1");
		table.insert(SuburbsDistributions["all"][allLocale3[i]].items, bongchance);
		table.insert(SuburbsDistributions["all"][allLocale3[i]].items, "Greenfire.BluntWrap");
		table.insert(SuburbsDistributions["all"][allLocale3[i]].items, 0.3*multip/chanceothermodifier);
		table.insert(SuburbsDistributions["all"][allLocale3[i]].items, "Greenfire.GFGrinder");
		table.insert(SuburbsDistributions["all"][allLocale3[i]].items, grinderchance);
		--print("Loading goodies to (all, " .. allLocale3[i] .. ") ....... SUCCESS!");
		end
	end
end

local medicineLocale = {"SurvivorCache1", "SurvivorCache2"};
for i in pairs(medicineLocale) do
	if SuburbsDistributions[medicineLocale[i]]["medicine"] == nil then
		print("FAILURE -- could not find " .. medicineLocale[i] .. "!");
	else
	if SuburbsDistributions[medicineLocale[i]]["medicine"].items == nil then
		print("FAILURE -- could not find " .. medicineLocale[i] .. "!");
	else
		table.insert(SuburbsDistributions[medicineLocale[i]]["medicine"].items, "Greenfire.Cannabis");
		table.insert(SuburbsDistributions[medicineLocale[i]]["medicine"].items, 5*cannachance);
		table.insert(SuburbsDistributions[medicineLocale[i]]["medicine"].items, "Greenfire.CannabisSeed");
		table.insert(SuburbsDistributions[medicineLocale[i]]["medicine"].items, 0.5*seedchance);
		table.insert(SuburbsDistributions[medicineLocale[i]]["medicine"].items, "Greenfire.TobaccoSeed");
		table.insert(SuburbsDistributions[medicineLocale[i]]["medicine"].items, 1*seedchance);
		table.insert(SuburbsDistributions[medicineLocale[i]]["medicine"].items, "Greenfire.GFSuspect1");
		table.insert(SuburbsDistributions[medicineLocale[i]]["medicine"].items, 5*bongchance);
		table.insert(SuburbsDistributions[medicineLocale[i]]["medicine"].items, "Greenfire.BluntWrap");
		table.insert(SuburbsDistributions[medicineLocale[i]]["medicine"].items, 1*cannachance);
		table.insert(SuburbsDistributions[medicineLocale[i]]["medicine"].items, "Greenfire.GFGrinder");
		table.insert(SuburbsDistributions[medicineLocale[i]]["medicine"].items, 1*cannachance);
		--print("Loading goodies to (" .. medicineLocale[i] .. ", medicine) ....... SUCCESS!");
		end
	end
end

local survivorCache = {"SurvivorCache1", "SurvivorCache2"};
for i in pairs(survivorCache) do
	if SuburbsDistributions[survivorCache[i]]["SurvivorCrate"] == nil then
		print("FAILURE -- could not find (" .. survivorCache[i] .. ", SurvivorCrate)!");
	else
	if SuburbsDistributions[survivorCache[i]]["SurvivorCrate"].items == nil then
		print("FAILURE -- could not find (" .. survivorCache[i] .. ", SurvivorCrate)!");
	else
		table.insert(SuburbsDistributions[survivorCache[i]]["SurvivorCrate"].items, "Greenfire.Cannabis");
		table.insert(SuburbsDistributions[survivorCache[i]]["SurvivorCrate"].items, 5*cannachance);
		table.insert(SuburbsDistributions[survivorCache[i]]["SurvivorCrate"].items, "Greenfire.CannabisSeed");
		table.insert(SuburbsDistributions[survivorCache[i]]["SurvivorCrate"].items, 0.5*seedchance);
		table.insert(SuburbsDistributions[survivorCache[i]]["SurvivorCrate"].items, "Greenfire.TobaccoSeed");
		table.insert(SuburbsDistributions[survivorCache[i]]["SurvivorCrate"].items, 1*seedchance);
		table.insert(SuburbsDistributions[survivorCache[i]]["SurvivorCrate"].items, "Greenfire.GFSuspect1");
		table.insert(SuburbsDistributions[survivorCache[i]]["SurvivorCrate"].items, 5*bongchance);
		table.insert(SuburbsDistributions[survivorCache[i]]["SurvivorCrate"].items, "Greenfire.GFMystery1");
		table.insert(SuburbsDistributions[survivorCache[i]]["SurvivorCrate"].items, 5*bongchance);
		table.insert(SuburbsDistributions[survivorCache[i]]["SurvivorCrate"].items, "Greenfire.BluntWrap");
		table.insert(SuburbsDistributions[survivorCache[i]]["SurvivorCrate"].items, 1*cannachance);
		table.insert(SuburbsDistributions[survivorCache[i]]["SurvivorCrate"].items, "Greenfire.GFGrinder");
		table.insert(SuburbsDistributions[survivorCache[i]]["SurvivorCrate"].items, 1*grinderchance);
		--print("Loading goodies to (" .. survivorCache[i] .. ", SurvivorCrate) ....... SUCCESS!");
		end
	end
end