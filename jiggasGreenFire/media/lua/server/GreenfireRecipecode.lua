require ('SmokeAdd');
require ('SmokerRelief');
require ('HarvestCode');

function RevealMysteryItem(items, result, char)
	local colors = {"", "_red", "_orange", "_yellow", "_green", "_blue", "_magenta", "_pastelred", "_pastelorange", "_pastelyellow", "_pastelgreen", "_pastelblue", "_pastelpurple", "_black", "_gray", "_white", "_darkbrown", "_darkbeige", "_tan", "_darkforestgreen", "_navy", "_royalpurple", "_arabiangold", "_persianpink"};
	local roll = ZombRand(#colors);
	char:Say(getText("UI_found_bong"));
	char:getInventory():AddItem("Greenfire.Bong" .. colors[roll + 1]);
end

function RevealSuspectItem(items, result, char)
	local illicit = {"Joint", "HalfJoint", "Spliff", "Blunt", "HalfBlunt"};
	local illname = {getText("UI_Joint"), getText("UI_HalfJoint"), getText("UI_Spliff"), getText("UI_Blunt"), getText("UI_HalfBlunt")};
	local roll = ZombRand(#illicit);
	char:Say(getText("UI_found_ill") .. illname[roll + 1] .. "?");
	char:getInventory():AddItem("Greenfire." .. illicit[roll + 1]);
end

function BongMod(items, result, char)
	local colored = false;
	for i=0, (items:size() - 1) do
		if string.sub(items:get(i):getType(), 5, 5) == "_" then
			colored = true;
			if string.sub(result:getType(), 1, 4) == "Toba" then
				char:getInventory():AddItem("Greenfire.TobaccoBong" .. string.sub(items:get(i):getType(), 5));
			elseif string.sub(result:getType(), 1, 4) == "Shak" then
				char:getInventory():AddItem("Greenfire.ShakeBong" .. string.sub(items:get(i):getType(), 5));
			else
				char:getInventory():AddItem("Greenfire." .. string.sub(result:getType(), 1, 4) .. "Bong" .. string.sub(items:get(i):getType(), 5));
			end
		end
	end
	if not colored then
		if string.sub(result:getType(), 1, 4) == "Toba" then
			char:getInventory():AddItem("Greenfire.TobaccoBong");
		elseif string.sub(result:getType(), 1, 4) == "Shak" then
			char:getInventory():AddItem("Greenfire.ShakeBong");
		else
			char:getInventory():AddItem("Greenfire." .. string.sub(result:getType(), 1, 4) .. "Bong");
		end
	end
end

--Open Vanilla Cigarette Pack---
--Checks if Smoker mod is active--
--(by Nebula, modified by jiggawutt)
function Check_SmokerMod_TestIsValid(sourceItem, result)
	--if the smoker mod is active then the recipe will not be shown.
	if getActivatedMods():contains("Smoker") or getActivatedMods():contains("Hydrocraft") then
		return
	end
	return true
end

function Check_noSmokerM(item, result)
	if getActivatedMods():contains("Smoker") then
		return;
	end
	return true;
end

function Check_Build41(items, result)
	if ProceduralDistributions == nil then
		return;
	else
		return true;
	end
end

function Check_Build40(items, result)
	if ProceduralDistributions ~= nil then
		return;
	else
		return true;
	end
end

function Check_Hydrocraft(items, result)
	if getActivatedMods():contains("Hydrocraft") then
		return true;
	else
		return false;
	end
end

function Check_noHydrocraft(items, result)
	if getActivatedMods():contains("Hydrocraft") then
		return false;
	else
		return true;
	end
end

function Grind_Cannabis(items, result, char)
	local multi = 1;
	local coinflip = ZombRand(1,3);
	if coinflip == 1 then
		coinflip = ZombRand(1,2);
		if coinflip == 2 then
			multi = 4;
		else
			multi = 2;
		end
	else
		multi = 3;
	end
	MakeShake(items, result, char);
	for i=0, (items:size() - 1) do
		if items:get(i):getType() == "GFGrinder" then
			if items:get(i):getModData().kiefamt == nil then
				items:get(i):getModData().kiefamt = 0;
				items:get(i):getModData().kiefamt = items:get(i):getModData().kiefamt + 0.001*multi;
			else
				items:get(i):getModData().kiefamt = items:get(i):getModData().kiefamt + 0.001*multi;
			end
			if items:get(i):getModData().kiefamt >= 0.05 then
				char:Say(getText("UI_speech_kief"));
				char:getInventory():AddItem("Greenfire.Kief"):setUsedDelta(0.05);
				items:get(i):getModData().kiefamt = items:get(i):getModData().kiefamt - 0.05;
			end
		end
	end
end

function Grind_Leaf(items, result, char)
	for i=0, (items:size() - 1) do
		if items:get(i):getType() == "GFGrinder" then
			if items:get(i):getModData().kiefamt == nil then
				items:get(i):getModData().kiefamt = 0;
				items:get(i):getModData().kiefamt = items:get(i):getModData().kiefamt + 0.001;
			else
				items:get(i):getModData().kiefamt = items:get(i):getModData().kiefamt + 0.001;
			end
			if items:get(i):getModData().kiefamt >= 0.05 then
				char:Say(getText("UI_speech_kief"));
				char:getInventory():AddItem("Greenfire.Kief"):setUsedDelta(0.05);
				items:get(i):getModData().kiefamt = items:get(i):getModData().kiefamt - 0.05;
			end
		end
	end
end


--This applies the stats onto the brownies or crispiez being cut into 16 pieces and returns the BakingPan.
function GFCutPan_OnCreate(items, result, player)
    local addType = "Base.BakingPan";
    player:getInventory():AddItem(addType);
    for i=0,(items:size() - 1) do
        if items:get(i):getType() == "SBrowniePan" or items:get(i):getType() == "NiceCrispiezPan" then
            result:setBaseHunger(items:get(i):getBaseHunger() / 16);
            result:setHungChange(items:get(i):getBaseHunger() / 16);
            result:setThirstChange(items:get(i):getThirstChange() / 16);
            result:setBoredomChange(items:get(i):getBoredomChange() / 16);
            result:setUnhappyChange(items:get(i):getUnhappyChange() / 16);
            result:setCarbohydrates(items:get(i):getCarbohydrates() / 16);
            result:setStressChange(items:get(i):getStressChange() / 16);
            result:setLipids(items:get(i):getLipids() / 16);
            result:setProteins(items:get(i):getProteins() / 16);
            result:setCalories(items:get(i):getCalories() / 16);
	    result:setAge(items:get(i):getAge());
         end
    end
end

function Create_Cigs(items, result, player)
	local times = ZombRand(1,9);
	for i=1, times do
		player:getInventory():AddItem("Greenfire.GFCigarettes");
	end
end

function Create_HCCigs(items, result, player)
	local times = ZombRand(1,9);
	for i=1, times do
		player:getInventory():AddItem("Hydrocraft.HCCigarettepack");
	end
end


function GF_GiveCigs(items, result, player)
	local times = 1;
	for i=1, times do
		player:getInventory():AddItem("Base.Cigarettes");
	end
end

function GF_GiveGFCigs(items, result, player)
	local times = 20;
	for i=1, times do
		player:getInventory():AddItem("Greenfire.GFCigarette");
	end
end

function BreakBlunt(items, result, char)
	char:getInventory():AddItem("Greenfire.Tobacco");
end

function OpenBlunt(items, result, char)
	char:getInventory():AddItem("Greenfire.BluntWrap");
end

--Returns the SmokingPipe after dumping its contents
function DumpPipe_OnCreate(items, result, player)

	player:getInventory():AddItem("Greenfire.SmokingPipe");
	if result:getType() == "Kief" then
		result:setUsedDelta(0.05);
	elseif result:getType() == "Hashish" then
		result:setUsedDelta(0.1);
	end
end

function Append_W(items, result, player)
	for i=0, (items:size() - 1) do
		if items:get(i):getType() == "Cannabis" then
			result:getModData().budtype = "Cannabis";
		elseif items:get(i):getType() == "HCHempbudcured" then
			result:getModData().budtype = "HCHempbudcured";
		end
	end
end

function DumpW_OnCreate(items, result, player)
	local colored = false;
	for i=0,(items:size() - 1) do
		if items:get(i):getModData().budtype == "HCHempbudcured" then
			if ProceduralDistributions == nil then
			player:getInventory():AddItem("Hydrocraft.HCHempbudcured");
			else
			player:getInventory():AddItem("Hydrocraft.HCHempbudcured", 1);
			end
		elseif items:get(i):getModData().budtype == "Cannabis" or items:get(i):getModData().budtype == nil then
			if ProceduralDistributions == nil then
			player:getInventory():AddItem("Greenfire.Cannabis");
			else
			player:getInventory():AddItem("Greenfire.Cannabis", 1);
			end
		end
		if string.sub(items:get(i):getType(), 9, 9) == "_" then
			colored = true;
			player:getInventory():AddItem("Greenfire.Bong" .. string.sub(items:get(i):getType(), 9));
		end
	end
	if not colored then
		player:getInventory():AddItem("Greenfire.Bong");
	end
end

--Returns the Bong after dumping its contents
function DumpBong_OnCreate(items, result, player)
	local colored = false;
	for i=0, (items:size() - 1) do
		if string.sub(items:get(i):getType(), 9, 9) == "_" then
			colored = true;
			player:getInventory():AddItem("Greenfire.Bong" .. string.sub(items:get(i):getType(), 9));
		elseif string.sub(items:get(i):getType(), 10, 10) == "_" then
			colored = true;
			player:getInventory():AddItem("Greenfire.Bong" .. string.sub(items:get(i):getType(), 10));
		elseif string.sub(items:get(i):getType(), 12, 12) == "_" then
			colored = true;
			player:getInventory():AddItem("Greenfire.Bong" .. string.sub(items:get(i):getType(), 12));
		end
	end
	if not colored then
		player:getInventory():AddItem("Greenfire.Bong");
	end
	if result:getType() == "Kief" then
		result:setUsedDelta(0.05);
	elseif result:getType() == "Hashish" then
		result:setUsedDelta(0.1);
	end
end

--Returns the Saucepan to the player's inventory
function GFNiceCrispiez_OnCreate(items, result, player)
    player:getInventory():AddItem("Base.Saucepan");
end

function OnEat_Spliff(food, character)
	local stonernerf = 10/3;
	if character:HasTrait("Lucky") then
		stonernerf = 15/2;
	end
	if character:HasTrait("Unlucky") then
		stonernerf = 0;
	end

	SmokeHalfWeed(character);

	if getActivatedMods():contains("jiggasAddictionMod") then
		character:getModData().cigsmoked = true;
	end

	if character:HasTrait("Smoker") then
		SmokerRelief(character);
	else
		character:getBodyDamage():setFoodSicknessLevel(character:getBodyDamage():getFoodSicknessLevel() + 7);
		if character:getBodyDamage():getFoodSicknessLevel() > 100 then
			character:getBodyDamage():setFoodSicknessLevel(100);
		end
	end

	if not character:HasTrait("Stoner") then
		character:getBodyDamage():setBoredomLevel(character:getBodyDamage():getBoredomLevel() - 20);
		character:getBodyDamage():setUnhappynessLevel(character:getBodyDamage():getUnhappynessLevel() - 20);
		character:getStats():setStress(character:getStats():getStress() - 20);
	else
		character:getBodyDamage():setBoredomLevel(character:getBodyDamage():getBoredomLevel() - stonernerf);
		character:getBodyDamage():setUnhappynessLevel(character:getBodyDamage():getUnhappynessLevel() - stonernerf);
		character:getStats():setStress(character:getStats():getStress() - stonernerf);
	end

	if character:getBodyDamage():getBoredomLevel() < 0 then
		character:getBodyDamage():setBoredomLevel(0);
	end
	if character:getBodyDamage():getUnhappynessLevel() < 0 then
		character:getBodyDamage():setUnhappynessLevel(0);
	end
	if character:getStats():getStress() < 0 then
		character:getStats():setStress(0);
	end
	if character:getStats():getThirst() < 0.4 then
		character:getStats():setThirst(character:getStats():getThirst() + 0.05);
	end
end

function OnEat_Tobacco(food, character)
	if getActivatedMods():contains("jiggasAddictionMod") then
		character:getModData().cigsmoked = true;
	end
    if character:HasTrait("Smoker") then
	SmokerRelief(character);
    else
        character:getBodyDamage():setFoodSicknessLevel(character:getBodyDamage():getFoodSicknessLevel() + 14);
        if character:getBodyDamage():getFoodSicknessLevel() > 100 then
            character:getBodyDamage():setFoodSicknessLevel(100);
        end
    end
end

function OnDrink_Alcohol(food, character, percent)
	character:getModData().mindrink = 0;
	character:getModData().daysdry = 0;
	character:getModData().dranktoday = true;
	if character:getModData().abu == nil then
		character:getModData().abu = 0;
	end
	if percent == nil then
		percent = 0.25;
	end
	character:getModData().abu = character:getModData().abu + (70 * percent * 0.4);
	if character:HasTrait("Alcoholic") and not getActivatedMods():contains("DynamicTraits") then
		character:getStats():setStress(0);
	end
end

function OnDrink_Beer(food, character, percent)
	character:getModData().mindrink = 0;
	character:getModData().daysdry = 0;
	character:getModData().dranktoday = true;
	if character:getModData().abu == nil then
		character:getModData().abu = 0;
	end
	if percent == nil then
		percent = 0.25;
	end
	if character:HasTrait("Alcoholic") and not getActivatedMods():contains("DynamicTraits") then
		character:getStats():setStress(0);
	end
	character:getModData().abu = character:getModData().abu + (35.49 * percent * 0.06);
end

function OnDrink_Wine(food, character, percent)
	character:getModData().mindrink = 0;
	character:getModData().daysdry = 0;
	character:getModData().dranktoday = true;
	if character:getModData().abu == nil then
		character:getModData().abu = 0;
	end
	if percent == nil then
		percent = 0.25;
	end
	if character:HasTrait("Alcoholic") and  not getActivatedMods():contains("DynamicTraits") then
		character:getStats():setStress(0);
	end
	character:getModData().abu = character:getModData().abu + (66.67 * percent * 0.14);
end