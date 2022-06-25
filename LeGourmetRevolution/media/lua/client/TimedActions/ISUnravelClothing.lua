--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISUnravelClothing = ISBaseTimedAction:derive("ISUnravelClothing");

function ISUnravelClothing:isValid()
	return (self.character:getPrimaryHandItem() ~= nil and self.character:getPrimaryHandItem() == self.scissor) and (self.character:getSecondaryHandItem() ~= nil and self.character:getSecondaryHandItem() == self.item);
end

function ISUnravelClothing:update()
	self.item:setJobDelta(self:getJobDelta());
	self.character:setMetabolicTarget(Metabolics.HeavyDomestic);
end

function ISUnravelClothing:start()
	self:setActionAnim("RipSheets");
	if self.scissor and self.scissor ~= nil then
		self:setOverrideHandModels(self.scissor, nil);
	end
	self.character:playSound("ClothesRipping");
	self.item:setJobType(getText("ContextMenu_UnravelClothing"));
	self.item:setJobDelta(0.0);
end

function ISUnravelClothing:stop()
	self.item:setJobDelta(0.0);
    ISBaseTimedAction.stop(self);
end

function ISUnravelClothing:perform()
	self.item:setJobDelta(0.0);
	if self.character:getSecondaryHandItem() == self.item then
		self.character:setSecondaryHandItem(nil)
	end
	self.character:getInventory():Remove(self.item);
	local condition = 100* self.item:getCondition() / self.item:getConditionMax();
	local Tailorlvl = self.character:getPerkLevel(Perks.Tailoring);
	if Tailorlvl < 1 then Tailorlvl = 1;end
	local Calq1 = math.ceil(tonumber(self.materials[2])*tonumber(condition)/100);
	if Calq1 > tonumber(self.materials[2]) then Calq1 = tonumber(self.materials[2]); end
	if Calq1 < 1 then Calq1 = 1; end
	local Calq2 =  math.ceil(Calq1 * Tailorlvl /10);
	if Calq2 > tonumber(self.materials[2]) then Calq2 = tonumber(self.materials[2]); end
	if Calq2 < 1 then Calq2 = 1; end
	if self.character:HasTrait("Tailor") then Calq2 = tonumber(self.materials[2]); end
	for i=1, Calq2 do
		local itemtogive = InventoryItemFactory.CreateItem(self.materials[1]);
		--if instanceof(self.item, "Clothing") then
		self.character:getInventory():AddItem(itemtogive);
		--end
		
	end
	self.character:getXp():AddXP(Perks.Tailoring, 1*Tailorlvl);
    -- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function ISUnravelClothing:new(character, item, scissor, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.scissor = scissor;
	o.recipe = ClothingUnravelDefinitions[item:getType()];
	o.materials = luautils.split(o.recipe.materials, ":");
	o.maxTime = tonumber(o.materials[2]) * 20;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time;
	return o;
end
