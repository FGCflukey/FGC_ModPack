----------------------------------------------------------------------------------
--
-- WTalkAction.lua
-- Parte del mod Advanced Fishing.
-- Creado por Snake.
--
--
----------------------------------------------------------------------------------

require "TimedActions/ISBaseTimedAction"

WTalkAction = ISBaseTimedAction:derive("WTalkAction");
WTalkAction.delay = 0;
WTalkAction.options = {}
WTalkAction.actual = 1;
function WTalkAction:isValid()
	return self.character ~= nil and (self.character:getBodyDamage():getBoredomLevel() > 25 or self.character:getBodyDamage():getUnhappynessLevel() > 25)

end


function WTalkAction:update()
    self.character:faceLocation(self.wilson:getX(), self.wilson:getY())
	WTalkAction.delay = WTalkAction.delay -1;
	if WTalkAction.delay == 0 then
		self:Converse();
	end
	if self.character:getBodyDamage():getBoredomLevel() > 0 then
		self.character:getBodyDamage():setBoredomLevel(self.character:getBodyDamage():getBoredomLevel() - 0.01)
	end
	if self.character:getBodyDamage():getUnhappynessLevel() > 0 then
		self.character:getBodyDamage():setUnhappynessLevel(self.character:getBodyDamage():getUnhappynessLevel() - 0.02)
	end
	self.character:setMetabolicTarget(Metabolics.SeatedResting);
end

function WTalkAction:Converse()
	self.character:Say(getText("Tooltip_" .. WTalkAction.options[WTalkAction.actual]));
	if WTalkAction.actual == #WTalkAction.options then
		self:forceStop();
	end
	if WTalkAction.options[WTalkAction.actual] == "Hardday3" then
		if self.character:getStats():getFatigue() < 0.9 then
			local fatigue = self.character:getStats():getFatigue() + 0.15;
			if fatigue > 1 then
				fatigue = 1;
			end
			self.character:getStats():setFatigue(fatigue)
		end
	end
	if WTalkAction.options[WTalkAction.actual] == "What" then
		if not self.character:HasTrait("Desensitized") then
			self.character:getStats():setPanic(self.character:getStats():getPanic() + 30);
			self.character:playSound("ZombieSurprisedPlayer");
		end
	end
	if WTalkAction.options[WTalkAction.actual] == "AskSomething2" or WTalkAction.options[WTalkAction.actual] == "AskSomething3" or WTalkAction.options[WTalkAction.actual] == "Angry" then
		self.character:getStats():setAnger(self.character:getStats():getAnger() + 0.15);
		self.character:playSound("ZombieSurprisedPlayer");
	end
	if WTalkAction.options[WTalkAction.actual] == ("OkayW") then
		self.character:getStats():setAnger(self.character:getStats():getAnger() - 0.15);
	end
	if WTalkAction.actual < #WTalkAction.options then
		WTalkAction.actual = WTalkAction.actual + 1;
	end	
	WTalkAction.delay = ZombRand(125,200);
end

function WTalkAction:Conversation(selection)
	if selection == 0 then
		WTalkAction.options = {"HelloW", "HowAreYouW", "Hardday", "Hardday2", "Hardday3", "Hardday4", "What", "Hey" }
	elseif selection == 1 then
		WTalkAction.options = {"HelloW", "AskSomething", "AskSomething2", "AskSomething3", "OkayW", "Hardday", "ByeW"}
	elseif selection == 2 then
		WTalkAction.options = {"HelloW", "Bored", "Hardday3", "AskSomething4", "AskSomething5", "OkayW2", "WanttoSurvive", "Hardday", "LaterW"}
	elseif selection == 3 then
		WTalkAction.options = {"HelloW", "Angry", "OkayW", "Hey", "WanttoSurvive", "LaterW"}
	end
end

function WTalkAction:start()
	self:setActionAnim("Loot");
	self:setOverrideHandModels(nil, nil);
	local selection = ZombRand(4);
	self:Conversation(selection)

	self.character:Say(getText("Tooltip_" .. WTalkAction.options[1]));
	WTalkAction.delay = 200;
	WTalkAction.actual = 2;
end


function WTalkAction:stop()
    ISBaseTimedAction.stop(self);
end


function WTalkAction:perform()
	--self.character:getStats():setEndurance(self.character:getStats():getEndurance() - 0.004)
	ISBaseTimedAction.perform(self);
end


function WTalkAction:new(player, wilson, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = player;
	o.wilson = wilson;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time;
	return o
end
