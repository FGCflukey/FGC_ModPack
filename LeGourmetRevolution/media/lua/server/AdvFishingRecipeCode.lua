require "recipecode" --Made by Snake

function MDBatteryRemoval_TestIsValid (sourceItem, result)
	return sourceItem:getUsedDelta() > 0;
end

function MDBatteryRemoval_OnCreate(items, result, player)
  for i=0, items:size()-1 do
	-- trasladar la cantidad delta de un gps a su resultante (la pila)
	if items:get(i):getType() == "MetalDetector" then
		result:setUsedDelta(items:get(i):getUsedDelta());
		-- Ahora se vacía la energia del gps ya que la pila se extrae.
		items:get(i):setUsedDelta(0);
	end
  end


end

function MDBatteryInsert_TestIsValid (sourceItem, result)
	if sourceItem:getType() == "MetalDetector" then
		return sourceItem:getUsedDelta() == 0; -- Sólo se permite que la pila se inserte si el GPS no tiene batería.
	end
	return true -- la pila
end

function MDBatteryInsert_OnCreate(items, result, player)
  for i=0, items:size()-1 do
	-- trasladar la cantidad delta de una pila a su resultante (El gps)
	if items:get(i):getType() == "Battery" then
		result:setUsedDelta(items:get(i):getUsedDelta());
	end
  end
end

function CleanWire_OnCreate(items, result, player)
  for i=0, items:size()-1 do
	-- trasladar la cantidad delta de una pila a su resultante (El gps)
	if items:get(i):getType() == "Wire" then
		result:setUsedDelta(items:get(i):getUsedDelta());
	end
  end
end

function CutFish_TestIsValid(sourceItem, result)
    if instanceof(sourceItem, "Food") then
        return sourceItem:getActualWeight() > 1.0
    end
    return true
end

function CutFish_OnCreate(items, result, player)
    local fish = nil;
    for i=0,items:size() - 1 do
        if instanceof(items:get(i), "Food") then
            fish = items:get(i);
            break;
        end
    end
    if fish then
        local hunger = math.max(fish:getBaseHunger(), fish:getHungChange())
        result:setBaseHunger(hunger / 2);
        result:setHungChange(hunger / 2);
        result:setActualWeight((fish:getActualWeight() * 0.9) / 2)
        result:setWeight(result:getActualWeight());
        result:setCustomWeight(true)
        result:setCarbohydrates(fish:getCarbohydrates() / 2);
        result:setLipids(fish:getLipids() / 2);
        result:setProteins(fish:getProteins() / 2);
        result:setCalories(fish:getCalories() / 2);
		result:setCooked(fish:isCooked());
		result:setAge(fish:getAge());
		result:setBurnt(fish:isBurnt());
    end
end

function Recipe.OnCreate.NewCutFish(items, result, player)
    local fish = nil;
    for i=0,items:size() - 1 do
        if instanceof(items:get(i), "Food") then
            fish = items:get(i);
            break;
        end
    end
	if fish then
		local number = 1;
		if fish:getHungerChange() >= (-0.4) then
			--nothing only received two fillet
		elseif fish:getHungerChange() < (-2) then
			number = 10
		elseif fish:getHungerChange() < (-1) then
			number = 4
		elseif fish:getHungerChange() < (-0.8) then
			number = 3
			elseif fish:getHungerChange() < (-0.4) then
			number = 2
		else
		end
		--player:Say(tostring(number))
		if number >= 2 then
			for i=1,(number -1) do
				--player:Say(tostring(result:getFullType()))
				local Slice = InventoryItemFactory.CreateItem(result:getFullType())
				local fhunger = math.max(fish:getBaseHunger(), fish:getHungChange())
				Slice:setBaseHunger(fhunger / number);
				Slice:setHungChange(fhunger / number);
				Slice:setUnhappyChange(fish:getUnhappyChange()/ number)
				Slice:setActualWeight((fish:getActualWeight() * 0.9) / number)
				Slice:setWeight(Slice:getActualWeight());
				Slice:setCustomWeight(true)
				Slice:setCarbohydrates(fish:getCarbohydrates() / number);
				Slice:setLipids(fish:getLipids() / number);
				Slice:setProteins(fish:getProteins() / number);
				Slice:setCalories(fish:getCalories() / number);
				Slice:setCooked(fish:isCooked());
				--Slice:setRotten(fish:isRotten());
				Slice:setAge(fish:getAge());
				Slice:setBurnt(fish:isBurnt());
				player:getInventory():AddItem(Slice);
			end
		end
        local hunger = math.max(fish:getBaseHunger(), fish:getHungChange())
        result:setBaseHunger(hunger / number);
        result:setHungChange(hunger / number);
		result:setUnhappyChange(fish:getUnhappyChange()/ number)
        result:setActualWeight((fish:getActualWeight() * 0.9) / number)
        result:setWeight(result:getActualWeight());
        result:setCustomWeight(true)
        result:setCarbohydrates(fish:getCarbohydrates() / number);
        result:setLipids(fish:getLipids() / number);
        result:setProteins(fish:getProteins() / number);
        result:setCalories(fish:getCalories() / number);
		result:setCooked(fish:isCooked());
		--result:setRotten(fish:isRotten());
		result:setAge(fish:getAge());
		result:setBurnt(fish:isBurnt());
	end
end

function AFishingxp2(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Fishing, 2);
end

function AFishingCxp2(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Fishing, 2);
	player:getXp():AddXP(Perks.Cooking, 2);
end

function CutArFish_OnCreate(items, result, player)
    local arfish = nil;
    for i=0,items:size() - 1 do
        if items:get(i):getType() == "Arapaima" then
            arfish = items:get(i)
            break
        end
    end
    if arfish then
        local hunger = math.max(arfish:getBaseHunger(), arfish:getHungChange())
        arfish:setBaseHunger(hunger / 20)
        arfish:setHungChange(arfish:getBaseHunger())
        arfish:setActualWeight((arfish:getActualWeight() * 0.8) / 20)
		arfish:setCustomWeight(true)

        result:setBaseHunger(arfish:getBaseHunger())
        result:setHungChange(arfish:getBaseHunger())
        result:setActualWeight(arfish:getActualWeight())
        result:setCustomWeight(true)
        result:setCarbohydrates(arfish:getCarbohydrates() / 20);
        result:setLipids(arfish:getLipids() / 20);
        result:setProteins(arfish:getProteins() / 20);
        result:setCalories(arfish:getCalories() / 20);
		result:setAge(arfish:getAge());
		if arfish:isCooked() then
			result:setCooked(true);
		else
		end
		if arfish:isBurnt() then
			result:setBurnt(true);
		else
		end
    end
end

function CutFishSalmon_OnCreate(items, result, player)
    local fish = nil;
    for i=0,items:size() - 1 do
        if instanceof(items:get(i), "Food") then
            fish = items:get(i);
            break;
        end
    end
    if fish then
        local hunger = math.max(fish:getBaseHunger(), fish:getHungChange())
        result:setBaseHunger(hunger / 6);
        result:setHungChange(hunger / 6);
        result:setActualWeight((fish:getActualWeight() * 0.9) / 6);
        result:setCustomWeight(true);
        result:setCarbohydrates(fish:getCarbohydrates() / 6);
        result:setLipids(fish:getLipids() / 6);
        result:setProteins(fish:getProteins() / 6);
        result:setCalories(fish:getCalories() / 6);
		result:setAge(fish:getAge());
		if fish:isCooked() then
			result:setCooked(true);
		end
		if fish:isBurnt() then
			result:setBurnt(true);
		end
    end
end

function CutFish4_OnCreate(items, result, player)
    local fish = nil;
    for i=0,items:size() - 1 do
        if instanceof(items:get(i), "Food") then
            fish = items:get(i);
            break;
        end
    end
    if fish then
        local hunger = math.max(fish:getBaseHunger(), fish:getHungChange())
        result:setBaseHunger(hunger / 4);
        result:setHungChange(hunger / 4);
        result:setActualWeight((fish:getActualWeight() * 0.9) / 4);
        result:setCustomWeight(true);
        result:setCarbohydrates(fish:getCarbohydrates() / 4);
        result:setLipids(fish:getLipids() / 4);
        result:setProteins(fish:getProteins() / 4);
        result:setCalories(fish:getCalories() / 4);
		result:setAge(fish:getAge());
		if fish:isCooked() then
			result:setCooked(true);
		end
		if fish:isBurnt() then
			result:setBurnt(true);
		end
    end
end

function CutFishSuru_OnCreate(items, result, player)
    local fish = nil;
    for i=0,items:size() - 1 do
        if instanceof(items:get(i), "Food") then
            fish = items:get(i);
            break;
        end
    end
    if fish then
        local hunger = math.max(fish:getBaseHunger(), fish:getHungChange())
        result:setBaseHunger(hunger / 5);
        result:setHungChange(hunger / 5);
        result:setActualWeight((fish:getActualWeight() * 0.9) / 5);
        result:setCustomWeight(true);
        result:setCarbohydrates(fish:getCarbohydrates() / 5);
        result:setLipids(fish:getLipids() / 5);
        result:setProteins(fish:getProteins() / 5);
        result:setCalories(fish:getCalories() / 5);
		result:setAge(fish:getAge());
		if fish:isCooked() then
			result:setCooked(true);
		end
		if fish:isBurnt() then
			result:setBurnt(true);
		end
    end
end

function CutFish3_OnCreate(items, result, player)
    local fish = nil;
    for i=0,items:size() - 1 do
        if instanceof(items:get(i), "Food") then
            fish = items:get(i);
            break;
        end
    end
    if fish then
        local hunger = math.max(fish:getBaseHunger(), fish:getHungChange())
        result:setBaseHunger(hunger / 3);
        result:setHungChange(hunger / 3);
        result:setActualWeight((fish:getActualWeight() * 0.9) / 3);
        result:setCustomWeight(true);
        result:setCarbohydrates(fish:getCarbohydrates() / 3);
        result:setLipids(fish:getLipids() / 3);
        result:setProteins(fish:getProteins() / 3);
        result:setCalories(fish:getCalories() / 3);
		result:setAge(fish:getAge());
		if fish:isCooked() then
			result:setCooked(true);
		end
		if fish:isBurnt() then
			result:setBurnt(true);
		end
    end
end

function CutFishtarpon_OnCreate(items, result, player)
    local fish = nil;
    for i=0,items:size() - 1 do
        if instanceof(items:get(i), "Food") then
            fish = items:get(i);
            break;
        end
    end
    if fish then
        local hunger = math.max(fish:getBaseHunger(), fish:getHungChange())
        result:setBaseHunger(hunger / 10);
        result:setHungChange(hunger / 10);
        result:setActualWeight((fish:getActualWeight() * 0.9) / 10);
        result:setCustomWeight(true);
        result:setCarbohydrates(fish:getCarbohydrates() / 10);
        result:setLipids(fish:getLipids() / 10);
        result:setProteins(fish:getProteins() / 10);
        result:setCalories(fish:getCalories() / 10);
		result:setAge(fish:getAge());
		if fish:isCooked() then
			result:setCooked(true);
		end
		if fish:isBurnt() then
			result:setBurnt(true);
		end
    end
end

function CutFish8_OnCreate(items, result, player)
    local fish = nil;
    for i=0,items:size() - 1 do
        if instanceof(items:get(i), "Food") then
            fish = items:get(i);
            break;
        end
    end
    if fish then
        local hunger = math.max(fish:getBaseHunger(), fish:getHungChange())
        result:setBaseHunger(hunger / 8);
        result:setHungChange(hunger / 8);
        result:setActualWeight((fish:getActualWeight() * 0.9) / 8);
        result:setCustomWeight(true);
        result:setCarbohydrates(fish:getCarbohydrates() / 8);
        result:setLipids(fish:getLipids() / 8);
        result:setProteins(fish:getProteins() / 8);
        result:setCalories(fish:getCalories() / 8);
		result:setAge(fish:getAge());
		if fish:isCooked() then
			result:setCooked(true);
		end
		if fish:isBurnt() then
			result:setBurnt(true);
		end
    end
end

function CutTurtle_OnCreate(items, result, player)
    local fish = nil;
    for i=0,items:size() - 1 do
        if instanceof(items:get(i), "Food") then
            fish = items:get(i);
            break;
        end
    end
    if fish then
        local hunger = math.max(fish:getBaseHunger(), fish:getHungChange())
        result:setBaseHunger(hunger * 2);
        result:setHungChange(hunger * 2);
        result:setActualWeight((fish:getActualWeight() * 0.5) / 6)
        result:setCustomWeight(true)
        result:setCarbohydrates(fish:getCarbohydrates() / 6);
        result:setLipids(fish:getLipids() / 6);
        result:setProteins(fish:getProteins() / 6);
        result:setCalories(fish:getCalories() / 6);
		result:setAge(fish:getAge());
		if fish:isCooked() then
			result:setCooked(true);
		end
		if fish:isBurnt() then
			result:setBurnt(true);
		end
    end
end

function OpenWormsPacket_OnCreate(items, result, player)
    player:getInventory():AddItem("Base.Newspaper");
end

function CutBigFish_TestIsValid(sourceItem, result)
    if instanceof(sourceItem, "Food") then
        return sourceItem:getActualWeight() > 15.0
    end
    return true
end

function CutMediumFish_TestIsValid(sourceItem, result)
    if instanceof(sourceItem, "Food") then
        return sourceItem:getActualWeight() > 10.0
    end
    return true
end

function CutNormalFish_TestIsValid(sourceItem, result)
    if instanceof(sourceItem, "Food") then
        return sourceItem:getActualWeight() > 3.0
    end
    return true
end

function Addbait_TestIsValid(sourceItem, result)
    if instanceof(sourceItem, "Food") then
        --return sourceItem:isRotten() == false
		local notrotten = false;
		if sourceItem:getAge() <= sourceItem:getScriptItem():getDaysTotallyRotten() then
			notrotten = true;
		end
		return notrotten;
    end
    return true
end

function DismantleElectronics_OnGiveXP5(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Electricity, 5);
end

function MDDismantle_OnCreate(items, result, player, selectedItem)
    local success = 20 + (player:getPerkLevel(Perks.Electricity)*8);
	for i=0, items:size()-1 do
		-- trasladar la cantidad delta de una pila a su resultante (El gps)
		if items:get(i):getType() == "MetalDetector" and items:get(i):getUsedDelta() > 0 then
			local item = InventoryItemFactory.CreateItem("Base.Battery");	
			item:setUsedDelta(items:get(i):getUsedDelta());
			
			--player:getInventory():AddItem(item);
			if isServer() then
				player:sendObjectChange('addItem', { item = item})
			else
				player:getInventory():AddItem(item)
			end
		end
		if ZombRand(0,100)<success then
			player:getInventory():AddItem("Radio.ScannerModule");
		end
    end
end