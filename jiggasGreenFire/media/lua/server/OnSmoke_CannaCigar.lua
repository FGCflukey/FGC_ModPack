require('CantFinishSmoking');
require('SmokeAdd');
require('SmokerRelief');

function OnSmoke_CannaCigar(food, character)
	if character == nil then return end

	--Initialize values
	local diceroll = 0;
	local bonus = 0;
	local stonerbonus = 0;
	local smokedhalf = false;

	if food:getType() == "CannaCigar" then
		diceroll = ZombRand(1, 24);
		stonerbonus = 70;
		bonus = 70;
		if not character:HasTrait("Stoner") and diceroll < 22 then
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
			character:getInventory():AddItem("Greenfire.HalfCannaCigar");
			SmokeKief(character);
			SmokeWeed(character);
		else
			SmokeKief(character);
			SmokeHash(character);
		end
	elseif food:getType() == "HalfCannaCigar" then
		stonerbonus = 20;
		bonus = 70;
		if character:HasTrait("Stoner") and character:HasTrait("Lucky") then
			stonerbonus = 45;
		elseif character:HasTrait("Stoner") and character:HasTrait("Unlucky") then
			stonerbonus = 0;
		end
		SmokeWeed(character);
		SmokeKief(character);
	elseif food:getType() == "PreCannaCigar" then
		diceroll = ZombRand(1, 100);
		stonerbonus = 60;
		bonus = 60;
		if not character:HasTrait("Stoner") and diceroll < 94 then
			smokedhalf = true;
		end

		if character:HasTrait("Stoner") and diceroll >= 86 then
			if character:HasTrait("Lucky") then
				stonerbonus = 60;
			elseif character:HasTrait("Unlucky") then
				stonerbonus = 40;
			end
		elseif character:HasTrait("Stoner") and diceroll < 86 then
			smokedhalf = true;
			stonerbonus = 80/3;
			if character:HasTrait("Lucky") then
				stonerbonus = 60;
			elseif character:HasTrait("Unlucky") then
				stonerbonus = 0;
			end
		end
		if smokedhalf then
			character:getInventory():AddItem("Greenfire.HalfPreCannaCigar");
			SmokeHash(character);
		else
			SmokeHash(character);
			SmokeHash(character);
		end
	elseif food:getType() == "HalfPreCannaCigar" then
		stonerbonus = 80/3;
		bonus = 60;
		if character:HasTrait("Stoner") and character:HasTrait("Lucky") then
			stonerbonus = 60;
		elseif character:HasTrait("Stoner") and character:HasTrait("Unlucky") then
			stonerbonus = 0;
		end
		SmokeHash(character);
	elseif food:getType() == "DelCannaCigar" then
		diceroll = ZombRand(1, 100);
		stonerbonus = 50;
		bonus = 50;
		if not character:HasTrait("Stoner") and diceroll ~= 100 then
			smokedhalf = true;
		end
		diceroll = ZombRand(1, 24);
		if character:HasTrait("Stoner") and diceroll < 22 then
			smokedhalf = true;
			stonerbonus = 100/3;
			if character:HasTrait("Lucky") then
				stonerbonus = 50;
			elseif character:HasTrait("Unlucky") then
				stonerbonus = 0;
			end
		end
		if smokedhalf then
			character:getInventory():AddItem("Greenfire.HalfDelCannaCigar");
			SmokeHash(character);
			SmokeWeed(character);
		else
			SmokeKief(character);
			SmokeHash(character);
			SmokeHash(character);
		end
	elseif food:getType() == "HalfDelCannaCigar" then
		stonerbonus = 100/3;
		bonus = 60;
		if character:HasTrait("Stoner") and character:HasTrait("Lucky") then
			stonerbonus = 50;
		elseif character:HasTrait("Stoner") and character:HasTrait("Unlucky") then
			stonerbonus = 0;
		end
		SmokeHash(character);
		SmokeWeed(character);
	elseif food:getType() == "ResCannaCigar" then
		diceroll = ZombRand(1, 100);
		stonerbonus = 40;
		bonus = 40;
		if not character:HasTrait("Stoner") and diceroll ~= 100 then
			smokedhalf = true;
		end
		if character:HasTrait("Stoner") and diceroll < 99 then
			smokedhalf = true;
			if character:HasTrait("Unlucky") then
				stonerbonus = 0;
			end
		end
		if smokedhalf then
			character:getInventory():AddItem("Greenfire.HalfResCannaCigar");
			SmokeKief(character);
			SmokeHash(character);
		else
			SmokeHash(character);
			SmokeHash(character);
			SmokeHash(character);
		end
	elseif food:getType() == "HalfResCannaCigar" then
		stonerbonus = 40;
		bonus = 40;
		if character:HasTrait("Stoner") and character:HasTrait("Unlucky") then
			stonerbonus = 0;
		end
		SmokeHash(character);
		SmokeKief(character);
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
		if character:getStats():getFatigue() >= 0.8 and character:getStats():getFatigue() < 1 then
			character:getStats():setFatigue(character:getStats():getFatigue() + 0.025);
		end
		if character:getStats():getFatigue() >= 0.6 and character:getStats():getFatigue() < 0.8 then
			character:getStats():setFatigue(character:getStats():getFatigue() + 0.05);
		end
		if character:getStats():getFatigue() < 0.6 then
			character:getStats():setFatigue(0.6);
		end
		if character:getStats():getHunger() < 0.4 then
			character:getStats():setHunger(character:getStats():getHunger() + 0.1);
		end
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
		if (character:getStats():getThirst() + 0.15) > 0.4 then
			character:getStats():setThirst(0.4);
		else
			character:getStats():setThirst(character:getStats():getThirst() + 0.15);
		end
	end

	--Food sick
	character:getBodyDamage():setFoodSicknessLevel(character:getBodyDamage():getFoodSicknessLevel() - 14*character:getModData().stonedamt/2);
	if character:getBodyDamage():getFoodSicknessLevel() < 0 then
		character:getBodyDamage():setFoodSicknessLevel(0);
	end
end