----------------------------------------------------------------------------------
--
-- AFReleaseFishAction.lua
-- Parte del mod Advanced Fishing.
-- Creado por Snake.
--
--
-- El codigo base se encuentra en ISShovelAction.lua y ISShovelGround.lua,
-- los cuales han sido creados por Robert Johnson.
--
----------------------------------------------------------------------------------

require "TimedActions/ISBaseTimedAction"

AFReleaseFishAction = ISBaseTimedAction:derive("AFReleaseFishAction");


function AFReleaseFishAction:isValid()
	local Item = self.character:getPrimaryHandItem();
	if Item ~= nil then
		local NotAllow = false;
		if (instanceof(Item, "Food")) then
			if Item ~= nil and (Item:isCooked() or Item:isRotten() or Item:isBurnt()) then
				NotAllow = true;
			end
		end
		if NotAllow ~= false then
			luautils.okModal(getText("Tooltip_BadRelease"), true);
		end
		return (NotAllow == false);
	else
		return 
	end
end


function AFReleaseFishAction:update()
    self.character:faceLocation(self.ReleaseSquare:getX(), self.ReleaseSquare:getY())
end


function AFReleaseFishAction:start()
--    self.sound = getSoundManager():PlayWorldSound("waterSplash", self.ReleaseSquare, 0, 10, 1, true);
	self:setActionAnim("Loot");
	self:setOverrideHandModels(nil, nil);
	self.character:clearVariable("LootPosition");
	self:setAnimVariable("LootPosition", "Low");
end


function AFReleaseFishAction:stop()
    ISBaseTimedAction.stop(self);
end


function AFReleaseFishAction:perform()

    getSoundManager():PlayWorldSound("LureHitWater", self.ReleaseSquare, 0, 10, 1, true);

	local _primary = self.character:getPrimaryHandItem();
	if _primary ~= nil then
		local perklvl = self.character:getPerkLevel(Perks.Fishing);
		local data = _primary:getModData();

		local xp = 0;
		if _primary:getType() == "Palometa" or _primary:getType() == "Piranha" or _primary:getType() == "Dentudo" or _primary:getType() == "Anguila" or _primary:getType() == "Crab" or _primary:getType() == "Crayfish" or _primary:getType() == "BaitFish" or _primary:getType() == "Crappie" or _primary:getType() == "Panfish" then
			xp = 1;
		elseif _primary:getType() == "Payara" or _primary:getType() == "Carp" or _primary:getType() == "Peje" or _primary:getType() == "Waterturtle" or _primary:getType() == "Perch" or _primary:getType() == "Bass" or _primary:getType() == "Trout" or _primary:getType() == "Catfish" then
			xp = ZombRand(1,3);
		elseif _primary:getType() == "Dorado" or _primary:getType() == "Tucunare" or _primary:getType() == "Pacu" or _primary:getType() == "Tararira" or _primary:getType() == "Walleye" or _primary:getType() == "Pati" or _primary:getType() == "Snakehead" or _primary:getType() == "Pike" or _primary:getType() == "Arowana" then
			xp = ZombRand(2,4);
		elseif _primary:getType() == "FSalmon" or _primary:getType() == "RainbowTrout" or _primary:getType() == "Tarpon" or _primary:getType() == "Surubi" then
			xp = ZombRand(2,5);
		elseif _primary:getType() == "Piraiba" or _primary:getType() == "Rtcatfish" then
			xp = ZombRand(2,6);
		elseif _primary:getType() == "Arapaima" or _primary:getType() == "Ray" then
			xp = ZombRand(5,11);
		end


		if self.character:HasTrait("sportfisherman") then
			xp = xp *2;
		end
		if perklvl < 10 then
			xp = xp *3;
		end
		if data.alive and data.alive == 1 then
			local oldXp = self.character:getXp():getXP(Perks.Fishing);
			self.character:getXp():AddXP(Perks.Fishing , xp);
			xp = tonumber(string.format("%." .. (2 or 0) .. "f", self.character:getXp():getXP(Perks.Fishing) - oldXp));

			--self.character:getXp():AddXP(Perks.Fishing, xp);
			--luautils.okModal(getText("Tooltip_Releasexp") .. tostring(xp), true);
			self.character:setHaloNote(getText("IGUI_perks_Fishing").."+"..tonumber(string.format("%." .. (2 or 0) .. "f", xp)), 0,255,0,300);
		else
			self.character:setHaloNote(getText("IGUI_perks_Fishing").."+".. "0 " .. getText("Tooltip_NeedAlive"), 204,0,0,500);
			--luautils.okModal(getText("Tooltip_Releasexp") .. "0" .. "\\n " .. getText("Tooltip_NeedAlive"), true);
		end

		self.character:setPrimaryHandItem(nil);
		self.character:getInventory():Remove(_primary);
	end

	ISBaseTimedAction.perform(self);
end


function AFReleaseFishAction:new(player, ReleaseSquare, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = player;
	o.ReleaseSquare = ReleaseSquare;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time;
	return o
end
