require "TimedActions/ISBaseTimedAction"

UGTakePropane = ISBaseTimedAction:derive("UGTakePropane")

function UGTakePropane.isValid()

	--print( "keyword: UGTakePropane:isValid() called")
	return true
end

function UGTakePropane:waitToStart()

	self.character:faceLocation( self.pump:getSquare():getX(), self.pump:getSquare():getY())
	return self.character:shouldBeTurning()
end

function UGTakePropane:update()

	self.tank:setJobDelta(self:getJobDelta())
	self.character:faceLocation(self.pump:getX(), self.pump:getY())
	local actionCurrent = math.floor(self.itemStart + (self.itemTarget - self.itemStart) * self:getJobDelta() + 0.001)
	local itemCurrent = math.floor(self.tank:getUsedDelta() / self.tank:getUseDelta() + 0.001)
	if actionCurrent > itemCurrent then

		self.tank:setUsedDelta(actionCurrent * self.tank:getUseDelta())
    end

    self.character:setMetabolicTarget(Metabolics.LightWork);	
end

function UGTakePropane:start()
	
	print( "keyword: UGTakePropane:start() called")
	if self.istorch then
		self:setOverrideHandModels(nil, "BlowTorch")
	else
		self:setOverrideHandModels(nil, "PropaneTank")	
	end
	self:setActionAnim("TakeGasFromPump")
	self.tank:setJobType(getText("ContextMenu_TakePropaneFromPump"))
	self.tank:setJobDelta(0.0)

	local itemCurrent = math.floor(self.tank:getUsedDelta() / self.tank:getUseDelta() + 0.001)
	local itemMax = math.floor(1 / self.tank:getUseDelta() + 0.001)
	local take = (itemMax - itemCurrent)
	
	self.action:setTime(take * self.duration)
	self.itemStart = itemCurrent
	self.itemTarget = itemCurrent + take
end

function UGTakePropane:stop()

	--print( "keyword: UGTakePropane:stop() called")
	self.tank:setJobDelta(0.0)
    ISBaseTimedAction.stop(self);
end

function UGTakePropane:perform()

	--print( "keyword: UGTakePropane:perform() called")
	self.tank:setJobDelta(0.0)
	local itemCurrent = math.floor(self.tank:getUsedDelta() / self.tank:getUseDelta() + 0.001)
	if self.itemTarget > itemCurrent then
		self.tank:setUsedDelta(self.itemTarget * self.tank:getUseDelta())
	end	
	
	ISBaseTimedAction.perform( self)
end

function UGTakePropane:new( pump, tank, player, time, duration, istorch)

	--print( "keyword: UGTakePropane:new() called")
	local o = {}
	setmetatable( o, self)
	self.__index = self
	o.maxTime = time
	o.duration = duration
	o.character = player
	o.tank = tank
	o.pump = pump
	o.stopOnWalk = true
	o.stopOnRun = true
	o.istorch = istorch
	
	return o
end