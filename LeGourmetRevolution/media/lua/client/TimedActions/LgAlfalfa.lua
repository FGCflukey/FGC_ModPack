----------------------------------------------------------------------------------
--
-- LGAlfalfaAction.lua
-- Parte del mod Advanced Fishing.
-- Creado por Snake.
--
--
-- El codigo base se encuentra en ISShovelAction.lua y ISShovelGround.lua,
-- los cuales han sido creados por Robert Johnson.
--
----------------------------------------------------------------------------------

require "TimedActions/ISBaseTimedAction"

LGAlfalfaAction = ISBaseTimedAction:derive("LGAlfalfaAction");


function LGAlfalfaAction:isValid()
	return self.character ~= nil and self.object:getModData().havealfalfa >= 1;
--    return self.character:getStats():getEndurance() < 1;
end


function LGAlfalfaAction:update()
    self.character:faceLocation(self.alfalfa:getX(), self.alfalfa:getY())
    if self.item then
	    self.item:setJobDelta(self:getJobDelta());
    end
	
	self.character:setMetabolicTarget(Metabolics.UsingTools);
end


function LGAlfalfaAction:start()
    if self.item then
        self.item:setJobType(getText("ContextMenu_TakeAlfalfa"));
        self.item:setJobDelta(0.0);
    end
    self.sound = getSoundManager():PlayWorldSound("Shoveling", self.alfalfa:getSquare(), 0, 10, 1, true);
	self:setActionAnim(ISFarmingMenu.getShovelAnim(self.item))
	if self.item then
		self:setOverrideHandModels(self.item:getStaticModel(), nil)
	end
end


function LGAlfalfaAction:stop()
    if self.sound and self.sound:isPlaying() then
        self.sound:stop();
    end
    ISBaseTimedAction.stop(self);
    if self.item then
        self.item:setJobDelta(0.0);
    end
end


function LGAlfalfaAction:perform()
    if self.sound and self.sound:isPlaying() then
        self.sound:stop();
    end
	if self.item then
        self.item:getContainer():setDrawDirty(true);
        self.item:setJobDelta(0.0);	
	end
	-- Agregar la fatiga al jugador
--    self.character:getStats():setFatigue(self.character:getStats():getFatigue() + 0.05)
	self.character:getStats():setEndurance(self.character:getStats():getEndurance() - 0.004)
    -- Agregar la lombriz roja al inventario del jugador
	local _inventory = self.character:getInventory();

--	local player = getPlayer()
	_inventory:AddItem("Base.Alfalfa");

	local objectData = self.object:getModData();
	if objectData.havealfalfa and objectData.havealfalfa > 0 then
        objectData.havealfalfa = objectData.havealfalfa - 1;
	else
	end
    self.object:transmitModData();
	
	if self.character:getPrimaryHandItem() ~= nil and self.character:getPrimaryHandItem():getType() == "GardenFork" then
	    self.trident = self.character:getPrimaryHandItem();
		if ZombRand(self.trident:getConditionLowerChance() + self.character:getMaintenanceMod() * 2) == 0 then
		    self.trident:setCondition(self.trident:getCondition() - 1);
            ISWorldObjectContextMenu.checkWeapon(self.character);
		else
			self.character:getXp():AddXP(Perks.Maintenance, 1);
		end
	end
	if objectData.havealfalfa == 0 then
	    luautils.okModal(getText("UI_objectremaining0"), true);
	    self.object:getSquare():transmitRemoveItemFromSquare(self.object)
	    self.object:getSquare():RemoveTileObject(self.object)
	end
	ISBaseTimedAction.perform(self);
end


function LGAlfalfaAction:new(player, alfalfa, time, object, item)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = player;
	o.alfalfa = alfalfa;
	o.object = object;
	o.item = item;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time;
	return o
end
