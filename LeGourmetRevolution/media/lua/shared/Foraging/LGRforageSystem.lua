require "Foraging/forageSystem";
local function metalDetectorTest()
   if forageSystem and forageSystem.isForageableFuncs then
      local function hasDetectorInHand(_character, _itemDef)
         local playerHand = _character:getPrimaryHandItem();
         local requiredItems = 0;
         for _, itemHand in ipairs(_itemDef.itemHands) do
            if playerHand ~= nil and playerHand:getType() == itemHand and playerHand:isActivated() and playerHand:getUsedDelta() > 0 then
               requiredItems = requiredItems + 1;
            end;
         end;
         return #_itemDef.itemHands == requiredItems;
      end;
      table.insert(forageSystem.isForageableFuncs, hasDetectorInHand);
   end;
end

local function removeFishingTackle()
	local FishingTackleDef = forageSystem.itemDefs["Base.FishingTackle"];
	forageSystem.removeItemDef(FishingTackleDef);
	
	local FishingTackleDefB = forageSystem.itemDefs["Base.FishingTackle2"];
	forageSystem.removeItemDef(FishingTackleDefB);
end

Events.OnGameStart.Add(metalDetectorTest)
Events.OnGameStart.Add(removeFishingTackle)