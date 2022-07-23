function TrimFresh(items, result, char)
	local times = ZombRand(2,3);
	for i=1, times do
		char:getInventory():AddItem("Greenfire.FreshCannabisFanLeaf");
	end
	times = ZombRand(3,5);
	for i=1, times do
		char:getInventory():AddItem("Greenfire.FreshCannabisSugarLeaf");
	end
	if (ItemTimeTrackerMod[result:getType()] ~= nil) then
        	result:getModData().Life = ItemTimeTrackerMod[result:getType()]["Life"];
        	result:getModData().TurnInto = ItemTimeTrackerMod[result:getType()]["TurnInto"];
		result:getModData().StartYear = getGameTime():getYear();
        	result:getModData().StartMonth = getGameTime():getMonth();
        	result:getModData().StartDay = getGameTime():getDay();
		result:getModData().StartHour = getGameTime():getHour();
		for i=0, (items:size()-1) do
			local daysinMonth = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
			local hoursElapsed = 0;
			local item = items:get(i);
			if items:get(i):getType() == "FreshUnCanna" then
			if items:get(i):getModData().StartYear == nil then
				items:get(i):getModData().Life = ItemTimeTrackerMod[items:get(i):getType()]["Life"];
				items:get(i):getModData().TurnInto = ItemTimeTrackerMod[items:get(i):getType()]["TurnInto"];
				items:get(i):getModData().StartYear = getGameTime():getYear();
				items:get(i):getModData().StartMonth = getGameTime():getMonth();
				items:get(i):getModData().StartDay = getGameTime():getDay();
				items:get(i):getModData().StartHour = getGameTime():getHour();
			end
			if (getGameTime():getYear() - items:get(i):getModData().StartYear) > 0 then
				hoursElapsed = hoursElapsed + (24 - items:get(i):getModData().StartHour);
				hoursElapsed = hoursElapsed + (daysinMonth[items:get(i):getModData().StartMonth - 1] - items:get(i):getModData().StartDay)*24;
				for i=items:get(i):getModData().StartMonth + 1, 12, 1 do
					hoursElapsed = hoursElapsed + daysinMonth[i-1]*24;
				end
				if getGameTime():getYear() - items:get(i):getModData().StartYear > 1 then
					hoursElapsed = hoursElapsed + (getGameTime():getYear() - items:get(i):getModData().StartYear - 1)*365*24;
				end
				for i=1, getGameTime():getMonth() - 1, 1 do
					hoursElapsed = hoursElapsed + daysinMonth[i-1]*24;
				end
				for i=1, getGameTime():getDay() - 1, 1 do
					hoursElapsed = hoursElapsed + 24;
				end
				hoursElapsed = hoursElapsed + (getGameTime():getHour() - 1);
			else
				if getGameTime():getMonth() - items:get(i):getModData().StartMonth > 0 then
					hoursElapsed = hoursElapsed + (daysinMonth[item:getModData().StartMonth - 1] - items:get(i):getModData().StartDay)*24;
					if getGameTime():getMonth() - item:getModData().StartMonth > 1 then
						for i=items:get(i):getModData().StartMonth + 1, getGameTime():getMonth() - 1, 1 do
							hoursElapsed = hoursElapsed + daysinMonth[i-1]*24;
						end
					end
					hoursElapsed = hoursElapsed + (getGameTime():getDay() - 1)*24;
					hoursElapsed = hoursElapsed + getGameTime():getHour();
				else
					if getGameTime():getDay() - item:getModData().StartDay > 0 then
						hoursElapsed = hoursElapsed + (24 - item:getModData().StartHour);
						if getGameTime():getDay() - item:getModData().StartDay > 1 then
							for i=item:getModData().StartDay, getGameTime():getDay() - 1, 1 do
								hoursElapsed = hoursElapsed + 24;
							end
						end
							hoursElapsed = hoursElapsed + (getGameTime():getHour() - 1);
					else
						hoursElapsed = hoursElapsed + getGameTime():getHour() - item:getModData().StartHour;
					end
				end
			end
			end
			if items:get(i):getType() == "FreshUnCanna" then
				if hoursElapsed<0 then
					--FIx server time error bug
        				result:getModData().StartYear = getGameTime():getYear();
        				result:getModData().StartMonth = getGameTime():getMonth();
        				result:getModData().StartDay = getGameTime():getDay();
					result:getModData().StartHour = getGameTime():getHour();
				elseif result:getModData().Life > (items:get(i):getModData().Life - hoursElapsed) then
					result:getModData().Life = items:get(i):getModData().Life;
					result:getModData().StartYear = items:get(i):getModData().StartYear;
					result:getModData().StartMonth = items:get(i):getModData().StartMonth;
					result:getModData().StartDay = items:get(i):getModData().StartDay;
					result:getModData().StartHour = items:get(i):getModData().StartHour;
				end
			end
		end
	end
end

function TrimDry(items, result, char)
	local times = ZombRand(2,3);
	for i=1, times do
		char:getInventory():AddItem("Greenfire.CannabisShake");
	end
end

function RollCigar(items, result, char)
	if (ItemTimeTrackerMod[result:getType()] ~= nil) then
        	result:getModData().Life = ItemTimeTrackerMod[result:getType()]["Life"];
        	result:getModData().TurnInto = ItemTimeTrackerMod[result:getType()]["TurnInto"];
		result:getModData().StartYear = getGameTime():getYear();
        	result:getModData().StartMonth = getGameTime():getMonth();
        	result:getModData().StartDay = getGameTime():getDay();
		result:getModData().StartHour = getGameTime():getHour();
	end
end

function JarCanna(items, result, char)
	if (ItemTimeTrackerMod[result:getType()] ~= nil) then
        	result:getModData().Life = ItemTimeTrackerMod[result:getType()]["Life"];
        	result:getModData().TurnInto = ItemTimeTrackerMod[result:getType()]["TurnInto"];
		result:getModData().StartYear = getGameTime():getYear();
        	result:getModData().StartMonth = getGameTime():getMonth();
        	result:getModData().StartDay = getGameTime():getDay();
		result:getModData().StartHour = getGameTime():getHour();
	end
end

function OpenCannaJar(items, result, char)
	char:getInventory():AddItem("Base.EmptyJar", 1);
	char:getInventory():AddItem("Base.JarLid", 1);
end

function MakeShake(items, result, char)
	local ceiling = 20;
	local seedtype = "Greenfire.CannabisSeed";
	if char:HasTrait("Lucky") then
		ceiling = 12;
	elseif char:HasTrait("Unlucky") then
		ceiling = 100;
	end
	for i=0, (items:size() - 1) do
		if items:get(i):getType() == "HCHempbudcured" then
			seedtype = "Hydrocraft.HCHempseeds";
		end
	end
	local diceroll = ZombRand(1,ceiling);
	if diceroll == 1 then
		char:Say(getText("UI_speech_seed1"));
		char:getInventory():AddItem(seedtype);
		if char:HasTrait("Lucky") then
			diceroll = ZombRand(1,20);
			if diceroll == 20 then
				char:getInventory():AddItem(seedtype);
			end
		end
	end
end

function SiftShake(items, result, char)
	local ceiling = 100;
	if char:HasTrait("Lucky") then
		ceiling = 20;
	elseif char:HasTrait("Unlucky") then
		ceiling = 200;
	end
	local diceroll = ZombRand(1,ceiling);
	if diceroll == 1 then
		char:Say(getText("UI_speech_seed2"));
		char:getInventory():AddItem("Greenfire.CannabisSeed");
		diceroll = ZombRand(1,20);
		if diceroll == 20 then
			char:getInventory():AddItem("Greenfire.CannabisSeed");
		end
	end
end

function MakeWrap(items, result, char)
	local times = 2;
	for i=1, times do
		char:getInventory():AddItem("Greenfire.Tobacco");
	end
end

function CutTobacco(items, result, char)
	local times = ZombRand(3,6);
	for i=1, times do
		char:getInventory():AddItem("Greenfire.CigarLeaf");
	end
end