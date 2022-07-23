--[[
require "TimedActions/ISEatFoodAction"

function ISEatFoodAction:getRequiredItem()
	if not self.item:getRequireInHandOrInventory() then
		return
	end
	local types = self.item:getRequireInHandOrInventory()
	for i=1,types:size() do
		local fullType = moduleDotType(self.item:getModule(), types:get(i-1))
		local item2 = self.character:getInventory():getFirstType(fullType)

		if item2 then
			if types:get(i-1):getType() == "GFMagnifyGlass" then
				local isDay = (getGameTime():getHour() >= 8 and getGameTime():getHour() <= 16)
				local isNotWinter = (getGameTime():getMonth() >= 3 and getGameTime():getMonth() <= 9)
				local isSunny = getWorld():getWeather() == "sunny"

				if isDay and isSunny and isNotWinter and self.character:isOutside() then
					return item2
				else
					return nil
				end
			else
				return item2
			end
		end
	end
	return nil
end
--]]