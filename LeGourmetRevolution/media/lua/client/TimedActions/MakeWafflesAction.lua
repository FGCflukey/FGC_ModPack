require ("TimedActions/ISBaseTimedAction");

MakeWafflesAction = ISBaseTimedAction:derive("MakeWafflesAction");

function MakeWafflesAction:isValid()
	return ((self.character:getPrimaryHandItem() ~= nil and self.character:getPrimaryHandItem():getType() == "WafflesPrep") or (self.character:getSecondaryHandItem() ~= nil and self.character:getSecondaryHandItem():getType() == "WafflesPrep"));
end

function MakeWafflesAction:update()
    self.item:setJobDelta(self:getJobDelta());
	self.character:setMetabolicTarget(Metabolics.UsingTools);
end

function MakeWafflesAction:start()
    self.item:setJobType(getText("ContextMenu_Cooking"));
    self.item:setJobDelta(0.0);
    self.character:getEmitter():playSoundImpl("waffles", nil);
end


function MakeWafflesAction:stop()

	ISBaseTimedAction.stop(self);
	self.item:setJobDelta(0.0);
end

function MakeWafflesAction:perform()

    self.item:setJobDelta(0.0);

	local pl = self.character;
    self.machine = pl:getPrimaryHandItem();
    self.primary = false;
    if self.machine ~= nil and self.machine:getType() == "WafflesPrep" then
        self.primary = true;
    end
	if self.primary then
        pl:getPrimaryHandItem():Use();
        pl:setPrimaryHandItem(nil);
	elseif not self.primary then
        pl:getSecondaryHandItem():Use();
        pl:setSecondaryHandItem(nil);
	end

	local perklvl = pl:getPerkLevel(Perks.Cooking);
	local inv = pl:getInventory();
    inv:AddItem("Base.HandmadeWaffles");

	if perklvl < 10 then
		pl:getXp():AddXP(Perks.Cooking, 3);
	end
	ISBaseTimedAction.perform(self);
end

function MakeWafflesAction:new(character, item, time)
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