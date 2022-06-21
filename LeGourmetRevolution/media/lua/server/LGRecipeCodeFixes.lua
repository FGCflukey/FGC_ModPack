require ("recipecode");

function Recipe.OnCreate.CutFillet(items, result, player)
    local fish = nil
    for i=0,items:size() - 1 do
        if items:get(i):getType() == "FishFillet" then
            fish = items:get(i)
            break
        end
    end
    if fish then
		local number = 2;
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

		--player:Say(tostring(fish:getUnhappyChange()))
		if number >= 3 then
			for i=1,(number -2) do
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
		result:setAge(fish:getAge());
		result:setBurnt(fish:isBurnt());
    end
end

function Recipe.OnCreate.CutAnimal(items, result, player)
    local anim = nil;
    for i=0,items:size() - 1 do
        if instanceof(items:get(i), "Food") then
            anim = items:get(i);
            break;
        end
    end
    if anim then
        local new_hunger = anim:getBaseHunger() * 0.95;
        if(new_hunger < -100) then
            new_hunger = -100;
        end
        result:setBaseHunger(new_hunger);
        result:setHungChange(new_hunger);

        result:setCustomWeight(true);
        result:setWeight(anim:getWeight() * 0.7);
        result:setActualWeight(anim:getActualWeight() * 0.7);

        result:setLipids(anim:getLipids() * 0.75);
        result:setProteins(anim:getProteins() * 0.75);
        result:setCalories(anim:getCalories() * 0.75);
        result:setCarbohydrates(anim:getCarbohydrates() * 0.75);
    end
end

function Recipe.OnCreate.OpenCannedFood(items, result, player)
    local jar = items:get(0);
    local aged = jar:getAge() / jar:getOffAgeMax();

    result:setAge(result:getOffAgeMax() * aged);

    player:getInventory():AddItem("Base.EmptyJar");
    player:getInventory():AddItem("Base.JarLid");
end

-- Code copied from TimedActions/ISRipClothing.lua
function Recipe.OnCreate.RipClothing(items, result, player, selectedItem)
    local item = items:get(0) -- assumes any tool comes after this in recipes.txt

    -- either we come from clothingrecipesdefinitions or we simply check number of covered parts by the clothing and add
    local materials = nil
    local nbrOfCoveredParts = nil
    local maxTime = 0 -- TODO: possibly allow recipe to call Lua function to get maxTime for actions
    if ClothingRecipesDefinitions[item:getType()] then
        local recipe = ClothingRecipesDefinitions[item:getType()]
        materials = luautils.split(recipe.materials, ":");
        maxTime = tonumber(materials[2]) * 20;
    elseif ClothingRecipesDefinitions["FabricType"][item:getFabricType()] then
        materials = {};
        materials[1] = ClothingRecipesDefinitions["FabricType"][item:getFabricType()].material;
        nbrOfCoveredParts = item:getNbrOfCoveredParts();
        local minMaterial = 2;
        local maxMaterial = nbrOfCoveredParts;
        if nbrOfCoveredParts == 1 then
            minMaterial = 1;
        end
    
        local nbr = ZombRand(minMaterial, maxMaterial + 1);
        nbr = nbr + (player:getPerkLevel(Perks.Tailoring) / 2);
        if nbr > nbrOfCoveredParts then
            nbr = nbrOfCoveredParts;
        end
        materials[2] = nbr;
    
        maxTime = nbrOfCoveredParts * 20;
    else
        error "RipClothing_OnCreate"
    end

    for i=1,tonumber(materials[2]) do
        local item2;
        local dirty = false;
        if instanceof(item, "Clothing") then
            dirty = (ZombRand(100) <= item:getDirtyness()) or (ZombRand(100) <= item:getBloodlevel());
        end
        if not dirty then
            item2 = InventoryItemFactory.CreateItem(materials[1]);
        elseif getScriptManager():FindItem(materials[1] .. "Dirty") then
            item2 = InventoryItemFactory.CreateItem(materials[1] .. "Dirty");
        else
            item2 = InventoryItemFactory.CreateItem(materials[1])
        end
        player:getInventory():AddItem(item2);
    end
	
	if ClothingUnravelDefinitions[item:getType()] then
		local recipeB = ClothingUnravelDefinitions[item:getType()]
        local materialsB = luautils.split(recipeB.materials, ":");
		local condition = 100* item:getCondition() / item:getConditionMax();
		local Tailorlvl = player:getPerkLevel(Perks.Tailoring);
		if Tailorlvl < 1 then Tailorlvl = 1;end
		local Calq1 = math.ceil(tonumber(materialsB[2])*tonumber(condition)/100);
		if Calq1 > tonumber(materialsB[2]) then Calq1 = tonumber(materialsB[2]); end
		if Calq1 < 1 then Calq1 = 1; end
		local Calq2 =  math.ceil(Calq1 * Tailorlvl /10);
		if Calq2 > tonumber(materialsB[2]) then Calq2 = tonumber(materialsB[2]); end
		if Calq2 < 1 then Calq2 = 1; end
		if player:HasTrait("Tailor") then Calq2 = tonumber(materialsB[2]); end
		for i=1, Calq2 do
			local itemtogive = InventoryItemFactory.CreateItem(materialsB[1]);
			--if instanceof(self.item, "Clothing") then
			player:getInventory():AddItem(itemtogive);
			--end
			
		end
		player:getXp():AddXP(Perks.Tailoring, 1);
	end
end