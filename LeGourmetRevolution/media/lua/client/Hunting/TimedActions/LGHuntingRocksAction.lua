----------------------------------------------------------------------------------
--
-- LGHuntingRocksAction.lua
-- Parte del mod Le Gourmet Evolution.
-- Creado por Snake.
--
----------------------------------------------------------------------------------

require "TimedActions/ISBaseTimedAction"

LGHuntingRocksAction = ISBaseTimedAction:derive("LGHuntingRocksAction");

function LGHuntingRocksAction:isValid()
	return true;
end

function LGHuntingRocksAction:waitToStart()
	self.character:faceThisObject(self.htree)
	return self.character:shouldBeTurning() and self.character:getSecondaryHandItem() ~= nil and self.character:getSecondaryHandItem():getType() == "SmallStone"
end

function LGHuntingRocksAction:update()
    self.character:faceLocation(self.htree:getX(), self.htree:getY())
	self.character:setMetabolicTarget(Metabolics.LightDomestic);
end


function LGHuntingRocksAction:start()
	self.character:faceLocation(self.htree:getX(), self.htree:getY())
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


function LGHuntingRocksAction:stop()
    ISBaseTimedAction.stop(self);
end


function LGHuntingRocksAction:perform()

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




	--if LGHuntingRocksAction.shooted == 1 then
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

			if ZombRand(1, 101) <= totalpercent then
				self.character:playSound("hitslingshot");
				local AnimalSize = 0;
				local AnimalWeigthChange = 1;
				local data = LGHuntingRocksMenu.getcapturetable(self.capture);
				local datatable = LGHT.Slingshot[data];
				if datatable.sound ~= nil then
					getSoundManager():PlayWorldSound(datatable.sound, self.htree:getSquare(), 0, 10, 1, true);
				end
				if datatable.minsize ~= nil and datatable.maxsize ~= nil then
					AnimalSize = ZombRand(datatable.minsize, datatable.maxsize);
				end
				if datatable.weigthchange ~= nil then
					AnimalWeigthChange = datatable.weigthchange;
				end

				if self.capture == "Base.Bag_DuffelBag" then
					local luck1 = self:getLuck();
					local luck2 = self:getLuck();
					local luck3 = self:getLuck() + ZombRand(1,11);
					local recipes = self.character:getKnownRecipes();
					local spawnzombie = false;
					if ZombRand(1, 101) <= luck1 then
						local item1 = "None";
						if ZombRand(1, 101) <= luck2 then
							item1 = "Base.Rope";
						else 
							item1 = "Base.SheetRope";
						end
						if item1 ~= "None" then
							self.htree:getSquare():AddWorldInventoryItem(item1, self.htree:getX() - math.floor(self.htree:getX()), self.htree:getY() - math.floor(self.htree:getY()), self.htree:getZ() - math.floor(self.htree:getZ()));
						end
						if SnakeClothingMod and not recipes:contains("DitoBag") then
							--No ZombieSpawn
							self.character:playSound("MaleZombieHurt");
						else
							--spawnHorde(self.htree:getX(), self.htree:getY(), self.htree:getX(), self.htree:getY(), self.htree:getZ(), 1);
							spawnzombie = true;
							if not self.character:HasTrait("Desensitized") then
								local panicvar = 15;
								if self.character:HasTrait("Brave") then
									panicvar = 5;
								elseif self.character:HasTrait("Cowardly") then
									panicvar = 25;
								end
								self.character:getStats():setPanic(self.character:getStats():getPanic() + panicvar);
							end
						end
					end
					if SnakeClothingMod and not recipes:contains("DitoBag") then
						recipes:add("DitoBag");
						self.character:playSound("EasterEggDito");
						if WPARepairSilencerMenu then
							local bag = self.htree:getSquare():AddWorldInventoryItem("Base.AlicePackDito", self.htree:getX() - math.floor(self.htree:getX()), self.htree:getY() - math.floor(self.htree:getY()), self.htree:getZ() - math.floor(self.htree:getZ()));
							local paper = InventoryItemFactory.CreateItem("Base.SheetPaper2")
							paper:setName(getText("UI_DitoPaper"));
							bag:getItemContainer():AddItem(paper);
							if AMBaseGameCharacterDetails then
								bag:getItemContainer():AddItem("AmmoMaker.ShotgunShellsCan");
							else
								bag:getItemContainer():AddItems("Base.ShotgunShellsBox", 5);
							end
							bag:getItemContainer():AddItem("Base.Screwdriver");
							bag:getItemContainer():AddItem("Base.Shotgun");
							bag:getItemContainer():AddItem("WPA.TacticalLaserLight2");
							bag:getItemContainer():AddItem("WPA.Silencer5");
							bag:getItemContainer():AddItem("WPA.SRTPS");
							bag:getItemContainer():AddItem("WPA.ShellHolderStock");
							bag:getItemContainer():AddItem("WPA.RecoilPad2");
						else
							self.htree:getSquare():AddWorldInventoryItem("Base.AlicePackDito", self.htree:getX() - math.floor(self.htree:getX()), self.htree:getY() - math.floor(self.htree:getY()), self.htree:getZ() - math.floor(self.htree:getZ()));
						end
						local finaltext = getText("UI_DiscoverEasterEggDito");
						luautils.okRichModal(finaltext, true, 320, 500);
					else
						if ZombRand(1, 101) <= luck3 then
							local bag = self.htree:getSquare():AddWorldInventoryItem(self.capture, self.htree:getX() - math.floor(self.htree:getX()), self.htree:getY() - math.floor(self.htree:getY()), self.htree:getZ() - math.floor(self.htree:getZ()));
							local bagtype = ZombRand(1, 7);
							local subtype = "NoMods";
							local bagname = "";
							local outfit = "";
							if bagtype == 1 then
								bagname = "WeaponBag";
								outfit = {"AirCrew", "ArmyCamoDesert", "ArmyCamoGreen", "Bandit", "Ghillie", "InmateEscaped", "InmateKhaki", "PoliceRiot", "Police", "PoliceState", "PrivateMilitia"};
								if AMBaseGameCharacterDetails then
									subtype = "AmmoMaker";
								else
									subtype  = "NoMods";
								end
							elseif bagtype == 2 then
								bagname = "FoodBag";
								outfit = {"Chef", "Cook_Generic", "Cook_IceCream", "Cook_Spiffos"};
							elseif bagtype == 3 then
								bagname = "ToolBag";
								outfit = {"McCoys", "Mechanic", "MetalWorker", "Foreman", "ConstructionWorker"};
							elseif bagtype == 4 then
								bagname = "TrapperBag";
								outfit = {"Camper", "Hunter"};
							elseif bagtype == 5 then
								bagname = "MedicBag";
								outfit = {"Doctor", "Nurse"};
							elseif bagtype == 6 then
								bagname = "LeGourmetBag";
								outfit = {"Chef"};
							end
							local items = LGHTZItems[bagname][subtype];
							local rolls = 1;
							if SandboxVars.WeaponLoot == 1 then -- very poor
								rolls = ZombRand(1,5);
							elseif SandboxVars.WeaponLoot == 2 then -- poor
								rolls = ZombRand(1,6);
							elseif SandboxVars.WeaponLoot == 3 then -- normal
								rolls = ZombRand(1,7);
							elseif SandboxVars.WeaponLoot == 4 then -- abundant
								rolls = ZombRand(2,8);
							elseif SandboxVars.WeaponLoot == 5 then -- very abundant
								rolls = ZombRand(3,9);
							end
							for i = 0, rolls do
								bag:getItemContainer():AddItem(items[ZombRand(1, #items +1)]);
							end
							--if ZombRand(2) == 0 then
							local ofit = outfit[ZombRand(1, #outfit+1)];
							if isClient() then
								--local ofit = outfit[ZombRand(1, #outfit+1)];
								--self.character:Say(tostring(ofit))
								SendCommandToServer(string.format("/createhorde2 -x %d -y %d -z %d -count %d -radius %d -outfit %s", self.htree:getX(), self.htree:getY(), self.htree:getZ(), 1, 1, ofit or ""))
							else
								--self.character:Say(tostring(ofit))
								local maleOutfits = getAllOutfits(false);
								local femaleOutfits = getAllOutfits(true);
								local femaleChance = nil;
								if maleOutfits:contains(ofit) and not femaleOutfits:contains(ofit) then
									femaleChance = 0;
								end
								if femaleOutfits:contains(ofit) and not maleOutfits:contains(ofit) then
									femaleChance = 100;
								end
								addZombiesInOutfit(self.htree:getX(), self.htree:getY(), self.htree:getZ(), 1, ofit, femaleChance);
							end
							--end
						else
							if spawnzombie then
								spawnHorde(self.htree:getX(), self.htree:getY(), self.htree:getX(), self.htree:getY(), self.htree:getZ(), 1);
							end
						end
					end
				else
					local Animalgived = nil;
					if self.capture == "Base.BeeNest" or self.capture == "Base.BirdNest" then
						self.htree:getSquare():AddWorldInventoryItem(self.capture, self.htree:getX() - math.floor(self.htree:getX()), self.htree:getY() - math.floor(self.htree:getY()), self.htree:getZ() - math.floor(self.htree:getZ()));
					else
						Animalgived = InventoryItemFactory.CreateItem(self.capture);
						Animalgived:setBaseHunger(- AnimalSize / 100);
						Animalgived:setHungChange(- AnimalSize / 100);
						Animalgived:setActualWeight(AnimalSize / AnimalWeigthChange);
						Animalgived:setCustomWeight(true);
						self.htree:getSquare():AddWorldInventoryItem(Animalgived, self.htree:getX() - math.floor(self.htree:getX()), self.htree:getY() - math.floor(self.htree:getY()), self.htree:getZ() - math.floor(self.htree:getZ()));
					end
				end
				local zone = self:getScavengeZone();
				local scavengeZoneNumber = ZombRand(5,15) + self.scavengeZoneIncrease;
				local actualzone = ISScavengeAction.getScavengingZone(self.htree:getX(), self.htree:getY());
				if not zone then -- register the new zone
					zone = getWorld():registerZone(scavengeZoneNumber .. "", "PlantScavenge",self.htree:getX() - 20, self.htree:getY() - 20, 0, 40, 40);
					zone:setLastActionTimestamp(getGametimeTimestamp());
	--				if zone then
	--					zone = self:getScavengeZone();
						local plantLeft = tonumber(zone:getName());
						local totalnumber = plantLeft - 3;
						if totalnumber <= 0 then
							zone:setName(0 .. "");
						else
							zone:setName(totalnumber .. "");
						end
						--zone:setLastActionTimestamp(getGametimeTimestamp());
						--if plantLeft <= "0" then
						--	zone:setName(0 .. "");
						--end
	--				end
				else
					local plantLeft = tonumber(zone:getName());
					zone:setName(plantLeft - 3 .. "");
					zone:setLastActionTimestamp(getGametimeTimestamp());
					if actualzone:getName() <= "0" then
						zone:setName(0 .. "");
					end
				end
				if isClient() then zone:sendToServer() end
				--self:AddScavengexp(3);
				self:AddAimingxp(perklvl, (perklvl +1) * ZombRand(5,11));
				self:AddHuntingxp(perklvl, (perklvl +1) * ZombRand(5,11));
			else
				--self.character:playSound("PZ_ChopTree", true);
				getSoundManager():PlayWorldSound("ChopTree", self.htree:getSquare(), 0, 5, 1, true);
				--self:AddScavengexp(1);
				self:AddAimingxp(perklvl, 1);
				self:AddHuntingxp(perklvl, 1);
			end
		else
			--self.character:playSound("PZ_ChopTree", true);
			getSoundManager():PlayWorldSound("ChopTree", self.htree:getSquare(), 0, 5, 1, true);
		end
	--else
	--end
	ISBaseTimedAction.perform(self);
end

function LGHuntingRocksAction:AddAimingxp(perklvl, Exp)
	if perklvl < 10 then
		local oldXp = self.character:getXp():getXP(Perks.Aiming);
		self.character:getXp():AddXP(Perks.Aiming, Exp);
		local xp = self.character:getXp():getXP(Perks.Aiming) - oldXp;
		self.character:setHaloNote(getText("IGUI_perks_Aiming").."+"..tonumber(string.format("%." .. (2 or 0) .. "f", xp)), 0,255,0,300);
	end
end

function LGHuntingRocksAction:AddHuntingxp(perklvl, Exp)
	if perklvl < 10 then
		local oldXp = self.character:getXp():getXP(Perks.LGRHunting);
		self.character:getXp():AddXP(Perks.LGRHunting, Exp);
		local xp = self.character:getXp():getXP(Perks.LGRHunting) - oldXp;
		self.character:setHaloNote(getText("IGUI_perks_LGRHunting").."+"..tonumber(string.format("%." .. (2 or 0) .. "f", xp)), 0,255,0,300);
	end
end

function LGHuntingRocksAction:AddScavengexp(xpn)
	if self.character:getPerkLevel(Perks.PlantScavenging) < 10 then
		local oldXp = self.character:getXp():getXP(Perks.PlantScavenging);
		self.character:getXp():AddXP(Perks.PlantScavenging, xpn);
		local xp = self.character:getXp():getXP(Perks.PlantScavenging) - oldXp;
		self.character:setHaloNote(getText("IGUI_perks_Foraging").."+"..tonumber(string.format("%." .. (2 or 0) .. "f", xp)), 0,255,0,300);
	end
end

function LGHuntingRocksAction:getLuck()
	local basepercent = 30;
	if self.character:HasTrait("Lucky") then
		basepercent = basepercent + ZombRand(1,26);
	elseif self.character:HasTrait("Unlucky") then
		basepercent = basepercent - ZombRand(1,26);
	end
	return basepercent;
end

function LGHuntingRocksAction:getScavengeZone()
    local zones = getWorld():getMetaGrid():getZonesAt(self.htree:getX(), self.htree:getY(), 0);
    if zones then
        for i=0,zones:size()-1 do
            if zones:get(i):getType() == "PlantScavenge" then
                return zones:get(i);
            end
        end
    end
end

function LGHuntingRocksAction:new(player, htree, time, capture)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = player;
	o.htree = htree;
	o.capture = capture;
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
