--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

OnGrindCoffeeAction = ISBaseTimedAction:derive("OnGrindCoffeeAction");

function OnGrindCoffeeAction:isValid()
	return (self.character:getPrimaryHandItem() ~= nil and self.character:getPrimaryHandItem() == self.cempty)
end

function OnGrindCoffeeAction:waitToStart()
	self.character:faceLocation(self.square:getX(), self.square:getY())
	return self.character:shouldBeTurning()
end

function OnGrindCoffeeAction:update()
	self.seeds:setJobDelta(self:getJobDelta())
	self.cempty:setJobDelta(self:getJobDelta())
	self.character:faceLocation(self.square:getX(), self.square:getY())
    self.character:setMetabolicTarget(Metabolics.LightWork);
end

function OnGrindCoffeeAction:start()
	self.character:playSound("GrindCoffee");
	addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), 5, 10);
	self.seeds:setJobType(getText("ContextMenu_Chopping"))
	self.cempty:setJobType(getText("ContextMenu_Chopping"))
	self:setAnimVariable("FoodType", "bottle");
	self:setActionAnim("fill_container_tap");
	if self.cempty:getStaticModel() then
		self:setOverrideHandModels(nil, self.cempty:getStaticModel())
	else
		self:setOverrideHandModels(nil, nil)
	end
	self.seeds:setJobDelta(0.0)
	self.cempty:setJobDelta(0.0)
end

function OnGrindCoffeeAction:stop()
	self.seeds:setJobDelta(0.0)
	self.cempty:setJobDelta(0.0)
    ISBaseTimedAction.stop(self);
end

function OnGrindCoffeeAction:perform()
	self.seeds:setJobDelta(0.0);
	self.cempty:setJobDelta(0.0)
	
	--Eliminar las semillas del molino de café y actualizar el sprite
	if self.object:getContainer() and self.object:getContainer():getContentsWeight() > 0 then
		if self.object:getContainer():getItemFromType("ToastedCafeSeeds") then
			self.object:getContainer():clear();
			if self.object:getOverlaySprite() then
				ItemPicker.updateOverlaySprite(self.object);
			end
		end
	end
	-- borrar frasco vacío de cafe de las manos y del inventario
	self.character:getPrimaryHandItem():Use();
	self.character:setPrimaryHandItem(nil);
	-- agregar café con propiedades extras.
	local newitem = InventoryItemFactory.CreateItem("Base.Coffee2")
	newitem:setBaseHunger(newitem:getBaseHunger()*1.5);
	newitem:setHungChange(newitem:getBaseHunger());
	newitem:setFatigueChange(newitem:getFatigueChange()*1.5);
	self.character:getInventory():AddItem(newitem)
	-- equipar café nuevo en mano primaria
	self.character:setPrimaryHandItem(newitem);
	-- agregar 10 de exp en cocina por concluir la preparacion del cafe
	self.character:getXp():AddXP(Perks.Cooking, 10);
	
	ISBaseTimedAction.perform(self);
end

function OnGrindCoffeeAction:new(character, object, seeds, cempty)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.object = object;
	o.seeds = seeds;
	o.cempty = cempty;
    o.square = object:getSquare();
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 250;
	return o;
end
