require "TimedActions/ISBaseTimedAction"


ISBloodCure = ISBaseTimedAction:derive("ISBloodCure");              

function ISBloodCure:isValid()                        
	return self.character:getInventory():contains(self.item);
end

function ISBloodCure:update()                          
    self.item:setJobDelta(self:getJobDelta());
    if self.eatAudio ~= 0 and not self.character:getEmitter():isPlaying(self.eatAudio) then
        self.eatAudio = self.character:getEmitter():playSound(self.eatSound);
    end
end

function ISBloodCure:start()
    if self.eatSound ~= '' then
        self.eatAudio = self.character:getEmitter():playSound(self.eatSound);
    end
    self.item:setJobDelta(0.0);
    self:setActionAnim(CharacterActionAnims.Drink);
    self:setOverrideHandModels(nil, self.item);
    self.character:reportEvent("EventEating");
	
end

function ISBloodCure:stop()                             
    if self.eatAudio ~= 0 and self.character:getEmitter():isPlaying(self.eatAudio) then
        self.character:getEmitter():stopSound(self.eatAudio);
    end
	
    self.item:setJobDelta(0.0);
    if self.character:getInventory():contains(self.item) then
        self:drink(self.item, self:getJobDelta());
    end
    ISBaseTimedAction.stop(self);
end

function ISBloodCure:perform()                          
	if self.item then
		self.item:Use();
		for i = 0, self.character:getBodyDamage():getBodyParts():size()-1 do
			self.character:getBodyDamage():getBodyParts():get(i):SetInfected(false);
		end
		self.character:getBodyDamage():setInfectionLevel(0); 
		self.character:getBodyDamage():setInf(false);
		self.character:getBodyDamage():setInfectionTime(-1);
		self.character:getBodyDamage():setInfectionMortalityDuration(-1);
		self.character:getInventory():AddItem("Base.PZGlassFlask");  
	end
	ISBaseTimedAction.perform(self);
end

function ISBloodCure:new(character, item, time)     
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.stopOnWalk = false;
	o.stopOnRun = false;
	o.maxTime = time;
	o.timer = time / 5;
	o.tick = 0;
	return o;
end
