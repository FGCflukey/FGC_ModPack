require "Reloading/ISReloadableWeapon"


-- Sawn-off recipe callback, copies modData to the new sawn-off.
function HalberdShift(items, result, player)
	for i=0,items:size()-1 do
		local item = items:get(i)
		if item:getType() == "HalberdSpear" or item:getType() == "HalberdAxe" then
			result:setCondition(item:getCondition())
			result:setCurrentAmmoCount(item:getCurrentAmmoCount())
			if result:haveChamber() and item:haveChamber() and item:isRoundChambered() then
				result:setRoundChambered(true)
			end
			 if item:isContainsClip() or ( item:getCurrentAmmoCount() > 0 and item:getMagazineType() )  then
				result:setContainsClip(true)
			end
			local modData = result:getModData()
			for k,v in pairs(item:getModData()) do
				modData[k] = v
			end
			result:attachWeaponPart(item:getScope())
			result:attachWeaponPart(item:getClip())
			result:attachWeaponPart(item:getSling())
			result:attachWeaponPart(item:getCanon())
			result:attachWeaponPart(item:getStock())
			result:attachWeaponPart(item:getRecoilpad())
			--if player:getPrimaryItem() == item then
				player:setPrimaryHandItem(result);
				player:setSecondaryHandItem(result);
			--end
			return
		end
    end
end