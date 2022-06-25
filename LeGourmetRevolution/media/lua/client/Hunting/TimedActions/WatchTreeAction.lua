--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

WatchTreeAction = ISBaseTimedAction:derive("WatchTreeAction");

function WatchTreeAction:isValid()
	return self.character:getInventory():contains(self.item);
end

function WatchTreeAction:update()
	self.character:faceLocation(self.square:getX(), self.square:getY());
	self.item:setJobDelta(self:getJobDelta());
end

function WatchTreeAction:start()
	self.item:setJobDelta(0.0);
	self.character:faceLocation(self.square:getX(), self.square:getY());
	self.character:playEmote("saluteformal");
end

function WatchTreeAction:stop()
    ISBaseTimedAction.stop(self);
    self.item:setJobDelta(0.0);

end

function WatchTreeAction:perform()
    self.item:setJobDelta(0.0);
	LGHuntingRocksMenu.ExploreandTrowrock(self.square, self.plnum, self.capture)
    -- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function WatchTreeAction:new (character, item, time, square, capture)
	local o = ISBaseTimedAction.new(self, character);
	o.item = item;
	o.stopOnAim = true;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time;
	o.square = square;
	o.capture = capture;
	o.plnum = character:getPlayerNum();
	o.useProgressBar = false;

	if o.character:isTimedActionInstant() then
		o.maxTime = 1;
	end
	return o
end
