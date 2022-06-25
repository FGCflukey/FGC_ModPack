----------------------------------------------------------------------------------
--
-- LGHuntingScopeAction.lua
-- Parte del mod Le Gourmet Evolution.
-- Creado por Snake.
--
----------------------------------------------------------------------------------

require "TimedActions/ISBaseTimedAction"
require "ISBaseObject"
require "Reloading/ISReloadUtil"

LGHuntingScopeAction = ISBaseTimedAction:derive("LGHuntingScopeAction");

LGHuntingScopeAction.swingTimer = 0;
LGHuntingScopeAction.shooted = 0;

function LGHuntingScopeAction:isValid()
	return true;
end


function LGHuntingScopeAction:update()
	--LGHuntingScopeAction.swingTimer = LGHuntingScopeAction.swingTimer - 1;
    --if LGHuntingScopeAction.swingTimer == 0 then
        --self.character:PlayAnim("Idle");
--		self.character:playSound(reloadable.clickSound, true);
--		self.character:getEmitter():playSound("brokeCR", false);
--		addSound(self.object, self.object:getX(), self.object:getY(), self.object:getZ(), 20, 10);
    --end
	self.character:setMetabolicTarget(Metabolics.LightDomestic);
end


function LGHuntingScopeAction:start()
	--setActionAnim("customAiming")
	self:setActionAnim("customAiming")
	local Primary = self.character:getPrimaryHandItem();
    self.character:faceLocation(self.htree2:getX(), self.htree2:getY())
    Primary:setJobType(getText("ContextMenu_Hunting"));
    Primary:setJobDelta(0.0);
	if Primary and instanceof(Primary, "HandWeapon") and getCore():isNewReloading() then
		if ISReloadWeaponAction.canShoot(Primary) then
			if Primary:getCondition() > 0 then 
				if Primary:getType() == "VarmintRifle" or Primary:getType() == "HuntingRifle" then
					local sound = nil;
					local SoundMod = nil;
					local RadiusMod = nil;
					if Primary:getType() == "VarmintRifle" then
						sound = "FirearmVarmintShot";
						SoundMod = 200 * 0.05;
						RadiusMod = 150 * 0.1;
					else
						sound = "FirearmHunterShot";
						SoundMod = 20 * 0.1;
						RadiusMod = 150 * 0.1;
					end
					if Primary:getCanon() ~= nil then
						local Canon = Primary:getCanon();
						if Canon:getType() == "Silencer3" or Canon:getType() == "Silencer6" then
							self.character:playSound('WPARSilencedShot');						
							addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), RadiusMod, SoundMod);
						else
							self.character:playSound(Primary:getSwingSound());
							addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), Primary:getSoundRadius(), Primary:getSoundVolume());
						end
					else
						self.character:playSound(Primary:getSwingSound());
						addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), Primary:getSoundRadius(), Primary:getSoundVolume());
					end
				end
			end
			--ISReloadWeaponAction.OnPlayerAttackFinished(self.character, Primary)
			--ISReloadWeaponAction:CheckAmmoCases(self.character, nil, Primary);
			self.character:DoAttack(0);
			--ISReloadWeaponAction.onShoot(self.character, Primary);
			LGHuntingScopeAction.shooted = 1;
		else
			self.character:playSound("StormyShotgunClick");
			self.character:DoAttack(0);
			self.character:setRangedWeaponEmpty(true);
			LGHuntingScopeAction.shooted = 0;
		end
	end
    --self.character:SetAnimFrame(0, false);
    --self.character:getSpriteDef():setFrameSpeedPerFrame(0.1);
	--LGHuntingScopeAction.swingTimer = 15;
	if ZombRand(Primary:getConditionLowerChance()) == 0 then
		Primary:setCondition(Primary:getCondition() - 1)
		ISWorldObjectContextMenu.checkWeapon(self.character);
	end
	if LGHuntingScopeAction.shooted == 1 then
		if self.capture2 ~= "nothing" then
			local totalpercent = 10;
			local variable = 0;
			local perklvl = self.character:getPerkLevel(Perks.Aiming);
			local huntperklvl = self.character:getPerkLevel(Perks.LGRHunting);
			if perklvl > 0 then
				variable = perklvl * 4;
				totalpercent = totalpercent + variable;
			end
			if self.character:HasTrait("ShortSighted") then
				totalpercent = totalpercent - 10;
			elseif self.character:HasTrait("EagleEyed") then
				totalpercent = totalpercent + 10;
			end

			if (instanceof(Primary, "HandWeapon") and Primary:getCondition() > 0) then 
				if Primary:getType() == "VarmintRifle" or Primary:getType() == "HuntingRifle" then
					if Primary:getScope() ~= nil then
						local Scope = Primary:getScope();
						if Scope:getType() == "x4Scope" then
							totalpercent = totalpercent + 5;
						elseif Scope:getType() == "x8Scope" then
							totalpercent = totalpercent + 10;
						elseif Scope:getType() == "x20Scope" then
							totalpercent = totalpercent + 12;
						elseif Scope:getType() == "x40Scope" then
							totalpercent = totalpercent + 14;
						elseif Scope:getType() == "StealthTacticalScope" then
							totalpercent = totalpercent + 16;
						elseif Scope:getType() == "StealthTacticalScope2" then
							totalpercent = totalpercent + 20;
						end
					end
				end
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
			if ZombRand(1, 101) <= totalpercent then
				local Escape = nil;
				local luck = ZombRand(0,11)
				local hit = 25 + (3.75 * perklvl) + (3.75 * huntperklvl);
				if self.character:HasTrait("Lucky") then
					hit = hit + luck;
				elseif self.character:HasTrait("Unlucky") then
					hit = hit - luck;
				end
				if hit >= 90 then
					hit = 90;
				elseif hit < 0 then
					hit = 5;
				end
				if self.character:HasTrait("HunterExpert") then
					hit = 100;
				end
				if ZombRand(101) > hit then
					Escape = true;
				end
				local AnimalSVolume = 0;
				local AnimalSRadius = 0;
				local AnimalSize = 50;
				local AnimalWeigthChange = 1;
				local AnimalXP = 1;
				getSoundManager():PlayWorldSound("HeadSmash", self.htree2:getSquare(), 0, 5, 1, false);
				if self.capture2 == "Base.DeadDeer" then
					getSoundManager():PlayWorldSound("deaddeer", self.htree2:getSquare(), 0, 100, 20, false);
					AnimalSVolume = 20;
					AnimalSRadius = 50;
					self.character:playSound("deaddeer");
					AnimalSize = ZombRand(45,81);
					AnimalWeigthChange = 1.1;
					if LGHuntingRocksMenu.DeerCaller.t > 0 then
						LGHuntingRocksMenu.DeerCaller.t = 0
						LGHuntingRocksMenu.DeerCaller.v = 1
					end
				elseif self.capture2 == "Base.DeadBear" then
					getSoundManager():PlayWorldSound("deadbear", self.htree2:getSquare(), 0, 150, 100, true);
					AnimalSVolume = 50;
					AnimalSRadius = 100;
					AnimalSize = ZombRand(40,66);
					AnimalWeigthChange = 2.2;
					self.character:playSound("deadbear");
				elseif self.capture2 == "Base.DeadPork" then
					getSoundManager():PlayWorldSound("deadboar", self.htree2:getSquare(), 0, 150, 100, true);
					AnimalSVolume = 50;
					AnimalSRadius = 100;
					AnimalSize = ZombRand(50,96);
					AnimalWeigthChange = 1.1;
					self.character:playSound("deadboar");
				elseif self.capture2 == "Base.DeadCow" then
					getSoundManager():PlayWorldSound("deadcow", self.htree2:getSquare(), 0, 150, 100, true);
					AnimalSVolume = 50;
					AnimalSRadius = 100;
					AnimalSize = ZombRand(65,126);
					AnimalWeigthChange = 1.8;
					self.character:playSound("deadcow");
				elseif self.capture2 == "Base.DeadBison" then
					getSoundManager():PlayWorldSound("deadbison", self.htree2:getSquare(), 0, 150, 100, true);
					AnimalSVolume = 50;
					AnimalSRadius = 100;
					AnimalSize = ZombRand(75,135);
					AnimalWeigthChange = 1.8;
					self.character:playSound("deadbison");
				elseif self.capture2 == "Base.DeadMoose" then
					getSoundManager():PlayWorldSound("deadmoose", self.htree2:getSquare(), 0, 150, 100, true);
					AnimalSVolume = 50;
					AnimalSRadius = 100;
					AnimalSize = ZombRand(40,70);
					AnimalWeigthChange = 2.2;
					self.character:playSound("deadmoose");
				elseif self.capture2 == "Base.DeadSheep" then
					getSoundManager():PlayWorldSound("deadsheep", self.htree2:getSquare(), 0, 150, 100, true);
					AnimalSVolume = 50;
					AnimalSRadius = 80;
					AnimalSize = ZombRand(40,70);
					AnimalWeigthChange = 1.2;
					self.character:playSound("deadsheep");
				end
				
				local zone = self:getScavengeZone();
				local scavengeZoneNumber = ZombRand(5,15) + self.scavengeZoneIncrease;
				local actualzone = ISScavengeAction.getScavengingZone(self.htree2:getX(), self.htree2:getY());
				if Escape ~= nil then
					self.character:Say(getText("Tooltip_AnimalHurt"))
					self:AddHuntingxp(3);
					if self.character:getPerkLevel(Perks.Aiming) < 10 then
						local oldXp = self.character:getXp():getXP(Perks.Aiming);
						self.character:getXp():AddXP(Perks.Aiming, (perklvl +1) * ZombRand(5,11));
						local xp = self.character:getXp():getXP(Perks.Aiming) - oldXp;
						self.character:setHaloNote(getText("IGUI_perks_Aiming").."+"..tonumber(string.format("%." .. (2 or 0) .. "f", xp)), 0,255,0,300);
					end
				else
					local Animalgived = InventoryItemFactory.CreateItem(self.capture2);
					Animalgived:setBaseHunger(- AnimalSize / 100);
					Animalgived:setHungChange(- AnimalSize / 100);
					Animalgived:setActualWeight(AnimalSize * AnimalWeigthChange);
					Animalgived:setCustomWeight(true);
					addSound(self.htree2, self.htree2:getX(), self.htree2:getY(), self.htree2:getZ(), AnimalSRadius, AnimalSVolume);
					self.htree2:getSquare():AddWorldInventoryItem(Animalgived, self.htree2:getX() - math.floor(self.htree2:getX()), self.htree2:getY() - math.floor(self.htree2:getY()), self.htree2:getZ() - math.floor(self.htree2:getZ()));
					AnimalXP = math.floor(AnimalSize/5);
					if AnimalXP < 4 then
						AnimalXP = 4;
					end
					self:AddHuntingxp(AnimalXP);
					if self.character:getPerkLevel(Perks.Aiming) < 10 then
						local oldXp = self.character:getXp():getXP(Perks.Aiming);
						self.character:getXp():AddXP(Perks.Aiming, (perklvl +1) * ZombRand(5,11));
						local xp = self.character:getXp():getXP(Perks.Aiming) - oldXp;
						self.character:setHaloNote(getText("IGUI_perks_Aiming").."+"..tonumber(string.format("%." .. (2 or 0) .. "f", xp)), 0,255,0,300);
					end
				end
				if not zone then -- register the new zone
					zone = getWorld():registerZone(scavengeZoneNumber .. "", "PlantScavenge",self.htree2:getX() - 20, self.htree2:getY() - 20, 0, 40, 40);
					zone:setLastActionTimestamp(getGametimeTimestamp());
					local plantLeft = tonumber(zone:getName());
					local totalnumber = plantLeft - 3;
					if totalnumber <= 0 then
						zone:setName(0 .. "");
					else
						zone:setName(totalnumber .. "");
					end
				else
					local plantLeft = tonumber(zone:getName());
					zone:setName(plantLeft - 5 .. "");
					zone:setLastActionTimestamp(getGametimeTimestamp());
					if actualzone:getName() <= "0" then
						zone:setName(0 .. "");
					end
				end
				if isClient() then zone:sendToServer() end
			else
				local saying = ZombRand(3);
				if saying == 0 then
					self.character:Say(getText("Tooltip_AnimalGone"));
				elseif saying == 1 then
					self.character:Say(getText("Tooltip_AnimalGone2"));
				else
					self.character:Say(getText("Tooltip_AnimalGone3"));
				end
				self:AddHuntingxp(3);
				if self.character:getPerkLevel(Perks.Aiming) < 10 then
					local oldXp = self.character:getXp():getXP(Perks.Aiming);
					self.character:getXp():AddXP(Perks.Aiming, 1);
					local xp = self.character:getXp():getXP(Perks.Aiming) - oldXp;
					self.character:setHaloNote(getText("IGUI_perks_Aiming").."+"..tonumber(string.format("%." .. (2 or 0) .. "f", xp)), 0,255,0,300);
				end
			end
		else
		end
	else
	end
end

function LGHuntingScopeAction:AddHuntingxp(xpn)
	if self.character:getPerkLevel(Perks.LGRHunting) < 10 then
		local oldXp = self.character:getXp():getXP(Perks.LGRHunting);
		self.character:getXp():AddXP(Perks.LGRHunting, xpn);
		local xp = self.character:getXp():getXP(Perks.LGRHunting) - oldXp;
		self.character:setHaloNote(getText("IGUI_perks_LGRHunting").."+"..tonumber(string.format("%." .. (2 or 0) .. "f", xp)), 0,255,0,300);
	end
end

function LGHuntingScopeAction:stop()
    ISBaseTimedAction.stop(self);
end


function LGHuntingScopeAction:perform()
	--self.character:PlayAnim("Idle");
	ISBaseTimedAction.perform(self);
end

function LGHuntingScopeAction:getScavengeZone()
    local zones = getWorld():getMetaGrid():getZonesAt(self.htree2:getX(), self.htree2:getY(), 0);
    if zones then
        for i=0,zones:size()-1 do
            if zones:get(i):getType() == "PlantScavenge" then
                return zones:get(i);
            end
        end
    end
end


function LGHuntingScopeAction:new(player, htree2, time, capture2)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = player;
	o.htree2 = htree2;
	o.capture2 = capture2;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time;

    -- sandbox settings
    o.scavengeZoneIncrease = 0;
    if SandboxVars.NatureAbundance == 1 then -- very poor
        o.scavengeZoneIncrease = -5;
    elseif SandboxVars.NatureAbundance == 2 then -- poor
        o.scavengeZoneIncrease = -2;
    elseif SandboxVars.NatureAbundance == 4 then -- abundant
        o.scavengeZoneIncrease = 2;
    elseif SandboxVars.NatureAbundance == 5 then -- very abundant
        o.scavengeZoneIncrease = 5;
    end
	return o
end
