require ("TimedActions/ISBaseTimedAction");

TMTrowAnimalAction = ISBaseTimedAction:derive("TMTrowAnimalAction");

function TMTrowAnimalAction:isValid()
	return true
end

function TMTrowAnimalAction:update()
    self.item:setJobDelta(self:getJobDelta());
	self.character:setMetabolicTarget(Metabolics.LightDomestic);
end

function TMTrowAnimalAction:start()
--    self.character:getEmitter():playSoundImpl("FishingLureBrowse", nil)
    self.item:setJobType(getText("ContextMenu_Trowing"));
    self.item:setJobDelta(0.0);
end


function TMTrowAnimalAction:stop()
	ISBaseTimedAction.stop(self);
	self.item:setJobDelta(0.0);
end

function TMTrowAnimalAction:perform()

    ISBaseTimedAction.perform(self);
	self.item:setJobDelta(0.0);

    self.character:getCurrentSquare():AddWorldInventoryItem(self.item, self.character:getX() - math.floor(self.character:getX()), self.character:getY() - math.floor(self.character:getY()), self.character:getZ() - math.floor(self.character:getZ())):getModData();
    self.character:getInventory():Remove(self.item);
	
end

function TMTrowAnimalAction:new(character, item, time)
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