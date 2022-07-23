require('SmokerRelief');


function OnEat_Edible(food, character, fraction)
	local bonus = 0;
	local stonerbonus = 0;
	if food:getType() == "SBrownie" or food:getType() == "NiceCrispiez" then
		stonerbonus = (10/3)*fraction;
		if getActivatedMods():contains("jiggasAddictionMod") then
			character:getModData().potcount = character:getModData().potcount + 1*fraction;
			if character:getModData().potcount > 3 then
				character:getModData().potcount = 3;
			end
		end
		character:getModData().gotedible = 6;
		if character:getModData().edibleamt == nil then
			character:getModData().edibleamt = 0;
		end
		character:getModData().edibleamt = character:getModData().edibleamt + 1*fraction;
		if not character:HasTrait("Stoner") then
			bonus = 20*fraction;
		elseif character:HasTrait("Stoner") and character:HasTrait("Lucky") then
			stonerbonus = 7.5*fraction;
		elseif character:HasTrait("Stoner") and character:HasTrait("Unlucky") then
			stonerbonus = 0;
		end
	elseif food:getType() == "SBrowniePan" or food:getType() == "NiceCrispiezPan" or food:getType() == "SCrispySauce" or food:getType() == "CannaButter" then
		stonerbonus = (400/3 - 20)*fraction;
		if getActivatedMods():contains("jiggasAddictionMod") then
			character:getModData().potcount = character:getModData().potcount + 8*fraction;
			if character:getModData().potcount > 3 then
				character:getModData().potcount = 3;
			end
		end
		character:getModData().gotedible = 6;
		character:getModData().edibleamt = character:getModData().edibleamt + 16*fraction;
		if not character:HasTrait("Stoner") then
			bonus = 380*fraction;
		elseif character:HasTrait("Stoner") and character:HasTrait("Lucky") then
			stonerbonus = 180*fraction;
		elseif character:HasTrait("Stoner") and character:HasTrait("Unlucky") then
			stonerbonus = 60*fraction;
		end
	end

	if bonus > 80 then
		bonus = 80;
	elseif stonerbonus > 80 then
		stonerbonus = 80;
	end

	if not character:HasTrait("Stoner") then
		--Applies max bonus for non-stoners
		if (character:getModData().bonus + bonus) <= 80 then
			character:getModData().bonus = character:getModData().bonus + bonus;
		else
			character:getModData().bonus = 80;
		end
	else
		if (character:getModData().bonus + stonerbonus) <= 80 then
			character:getModData().bonus = character:getModData().bonus + stonerbonus;
		else
			character:getModData().bonus = 80;
		end
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
end

