--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

require "TimedActions/ISBaseTimedAction"
require "Farming/TimedActions/ISPlowAction"
function ISPlowAction:isValid()
	if self.character:getMoodles():getMoodleLevel(MoodleType.Endurance) < 4 then
		return true;
	end
	return false;
end

function ISPlowAction:perform()
    if self.item then
        self.item:getContainer():setDrawDirty(true);
        self.item:setJobDelta(0.0);
    elseif ZombRand(10) == 0 then -- chance of getting hurt
        if ZombRand(2) == 0 then
            self.character:getBodyDamage():getBodyPart(BodyPartType.Hand_L):SetScratchedWeapon(true);
        else
            self.character:getBodyDamage():getBodyPart(BodyPartType.Hand_R):SetScratchedWeapon(true);
        end
    end
    if self.sound and self.sound ~= 0 then
        self.character:getEmitter():stopOrTriggerSound(self.sound);
    end

	local sq = self.gridSquare
	local args = { x = sq:getX(), y = sq:getY(), z = sq:getZ() }
	CFarmingSystem.instance:sendCommand(self.character, 'plow', args)

	CFarmingSystem.instance:changePlayer(self.character)
	---------- Agregar Cansancio ------------
	local moodleLevel = self.character:getMoodles():getMoodleLevel(MoodleType.Endurance)
	local val = 0.025;
	if moodleLevel == 1 then val = val * 1.1
		elseif moodleLevel == 2 then val = val * 1.2
		elseif moodleLevel == 3 then val = val * 1.3
		elseif moodleLevel == 4 then val = val * 1.4 
	end
	self.character:getStats():setEndurance(self.character:getStats():getEndurance() - val)

	---------- Reconfiguracion de gusanos ----------
	-- maybe give worm ?
	local nb;
	if SandboxVars.NatureAbundance == 1 then -- very poor
        nb = 20;
    elseif SandboxVars.NatureAbundance == 2 then -- poor
        nb = 15;
    elseif SandboxVars.NatureAbundance == 3 then -- abundant
        nb = 10;
    elseif SandboxVars.NatureAbundance == 4 then -- very abundant
        nb = 5;
	else
		nb = 15;
    end

    if ZombRand(nb) == 0 then --5
		local rewarditems = {
			"AdvancedFishing.RedWorm",
			"Base.Worm",
			"Base.Centipede",
			"Base.Centipede2",
			"Base.Millipede",
			"Base.Millipede2",
			"Base.Snail",
		};
		self.character:getInventory():AddItem(rewarditems[ZombRand(1, #rewarditems+1)]);

    end
	ISBaseTimedAction.perform(self);
end

