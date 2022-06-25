----------------------------------------------------------------------------------
--
-- LGPracticeHuntingAction.lua
-- Parte del mod Le Gourmet Evolution.
-- Creado por Snake.
--
----------------------------------------------------------------------------------

require "TimedActions/ISBaseTimedAction"

LGPracticeHuntingAction = ISBaseTimedAction:derive("LGPracticeHuntingAction");

function LGPracticeHuntingAction:isValid()
	return true;
end

function LGPracticeHuntingAction:waitToStart()
	--self.character:faceThisObject(self.diana)
	self.character:faceLocation(self.diana:getX(), self.diana:getY());
	return self.character:shouldBeTurning() and self.character:getSecondaryHandItem() ~= nil and self.character:getSecondaryHandItem():getType() == "SmallStone"
end

function LGPracticeHuntingAction:update()
    self.character:faceLocation(self.diana:getX(), self.diana:getY())
	self.character:setMetabolicTarget(Metabolics.LightDomestic);
end


function LGPracticeHuntingAction:start()
	self.character:faceLocation(self.diana:getX(), self.diana:getY())
	self.character:playSound("shootslingshot");
	if self.character:getSecondaryHandItem() ~= nil and self.character:getSecondaryHandItem():getType() == "SmallStone" then
		self.character:getSecondaryHandItem():Use();
		self.character:setSecondaryHandItem(nil);
	end

    self.weapon = self.character:getPrimaryHandItem()
	if self.weapon ~= nil then
		self.weapon:setJobType(getText("ContextMenu_Hunting"));
		self.weapon:setJobDelta(0.0);
	end
end


function LGPracticeHuntingAction:stop()
    ISBaseTimedAction.stop(self);
end


function LGPracticeHuntingAction:perform()

	self.character:getStats():setEndurance(self.character:getStats():getEndurance() - 0.02)

	local _inventory = self.character:getInventory();

	if self.character:getPrimaryHandItem() ~= nil and (self.character:getPrimaryHandItem():getType() == "Slingshot" or self.character:getPrimaryHandItem():getType() == "Slingshot2") then
		local chancetobreak = 15;
		if self.character:getPrimaryHandItem():getType() == "Slingshot2" then
			chancetobreak = (chancetobreak + self.character:getPerkLevel(Perks.Woodwork)) * 2;
		--	chancetobreak = 0;
		else
			chancetobreak = chancetobreak
		end
		if ZombRand(chancetobreak) == 0 then
			local ItemName;
			if self.character:getPrimaryHandItem():getType() == "Slingshot2" then
				ItemName = "Base.SlingshotHandle"
			else
				ItemName = "Base.Twigs"
			end
			self.character:getPrimaryHandItem():Use();
			self.character:setPrimaryHandItem(nil);
			self.character:playSound("PoolcueBreak");
			_inventory:AddItem(ItemName);
		end
	end

	if self.capture ~= "nothing" then
		local totalpercent = 15;
		local variable = 0;
		local perklvl = self.character:getPerkLevel(Perks.Aiming);
		if perklvl > 0 then
			variable = perklvl * 4;
			totalpercent = totalpercent + variable;
		end
		if self.character:HasTrait("ShortSighted") then
			totalpercent = totalpercent - 10;
		elseif self.character:HasTrait("EagleEyed") then
			totalpercent = totalpercent + 10;
		end
		if not self.character:HasTrait("Desensitized") then
			local paniclvl = self.character:getStats():getPanic();
			if paniclvl > 0 then
				local panicvariable = 0;
				if paniclvl > 0 and paniclvl < 25 then
					panicvariable = 5;
				elseif paniclvl > 25 and paniclvl < 50 then
					panicvariable = 10;
				elseif paniclvl > 50 and paniclvl < 75 then
					panicvariable = 15;
				elseif paniclvl > 75 and paniclvl < 100 then
					panicvariable = 20;
				end
				totalpercent = totalpercent - panicvariable;
			end
		end
		if totalpercent <= 0 then
			totalpercent = 1;
		end
		if totalpercent >= 100 then
			totalpercent = 100;
		end
		local aiming = nil;
		local hunting = nil;
		local r = 255;
		local g = 0;
		local b = 0;
		local state = getText("Tooltip_HuntingMiss");
		if ZombRand(1, 101) <= totalpercent then
			self.character:playSound("hitslingshot");
			getSoundManager():PlayWorldSound("hitslingshot", self.diana, 0, 5, 1, true);
			state = getText("Tooltip_HuntingHit");
			aiming = 1;
			hunting = 1;
			r = 0;
			g = 255;
			self:doPlayerModData()
			self.diana:AddWorldInventoryItem("Base.SmallStone", self.diana:getX() - math.floor(self.diana:getX()), self.diana:getY() - math.floor(self.diana:getY()), self.diana:getZ() - math.floor(self.diana:getZ()));
		else
			if ZombRand(3) == 0 then
				getSoundManager():PlayWorldSound("BrokenBottle", self.diana, 0, 50, 20, false);
			else
				self.character:playSound("WoodenLanceSwing");
			end
		end

		if aiming ~= nil then
			aiming = self:AddAimingxp(perklvl, aiming);
			aiming = getText("IGUI_perks_Aiming").."+".. tonumber(string.format("%." .. (2 or 0) .. "f", aiming)) .. ", "
		else
			aiming = "";
		end
		if hunting ~= nil then
			hunting = self:AddHuntingxp(perklvl, hunting);
			hunting = getText("IGUI_perks_LGRHunting").."+".. tonumber(string.format("%." .. (2 or 0) .. "f", hunting)) .. "."
		else
			hunting = "";
		end
		self.character:setHaloNote(state .. aiming .. hunting, r,g,b,300);
	else
		--getSoundManager():PlayWorldSound("ChopTree", self.diana:getSquare(), 0, 5, 1, true);
	end
	ISBaseTimedAction.perform(self);
end

function LGPracticeHuntingAction:doPlayerModData()
	local pdata = self.character:getModData()
	local boost = self.character:getXp():getPerkBoost(Perks.LGRHunting);
	if pdata.Practice and pdata.Practice > 0 and boost < 3 then
		pdata.Practice = pdata.Practice -1;
	end
	if pdata.Practice == 0 and boost < 3 then
		self.character:getXp():setPerkBoost(Perks.LGRHunting, boost+1)
		boost = self.character:getXp():getPerkBoost(Perks.LGRHunting);
		if boost == 0 then
			pdata.Practice = 25;
		elseif boost == 1 then
			pdata.Practice = 50;
		elseif boost == 2 then
			pdata.Practice = 100;
		end
	end
end


function LGPracticeHuntingAction:AddAimingxp(perklvl, Exp)
	if perklvl < 10 then
		local oldXp = self.character:getXp():getXP(Perks.Aiming);
		self.character:getXp():AddXP(Perks.Aiming, Exp);
		local xp = self.character:getXp():getXP(Perks.Aiming) - oldXp;
		return xp;
	end
end

function LGPracticeHuntingAction:AddHuntingxp(perklvl, Exp)
	if perklvl < 10 then
		local oldXp = self.character:getXp():getXP(Perks.LGRHunting);
		self.character:getXp():AddXP(Perks.LGRHunting, Exp);
		local xp = self.character:getXp():getXP(Perks.LGRHunting) - oldXp;
		return xp;
	end
end

function LGPracticeHuntingAction:new(player, diana, time, capture)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = player;
	o.diana = diana;
	o.capture = capture;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time;
	return o
end
