require "TimedActions/ISBaseTimedAction"
require "Farming/TimedActions/ISSeedAction"

function ISSeedAction:perform()

	for i=1, self.nbOfSeed do
		local seed = self.seeds[i];
		self.character:getInventory():Remove(seed);
	end
	if farming_vegetableconf.props[self.typeOfSeed].sticksRequired > 0 then
		local nbOfSticks = farming_vegetableconf.props[self.typeOfSeed].sticksRequired;
		local itemList = ISFarmingMenu.haveItems(self.character);
		for i=1, nbOfSticks do
			local stick = itemList.WoodenStick[i];
			self.character:getInventory():Remove(stick);
		end
	end
	if farming_vegetableconf.props[self.typeOfSeed].sheetropeRequired > 0 then
		local nbOfSheetRope = farming_vegetableconf.props[self.typeOfSeed].sheetropeRequired;
		local itemList = ISFarmingMenu.haveItems(self.character);
		for i=1, nbOfSheetRope do
			local sheetrope = itemList.SheetRope[i];
			self.character:getInventory():Remove(sheetrope);
		end
	end

	local sq = self.plant:getSquare()
	local args = { x = sq:getX(), y = sq:getY(), z = sq:getZ(), typeOfSeed = self.typeOfSeed }
	CFarmingSystem.instance:sendCommand(self.character, 'seed', args)

    -- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end
