--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

require "TimedActions/ISBaseTimedAction"
require "TimedActions/ISUnequipAction"

function ISUnequipAction:perform()
	if self.sound then
		self.character:getEmitter():stopSound(self.sound)
	end

    self.item:getContainer():setDrawDirty(true);
    self.item:setJobDelta(0.0);
    self.character:removeWornItem(self.item)

	if self.fromHotbar then
		local hotbar = getPlayerHotbar(self.character:getPlayerNum());
		hotbar.chr:setAttachedItem(self.item:getAttachedToModel(), self.item);
		self:setOverrideHandModels(nil, nil)
	end
	----Parte del mod WPA apagar linterna
	if self.item and instanceof(self.item, "HandWeapon") then
		local Sling = self.item:getSling();
		local Scope = self.item:getScope();
		if Sling ~= nil then
			if LightPartsDef[Sling:getType()] then
				if self.item:isActivated() then
					self.character:playSound("WPA_TLonoff");
				end
				ISRemoveWeaponUpgrade:TurnOffLights(self.item)
			end
		end
		if Scope ~= nil then
			if LightPartsDef[Scope:getType()] then
				if self.item:isActivated() then
					self.character:playSound("WPA_TLonoff");
				end
				ISRemoveWeaponUpgrade:TurnOffLights(self.item)
			end
		end
	end
	---------------------------------------------
    if self.item == self.character:getPrimaryHandItem() then
        if (self.item:isTwoHandWeapon() or self.item:isRequiresEquippedBothHands()) and self.item == self.character:getSecondaryHandItem() then
            self.character:setSecondaryHandItem(nil);
        end
		self.character:setPrimaryHandItem(nil);
    end
    if self.item == self.character:getSecondaryHandItem() then
        if (self.item:isTwoHandWeapon() or self.item:isRequiresEquippedBothHands()) and self.item == self.character:getPrimaryHandItem() then
            self.character:setPrimaryHandItem(nil);
        end
		self.character:setSecondaryHandItem(nil);
    end
	triggerEvent("OnClothingUpdated", self.character)
	if isForceDropHeavyItem(self.item) then
		self.character:getInventory():Remove(self.item);
		local dropX,dropY,dropZ = ISInventoryTransferAction.GetDropItemOffset(self.character, self.character:getCurrentSquare(), self.item)
		self.character:getCurrentSquare():AddWorldInventoryItem(self.item, dropX, dropY, dropZ)
	end
	ISInventoryPage.renderDirty = true

    -- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end