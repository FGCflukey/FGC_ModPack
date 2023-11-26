function Give5EngineParts_OnCreate(items, result, player)

	for i=1, 5 do
		player:getInventory():AddItem("Base.EngineParts");
	end
end

function Give10EngineParts_OnCreate(items, result, player)

	for i=1, 10 do
		player:getInventory():AddItem("Base.EngineParts");
	end
end

function Give20EngineParts_OnCreate(items, result, player)

	for i=1, 20 do
		player:getInventory():AddItem("Base.EngineParts");
	end
end

function Give30EngineParts_OnCreate(items, result, player)

	for i=1, 30 do
		player:getInventory():AddItem("Base.EngineParts");
	end
end

function GiveBack_CarSeatStuff(items, result, player)

		player:getInventory():AddItem("Base.Sheet");
		player:getInventory():AddItem("Base.LeatherStrips");
		player:getInventory():AddItem("Base.LeatherStrips");
		player:getInventory():AddItem("Base.MetalBar");
		player:getInventory():AddItem("Base.MetalBar");
		player:getInventory():AddItem("Base.SmallMetalSheet");
		player:getInventory():AddItem("Base.SmallMetalSheet");
end

function GiveBack_ElectronicScrap(items, result, player)

		player:getInventory():AddItem("Base.ElectronicsScrap");
		player:getInventory():AddItem("Base.ElectronicsScrap");
		player:getInventory():AddItem("Radio.ElectricWire");
		player:getInventory():AddItem("Radio.ElectricWire");
end

function GetNeedle_OnCreate(items, result, player)

		player:getInventory():AddItem("Base.Needle");
end

function GiveHimStick_OnCreate(items, result, player)

		player:getInventory():AddItem("Base.WoodenStick");
end