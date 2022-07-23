require('NPCs/MainCreationMethods');
require('SmokerRelief');

local function initStoned(_player)
	_player:getModData().mindrink = 0;
	_player:getModData().gotedible = 0;
	_player:getModData().edibleamt = 0;
	_player:getModData().stonedamt = 0;
	_player:getModData().gotstoned = 0;
	_player:getModData().bonus = 0;
	_player:getModData().dranktoday = false;
	_player:getModData().abu = 0;
	_player:getModData().daysdry = 0;
	_player:getModData().dayswet = 0;
	if _player:HasTrait("Alcoholic") and not getActivatedMods():contains("DynamicTraits") then
		_player:getBodyDamage():setDrunkIncreaseValue(15.38);
	end
end

local function checkStoner()
	local char = getPlayer();
	if char == nil then
		return
	end
	if char:HasTrait("Alcoholic") and char:getBodyDamage():getDrunkIncreaseValue() ~= 15.38 then
		if not getActivatedMods():contains("DynamicTraits") then
			char:getBodyDamage():setDrunkIncreaseValue(15.38);
		end
	end
	if char:hasModData() and char:getModData().stonedamt == nil then
		char:getModData().mindrink = 0;
		char:getModData().gotedible = 0;
		char:getModData().edibleamt = 0;
		char:getModData().stonedamt = 0;
		char:getModData().gotstoned = 0;
		char:getModData().bonus = 0;
		char:getModData().bonus = 0;
		char:getModData().dranktoday = false;
		char:getModData().abu = 0;
		char:getModData().daysdry = 0;
		char:getModData().dayswet = 0;
	else
		if char:getBodyDamage():getPanicReductionValue() ~= 0.06 then
			--This was intended to fix any characters whose Panic got broken after playing
			--the christmas 2020 update. If your character's panic is still broken, simply:
			--Delete the two dashes from the line below, save this document, load your character, and then save your game
			--char:getBodyDamage():setPanicReductionValue(0.06);
		end
	end
end

local function updateStoner()
	local char = getPlayer();
	local nilmin = false;
	if char == nil then
		return
	end
	if char:HasTrait("Alcoholic") and char:getBodyDamage():getDrunkIncreaseValue() ~= 15.38 then
		if not getActivatedMods():contains("DynamicTraits") then
			char:getBodyDamage():setDrunkIncreaseValue(15.38);
		end
	end
	if char:getModData().dranktoday == nil then
		char:getModData().dranktoday = false;
	end
	if char:HasTrait("Alcoholic") and not char:getModData().dranktoday then
		if not getActivatedMods():contains("DynamicTraits") then
			if char:getModData().mindrink == nil then
				char:getModData().mindrink = 0;
				nilmin = true;
			end
			if not nilmin then
				char:getModData().mindrink = char:getModData().mindrink + 10;
			end
			if char:getStats():getStress() < 1 and (char:getModData().mindrink/60) >= 24 then
				if not char:isAsleep() then
					--char:Say("Stress added.");
					char:getStats():setStress(char:getStats():getStress() + 0.03);
				end
			end
		end
	end
	if not char:HasTrait("Alcoholic") and not getActivatedMods():contains("DynamicTraits") then
		if char:getBodyDamage():getDrunkIncreaseValue() ~= 20.5 then
			char:getBodyDamage():setDrunkIncreaseValue(20.5);
		end
	end
	if char:hasModData() and char:getModData().stonedamt == nil then
		char:getModData().gotedible = 0;
		char:getModData().edibleamt = 0;
		char:getModData().stonedamt = 0;
		char:getModData().gotstoned = 0;
		char:getModData().bonus = 0;
	end
	local scale = char:getModData().stonedamt/2;
	if char:hasModData() and char:getModData().gotstoned <= 2 and char:getModData().gotstoned ~= 0 then
		if char:getPainEffect() < (2400*(SandboxVars.DayLength - 2)) and SandboxVars.DayLength > 2 then
			char:setPainEffect(4800*(SandboxVars.DayLength - 2));
		elseif char:getPainEffect() < (600*SandboxVars.DayLength) and SandboxVars.DayLength <= 2 then
			char:setPainEffect(1200*(SandboxVars.DayLength));
		end
		if char:getBetaEffect() < (2400*(SandboxVars.DayLength - 2)) and SandboxVars.DayLength > 2 then
			char:setBetaEffect(4800*(SandboxVars.DayLength - 2));
		elseif char:getBetaEffect() < (600*SandboxVars.DayLength) and SandboxVars.DayLength <= 2 then
			char:setBetaEffect(1200*(SandboxVars.DayLength));
		end
		if char:getStats():getDrunkenness() > 10.0 then
			char:setPainDelta(char:getPainDelta() + 0.45*scale/2);
			char:setBetaDelta(char:getBetaDelta() + 0.3*scale/2);
		else
			char:setPainDelta(char:getPainDelta() + 0.15*scale/2);
			char:setBetaDelta(char:getBetaDelta() + 0.15*scale/2);
		end
		if not char:HasTrait("Stoner") then
			if char:getStats():getFatigue() >= 0.8 and char:getStats():getFatigue() < 1 then
				if (char:getStats():getFatigue() + 0.0125*scale) > 1 then
					char:getStats():setFatigue(1);
				else
					char:getStats():setFatigue(char:getStats():getFatigue() + 0.0125*scale);
				end
			end
			if char:getStats():getFatigue() >= 0.6 and char:getStats():getFatigue() < 0.8 then
				if (char:getStats():getFatigue() + 0.025*scale) > 0.8 then
					char:getStats():setFatigue(0.8);
				else
					char:getStats():setFatigue(char:getStats():getFatigue() + 0.025*scale);
				end
			end
			if char:getStats():getFatigue() < 0.6 then
				if (char:getStats():getFatigue() + 0.3*scale) > 0.6 then
						char:getStats():setFatigue(0.6);
				else
					char:getStats():setFatigue(char:getStats():getFatigue() + 0.3*scale);
				end
			end
			if char:getBodyDamage():getHealthFromFoodTimer() <= 0 then
				if char:getStats():getHunger() < 0.4 then
					if (char:getStats():getHunger() + 0.05*scale) > 0.4 then
						--char:Say("Hunger added");

						char:getStats():setHunger(0.4);
					else
						--char:Say("Hunger added");

						char:getStats():setHunger(char:getStats():getHunger() + 0.05*scale);
					end
				end
			end
		end
	end
	if char:getModData().gotstoned > 0 then
		char:getModData().gotstoned = (char:getModData().gotstoned) - 1;
	end
	if char:getModData().gotstoned == 0 then
		char:getModData().stonedamt = 0;
	end
	if char:getModData().gotstoned < 0 then
		char:getModData().gotstoned = 0;
	end
end

local function updateEdible()
	local char = getPlayer();
	if char == nil then
		return
	end
	if char:hasModData() and char:getModData().stonedamt == nil then
		char:getModData().gotedible = 0;
		char:getModData().edibleamt = 0;
		char:getModData().stonedamt = 0;
		char:getModData().gotstoned = 0;
		char:getModData().bonus = 0;
	end
	local scale = char:getModData().edibleamt/2;
	if char:hasModData() and char:getModData().gotedible <= 3 and char:getModData().gotedible ~= 0 then
		if char:getPainEffect() < (2400*(SandboxVars.DayLength - 2)) and SandboxVars.DayLength > 2 then
			char:setPainEffect(4800*(SandboxVars.DayLength - 2));
		elseif char:getPainEffect() < (600*SandboxVars.DayLength) and SandboxVars.DayLength <= 2 then
			char:setPainEffect(1200*(SandboxVars.DayLength));
		end
		if char:getBetaEffect() < (2400*(SandboxVars.DayLength - 2)) and SandboxVars.DayLength > 2 then
			char:setBetaEffect(4800*(SandboxVars.DayLength - 2));
		elseif char:getBetaEffect() < (600*SandboxVars.DayLength) and SandboxVars.DayLength <= 2 then
			char:setBetaEffect(1200*(SandboxVars.DayLength));
		end
		if char:getStats():getDrunkenness() > 10.0 then
			char:setPainDelta(char:getPainDelta() + 0.45*scale/3);
			char:setBetaDelta(char:getBetaDelta() + 0.3*scale/3);
		else
			char:setPainDelta(char:getPainDelta() + 0.15*scale/3);
			char:setBetaDelta(char:getBetaDelta() + 0.15*scale/3);
		end

		if not char:HasTrait("Stoner") then
			if char:getStats():getFatigue() >= 0.8 and char:getStats():getFatigue() < 1 then
				if (char:getStats():getFatigue() + 0.0125*scale) > 1 then
					char:getStats():setFatigue(1);
				else
					char:getStats():setFatigue(char:getStats():getFatigue() + 0.0125*scale);
				end
			end
			if char:getStats():getFatigue() >= 0.6 and char:getStats():getFatigue() < 0.8 then
				if (char:getStats():getFatigue() + 0.025*scale) > 0.8 then
					char:getStats():setFatigue(0.8);
				else
					char:getStats():setFatigue(char:getStats():getFatigue() + 0.025*scale);
				end
			end
			if char:getStats():getFatigue() < 0.6 then
				if (char:getStats():getFatigue() + 0.3*scale) > 0.6 then
						char:getStats():setFatigue(0.6);
				else
					char:getStats():setFatigue(char:getStats():getFatigue() + 0.3*scale);
				end
			end
		end
		char:getBodyDamage():setBoredomLevel(char:getBodyDamage():getBoredomLevel() - (char:getModData().bonus)/3);
		char:getBodyDamage():setUnhappynessLevel(char:getBodyDamage():getUnhappynessLevel() - (char:getModData().bonus)/3);
		char:getStats():setStress(char:getStats():getStress() - (char:getModData().bonus)/3);

		--Turns all levels in the negative to zero
		if char:getBodyDamage():getBoredomLevel() < 0 then
			char:getBodyDamage():setBoredomLevel(0);
		end
		if char:getBodyDamage():getUnhappynessLevel() < 0 then
			char:getBodyDamage():setUnhappynessLevel(0);
		end
		if char:getStats():getStress() < 0 then
			char:getStats():setStress(0);
		end
		--Satisfy smoker trait
		if char:HasTrait("Smoker") then
			SmokerRelief(char);
		end
	end
	if char:getModData().gotedible > 0 then
		char:getModData().gotedible = (char:getModData().gotedible) - 1;
	end
	if char:getModData().gotedible == 0 then
		char:getModData().edibleamt = 0;
		char:getModData().bonus = 0;
	end
	if char:getModData().gotedible < 0 then
		char:getModData().gotedible = 0;
	end
end

local function resetAlcohol()
	local char = getPlayer();
	local nilday = false;
	if char == nil then return end

	if char:getModData().dranktoday == nil then
		char:getModData().dranktoday = false;
	end
	if char:getModData().daysdry == nil then
		char:getModData().daysdry = 0;
		nilday = true;
	end
	if char:getModData().dayswet == nil then
		char:getModData().dayswet = 0;
	end
	if char:getModData().mindrink == nil then
		char:getModData().mindrink = 0;
	end
	if not char:getModData().dranktoday and not nilday then
		if not char:HasTrait("Alcoholic") and (char:getModData().mindrink/60) >= 24 then
			if not getActivatedMods():contains("DynamicTraits") then
				char:getModData().dayswet = char:getModData().dayswet - 1;
				if char:getModData().dayswet < 0 then
					char:getModData().dayswet = 0;
				end
				
			end
		elseif char:HasTrait("Alcoholic") and (char:getModData().mindrink/60) >= 24 then
			if not getActivatedMods():contains("DynamicTraits") then
				char:getModData().daysdry = char:getModData().daysdry + 1;
			end
		end
	end
	if char:getModData().dranktoday then
		char:getModData().daysdry = 0;
	end
	if char:getModData().abu == nil then
		char:getModData().abu = 0;
	end
	if char:getModData().abu >= 7 and not getActivatedMods():contains("DynamicTraits") then
		char:getModData().dayswet = char:getModData().dayswet + 1;
	end
	char:getModData().dranktoday = false;
	char:getModData().abu = 0;
	nilday = false;

end

Events.OnNewGame.Add(initStoned);
Events.EveryTenMinutes.Add(updateStoner);
Events.EveryTenMinutes.Add(updateEdible);
Events.OnGameStart.Add(checkStoner);
Events.EveryDays.Add(resetAlcohol);