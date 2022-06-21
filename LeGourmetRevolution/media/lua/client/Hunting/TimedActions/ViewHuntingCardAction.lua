require ("TimedActions/ISBaseTimedAction");

ViewHuntingCardAction = ISBaseTimedAction:derive("ViewHuntingCardAction");

function ViewHuntingCardAction:isValid()
	return ((self.character:getPrimaryHandItem() ~= nil and self.character:getPrimaryHandItem():getType() == (self.item:getType())) or (self.character:getSecondaryHandItem() ~= nil and self.character:getSecondaryHandItem():getType() == (self.item:getType())));
end

function ViewHuntingCardAction:update()
    self.item:setJobDelta(self:getJobDelta());
end

function ViewHuntingCardAction:start()
	self.item:setJobType(getText("ContextMenu_Reading"));
    self.item:setJobDelta(0.0);
	self:setAnimVariable("ReadType", "book")
	self:setActionAnim(CharacterActionAnims.Read);
	self:setOverrideHandModels(nil, self.item);
	self.character:setReading(true)
--    self.character:getEmitter():playSoundImpl("FishingLureBrowse", nil);
end


function ViewHuntingCardAction:stop()

	ISBaseTimedAction.stop(self);
	self.character:setReading(false);
	self.item:setJobDelta(0.0);
end

function ViewHuntingCardAction:perform()
	self.character:setReading(false);
    self.item:setJobDelta(0.0);
	local img = nil;

    self.prim = self.character:getPrimaryHandItem();
	self.sec = self.character:getSecondaryHandItem();
	
	-- Determinacion del perk de la revista segun el objeto clickeado
    if self.prim ~= nil and self.prim:getType() == (self.item:getType()) or self.sec ~= nil and self.sec:getType() == (self.item:getType()) then
		if self.item:getType() == "HuntingCard1" then
			img = "IGUI_HuntingCard_Rats";
		elseif self.item:getType() == "HuntingCard2" then
			img = "IGUI_HuntingCard_Mouses";
		elseif self.item:getType() == "HuntingCard3" then
			img = "IGUI_HuntingCard_Birds";
		elseif self.item:getType() == "HuntingCard4" then
			img = "IGUI_HuntingCard_Squirrels";
		elseif self.item:getType() == "HuntingCard5" then
			img = "IGUI_HuntingCard_Rabbits";
		elseif self.item:getType() == "HuntingCard6" then
			img = "IGUI_HuntingCard_WildPigs";
		elseif self.item:getType() == "HuntingCard7" then
			img = "IGUI_HuntingCard_Cow";
		elseif self.item:getType() == "HuntingCard8" then
			img = "IGUI_HuntingCard_Chicken";
		elseif self.item:getType() == "HuntingCard9" then
			img = "IGUI_HuntingCard_Bear";
		elseif self.item:getType() == "HuntingCard10" then
			img = "IGUI_HuntingCard_Crow";
		end
    end

	if img ~= nil then
		luautils.okRichModal(getText(img), true, 500, 425);
	end
	
	ISBaseTimedAction.perform(self);
end

function ViewHuntingCardAction:new(character, item, time)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o.character = character;
	o.item = item;
	o.stopOnWalk = false;
	o.stopOnRun = true;
	o.maxTime = 100;

	-- calculos de tiempo segun el rasgo
	if character:HasTrait("FastReader") then
		o.maxTime = o.maxTime * 0.5
	end
	if character:HasTrait("SlowReader") then
		o.maxTime = o.maxTime * 1.5
	end

	o.variable = ZombRand(3,11);
	return o;
end