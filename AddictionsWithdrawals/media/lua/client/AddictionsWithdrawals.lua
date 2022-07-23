require('NPCs/MainCreationMethods');

local function initAddictions(_player)
	local character = _player;
	character:getModData().exsmoker = false;
	character:getModData().lastsmokedays = 0;
	character:getModData().cigdays = 0;
	character:getModData().cigsmoked = false;
	character:getModData().lastpotdays = 0;
	character:getModData().potdays = 0;
	character:getModData().potcount = 0;
	character:getModData().potscale = 0;
end

local function checkSmoker()
	local character = getPlayer();
	if not getActivatedMods():contains("QuitSmoking") then
		if character:hasModData() and character:getModData().lastsmokedays ~= nil then
		else
			character:getModData().cigsmoked = false;
			character:getModData().lastsmokedays = 0;
			character:getModData().exsmoker = false;
			character:getModData().cigdays = 0;
		end
	end
	if getActivatedMods():contains("jiggasGreenfireMod") then
		if character:hasModData() and character:getModData().lastpotdays ~= nil then
		else
			character:getModData().lastpotdays = 0;
			character:getModData().potdays = 0;
			character:getModData().potcount = 0;
			character:getModData().potscale = 0;
			if character:HasTrait("Stoner") then
				character:getModData().potscale = 1;
			end
		end
	end
end

local function updateSmoker()
	local character = getPlayer();
	local time = ZombRand(18,24);
	local weedtime = ZombRand(18,24);
	if character:HasTrait("Lucky") then
		time = ZombRand(11,17);
		weedtime = ZombRand(25,31);
	end
	if character:HasTrait("Unlucky") then
		time = ZombRand(25,31);
		weedtime = ZombRand(11,17);
	end
	if character:getModData().dayswet == nil then
		character:getModData().dayswet = 0;
	end
	if character:getModData().daysdry == nil then
		character:getModData().daysdry = 0;
	end
	if not character:HasTrait("Alcoholic") and character:getModData().dayswet >= 14 then
		if not getActivatedMods():contains("ToadTraits") and not getActivatedMods():contains("DynamicTraits") then
			character:getTraits():add("Alcoholic");
		end
		if not getActivatedMods():contains("DynamicTraits") then
			character:getBodyDamage():setDrunkIncreaseValue(10.25);
		end
	end
	if character:HasTrait("Alcoholic") and character:getModData().daysdry >= 14 then

		if not getActivatedMods():contains("DynamicTraits") then
			character:getTraits():remove("Alcoholic");
			character:getBodyDamage():setDrunkIncreaseValue(20.5);
		end
	end
	if not character:HasTrait("Smoker") and character:getModData().cigsmoked then
		character:getModData().cigdays = character:getModData().cigdays + 1;
	elseif not character:HasTrait("Smoker") and not character:getModData().cigsmoked then
		character:getModData().cigdays = character:getModData().cigdays - 1;
	end
	if character:getModData().cigdays < 0 then
		character:getModData().cigdays = 0;
	end
	if not character:HasTrait("Smoker") and character:getModData().cigdays >= weedtime/1.5 then
		character:getTraits():add("Smoker");
		character:Say(getText("UI_gain_smoker"));
	end
	if not getActivatedMods():contains("QuitSmoking") then
		if not character:getModData().cigsmoked then
			character:getModData().lastsmokedays = character:getModData().lastsmokedays + 1;
		end
		if character:HasTrait("Smoker") and character:getModData().lastsmokedays >= time then
			character:getTraits():remove("Smoker");
			character:getModData().exsmoker = true;
			character:getStats():setStressFromCigarettes(0);
		end
		if character:getModData().exsmoker == true and character:getModData().cigsmoked then
			character:getModData().lastsmokedays = 0;
			character:getModData().exsmoker = false;
			character:getTraits():add("Smoker");
			character:Say(getText("UI_regain_smoker"));
		end
		character:getModData().cigsmoked = false;
	end
	if getActivatedMods():contains("jiggasGreenfireMod") then
		if character:HasTrait("Stoner") and character:getModData().potscale == 0 then
			character:getModData().potscale = 1;
		end
		if character:getModData().potcount == 0 then
			character:getModData().lastpotdays = character:getModData().lastpotdays + 1;
			character:getModData().potdays = character:getModData().potdays - 1;
			if character:getModData().potdays < 0 then
				character:getModData().potdays = 0;
			end
		elseif character:getModData().potcount ~= 0 then
			character:getModData().lastpotdays = 0;
			character:getModData().potdays = character:getModData().potdays + 1;
		end
		if character:getModData().potcount > 0 and character:getModData().potscale == 0 then
			character:getModData().potscale = character:getModData().potcount;
		end
		if character:getModData().potscale > character:getModData().potcount and character:getModData().potcount ~= 0 then
			character:getModData().potscale = character:getModData().potscale - (1/(character:getModData().potcount + 3));
		elseif character:getModData().potscale < character:getModData().potcount then
			character:getModData().potscale = character:getModData().potscale + 1/5;
		end
		if character:getModData().potscale > 3 then
			character:getModData().potscale = 3;
		end
		if character:getModData().potscale > 0 then
			if character:HasTrait("Stoner") and character:getModData().lastpotdays >= (character:getModData().potscale/1.5)*weedtime then
				character:getTraits():remove("Stoner");
				character:getModData().potscale = 0;
				character:getModData().potdays = 0;
				character:Say(getText("UI_lost_stoner"));
			end
			if not character:HasTrait("Stoner") and character:getModData().potdays >= 1.5*time then
				character:getTraits():add("Stoner");
				character:playSound("GainExperienceLevel");
			end
		end
		character:getModData().potcount = 0;
	end
end

Events.OnNewGame.Add(initAddictions);
Events.EveryDays.Add(updateSmoker);
Events.OnGameStart.Add(checkSmoker);