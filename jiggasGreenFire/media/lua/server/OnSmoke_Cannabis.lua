require('CantFinishSmoking');
require('SmokeAdd');
require('SmokerRelief');

function OnSmoke_Cannabis(food, character)
	if character == nil then return end

	--Initialize values
	local diceroll = 0;
	local bonus = 0;
	local stonerbonus = 0;
	local smokedhalf = false;
	local bongname = "none";
	if food:getType():sub(1,8) then
		bongname = food:getType():sub(1, 8);
	end

	--Apply proper logic and bonuses based on the smoke consumed.
	if food:getType() == "Joint" then
		diceroll = ZombRand(1,3);
		stonerbonus = 11 + 2/3;
		if not character:HasTrait("Stoner") and diceroll ~= 1 then
			bonus = 45;
		elseif not character:HasTrait("Stoner") and diceroll == 1 then
			bonus = 20;
			smokedhalf = true;
		elseif character:HasTrait("Stoner") and character:HasTrait("Lucky") then
			stonerbonus = 20;
		elseif character:HasTrait("Stoner") and character:HasTrait("Unlucky") then
			stonerbonus = 0;
		end
		if smokedhalf then
			character:getInventory():AddItem("Greenfire.HalfJoint");
			SmokeHalfWeed(character);
		else
			SmokeWeed(character);
		end
	elseif food:getType() == "HalfJoint" then
		stonerbonus = 10/3;
		bonus = 20;
		if character:HasTrait("Stoner") and character:HasTrait("Lucky") then
			stonerbonus = 7.5;
		elseif character:HasTrait("Stoner") and character:HasTrait("Unlucky") then
			stonerbonus = 0;
		end
		SmokeHalfWeed(character);
	elseif food:getType() == "KiefJoint" then
		diceroll = ZombRand(1,12);
		stonerbonus = 35;
		if not character:HasTrait("Stoner") and diceroll >= 11  then
			bonus = 85;
		elseif not character:HasTrait("Stoner") and diceroll < 11  then
			bonus = 35;
			smokedhalf = true;
		end

		if character:HasTrait("Stoner") and diceroll >= 7 then
			if character:HasTrait("Lucky") then
				stonerbonus = 60;
			elseif character:HasTrait("Unlucky") then
				stonerbonus = 15;
			end
		elseif character:HasTrait("Stoner") and diceroll < 7 then
			smokedhalf = true;
			stonerbonus = 10;
			if character:HasTrait("Lucky") then
				stonerbonus = 22.5;
			elseif character:HasTrait("Unlucky") then
				stonerbonus = 0;
			end
		end
		if smokedhalf then
			character:getInventory():AddItem("Greenfire.HalfKiefJoint");
			SmokeWeed(character);
			SmokeHalfWeed(character);
		else
			SmokeKief(character);
			SmokeWeed(character);
		end
	elseif food:getType() == "HalfKiefJoint" then
		stonerbonus = 10;
		bonus = 35;
		if character:HasTrait("Stoner") and character:HasTrait("Lucky") then
			stonerbonus = 22.5;
		elseif character:HasTrait("Stoner") and character:HasTrait("Unlucky") then
			stonerbonus = 0;
		end
		SmokeWeed(character);
		SmokeHalfWeed(character);
	elseif food:getType() == "HashJoint" then
		diceroll = ZombRand(1,48);
		stonerbonus = 75;
		if not character:HasTrait("Stoner") and diceroll >= 42 then
			bonus = 75;
		elseif not character:HasTrait("Stoner") and diceroll < 42 then
			bonus = 75;
			smokedhalf = true;
		end

		if character:HasTrait("Stoner") and diceroll >= 37 then
			if character:HasTrait("Lucky") then
				stonerbonus = 58 + 1/3;
			elseif character:HasTrait("Unlucky") then
				stonerbonus = 25;
			end
		elseif character:HasTrait("Stoner") and diceroll < 37 then
			smokedhalf = true;
			stonerbonus = 10 + 2/3;
			if character:HasTrait("Lucky") then
				stonerbonus = 37.5;
			elseif character:HasTrait("Unlucky") then
				stonerbonus = 25;
			end
		end
		if smokedhalf then
			character:getInventory():AddItem("Greenfire.HalfHashJoint");
			SmokeKief(character);
			SmokeHalfWeed(character);
		else
			SmokeWeed(character);
			SmokeHash(character);
		end
	elseif food:getType() == "HalfHashJoint" then
		stonerbonus = 10 + 2/3;
		bonus = 75;
		if character:HasTrait("Stoner") and character:HasTrait("Lucky") then
			stonerbonus = 37.5;
		elseif character:HasTrait("Stoner") and character:HasTrait("Unlucky") then
			stonerbonus = 0;
		end
		SmokeKief(character);
		SmokeHalfWeed(character);
	elseif bongname == "WeedBong" or bongname == "ShakeBon" then
		bonus = 40;
		stonerbonus = 20/3;
		if character:HasTrait("Lucky") then
			stonerbonus = 15;
		elseif character:HasTrait("Unlucky") then
			stonerbonus = 0
		end
		SmokeWeed(character);
	elseif bongname == "WeedPipe" or bongname == "ShakePip" then
		bonus = 40;
		stonerbonus = 20/3;
		if character:HasTrait("Lucky") then
			stonerbonus = 15;
		elseif character:HasTrait("Unlucky") then
			stonerbonus = 0
		end
		SmokeWeed(character);
	elseif bongname == "KiefBong" or bongname == "KiefPipe" then
		bonus = 80;
		stonerbonus = 10 + 10/3;
		if character:HasTrait("Lucky") then
			stonerbonus = 30;
		elseif character:HasTrait("Unlucky") then
			stonerbonus = 0
		end
		SmokeKief(character);
	elseif bongname == "HashBong" or bongname == "HashPipe" then
		bonus = 60;
		stonerbonus = 20 + 20/3;
		if character:HasTrait("Lucky") then
			stonerbonus = 60;
		elseif character:HasTrait("Unlucky") then
			stonerbonus = 0
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
		if (character:getStats():getThirst() + 0.1) > 0.4 then
			character:getStats():setThirst(0.4);
		else
			character:getStats():setThirst(character:getStats():getThirst() + 0.1);
		end
	end

	--Food sick
	character:getBodyDamage():setFoodSicknessLevel(character:getBodyDamage():getFoodSicknessLevel() - 14*character:getModData().stonedamt/2);
	if character:getBodyDamage():getFoodSicknessLevel() < 0 then
		character:getBodyDamage():setFoodSicknessLevel(0);
	end
end