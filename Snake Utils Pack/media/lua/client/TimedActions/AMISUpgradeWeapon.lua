require "TimedActions/ISBaseTimedAction"
require "TimedActions/ISUpgradeWeapon"

function ISUpgradeWeapon:isValid()
    if not self.character:getInventory():getItemFromType("Screwdriver") then return false end
    if self.weapon:getWeaponPart(self.part:getPartType()) then return false end
	if SilencerDefinitions[self.part:getType()] then
		local WeaponDef = SilencerDefinitions[self.part:getType()][self.weapon:getType()];
		if WeaponDef.CondModifier ~= nil then
			local Sdata = self.part:getModData();
			if Sdata.SilencerDurability and Sdata.SilencerDurability <= 0 then
				self.character:Say(getText("ContextMenu_cantequipsilencer"));
			return false end
		end
	end
    return self.character:getInventory():contains(self.part);
end

function ISUpgradeWeapon:perform()
    self.weapon:setJobDelta(0.0);
    self.part:setJobDelta(0.0);
	--mod functions
	ISUpgradeWeapon:setSilencerDurability(self.weapon, self.part)
	if SilencerDefinitions[self.part:getType()] then
		ISUpgradeWeapon:setCannonSound(self.weapon, self.part)
	end

	--
	self.weapon:attachWeaponPart(self.part)
    self.character:getInventory():Remove(self.part);
    self.character:setSecondaryHandItem(nil);
    -- needed to remove from queue / start next.
    ISBaseTimedAction.perform(self);
end

function ISUpgradeWeapon:setSilencerDurability(weapon, part)
	if SilencerDefinitions[part:getType()] then
		local WeaponDef = SilencerDefinitions[part:getType()][weapon:getType()];
		if WeaponDef.CondModifier ~= nil then
			local Sdata = part:getModData();
			if not Sdata.SilencerDurability then
				if WeaponDef.handmade == true then
					Sdata.SilencerDurability = ZombRand(75,101);
				else
					Sdata.SilencerDurability = 100;
				end
			end
			weapon:getModData().SilencerDurability = Sdata.SilencerDurability;		
		end
	end
end

function ISUpgradeWeapon:setCannonSound(weapon, part)
	if SilencerDefinitions[part:getType()][weapon:getType()] then
		local data = weapon:getModData()
		if not data.baseSwingSound then
			data.baseSwingSound = weapon:getSwingSound();
		end
		if not data.baseSoundVolume then
			data.baseSoundVolume = weapon:getSoundVolume();
		end
		if not data.baseSoundRadius then
			data.baseSoundRadius = weapon:getSoundRadius();
		end
		local silencer = SilencerDefinitions[part:getType()][weapon:getType()];
		weapon:setSwingSound(silencer.Sound);
		weapon:setSoundVolume(data.baseSoundVolume * silencer.SoundVolume);
		weapon:setSoundRadius(data.baseSoundRadius * silencer.SoundRadius);
	end
end