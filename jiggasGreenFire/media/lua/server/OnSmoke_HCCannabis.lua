require('CantFinishSmoking');
require('SmokeAdd');
require('SmokerRelief');

function OnSmoke_HCCannabis(food, character)
	if character == nil then return end

	--Initialize values
	local bonus = 0;
	local stonerbonus = 0;

	if food:getType() == "HCBongfull" or food:getType() == "HCBongacrylicfull" then
		stonerbonus = 4;
		if not character:HasTrait("Stoner") then
			bonus = 24;
		elseif character:HasTrait("Stoner") and character:HasTrait("Lucky") then
			stonerbonus = 19;
		elseif character:HasTrait("Stoner") and character:HasTrait("Unlucky") then
			stonerbonus = 0;
		end
		SmokeWeed(character);
	elseif food:getType() == "HCPipehemp" or food:getType() == "HCCorncobpipehemp" then
		stonerbonus = 10/3;
		if not character:HasTrait("Stoner") then
			bonus = 20;
		elseif character:HasTrait("Stoner") and character:HasTrait("Lucky") then
			stonerbonus = 7.5;
		elseif character:HasTrait("Stoner") and character:HasTrait("Unlucky") then
			stonerbonus = 0;
		end
		SmokeWeed(character);
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