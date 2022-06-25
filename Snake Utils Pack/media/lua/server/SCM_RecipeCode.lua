function GetNeedle_OnCreate(items, result, player, selectedItem)
    local success = 50 + (player:getPerkLevel(Perks.Electricity)*5);
	for i=0, items:size()-1 do
		-- En el caso de que el GPS tenga energía restante trasladar la cantidad delta del GPS a su resultante (La Pila)
		if items:get(i):getType() == "UpholsteryKit" and items:get(i):getUsedDelta() > 0 then
			local Tuses = items:get(i):getUsedDelta() * 2;
			if Tuses > 1 then
				local item1 = InventoryItemFactory.CreateItem("Base.Twine");
				item1:setUsedDelta(1)
				player:getInventory():AddItem(item1);
				
				local item2 = InventoryItemFactory.CreateItem("Base.Twine");
				local delta = Tuses - 1;
				item1:setUsedDelta(delta)
				player:getInventory():AddItem(item2);
			else
				local item1 = InventoryItemFactory.CreateItem("Base.Twine");
				item1:setUsedDelta(items:get(i):getUsedDelta())
				player:getInventory():AddItem(item1);
			end
		end
    end
end