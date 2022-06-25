--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

require "TimedActions/ISBaseTimedAction"
require "TimedActions/ISEquipWeaponAction"

function ISEquipWeaponAction:start()
	if self:isAlreadyEquipped(self.item) then
		self:forceComplete()
		return
	end
	local sc = self.character:getSecondaryHandItem();
	----Parte del mod WPA apagar linterna
	if self.primary or self.twoHands then
		local pr = self.character:getPrimaryHandItem();
		if pr and instanceof(pr, "HandWeapon") then
			local Sling = pr:getSling();
			local Scope = pr:getScope();
			if Sling ~= nil then
				if LightPartsDef[Sling:getType()] then
					if pr:isActivated() then
						self.character:playSound("WPA_TLonoff");
					end
					ISRemoveWeaponUpgrade:TurnOffLights(pr)
				end
			end
			if Scope ~= nil then
				if LightPartsDef[Scope:getType()] then
					if pr:isActivated() then
						self.character:playSound("WPA_TLonoff");
					end
					ISRemoveWeaponUpgrade:TurnOffLights(pr)
				end
			end
		end
	end
	if not self.primary or self.twoHands then
		if sc and instanceof(sc, "HandWeapon") then
			local Sling = sc:getSling();
			local Scope = sc:getScope();
			if Sling ~= nil then
				if LightPartsDef[Sling:getType()] then
					if sc:isActivated() then
						self.character:playSound("WPA_TLonoff");
					end
					ISRemoveWeaponUpgrade:TurnOffLights(sc)
				end
			end
			if Scope ~= nil then
				if LightPartsDef[Scope:getType()] then
					if sc:isActivated() then
						self.character:playSound("WPA_TLonoff");
					end
					ISRemoveWeaponUpgrade:TurnOffLights(sc)
				end
			end
		end
	end
	---------------------------------------------
    if self.primary then
	    self.item:setJobType(getText("ContextMenu_Equip_Primary") .. " " .. self.item:getName());
    else
        self.item:setJobType(getText("ContextMenu_Equip_Secondary") .. " " .. self.item:getName());
    end
    if self.twoHands then
        self.item:setJobType(getText("ContextMenu_Equip_Two_Hands") .. " " .. self.item:getName());
    end
	self.item:setJobDelta(0.0);
	
	if self.fromHotbar then
		self.character:setVariable("AttachItemSpeed", self.animSpeed)
		self.hotbar:setAttachAnim(self.item);
		self:setActionAnim("DetachItem")
		self.character:reportEvent("EventAttachItem");
	else
		self:setActionAnim("EquipItem");
		self.character:reportEvent("EventAttachItem");
	end
	if self.item:getEquipSound() then
		self.sound = self.character:getEmitter():playSound(self.item:getEquipSound())
	end
	
end