--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISReloadWeaponAction = ISBaseTimedAction:derive("ISReloadWeaponAction");

function ISReloadWeaponAction:isValid()
	return self.character:getPrimaryHandItem() == self.gun
end

function ISReloadWeaponAction:update()
	local remaining = self.ammoCount - (self.gun:getCurrentAmmoCount() - self.ammoCountStart)
	self.gun:setJobDelta((self.gun:getCurrentAmmoCount() - self.ammoCountStart) / self.ammoCount)
end

ISReloadWeaponAction.canRack = function(weapon)
	if not weapon:getMagazineType() and not weapon:getAmmoType() then
		return false
	end
	if weapon:isJammed() then
		return true
	end
	if weapon:haveChamber() and weapon:isRoundChambered() then
		return true
	end
	if weapon:haveChamber() and weapon:isSpentRoundChambered() then
		return true
	end
	if weapon:haveChamber() and not weapon:isRoundChambered() and weapon:getMagazineType() and weapon:getCurrentAmmoCount() > 0 then
		return true
	end
	if not weapon:haveChamber() and weapon:getCurrentAmmoCount() > 0 then
		return true
	end
	if not weapon:haveChamber() and weapon:getSpentRoundCount() > 0 then
		return true
	end
	if not weapon:getMagazineType() and weapon:getCurrentAmmoCount() >= weapon:getAmmoPerShoot() then
		return true;
	end
	return false;
end

function ISReloadWeaponAction:start()
	-- Setup IsPerformingAction & the current anim we want (check in AnimSets LoadHandgun.xml for example)
	self:setOverrideHandModels(self.gun, nil);
	self:setAnimVariable("WeaponReloadType", self.gun:getWeaponReloadType())
	self:setAnimVariable("isLoading", true);
	self.ammoCountStart = self.gun:getCurrentAmmoCount()
	self.gun:setJobType(getText("IGUI_JobType_LoadBulletsIntoFirearm"))
	self.gun:setJobDelta(0.0)
	self:initVars();
	self:setActionAnim(CharacterActionAnims.Reload);
	
	self.character:reportEvent("EventReloading");

	self:ejectSpentRounds()

	-- no bullets were found
	if not self.bullets then
		self:forceStop();
	end
end

-- This is used by other timed actions.
function ISReloadWeaponAction.setReloadSpeed(character, rack)
	local baseReloadSpeed = 1;
	if rack then
		-- reloading skill has less impact on racking, panic does nothing
		baseReloadSpeed = baseReloadSpeed + (character:getPerkLevel(Perks.Reloading) * 0.03);
	else
		baseReloadSpeed = baseReloadSpeed + (character:getPerkLevel(Perks.Reloading) * 0.07);
		baseReloadSpeed = baseReloadSpeed - (character:getMoodles():getMoodleLevel(MoodleType.Panic) * 0.05);
	end
	
	-- check for ammo straps
	local gun = character:getPrimaryHandItem();
	local strap = character:getWornItem("AmmoStrap");
	local reloadFast = character:hasEquippedTag("ReloadFastShells") or character:hasEquippedTag("ReloadFastBullets")
	local strapFound = false;
	if gun and (reloadFast or (strap and strap:getClothingItem())) then
		local shell = false;
		if gun:getAmmoType() == "Base.ShotgunShells" then
			shell = true;
		end
		if shell and (character:hasEquippedTag("ReloadFastShells") or strap:getClothingItemName() == "AmmoStrap_Shells") then
			strapFound = true;
		elseif not shell and (character:hasEquippedTag("ReloadFastBullets") or strap:getClothingItemName() == "AmmoStrap_Bullets") then
			strapFound = true;
		end
	end
	if strapFound then
		baseReloadSpeed = baseReloadSpeed * 1.15;
	end
	-- vehicles driver take bit longer to reload their weapon
	if character:getVehicle() and character:getVehicle():getDriver() == character then
		baseReloadSpeed = baseReloadSpeed * 0.8;
	end
	-- Mod Content
	if gun and (gun:getType() == "556Clip" or gun:getType() == "AKMMag") then
		local extraReloadSpeed = ISReloadWeaponAction:addModSpeedTrait(character);
		baseReloadSpeed = baseReloadSpeed * extraReloadSpeed;
	end
	if gun and instanceof(gun, "HandWeapon") then
		if gun:getMagazineType() ~= nil then
			local MagName = tostring(gun:getMagazineType());
			if MagName == "Base.556Clip" or MagName == "AmmoMaker.AKMMag" then
				local extraReloadSpeed = ISReloadWeaponAction:addModSpeedTrait(character);
				baseReloadSpeed = baseReloadSpeed * extraReloadSpeed;
			end
		end
	end
	--
	character:setVariable("ReloadSpeed", baseReloadSpeed * GameTime.getAnimSpeedFix());
end

-- Add some vars we gonna use, either magazine or the bullets
-- also decide the reload speed
function ISReloadWeaponAction:initVars()
	ISReloadWeaponAction.setReloadSpeed(self.character, false)
	-- Get the best magazine (the one with the most bullets)
	local ammoType = self.gun:getAmmoType()
	if ammoType then
		local ammoCount = self.character:getInventory():getItemCountRecurse(ammoType)
		ammoCount = math.min(ammoCount, self.gun:getMaxAmmo() - self.gun:getCurrentAmmoCount())
		local bullets = self.character:getInventory():getSomeType(self.gun:getAmmoType(), ammoCount);
		if bullets and not bullets:isEmpty() then
			self.bullets = bullets;
			self.ammoCount = ammoCount;
		end
	end
end

function ISReloadWeaponAction:stop()
	if self.gun:getInsertAmmoStopSound() then
		self.character:playSound(self.gun:getInsertAmmoStopSound());
	end
	self.gun:setJobDelta(0.0)
	-- this should already be cleared from event, but who knows right?
	self.character:clearVariable("isLoading");
	self.character:clearVariable("WeaponReloadType")
	ISBaseTimedAction.stop(self);
end

function ISReloadWeaponAction:perform()
	if self.gun:getInsertAmmoStopSound() then
		self.character:playSound(self.gun:getInsertAmmoStopSound());
	end
	self.gun:setJobDelta(0.0)
	self.character:clearVariable("isLoading");
	self.character:clearVariable("WeaponReloadType")
	ISBaseTimedAction.perform(self);
end

-- Our AnimSet trigger various event, we hook them here. Check LoadHandgun.xml for example.
function ISReloadWeaponAction:animEvent(event, parameter)
	-- Loading clip is done, we're moving to racking if needed
	if event == 'loadFinished' then
		self:loadAmmo();
		local chance = 3;
		local xp = 1;
		if self.character:getPerkLevel(Perks.Reloading) < 5 then
			chance = 1;
			xp = 4;
		end
		if ZombRand(chance) == 0 then
			self.character:getXp():AddXP(Perks.Reloading, xp);
		end
	end
	if event == 'playReloadSound' then
		if parameter == 'load' then
			if self.gun:getInsertAmmoSound() and self.gun:getCurrentAmmoCount() < self.gun:getMaxAmmo() then
				self.character:playSound(self.gun:getInsertAmmoSound());
			end
		elseif parameter == 'insertAmmoStart' then
			if not self.playedInsertAmmoStartSound and self.gun:getInsertAmmoStartSound() then
				self.playedInsertAmmoStartSound = true;
				self.character:playSound(self.gun:getInsertAmmoStartSound());
			end
		end
	end
	if event == 'changeWeaponSprite' then
		if parameter and parameter ~= '' then
			if parameter ~= 'original' then
				self:setOverrideHandModels(parameter, nil)
			else
				self:setOverrideHandModels(self.gun, nil)
			end
		end
	end
end

function ISReloadWeaponAction:loadAmmo()
	-- we insert a new clip only if we're in the motion of loading
	if self.bullets then -- insert bullets one by one
		if not self.bullets:isEmpty() and self.gun:getCurrentAmmoCount() < self.gun:getMaxAmmo() then
			local bullet = self.bullets:get(0);
			self.bullets:remove(bullet);
			self.character:getInventory():Remove(bullet);
			self.gun:setCurrentAmmoCount(self.gun:getCurrentAmmoCount() + 1);
			--- Contenido del mod --
			self.character:getXp():AddXP(Perks.Reloading, 1);
			------------------------
		end
		-- fully loaded or no more bullet, we rack
		if self.bullets:isEmpty() or self.gun:getCurrentAmmoCount() >= self.gun:getMaxAmmo() then
			self.character:clearVariable("isLoading");
			-- we rack only if no round is chambered
			if self.gun:haveChamber() and not self.gun:isRoundChambered() then
				ISTimedActionQueue.addAfter(self, ISRackFirearm:new(self.character, self.gun));
			end
			self:forceComplete();
		elseif self.gun:isInsertAllBulletsReload() then
			self:loadAmmo()
		end
	end
end

function ISReloadWeaponAction:ejectSpentRounds()
	if self.gun:getSpentRoundCount() > 0 then
		--- Mod Content ------
		if self.gun:isRackAfterShoot() then
			--nothing
		else
			for i=1, self.gun:getSpentRoundCount() do
				ISReloadWeaponAction:CheckAmmoCases(self.character, chargeDelta, self.gun);
			end
		end
		----------------------
		self.gun:setSpentRoundCount(0)
	elseif self.gun:isSpentRoundChambered() then
		--- Mod Content ------
		if self.gun:isRackAfterShoot() then
			--nothing
		else
			ISReloadWeaponAction:CheckAmmoCases(self.character, chargeDelta, self.gun);
		end
		-----------------------
		self.gun:setSpentRoundChambered(false)
	else
		return
	end
	if self.gun:getShellFallSound() then
		self.character:getEmitter():playSound(self.gun:getShellFallSound())
	end
end

-- if reload is true we remove our current clip if we have one & equip a new one
-- if false we simply just remove the clip or ammos we have in our gun
function ISReloadWeaponAction:new(character, gun)
	local o = ISBaseTimedAction.new(self, character)
	o.stopOnAim = false;
	o.stopOnWalk = false;
	o.stopOnRun = true;
	o.gun = gun;
	o.reloading = true;
	o.maxTime = -1; -- we don't care about time, the anim is controlling the speed/time
	o.useProgressBar = false;
	return o;
end

ISReloadWeaponAction.ReloadBestMagazine = function(playerObj, gun)
	local magazine = gun:getBestMagazine(playerObj)
	if not magazine then
		magazine = playerObj:getInventory():getFirstTypeRecurse(gun:getMagazineType())
	end
	if not magazine then
		return
	end
	local ammoCount = ISInventoryPaneContextMenu.transferBullets(playerObj, magazine:getAmmoType(), magazine:getCurrentAmmoCount(), magazine:getMaxAmmo())
	if ammoCount == 0 then
		return
	end
	ISTimedActionQueue.add(ISLoadBulletsInMagazine:new(playerObj, magazine, ammoCount))
	ISTimedActionQueue.add(ISInsertMagazine:new(playerObj, gun, magazine))
end

-- Called by ISFirearmRadialMenu.onKeyReleased()
ISReloadWeaponAction.BeginAutomaticReload = function(playerObj, gun)
	if gun:getMagazineType() then
		-- clip inside, pressing R will remove it, other wise we load another
		if gun:isContainsClip() then
			ISTimedActionQueue.add(ISEjectMagazine:new(playerObj, gun))
			-- insert a different non-empty magazine
			local mags = playerObj:getInventory():getAllTypeRecurse(gun:getMagazineType())
			for i=1,mags:size() do
				local magazine = mags:get(i-1)
				if magazine and magazine:getCurrentAmmoCount() > 0 then
					ISTimedActionQueue.add(ISInsertMagazine:new(playerObj, gun, magazine))
					return
				end
			end
			-- reload the ejected magazine and insert it
			ISTimedActionQueue.queueActions(playerObj, ISReloadWeaponAction.ReloadBestMagazine, gun)
			return
		end
		local magazine = gun:getBestMagazine(playerObj)
		if magazine then
			ISInventoryPaneContextMenu.transferIfNeeded(playerObj, magazine)
			ISTimedActionQueue.add(ISInsertMagazine:new(playerObj, gun, magazine))
			return
		end
		-- check if we have an empty magazine for the current gun
		ISReloadWeaponAction.ReloadBestMagazine(playerObj, gun)
	else
		-- if can't have more bullets, we don't do anything, this doesn't apply for magazine-type guns (you'll still remove the current clip)
		if gun:getCurrentAmmoCount() >= gun:getMaxAmmo() then
			return
		end
		-- can't load bullet into a jammed gun, clip works tho
		if gun:isJammed() then
			return
		end
		local ammoCount = ISInventoryPaneContextMenu.transferBullets(playerObj, gun:getAmmoType(), gun:getCurrentAmmoCount(), gun:getMaxAmmo())
		if ammoCount == 0 then
			return
		end
		ISTimedActionQueue.add(ISReloadWeaponAction:new(playerObj, gun))
	end
end

-- Called when pressing reload button when not already reloading, only called when you have an equipped weapon to reload (with available bullets or clip)
ISReloadWeaponAction.OnPressReloadButton = function(player, gun)
	if ISReloadWeaponAction.disableReloading then
		return;
	end
	-- If you press reloading while loading bullets, we stop and rack
	if player:getVariableBoolean("isLoading") then
		ISTimedActionQueue.clear(player);
		ISTimedActionQueue.add(ISRackFirearm:new(player, gun));
	else
		-- See ISFirearmRadialMenu.onKeyReleased()
	end
end

-- Called when pressing rack (if you rack while having a clip/bullets, we simply remove it and don't reload a new one)
ISReloadWeaponAction.OnPressRackButton = function(player, gun)
	if ISReloadWeaponAction.disableReloading then
		return;
	end
	if not ISReloadWeaponAction.canRack(gun) then
		return;
	end
	-- if you press rack while loading bullets, we stop and rack
	if player:getVariableBoolean("isLoading") and not gun:isRoundChambered() then
		ISTimedActionQueue.clear(player);
	end
	ISTimedActionQueue.add(ISRackFirearm:new(player, gun));
end

ISReloadWeaponAction.canShoot = function(weapon)
	if getDebug() and getDebugOptions():getBoolean("Cheat.Player.UnlimitedAmmo") then
		return true;
	end
	if weapon:isJammed() then
		return false;
	end
	if weapon:haveChamber() and not weapon:isRoundChambered() then
		return false;
	end
	if not weapon:haveChamber() and weapon:getCurrentAmmoCount() <= 0 then
		return false;
	end
	return true;
end

-- can we attack?
-- need a chambered round
ISReloadWeaponAction.attackHook = function(character, chargeDelta, weapon)
	ISTimedActionQueue.clear(character)
	if character:isAttackStarted() then return; end
	if instanceof(character, "IsoPlayer") and not character:isAuthorizeMeleeAction() then
		return;
	end
	if weapon:isRanged() and not character:isDoShove() then
		if ISReloadWeaponAction.canShoot(weapon) then
			-- character:playSound(weapon:getSwingSound());
			-- local radius = weapon:getSoundRadius();
			-- if isClient() then -- limit sound radius in MP
				-- radius = radius / 2.2;
			-- end
			-- character:addWorldSoundUnlessInvisible(radius, weapon:getSoundVolume(), false);
			-- character:startMuzzleFlash()
			-- Mod content ----------------------------------
			ISReloadWeaponAction:CheckSilencer(character, chargeDelta, weapon);
			if weapon:isRackAfterShoot() then
				--nothing
			elseif weapon:getSpentRoundCount() and weapon:getSpentRoundCount() > 0 then
				--nothing
			elseif (not weapon:haveChamber()) and weapon:isManuallyRemoveSpentRounds() then
				--nothing
			else
				ISReloadWeaponAction:CheckAmmoCases(character, chargeDelta, weapon);
			end
			--
			character:DoAttack(0);
		else
			-- Mod Content
			if weapon:isJammed() then
				if character:HasTrait("ammocount") or character:HasTrait("ammocount2") then
					character:setHaloNote(getText("Tooltip_weapon_Jammed"), 250,140,0,150);
				end
			end
			--
			character:DoAttack(0);
			character:setRangedWeaponEmpty(true);
		end
	else
		ISTimedActionQueue.clear(character)
		if(chargeDelta == nil) then
			character:DoAttack(0);
		else
			character:DoAttack(chargeDelta);
		end
	end
end

-- shoot shoot bang bang
-- handle ammo removal, new chamber & jam chance
ISReloadWeaponAction.onShoot = function(player, weapon)
	if not weapon:isRanged() then return; end
	if getDebug() and getDebugOptions():getBoolean("Cheat.Player.UnlimitedAmmo") then
		return;
	end
	if weapon:haveChamber() then
		weapon:setRoundChambered(false);
	end
	if weapon:isRackAfterShoot() then
		-- shotgun need to be rack after each shot to rechamber round
		-- See ISReloadWeaponAction.OnPlayerAttackFinished()
		if weapon:haveChamber() then
			weapon:setSpentRoundChambered(true);
		end
	else
		-- automatic weapons eject the bullet cartridge
		if not weapon:isManuallyRemoveSpentRounds() then
			if weapon:getShellFallSound() then
				player:getEmitter():playSound(weapon:getShellFallSound())
			end
		end
		if weapon:getCurrentAmmoCount() >= weapon:getAmmoPerShoot() then
			-- remove ammo, add one to chamber if we still have some
			if weapon:haveChamber() then
				weapon:setRoundChambered(true);
			end
			weapon:setCurrentAmmoCount(weapon:getCurrentAmmoCount() - weapon:getAmmoPerShoot())
		end
	end
	if weapon:isManuallyRemoveSpentRounds() then
		weapon:setSpentRoundCount(weapon:getSpentRoundCount() + weapon:getAmmoPerShoot())
	end
	if weapon:getCondition() < weapon:getConditionMax() and weapon:getJamGunChance() > 0 and weapon:getCurrentAmmoCount() > 0 then
		local baseJamChance = weapon:getJamGunChance();
		if baseJamChance == 0 then
			return;
		end
		-- every condition loss increase the chance of jamming the gun
		baseJamChance = baseJamChance + ((weapon:getConditionMax() - weapon:getCondition()) / 4)
		if baseJamChance > 7 then
			baseJamChance = 7;
		end
		if ZombRand(100) < baseJamChance then
			-- Mod Content
			if player:HasTrait("ammocount") or player:HasTrait("ammocount2") then
				player:setHaloNote(getText("Tooltip_weapon_Jammed"), 250,140,0,150);
			end
			-- Mod Content
			weapon:setJammed(true);
		end
	end
end

ISReloadWeaponAction.OnPlayerAttackFinished = function(playerObj, weapon)
	if not playerObj or playerObj:isDead() then return end
	if getDebug() and getDebugOptions():getBoolean("Cheat.Player.UnlimitedAmmo") then
		return;
	end
	if weapon and weapon:isRanged() and weapon:isRackAfterShoot() then
		ISTimedActionQueue.add(ISRackFirearm:new(playerObj, weapon));
		---- Mod Content ----
		ISReloadWeaponAction:CheckAmmoCases(playerObj, chargeDelta, weapon);
		---------------------
	end
end
function ISReloadWeaponAction:CheckSilencer(character, chargeDelta, weapon)
	local part = weapon:getCanon();
	if part ~= nil then
		local silencer = SilencerDefinitions[part:getType()];
		if silencer then
			if silencer[weapon:getType()] then
				if SilencerDefinitions.loadedWeapon ~= tostring(weapon:getType()) or SilencerDefinitions.loadedWeapon == nil or weapon:getSwingSound() ~= silencer[weapon:getType()].Sound then
					SilencerDefinitions.loadedWeapon = tostring(weapon:getType());
					ISReloadWeaponAction:loadSilencer(weapon, part);
				end
			end
			local data = weapon:getModData()
			if data.SilencerDurability and data.SilencerDurability > 0 then
				local scriptItem = getScriptManager():FindItem(weapon:getFullType())
				local chance = scriptItem:getConditionLowerChance();
				if SilencerDefinitions[part:getType()] then
					local silencerweapon = silencer[weapon:getType()];
					if silencerweapon.CondModifier ~= nil then
						chance = (chance*silencerweapon.CondModifier);
						if ZombRand(chance) == (chance - 1) then
							weapon:getModData().SilencerDurability = weapon:getModData().SilencerDurability - 1;
						end
						if weapon:getModData().SilencerDurability and weapon:getModData().SilencerDurability == 0 then
							character:playSound("AM_BrokenSilencer");
							weapon:detachWeaponPart(weapon:getCanon())
						end
					else
						character:startMuzzleFlash()
					end
				end
			end
		end

	else
		character:startMuzzleFlash()
	end
	character:playSound(weapon:getSwingSound());
	local radius = weapon:getSoundRadius();
	if isClient() then -- limit sound radius in MP
		radius = radius / 3;
	end
	character:addWorldSoundUnlessInvisible(radius, weapon:getSoundVolume(), false);

end

function ISReloadWeaponAction:loadSilencer(weapon, part)
	local silencer = SilencerDefinitions[part:getType()][weapon:getType()];
	weapon:setSwingSound(silencer.Sound);
	weapon:setSoundVolume(weapon:getSoundVolume() * silencer.SoundVolume);
	weapon:setSoundRadius(weapon:getSoundRadius() * silencer.SoundRadius);
end

function ISReloadWeaponAction:CheckAmmoCases(character, chargeDelta, weapon)
	if SWPBaseGameCharacterDetails or AMBaseGameCharacterDetails then
		if AmmoDefinitions[weapon:getAmmoType()] then
			if AmmoDefinitions[weapon:getAmmoType()].casesound then
				local sound = AmmoDefinitions[weapon:getAmmoType()].casesound[ZombRand(1, #AmmoDefinitions[weapon:getAmmoType()].casesound +1)];
				character:playSound(sound);
				if character:HasTrait("Gunnut") or character:HasTrait("wrecicler") or character:HasTrait("wrecicler2") then
					for i = 1, weapon:getAmmoPerShoot() do
						character:getInventory():AddItem("AmmoMaker." .. AmmoDefinitions[weapon:getAmmoType()].materials[1]);
					end
				end
				if character:HasTrait("wrecicler3") then
					--nothing
				end
				if not character:HasTrait("Gunnut") and not character:HasTrait("wrecicler") and not character:HasTrait("wrecicler2") and not character:HasTrait("wrecicler3") then		    
					for i = 1, weapon:getAmmoPerShoot() do
						character:getCurrentSquare():AddWorldInventoryItem("AmmoMaker." .. AmmoDefinitions[weapon:getAmmoType()].materials[1], character:getX() - math.floor(character:getX()), character:getY() - math.floor(character:getY()), character:getZ() - math.floor(character:getZ()));
						ISInventoryPage.renderDirty = true
					end
				end
			end
		end
	end
end

function ISReloadWeaponAction:addModSpeedTrait(character)
	local speed = 1;
	if character:HasTrait("Gunnut") then
		speed = 1.25;
	elseif character:HasTrait("militaryreloader") then
		speed = 1.5;
	end
	return speed
end

local function AMOnLoad()
	local player = getSpecificPlayer(0);	
	local item = player:getPrimaryHandItem();
	if item ~= nil then  	
		local itemType = item:getType();
		if itemType == "AK47" then
			if item:getMagazineType() then
				-- clip inside
				if item:isContainsClip() then
					item:setWeaponSprite("AmmoMaker.AK47_Loaded")
				else --noclip
					item:setWeaponSprite("AmmoMaker.AK47")
				end
				player:resetEquippedHandsModels();
			end
		end
	end
end

local function AMOnEquiPrimary(player,item)	
	if item ~= nil then  	
		local itemType = item:getType();
		if itemType == "AK47" then
			if item:getMagazineType() then
				-- clip inside
				if item:isContainsClip() then
					item:setWeaponSprite("AmmoMaker.AK47_Loaded")
				else --- noclip
					item:setWeaponSprite("AmmoMaker.AK47")
				end
				player:resetEquippedHandsModels();
			end
		end
	end
end

Events.OnPressReloadButton.Add(ISReloadWeaponAction.OnPressReloadButton);
Events.OnPressRackButton.Add(ISReloadWeaponAction.OnPressRackButton);
Events.OnWeaponSwingHitPoint.Add(ISReloadWeaponAction.onShoot);
Events.OnPlayerAttackFinished.Add(ISReloadWeaponAction.OnPlayerAttackFinished);
Hook.Attack.Add(ISReloadWeaponAction.attackHook);

