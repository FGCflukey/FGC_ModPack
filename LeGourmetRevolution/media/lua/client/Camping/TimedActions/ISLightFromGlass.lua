--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISLightFromGlass = ISBaseTimedAction:derive("ISLightFromGlass");

function ISLightFromGlass:isValid()
	self.campfire:updateFromIsoObject()
	local currentHour = math.floor(math.floor(GameTime:getInstance():getTimeOfDay() * 3600) / 3600); --La hora del día
	local c = getClimateManager();
	local clouds = c:getCloudIntensity();
	
	return self.campfire:getObject() ~= nil and self.item ~= nil and
			self.character:getInventory():contains(self.item) and
			not self.campfire.isLit and 
			(currentHour >= 5 and currentHour <= 20) and
			clouds<0.25 and
			not RainManager.isRaining() and
			self.campfire.fuelAmt > 0
end

function ISLightFromGlass:waitToStart()
	self.character:faceThisObject(self.campfire:getObject())
	return self.character:shouldBeTurning()
end

function ISLightFromGlass:update()
	self.item:setJobDelta(self:getJobDelta());
	self.character:faceThisObject(self.campfire:getObject())
	local canlit = self:CanLit(self.campfire)
	if canlit then
	else
		ISLightFromGlass:stop()
	end
end

function ISLightFromGlass:CanLit(camp)
	local CanLit = false
	local currentHour = math.floor(math.floor(GameTime:getInstance():getTimeOfDay() * 3600) / 3600); --La hora del día
	local c = getClimateManager();
	local clouds = c:getCloudIntensity();
	if not camp.isLit and 
		(currentHour >= 5 and currentHour <= 20) and
		clouds<0.25 and
		not RainManager.isRaining() and
		camp.fuelAmt > 0 then
		CanLit = true;
	end
	return CanLit;
end

function ISLightFromGlass:start()
	self.item:setJobType(campingText.lightCampfire);
	self.item:setJobDelta(0.0);

end

function ISLightFromGlass:stop()
	ISBaseTimedAction.stop(self);
	if self.item then
		self.item:setJobDelta(0.0);
	end
end

function ISLightFromGlass:perform()
	if self.item then
		self.item:getContainer():setDrawDirty(true);
		self.item:setJobDelta(0.0);
	end
	local canlit = self:CanLit(self.campfire)
	if canlit then
		local cf = self.campfire
		local args = { x = cf.x, y = cf.y, z = cf.z }
		CCampfireSystem.instance:sendCommand(self.character, 'lightFire', args)
	end
    -- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function ISLightFromGlass:new(character, item, campfire, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
    o.item = item;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.campfire = campfire;
	-- if you are a outdoorsman (ranger) you can light the fire faster
	if character:HasTrait("Outdoorsman") then
		o.maxTime = time/2;
	else
		o.maxTime = time;
	end
	return o;
end
