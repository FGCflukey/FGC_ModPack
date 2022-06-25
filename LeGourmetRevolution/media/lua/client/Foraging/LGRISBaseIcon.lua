require "Foraging/forageSystem";
require "ISUI/ISPanel";
require "Foraging/ISBaseIcon";
--soundtimer = 0;
function ISBaseIcon:spotIcon()
	if (not self:getIsSeen()) then
		self:resetBounce();
		self.spotTimer = self.spotTimerMax;
		self:setIsNoticed(true);
		self:updateAlpha();
		self:setIsSeen(true);
		local playerHand = self.character:getPrimaryHandItem();
		if playerHand ~= nil and playerHand:getType() == "MetalDetector" and playerHand:isActivated() and playerHand:getUsedDelta() > 0 then
			local it = InventoryItemFactory.CreateItem(self.itemType)
			if it:getMetalValue() and it:getMetalValue() > 0 then
				--if soundtimer <= 0 then
					--soundtimer = 40;
					self.character:playSound("detectorbeeping");
				--else
				--	soundtimer = soundtimer -1;
				--	self.character:Say(tostring(soundtimer))
				--end
			end
		end
		self:setIsSeenThisUpdate(true);
		self.manager:spotIcon(self);
		self:addIsoMarker();
		self:initItem();
		self:initItemCount();
		self:getItemList();
	end;
end
