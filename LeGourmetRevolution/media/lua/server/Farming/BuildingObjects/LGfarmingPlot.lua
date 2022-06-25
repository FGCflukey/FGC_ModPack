require "BuildingObjects/ISBuildingObject"
require "Farming/BuildingObjects/farmingPlot"

function farmingPlot:isValid(square)
	if not self.handItem then
		if self.character:getBodyDamage():getBodyPart(BodyPartType.Hand_L):HasInjury() or self.character:getBodyDamage():getBodyPart(BodyPartType.Hand_R):HasInjury() then
			return false;
		end
    end
	if CFarmingSystem.instance:getLuaObjectOnSquare(square) then
		return false
	end
	if not square:isFreeOrMidair(true, true) then return false end
	-- farming plot have to be on natural floor (no road, concrete etc.)
	for i = 0, square:getObjects():size() - 1 do
		local item = square:getObjects():get(i);
		-- IsoRaindrop and IsoRainSplash have no sprite/texture
		if item:getTextureName() and (luautils.stringStarts(item:getTextureName(), "floors_exterior_natural") or
				luautils.stringStarts(item:getTextureName(), "blends_natural_01")) and (self.character:getMoodles():getMoodleLevel(MoodleType.Endurance) < 3)  then
			return true;
		end
	end
--~ 	if result then
--~ 		result = square:getSpecialObjects():size() == 0;
--~ 	end
	return false;
end