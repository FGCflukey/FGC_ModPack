require ("TimedActions/ISBaseTimedAction");

OpenLGFLBAction = ISBaseTimedAction:derive("OpenLGFLBAction");

function OpenLGFLBAction:isValid()
	return ((self.character:getPrimaryHandItem() ~= nil and self.character:getPrimaryHandItem():getType() == self.item:getType()) or (self.character:getSecondaryHandItem() ~= nil and self.character:getSecondaryHandItem():getType() == self.item:getType()));
end

function OpenLGFLBAction:update()
    self.item:setJobDelta(self:getJobDelta());
end

function OpenLGFLBAction:start()
    self.item:setJobType(getText("ContextMenu_OpenLGFLB"));
    self.item:setJobDelta(0.0);
	self:setActionAnim(CharacterActionAnims.Craft);
end


function OpenLGFLBAction:stop()
	ISBaseTimedAction.stop(self);
	self.item:setJobDelta(0.0);
end

function OpenLGFLBAction:perform()

    ISBaseTimedAction.perform(self);
	self.item:setJobDelta(0.0);

	local items = {"AdvancedFishing.FishingLead1", "AdvancedFishing.FishingLead2", "AdvancedFishing.FishingLead3"};
	local iRandom = ZombRand(11);
	if self.character:HasTrait("Lucky") then
	    iRandom = iRandom + ZombRand(3);
    elseif self.character:HasTrait("Unlucky") then
        iRandom = iRandom - ZombRand(3);
		if iRandom < 0 then
			iRandom = 0;
		end
    end
	if iRandom < 6 then
		self.character:Say(getText("IGUI_PlayerText_lurebox2"))
	else
		for i = 1, iRandom do
			self.character:getInventory():AddItem(items[ZombRand(1, #items +1)])
		end
	end
	
    self.prim = self.character:getPrimaryHandItem();
	self.sec = self.character:getSecondaryHandItem();
    self.flbox = nil;
    if self.prim ~= nil and (self.prim:getType() == self.item:getType()) then
        self.flbox = true;
	elseif self.sec ~= nil and (self.sec:getType() == self.item:getType()) then
		self.flbox = false;
    end
	if self.flbox ~= nil then
		if self.flbox then
			self.character:getPrimaryHandItem():Use();
			self.character:setPrimaryHandItem(nil);
		elseif not self.flbox then
			self.character:getSecondaryHandItem():Use();
			self.character:setSecondaryHandItem(nil);
		end
	end
end

function OpenLGFLBAction:new(character, item, time)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o.character = character;
	o.item = item;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time;
	return o;
end