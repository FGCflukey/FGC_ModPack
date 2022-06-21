--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

OnMincerMeatAction = ISBaseTimedAction:derive("OnMincerMeatAction");

function OnMincerMeatAction:isValid()
	return (self.character:getPrimaryHandItem() ~= nil and self.character:getPrimaryHandItem() == self.item)
end

function OnMincerMeatAction:waitToStart()
	self.character:faceLocation(self.square:getX(), self.square:getY())
	return self.character:shouldBeTurning()
end

function OnMincerMeatAction:update()
	self.item:setJobDelta(self:getJobDelta())
	self.character:faceLocation(self.square:getX(), self.square:getY())
    self.character:setMetabolicTarget(Metabolics.LightWork);
end

function OnMincerMeatAction:start()
	local sound = "mmincer"
	if self.object:getSprite():getProperties():Val("CustomName") == "Electric Meat Grinder" then
		sound = "emincer"
	end
	self.character:playSound(sound);
	addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), 10, 20);
	self.item:setJobType(getText("ContextMenu_Chopping"))
	self:setAnimVariable("FoodType", "bottle");
	self:setActionAnim("fill_container_tap");
	if self.item:getStaticModel() then
		self:setOverrideHandModels(nil, self.item:getStaticModel())
	else
		self:setOverrideHandModels(nil, nil)
	end
	self.item:setJobDelta(0.0)
end

function OnMincerMeatAction:stop()
	self.item:setJobDelta(0.0)
    ISBaseTimedAction.stop(self);
end

function OnMincerMeatAction:perform()
	self.item:setJobDelta(0.0)
	local number = 1;
	local itemtoadd = nil;
	local itm = nil;
	if self.item:getType() == "Steak" then
		itm = "Base.MincedMeat";
		--number = 1;
	elseif self.item:getType() == "PorkChop" then
		itm = "Base.Choppedporkmeat";
		--number = 1;
	end
	if itm ~= nil then
		local meat = self.character:getPrimaryHandItem();
		itemtoadd = InventoryItemFactory.CreateItem(itm)
		itemtoadd:setBaseHunger(meat:getHungChange() * 0.8);
		itemtoadd:setHungChange(meat:getHungChange() * 0.8);
		itemtoadd:setThirstChange(meat:getThirstChange() * 0.8);
		itemtoadd:setUnhappyChange(meat:getUnhappyChange());
		itemtoadd:setBoredomChange(meat:getBoredomChange());
		itemtoadd:setCarbohydrates(meat:getCarbohydrates() * 0.8);
		itemtoadd:setLipids(meat:getLipids() * 0.8);
		itemtoadd:setProteins(meat:getProteins() * 0.8);
		itemtoadd:setCalories(meat:getCalories() * 0.8);
		itemtoadd:setActualWeight(meat:getActualWeight() * 0.8)
		itemtoadd:setWeight(meat:getActualWeight());
		itemtoadd:setCustomWeight(true)
		itemtoadd:setCooked(meat:isCooked());
		itemtoadd:setAge(meat:getAge());
		itemtoadd:setBurnt(meat:isBurnt());
		self.character:getPrimaryHandItem():Use();
		self.character:setPrimaryHandItem(nil);
		local itemAdded = self.character:getInventory():AddItem(itemtoadd);
		if self.object:getSprite():getProperties():Val("CustomName") == "Meat Grinder" then
			self.character:getXp():AddXP(Perks.Strength, 5);
		end
		self.character:getXp():AddXP(Perks.Cooking, 2);
		self:addOrDropItem(itemAdded);
	end
    -- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function OnMincerMeatAction:addOrDropItem(itemtoadd)
	local inv = self.character:getInventory()
	if not inv:contains(itemtoadd) then
		inv:AddItem(itemtoadd)
	end
	if inv:getCapacityWeight() > inv:getEffectiveCapacity(self.character) then
		if inv:contains(itemtoadd) then
			inv:Remove(itemtoadd)
		end
		self.character:getCurrentSquare():AddWorldInventoryItem(itemtoadd,
		self.character:getX() - math.floor(self.character:getX()),
		self.character:getY() - math.floor(self.character:getY()),
		self.character:getZ() - math.floor(self.character:getZ()))
	end
end

function OnMincerMeatAction:new(character, object, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.object = object;
	o.item = item;
    o.square = object:getSquare();
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time;
	return o;
end
