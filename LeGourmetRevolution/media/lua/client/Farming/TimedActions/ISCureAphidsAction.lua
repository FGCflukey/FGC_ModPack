--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISCureAphidsAction = ISBaseTimedAction:derive("ISCureAphidsAction");

function ISCureAphidsAction:isValid()
	self.plant:updateFromIsoObject()
	return self.plant:getIsoObject() ~= nil
end

function ISCureAphidsAction:update()
	self.character:faceThisObject(self.plant:getObject())
end

function ISCureAphidsAction:start()
	self:setActionAnim(CharacterActionAnims.Pour)
	self:setOverrideHandModels(self.item, nil)
end

function ISCureAphidsAction:stop()
    ISBaseTimedAction.stop(self);
end

function ISCureAphidsAction:perform()
	local sq = self.plant:getSquare()
	local args = { x = sq:getX(), y = sq:getY(), z = sq:getZ(), uses = self.uses }
	CFarmingSystem.instance:sendCommand(self.character, 'cureAphids', args)

	-- Hack until server manages player inventory
	local level = self.plant.aphidLvl
	for i=1,self.uses do
		if level < 100 then
			self.item:Use()
			level = level - 5
		end
	end

    -- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function ISCureAphidsAction:new(character, item, uses, plant, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.uses = uses;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time;
    o.plant = plant;
	return o;
end
