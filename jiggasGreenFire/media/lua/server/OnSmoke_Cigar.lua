require('CantFinishSmoking');
require('SmokerRelief');

function OnSmoke_Cigar(food, character)
	if character == nil then return end

	--Initialize values
	local diceroll = 0;
	local bonus = 0;
	local smokedhalf = false;
	local multiple = 0;

	if getActivatedMods():contains("jiggasAddictionMod") then
		character:getModData().cigsmoked = true;
	end 

	--Roll the dice
	diceroll = ZombRand(1,3);

	--Apply proper bonus based on smoke consumed and determine if only half is smoked
	if food:getType() == "GFCigar" then
		if not character:HasTrait("Smoker") and diceroll == 3 then
			bonus = 40;
			multiple = 7;
		elseif not character:HasTrait("Smoker") and diceroll ~= 3 then
			bonus = 0;
			smokedhalf = true;
			multiple = 4;
		elseif character:HasTrait("Smoker") and diceroll ~= 1 then
			bonus = 40;
		elseif character:HasTrait("Smoker") and diceroll == 1 then
			bonus = 0;
			smokedhalf = true;
		end
		if smokedhalf then
			character:getInventory():AddItem("Greenfire.HalfCigar");
		end
	elseif food:getType() == "HalfCigar" then
		bonus = 0;
		multiple = 3.5;
	elseif food:getType() == "BluntCigar" then
		if not character:HasTrait("Smoker") and diceroll ~= 1 then
			bonus = 7;
			multiple = 3;
		elseif not character:HasTrait("Smoker") and diceroll == 1 then
			bonus = 0;
			smokedhalf = true;
			multiple = 1.5;
		elseif character:HasTrait("Smoker") then
			bonus = 7;
		end
		if smokedhalf then
			character:getInventory():AddItem("Greenfire.HalfBluntCigar");
		end
	elseif food:getType() == "HalfBluntCigar" then
		bonus = 0;
		multiple = 1.5;
	end

	--Satisfy smoker trait
	if character:HasTrait("Smoker") then
		SmokerRelief(character);
	else
		character:getBodyDamage():setFoodSicknessLevel(character:getBodyDamage():getFoodSicknessLevel() + 14*multiple);
		if character:getBodyDamage():getFoodSicknessLevel() > 100 then
			character:getBodyDamage():setFoodSicknessLevel(100);
		end
	end

	--Cough, player expresses distress
	if smokedhalf then
		CantFinishSmoking(character);
	end

	--Apply bonuses
	character:getBodyDamage():setBoredomLevel(character:getBodyDamage():getBoredomLevel() - bonus);
	character:getStats():setStress(character:getStats():getStress() - bonus);

	--Turns all levels in the negative to zero
	if character:getBodyDamage():getBoredomLevel() < 0 then
		character:getBodyDamage():setBoredomLevel(0);
	end
	if character:getStats():getStress() < 0 then
		character:getStats():setStress(0);
	end
end