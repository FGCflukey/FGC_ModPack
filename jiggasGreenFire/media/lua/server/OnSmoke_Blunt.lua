require('CantFinishSmoking');
require('SmokeAdd');
require('SmokerRelief');

function OnSmoke_Blunt(food, character)
	if character == nil then return end

	--Initialize values
	local diceroll = 0;
	local bonus = 0;
	local stonerbonus = 0;
	local smokedhalf = false;
	if getActivatedMods():contains("jiggasAddictionMod") then
		character:getModData().cigsmoked = true;
	end
	--Apply proper logic and bonuses based on the smoke consumed.
	if food:getType() == "Blunt" then
		diceroll = ZombRand(1,3);
		if not character:HasTrait("Stoner") and diceroll == 1 then
			bonus = 90;
		elseif not character:HasTrait("Stoner") and diceroll ~= 1 then
			bonus = 40;
			smokedhalf = true;
		end
		if character:HasTrait("Stoner") and diceroll ~= 3 then
			stonerbonus = 20 + 10/3;
			if character:HasTrait("Stoner") and character:HasTrait("Lucky") then
				stonerbonus = 40;
			elseif character:HasTrait("Stoner") and character:HasTrait("Unlucky") then
				stonerbonus = 10;
			end
		elseif character:HasTrait("Stoner") and diceroll == 3 then
			stonerbonus = 20/3;
			smokedhalf = true;
			if character:HasTrait("Stoner") and character:HasTrait("Lucky") then
				stonerbonus = 15;
			elseif character:HasTrait("Stoner") and character:HasTrait("Unlucky") then
				stonerbonus = 20/3;
			end
		end
		if smokedhalf then
			character:getInventory():AddItem("Greenfire.HalfBlunt");
			SmokeWeed(character);
		else
			SmokeKief(character);
		end
	elseif food:getType() == "HalfBlunt" then
		stonerbonus = 20/3;
		bonus = 40;
		if character:HasTrait("Stoner") and character:HasTrait("Lucky") then
			stonerbonus = 15;
		elseif character:HasTrait("Stoner") and character:HasTrait("Unlucky") then
			stonerbonus = 0;
		end
		SmokeWeed(character);
	elseif food:getType() == "MixedBlunt" then
		diceroll = ZombRand(1, 3);
		stonerbonus = 10/3 + 5;
		if not character:HasTrait("Smoker") and diceroll == 1 then
			bonus = 45;
		elseif not character:HasTrait("Smoker") and diceroll ~= 1 then
			bonus = 20;
			smokedhalf = true;
		end

		if character:HasTrait("Stoner") and character:HasTrait("Lucky") then
			stonerbonus = 20;
			if smokedhalf then
				stonerbonus = 7.5;
			end
		elseif character:HasTrait("Stoner")and character:HasTrait("Unlucky") then
			stonerbonus = 5;
			if smokedhalf then
				stonerbonus = 0;
			end
		end
		if smokedhalf then
			character:getInventory():AddItem("Greenfire.HalfMixedBlunt");
			SmokeHalfWeed(character);
		else
			SmokeWeed(character);
		end
	elseif food:getType() == "HalfMixedBlunt" then
		stonerbonus = 10/3 + 5;
		bonus = 20;
		if character:HasTrait("Stoner") and character:HasTrait("Lucky") then
			stonerbonus = 7.5;
		elseif character:HasTrait("Stoner") and character:HasTrait("Unlucky") then
			stonerbonus = 0;
		end
		SmokeHalfWeed(character);
	elseif food:getType() == "KiefBlunt" then
		diceroll = ZombRand(1, 6);
		stonerbonus = 40 + 20/3;
		if not character:HasTrait("Stoner") and diceroll == 6 then
			bonus = 80;
		elseif not character:HasTrait("Stoner") and diceroll ~= 6 then
			bonus = 80;
			smokedhalf = true;
		end

		if character:HasTrait("Stoner") and diceroll >= 5 then
			if character:HasTrait("Lucky") then
				stonerbonus = 80;
			elseif character:HasTrait("Unlucky") then
				stonerbonus = 20;
			end
		elseif character:HasTrait("Stoner") and diceroll < 5 then
			smokedhalf = true;
			stonerbonus = 40/3;
			if character:HasTrait("Lucky") then
				stonerbonus = 30;
			elseif character:HasTrait("Unlucky") then
				stonerbonus = 0;
			end
		end
		if smokedhalf then
			character:getInventory():AddItem("Greenfire.HalfKiefBlunt");
			SmokeKief(character);
		else
			SmokeHash(character);
		end
	elseif food:getType() == "HalfKiefBlunt" then
		stonerbonus = 40/3;
		bonus = 80;
		if character:HasTrait("Stoner") and character:HasTrait("Lucky") then
			stonerbonus = 30;
		elseif character:HasTrait("Stoner") and character:HasTrait("Unlucky") then
			stonerbonus = 0;
		end
		SmokeKief(character);
	elseif food:getType() == "HashBlunt" then
		diceroll = ZombRand(1, 24);
		stonerbonus = 70;
		if not character:HasTrait("Stoner") and diceroll >= 22 then
			bonus = 70;
		elseif not character:HasTrait("Stoner") and diceroll < 22 then
			bonus = 70;
			smokedhalf = true;
		end

		if character:HasTrait("Stoner") and diceroll >= 21 then
			if character:HasTrait("Lucky") then
				stonerbonus = 70;
			elseif character:HasTrait("Unlucky") then
				stonerbonus = 30;
			end
		elseif character:HasTrait("Stoner") and diceroll < 21 then
			smokedhalf = true;
			stonerbonus = 20;
			if character:HasTrait("Lucky") then
				stonerbonus = 45;
			elseif character:HasTrait("Unlucky") then
				stonerbonus = 0;
			end
		end
		if smokedhalf then
			character:getInventory():AddItem("Greenfire.HalfHashBlunt");
			SmokeKief(character);
			SmokeWeed(character);
		else
			SmokeHash(character);
			SmokeKief(character);
		end
	elseif food:getType() == "HalfHashBlunt" then
		stonerbonus = 20;
		bonus = 70;
		if character:HasTrait("Stoner") and character:HasTrait("Lucky") then
			stonerbonus = 45;
		elseif character:HasTrait("Stoner") and character:HasTrait("Unlucky") then
			stonerbonus = 0;
		end
		SmokeKief(character);
		SmokeWeed(character);
	elseif food:getType() == "SpaceBlunt" then
		diceroll = ZombRand(1, 100);
		bonus = 50;
		if not character:HasTrait("Stoner") and diceroll ~= 100 then
			smokedhalf = true;
		end
		diceroll = ZombRand(1, 24);
		if character:HasTrait("Stoner") and diceroll >= 22 then
			stonerbonus = 50;
		elseif character:HasTrait("Stoner") and diceroll < 22 then
			smokedhalf = true;
			stonerbonus = 100/3;
			if character:HasTrait("Lucky") then
				stonerbonus = 50;
			elseif character:HasTrait("Unlucky") then
				stonerbonus = 0;
			end
		end
		if smokedhalf then
			character:getInventory():AddItem("Greenfire.HalfSpaceBlunt");
			SmokeHash(character);
			SmokeHash(character);
		else
			SmokeHash(character);
		end
	elseif food:getType() == "HalfSpaceBlunt" then
		bonus = 50;
		stonerbonus = 100/3;
		if character:HasTrait("Lucky") then
			stonerbonus = 50;
		elseif character:HasTrait("Unlucky") then
			stonerbonus = 0;
		end
		SmokeHash(character);
	end

	if smokedhalf then
		--CantFinishSmoking.lua
		CantFinishSmoking(character);
	end

	--Satisfy smoker trait
	if character:HasTrait("Smoker") then
		SmokerRelief(character);
	end

	--Applies sleepiness and hunger to non-stoners
	if not character:HasTrait("Stoner") then
		--Applies max bonus for non-stoners
		character:getBodyDamage():setBoredomLevel(character:getBodyDamage():getBoredomLevel() - bonus);
		character:getBodyDamage():setUnhappynessLevel(character:getBodyDamage():getUnhappynessLevel() - bonus);
		character:getStats():setStress(character:getStats():getStress() - bonus);
	else
		--Applies stoner bonus to the player
		character:getBodyDamage():setBoredomLevel(character:getBodyDamage():getBoredomLevel() - stonerbonus);
		character:getBodyDamage():setUnhappynessLevel(character:getBodyDamage():getUnhappynessLevel() - stonerbonus);
		character:getStats():setStress(character:getStats():getStress() - stonerbonus);
	end

	--Turns all levels in the negative to zero
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
		if (character:getStats():getThirst() + 0.125) > 0.4 then
			character:getStats():setThirst(0.4);
		else
			character:getStats():setThirst(character:getStats():getThirst() + 0.125);
		end
	end

	--Food sick
	character:getBodyDamage():setFoodSicknessLevel(character:getBodyDamage():getFoodSicknessLevel() - 7*character:getModData().stonedamt/2);
	if character:getBodyDamage():getFoodSicknessLevel() < 0 then
		character:getBodyDamage():setFoodSicknessLevel(0);
	end
end