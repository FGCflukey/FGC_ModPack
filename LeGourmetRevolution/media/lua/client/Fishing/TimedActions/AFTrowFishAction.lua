require ("TimedActions/ISBaseTimedAction");

AFTrowFishAction = ISBaseTimedAction:derive("AFTrowFishAction");

function AFTrowFishAction:isValid()
	return true
end

function AFTrowFishAction:update()
    self.item:setJobDelta(self:getJobDelta());
end

function AFTrowFishAction:start()
    self.item:setJobType(getText("ContextMenu_TrowFish"));
    self.item:setJobDelta(0.0);
end


function AFTrowFishAction:stop()
	ISBaseTimedAction.stop(self);
	self.item:setJobDelta(0.0);
end

function AFTrowFishAction:perform()

    ISBaseTimedAction.perform(self);
	self.item:setJobDelta(0.0);

	self.character:getCurrentSquare():AddWorldInventoryItem(self.item, self.character:getX() - math.floor(self.character:getX()), self.character:getY() - math.floor(self.character:getY()), self.character:getZ() - math.floor(self.character:getZ())):getModData();
    self.character:getInventory():Remove(self.item);
	
end

function AFTrowFishAction:new(character, item, time)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o.character = character;
	o.item = item;
	o.stopOnWalk = false;
	o.stopOnRun = true;
	o.maxTime = time;
	return o;
end