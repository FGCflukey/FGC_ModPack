require ("TimedActions/ISBaseTimedAction");

LGOpenGuideAction = ISBaseTimedAction:derive("LGOpenGuideAction");

function LGOpenGuideAction:isValid()
	return ((self.character:getPrimaryHandItem() ~= nil and self.character:getPrimaryHandItem():getType() == (self.item:getType())) or (self.character:getSecondaryHandItem() ~= nil and self.character:getSecondaryHandItem():getType() == (self.item:getType())));
end

function LGOpenGuideAction:update()
    self.item:setJobDelta(self:getJobDelta());
end

function LGOpenGuideAction:start()
    self.character:getEmitter():playSoundImpl("pageflip", nil)
    self.item:setJobType(getText("ContextMenu_OpeningGuide"));
    self.item:setJobDelta(0.0);

    self:setAnimVariable("ReadType", "book");
    self:setActionAnim(CharacterActionAnims.Read);
    self:setOverrideHandModels(nil, self.item);
    self.character:setReading(true)
end


function LGOpenGuideAction:stop()
	ISBaseTimedAction.stop(self);
	self.character:setReading(false);
	self.item:setJobDelta(0.0);
end

function LGOpenGuideAction:perform()
	self.character:setReading(false);
    ISBaseTimedAction.perform(self);
	self.item:setJobDelta(0.0);
	LGSurvivalGuideManager.onKeyPressed();
end

function LGOpenGuideAction:new(character, item, time)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o.character = character;
	o.item = item;
	o.text = text;
	o.stopOnWalk = false;
	o.stopOnRun = true;
	o.maxTime = 250;
	if character:HasTrait("FastReader") then
		o.maxTime = o.maxTime - 50
	end
	if character:HasTrait("SlowReader") then
		o.maxTime = o.maxTime + 150
	end
	if time then
        o.maxTime = time;
    end
	return o;
end