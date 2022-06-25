require "TimedActions/ISBaseTimedAction"
require "TimedActions/ISFertilizeAction"

function ISFertilizeAction:perform()
	--self.item:getContainer():setDrawDirty(true);
	self.item:setJobDelta(0.0);
	
	local sq = self.plant:getSquare()
	local args = { x = sq:getX(), y = sq:getY(), z = sq:getZ() }
	CFarmingSystem.instance:sendCommand(self.character, 'fertilize', args)

	-- MP shouldn't do this directly

	self.item:Use()
	ISInventoryPage.renderDirty = true;


	
	self.character:getInventory():Remove("FertilizerEmpty")

    -- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end