require ("TimedActions/ISBaseTimedAction");

PourJarAction = ISBaseTimedAction:derive("PourJarAction");

function PourJarAction:isValid()
	if self.item:getType() == "WaterCubebox" then
		return true
	else
		return ((self.character:getPrimaryHandItem() ~= nil and self.character:getPrimaryHandItem():getType() == (self.item:getType())) or (self.character:getSecondaryHandItem() ~= nil and self.character:getSecondaryHandItem():getType() == (self.item:getType())));
	end
end

function PourJarAction:update()
    self.item:setJobDelta(self:getJobDelta());
end

function PourJarAction:start()
    self.item:setJobType(getText("ContextMenu_Pour_on_Ground"));
    self.item:setJobDelta(0.0);
end


function PourJarAction:stop()

	ISBaseTimedAction.stop(self);
	self.item:setJobDelta(0.0);
end

function PourJarAction:perform()

    self.item:setJobDelta(0.0);

    local player = getPlayer()
	if self.item:getType() ~= "WaterCubebox" then
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
	else
		local wcube = self.character:getInventory():getItemFromType(self.item:getType());
		wcube:Use();
	end
	ISBaseTimedAction.perform(self);
end

function PourJarAction:new(character, item, time)
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