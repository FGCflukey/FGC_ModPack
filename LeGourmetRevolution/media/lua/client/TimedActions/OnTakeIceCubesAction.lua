require ("TimedActions/ISBaseTimedAction");

OnTakeIceCubesAction = ISBaseTimedAction:derive("OnTakeIceCubesAction");

function OnTakeIceCubesAction:isValid()
	if self.item:getType() == "WaterCubebox" and self.item:isFrozen() and self.item:getFreezingTime() >= 80 then
		return true
	else return end
end

function OnTakeIceCubesAction:update()
    self.item:setJobDelta(self:getJobDelta());
end

function OnTakeIceCubesAction:start()
    self.item:setJobType(getText("ContextMenu_TakeIceCubes"));
    self.item:setJobDelta(0.0);
end


function OnTakeIceCubesAction:stop()

	ISBaseTimedAction.stop(self);
	self.item:setJobDelta(0.0);
end

function OnTakeIceCubesAction:perform()

    self.item:setJobDelta(0.0);

	if self.item:getType() == "WaterCubebox" then
		if self.item:isFrozen() and self.item:getFreezingTime() > 80 then
			if self.item:isTaintedWater() then
				for i = 1, 15 do
					local item2 = InventoryItemFactory.CreateItem("legourmet.IceCubes");
					item2:setTaintedWater(true)
					self.character:getInventory():AddItem(item2)
				end			
			else
				self.character:getInventory():AddItems("legourmet.IceCubes", 15)
			end
			self.item:Use();
		end
	end
	ISBaseTimedAction.perform(self);
end

function OnTakeIceCubesAction:new(character, item, time)
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