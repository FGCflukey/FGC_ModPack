require "TimedActions/ISBaseTimedAction"
require "TimedActions/ISRemoveWeaponUpgrade"

function ISRemoveWeaponUpgrade:perform()
	if LightPartsDef[self.part:getType()] then
		ISRemoveWeaponUpgrade:TurnOffLights(self.weapon)
	end

    self.weapon:detachWeaponPart(self.part)
    self.character:getInventory():AddItem(self.part);
	self.character:resetEquippedHandsModels();

	if SilencerDefinitions[self.part:getType()] then
		ISRemoveWeaponUpgrade:setSilencerDurability(self.weapon, self.part)
		ISRemoveWeaponUpgrade:setCannonSound(self.weapon, self.part)
	end
    -- needed to remove from queue / start next.
    ISBaseTimedAction.perform(self);
end
function ISRemoveWeaponUpgrade:TurnOffLights(weapon)
	weapon:setTorchCone(true);
	weapon:setLightStrength(0);
	weapon:setLightDistance(0);
	weapon:setActivated(false);
end

function ISRemoveWeaponUpgrade:setSilencerDurability(weapon, part)
	local WeaponDef = SilencerDefinitions[part:getType()][weapon:getType()];
	if WeaponDef.CondModifier ~= nil then
		part:getModData().SilencerDurability = weapon:getModData().SilencerDurability;
		weapon:getModData().SilencerDurability = 0;
	end
end

function ISRemoveWeaponUpgrade:setCannonSound(weapon, part)
	if SilencerDefinitions[part:getType()][weapon:getType()] then
		local data = weapon:getModData();
		if not data.baseSwingSound then
			data.baseSwingSound = weapon:getSwingSound();
		end
		if not data.baseSoundVolume then
			data.baseSoundVolume = weapon:getSoundVolume();
		end
		if not data.baseSoundRadius then
			data.baseSoundRadius = weapon:getSoundRadius();
		end
		weapon:setSwingSound(data.baseSwingSound);
		weapon:setSoundVolume(data.baseSoundVolume);
		weapon:setSoundRadius(data.baseSoundRadius);
	end
end