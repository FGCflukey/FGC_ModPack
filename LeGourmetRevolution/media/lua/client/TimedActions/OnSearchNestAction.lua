require ("TimedActions/ISBaseTimedAction");

OnSearchNestAction = ISBaseTimedAction:derive("OnSearchNestAction");

function OnSearchNestAction:isValid()
	return ((self.character:getPrimaryHandItem() ~= nil and self.character:getPrimaryHandItem():getType() == (self.item:getType())) or (self.character:getSecondaryHandItem() ~= nil and self.character:getSecondaryHandItem():getType() == (self.item:getType())));
end

function OnSearchNestAction:update()
    self.item:setJobDelta(self:getJobDelta());
end

function OnSearchNestAction:start()
    self.item:setJobType(getText("ContextMenu_SearchOnNest"));
    self.item:setJobDelta(0.0);
	self:setActionAnim("Forage");
    self:setOverrideHandModels(nil, nil)
end


function OnSearchNestAction:stop()

	ISBaseTimedAction.stop(self);
	self.item:setJobDelta(0.0);
end

function OnSearchNestAction:perform()

    self.item:setJobDelta(0.0);

    local player = getPlayer()

    self.i1 = self.character:getPrimaryHandItem();
    self.primary = false;
    if self.i1 ~= nil and self.i1:getType() == (self.item:getType()) then
        self.primary = true;
    end
	if self.primary then
        self.character:getPrimaryHandItem():Use();
        self.character:setPrimaryHandItem(nil);
	elseif not self.primary then
        self.character:getSecondaryHandItem():Use();
        self.character:setSecondaryHandItem(nil);
	end
	local ItemGived = self.item;
	if ZombRand(2) == 0 then
		ItemGived = "Base.WildEggs"
	else
		ItemGived = "Base.Egg"
	end
	local quantity = ZombRand(1,4);
	if quantity > 1 then
		self.character:getInventory():AddItems(ItemGived, quantity);
	else
		self.character:getInventory():AddItem(ItemGived);
	end
	ISBaseTimedAction.perform(self);
end

function OnSearchNestAction:new(character, item, time)
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