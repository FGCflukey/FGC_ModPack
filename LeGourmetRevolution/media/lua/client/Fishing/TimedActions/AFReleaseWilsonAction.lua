----------------------------------------------------------------------------------
--
-- AFReleaseWilsonAction.lua
-- Parte del mod Advanced Fishing.
-- Creado por Snake.
--
--
-- El codigo base se encuentra en ISShovelAction.lua y ISShovelGround.lua,
-- los cuales han sido creados por Robert Johnson.
--
----------------------------------------------------------------------------------

require "TimedActions/ISBaseTimedAction"

AFReleaseWilsonAction = ISBaseTimedAction:derive("AFReleaseWilsonAction");


function AFReleaseWilsonAction:isValid() 
	return true--(self.character:getPrimaryHandItem() ~= nil and self.character:getPrimaryHandItem():getType() == "WilsonBall");
end


function AFReleaseWilsonAction:update()
    self.character:faceLocation(self.ReleaseSquare:getX(), self.ReleaseSquare:getY())
end


function AFReleaseWilsonAction:start()
	self:setActionAnim("Loot");
	self:setOverrideHandModels(nil, nil);
	self.character:clearVariable("LootPosition");
	self:setAnimVariable("LootPosition", "Low");
	self.character:playSound("LureHitWater");
	self.character:playSound("EasterEggWilson", true);
end


function AFReleaseWilsonAction:stop()
    ISBaseTimedAction.stop(self);
end


function AFReleaseWilsonAction:perform()
	local xp = ZombRand(25,50);

	local player = self.character;
	if player:HasTrait("sportfisherman") then
		xp = xp *2;
	end

--	self.character:setPrimaryHandItem(nil);
--	self.character:getInventory():Remove(self.character:getPrimaryHandItem());
	local oldXp = self.character:getXp():getXP(Perks.Fishing);
    self.character:getXp():AddXP(Perks.Fishing , xp);
    xp = self.character:getXp():getXP(Perks.Fishing) - oldXp;
	
	--self.character:getXp():AddXP(Perks.Fishing, xp);
	luautils.okModal(getText("Tooltip_Releasexp") .. tostring(xp), true);
	ISBaseTimedAction.perform(self);
end


function AFReleaseWilsonAction:new(player, ReleaseSquare, time)
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
