require "TimedActions/ISBaseTimedAction"

ISRebuildEngine = ISBaseTimedAction:derive("ISRebuildEngine")

function ISRebuildEngine:isValid()
--	return self.vehicle:isInArea(self.part:getArea(), self.character)
	return true;
end

function ISRebuildEngine:waitToStart()
	self.character:faceThisObject(self.vehicle)
	return self.character:shouldBeTurning()
end

function ISRebuildEngine:update()
	self.character:faceThisObject(self.vehicle)
	self.item:setJobDelta(self:getJobDelta())

    self.character:setMetabolicTarget(Metabolics.MediumWork);
end

function ISRebuildEngine:start()
	self.item:setJobType(getText("IGUI_EER_RebuildEngine"))
	self:setActionAnim("VehicleWorkOnMid")
end

function ISRebuildEngine:stop()
	self.item:setJobDelta(0)
	ISBaseTimedAction.stop(self)
end

function ISRebuildEngine:perform()
	ISBaseTimedAction.perform(self)
	self.item:setJobDelta(0)

	local engineRepairLevel = self.vehicle:getScript():getEngineRepairLevel();

	local skill = self.character:getPerkLevel(Perks.Mechanics) - engineRepairLevel;
	local numberOfParts = self.character:getInventory():getNumberOfItem("EngineParts", false, true);
	
	-- Set how many Spare Engine Parts are required to rebuild the engine on this vehicle. Equal to 5 * the Mechanics skill level required 
	--   to work on the engine.
	local requiredEngineParts = engineRepairLevel * 5;
	
	--this sends the request to the server to rebuild the engine.
	sendClientCommand(self.character, "RebuildEngine", "RepairEngine", { vehicle = self.part:getVehicle():getId(), part = self.part:getId() });
	
	--these two lines are fake!  it only effects the local version of the car to update the mechanics UI
	self.part:getVehicle():setEngineFeature( 100, self.part:getVehicle():getEngineLoudness(), self.part:getVehicle():getEnginePower())
	self.part:setCondition( 100)
	
	local inventory = self.character:getInventory();
	
	for i=1,requiredEngineParts do
		inventory:RemoveOneOf("EngineParts");
	end

	self.character:getXp():AddXP(Perks.Mechanics, 50);
end

function ISRebuildEngine:new(character, part, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character
	o.vehicle = part:getVehicle()
	o.part = part
	o.item = item
	o.maxTime = time
	o.jobType = getText("IGUI_EER_RebuildEngine")
	return o
end