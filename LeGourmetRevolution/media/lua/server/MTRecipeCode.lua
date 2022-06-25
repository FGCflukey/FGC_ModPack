require "recipecode" --Made by Snake

function MakeSmallStones_OnCreate(items, result, player)
	local number = ZombRand(4)
	if number > 0 then
		player:getInventory():AddItems("Base.SmallStone", number);
	end
end

function LGRCreateSpear_TestIsValid(sourceItem, result)
	local playerObj = getSpecificPlayer(0);
	local containerList = ArrayList.new();
    for i,v in ipairs(getPlayerInventory(playerObj:getPlayerNum()).inventoryPane.inventoryPage.backpacks) do
        --        if v.inventory ~= self.character:getInventory() then -- owner inventory already check in RecipeManager
        containerList:add(v.inventory);
        --        end
    end
    for i,v in ipairs(getPlayerLoot(playerObj:getPlayerNum()).inventoryPane.inventoryPage.backpacks) do
        containerList:add(v.inventory);
    end
	local items = {"HuntingKnife","KitchenKnife","SharpedStone","FlintKnife","MeatCleaver","Machete"};
    for i=0,containerList:size()-1 do
		local container = containerList:get(i);
		for x=0,container:getItems():size() - 1 do
			local baseItem = container:getItems():get(x);
			local index = 0;
			for i=1,#items do
				index = index + 1;
				if baseItem:getType() == items[index] then
					return false;
				end
			end
		end
	end
    return true
end

function UnravelClothing_GetItemTypes(scriptItems)
    local allScriptItems = getScriptManager():getAllItems()
    for i=1,allScriptItems:size() do
        local scriptItem = allScriptItems:get(i-1)
        if scriptItem:getType() == Type.Clothing then
            if ClothingUnravelDefinitions[scriptItem:getName()] and (not ClothingRecipesDefinitions[scriptItem:getName()] and not scriptItem:getFabricType()) then
                scriptItems:add(scriptItem)
            end
        end
    end
end

-- Code copied from TimedActions/ISRipClothing.lua
function UnravelClothing_OnCreate(items, result, player, selectedItem)
    local item = items:get(0) -- assumes any tool comes after this in recipes.txt
	local maxTime = 0
    -- either we come from clothingrecipesdefinitions or we simply check number of covered parts by the clothing and add
	if ClothingUnravelDefinitions[item:getType()] then
		local recipeB = ClothingUnravelDefinitions[item:getType()]
        local materialsB = luautils.split(recipeB.materials, ":");
		maxTime = tonumber(materialsB[2]) * 20;
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
		if ZombRand(3) == 0 then
			player:getXp():AddXP(Perks.Tailoring, 1);
		end
	end
end

function Give1TailoringXP(recipe, ingredients, result, player)
    if ZombRand(3) == 0 then
		player:getXp():AddXP(Perks.Tailoring, 1);
	end
end

function Give3TailoringXP(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Tailoring, 3);
end

function Give5TailoringXP(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Tailoring, 5);
end

function TieMTAnimal_OnCreate(items, result, player)
    local animal = nil;
    for i=0,items:size() - 1 do
        if instanceof(items:get(i), "Food") then
            animal = items:get(i);
            break;
        end
    end
    if animal then
		result:getModData().Bhung = animal:getBaseHunger();
		result:getModData().hung = animal:getHungChange();
		result:getModData().bweight = animal:getActualWeight();
		
		result:setAge(animal:getAge());
		result:setCarbohydrates(animal:getCarbohydrates());
        result:setLipids(animal:getLipids());
        result:setProteins(animal:getProteins());
        result:setCalories(animal:getCalories());
        result:setActualWeight((animal:getActualWeight() * 0.2));
        result:setWeight(result:getActualWeight());
        result:setCustomWeight(true)
    end
end

function UnTieMTAnimal_OnCreate(items, result, player)
    local animal = nil;
    for i=0,items:size() - 1 do
        if instanceof(items:get(i), "Food") then
            animal = items:get(i);
            break;
        end
    end
    if animal then
		result:setBaseHunger(animal:getModData().Bhung);
        result:setHungChange(animal:getModData().hung);
		result:setCarbohydrates(animal:getCarbohydrates());
        result:setLipids(animal:getLipids());
        result:setProteins(animal:getProteins());
        result:setCalories(animal:getCalories());
		result:setAge(animal:getAge());
        result:setActualWeight(animal:getModData().bweight);
        result:setWeight(result:getActualWeight());
        result:setCustomWeight(true);
        player:getInventory():AddItems("Base.Rope", 4)
    end
end

function TieAnimal_TestIsValid(sourceItem, result)
    if instanceof(sourceItem, "Food") then
		local notrotten = false;
		if sourceItem:getAge() <= sourceItem:getScriptItem():getDaysTotallyRotten() then
			notrotten = true;
		end
        return sourceItem:getActualWeight() >= 50 and notrotten;
    end
    return true
end

function AnimalRugs_TestIsValid(sourceItem, result)
    if sourceItem:getFullType() == "Base.CowSkin" 
	  or sourceItem:getFullType() == "Base.DeerSkin" 
	  or sourceItem:getFullType() == "Base.BearSkin" then
		local data = sourceItem:getModData();
		if data.dry then
			return data.dry == 1;
		else
			return false;
		end
    end
    return true
end

function DepostarMTAnimal_OnCreate(items, result, player)
    local animal = nil;
    for i=0,items:size() - 1 do
        if instanceof(items:get(i), "Food") then
            animal = items:get(i);
            break;
        end
    end
    if animal then
		local weightchange = animal:getActualWeight();
		if animal:getType() == "ChickenDead" then
			--player:getInventory():AddItems("Base.Feather", ZombRand(5,16))
			weightchange = weightchange * 0.9;
		elseif animal:getType() == "DeadCow" then
			player:getInventory():AddItem("Base.RawCowSkin")
			weightchange = weightchange - 20;
		elseif animal:getType() == "DeadDeer" then
			player:getInventory():AddItem("Base.RawDeerSkin")
			weightchange = weightchange - 15;
		elseif animal:getType() == "DeadBear" then
			player:getInventory():AddItem("Base.RawBearSkin")
			weightchange = weightchange - 30;
		elseif animal:getType() == "DeadSheep" then
			--player:getInventory():AddItem("Base.RawBearSkin")
			weightchange = weightchange - 20;
		else
			weightchange = weightchange * 0.9;
		end
        result:setBaseHunger(animal:getBaseHunger() + 0.02);
        result:setHungChange(animal:getBaseHunger() + 0.02);
        result:setActualWeight(weightchange)
        result:setWeight(result:getActualWeight());
        result:setCustomWeight(true)
        result:setCarbohydrates(animal:getCarbohydrates() * 0.8);
        result:setLipids(animal:getLipids() * 0.8);
        result:setProteins(animal:getProteins() * 0.8);
        result:setCalories(animal:getCalories() * 0.8);
		result:setCooked(animal:isCooked());
		result:setAge(animal:getAge());
		result:setBurnt(animal:isBurnt());
    end
end

function Tenderize_Meat_OnCreate(items, result, player)
	local meat = nil;
    for i=0,items:size() - 1 do
        if instanceof(items:get(i), "Food") then
            meat = items:get(i);
            break;
        end
    end
    if meat then
		local perklvl = player:getPerkLevel(Perks.Cooking)
		local val = 1 + (0.05 * perklvl);
--        local hunger = math.max(animal:getBaseHunger(), animal:getHungChange())
		result:setName((getItemNameFromFullType(meat:getFullType())) .. " " .. getText("IGUI_Chopped"));
		local notrotten = false;
		if meat:getAge() <= meat:getScriptItem():getDaysTotallyRotten() then
			notrotten = true;
		end
		if meat:isCooked() == true or notrotten or meat:isBurnt() == true then
			result:setCooked(meat:isCooked());
			result:setAge(meat:getAge());
			result:setBurnt(meat:isBurnt());
			result:setActualWeight(meat:getActualWeight())
			result:setWeight(result:getActualWeight());
			result:setCustomWeight(true)
		else
			result:setBaseHunger(meat:getHungChange() * val);
			result:setHungChange(meat:getHungChange() * val);
			result:setBoredomChange(meat:getBoredomChange() * (0.5 - (0.05 * perklvl)))
			result:setUnhappyChange(meat:getUnhappyChange() * (0.5 - (0.05 * perklvl)))
			result:setActualWeight(meat:getActualWeight())
			result:setWeight(result:getActualWeight());
			result:setCustomWeight(true)
			result:setCarbohydrates(meat:getCarbohydrates() * val);
			result:setLipids(meat:getLipids() * val);
			result:setProteins(meat:getProteins() * val);
			result:setCalories(meat:getCalories() * val);
			result:setCooked(meat:isCooked());
			result:setAge(meat:getAge());
			result:setBurnt(meat:isBurnt());
		end
		if result:getTooltip() ~= nil then
			result:setTooltip(getText("Tooltip_AlreadyChopped"))
		end
		local Data = result:getModData();
		if not Data.Tenderize then
			Data.Tenderize = "1";
		end
	end
end

function Tenderize_TestIsValid(sourceItem, result)
    if instanceof(sourceItem, "Food") then
		local Data = sourceItem:getModData();
        return not Data.Tenderize;
    end
    return true
end

function CutMTAnimal_OnCreate(items, result, player)
	local addType = "farming.Bacon"
	local addType2 = "Base.Ham"
	local addType3 = "Base.HogCasings"
	local addType4 = "Base.Tendon"
    local animal = nil;
    for i=0,items:size() - 1 do
        if instanceof(items:get(i), "Food") then
            animal = items:get(i);
            break;
        end
    end

    if animal then
--        local hunger = math.max(animal:getBaseHunger(), animal:getHungChange())
		player:getInventory():AddItem("Base.BoarHead")
        result:setBaseHunger(animal:getHungChange() / 4);
        result:setHungChange(animal:getHungChange() / 4);
        result:setActualWeight((animal:getActualWeight() * 0.9) / 55)
        result:setWeight(result:getActualWeight());
        result:setCustomWeight(true)
		result:setCooked(animal:isCooked());
		result:setAge(animal:getAge());
		result:setBurnt(animal:isBurnt());
		for i=1,5 do
			local item = InventoryItemFactory.CreateItem(addType);		
			item:setBaseHunger(animal:getHungChange() / 6);
			item:setHungChange(animal:getHungChange() / 6);
			item:setActualWeight((animal:getActualWeight() * 0.9) / 75)
			item:setWeight(result:getActualWeight());
			item:setCustomWeight(true)
			item:setCooked(animal:isCooked());
			item:setAge(animal:getAge());
			item:setBurnt(animal:isBurnt());

			player:getInventory():AddItem(item)
		end
		for i=1,2 do
			local item2 = InventoryItemFactory.CreateItem(addType2);
			item2:setBaseHunger(animal:getHungChange() / 2);
			item2:setHungChange(animal:getHungChange() / 2);
			item2:setActualWeight((animal:getActualWeight() * 0.9) / 65)
			item2:setWeight(result:getActualWeight());
			item2:setCustomWeight(true)
			item2:setCooked(animal:isCooked());
			item2:setAge(animal:getAge());
			item2:setBurnt(animal:isBurnt());
			player:getInventory():AddItem(item2)
		end

		local item3 = InventoryItemFactory.CreateItem(addType3);
        item3:setBaseHunger(animal:getHungChange() / 4);
        item3:setHungChange(animal:getHungChange() / 4);
        item3:setActualWeight((animal:getActualWeight() * 0.9) / 75)
        item3:setWeight(result:getActualWeight());
        item3:setCustomWeight(true)
		item3:setCooked(animal:isCooked());
		item3:setAge(animal:getAge());
		item3:setBurnt(animal:isBurnt());
        player:getInventory():AddItem(item3);

		local item4 = InventoryItemFactory.CreateItem(addType4);
        player:getInventory():AddItems(item4, 4);

    end
end

function CutMTBisonAnimal_OnCreate(items, result, player)
	local addType = "Base.HogCasings"
	local addType2 = "Base.Bisonribs"
	local addType3 = "Base.Tendon"
    local animal = nil;
    for i=0,items:size() - 1 do
        if instanceof(items:get(i), "Food") then
            animal = items:get(i);
            break;
        end
    end
    if animal then
		player:getInventory():AddItem("Base.BisonHead")
--        local hunger = math.max(animal:getBaseHunger(), animal:getHungChange())
        result:setBaseHunger(animal:getHungChange() / 5);
        result:setHungChange(animal:getHungChange() / 5);
        result:setActualWeight((animal:getActualWeight() * 0.9) / 55)
        result:setWeight(result:getActualWeight());
        result:setCustomWeight(true)
		result:setCooked(animal:isCooked());
		result:setAge(animal:getAge());
		result:setBurnt(animal:isBurnt());
		for i=1,5 do
			local item = InventoryItemFactory.CreateItem(addType);		
			item:setBaseHunger(animal:getHungChange() / 6);
			item:setHungChange(animal:getHungChange() / 6);
			item:setActualWeight((animal:getActualWeight() * 0.9) / 75)
			item:setWeight(result:getActualWeight());
			item:setCustomWeight(true)
			item:setCooked(animal:isCooked());
			item:setAge(animal:getAge());
			item:setBurnt(animal:isBurnt());

			player:getInventory():AddItem(item)
		end
		for i=1,2 do
			local item2 = InventoryItemFactory.CreateItem(addType2);		
			item2:setCooked(animal:isCooked());
			item2:setAge(animal:getAge());
			item2:setBurnt(animal:isBurnt());
			player:getInventory():AddItem(item2)
		end

		local item3 = InventoryItemFactory.CreateItem(addType3);
        player:getInventory():AddItems(item3, 4)

    end
end

function CutMTCowAnimal_OnCreate(items, result, player)
	local addType = "Base.HogCasings"
	local addType2 = "Base.Cowribs"
	local addType3 = "Base.Tendon"
    local animal = nil;
    for i=0,items:size() - 1 do
        if instanceof(items:get(i), "Food") then
            animal = items:get(i);
            break;
        end
    end
    if animal then
		player:getInventory():AddItem("Base.CowHead")
--        local hunger = math.max(animal:getBaseHunger(), animal:getHungChange())
        result:setBaseHunger(animal:getHungChange() / 5);
        result:setHungChange(animal:getHungChange() / 5);
        result:setActualWeight((animal:getActualWeight() * 0.9) / 55)
        result:setWeight(result:getActualWeight());
        result:setCustomWeight(true)
		result:setCooked(animal:isCooked());
		result:setAge(animal:getAge());
		result:setBurnt(animal:isBurnt());
		for i=1,5 do
			local item = InventoryItemFactory.CreateItem(addType);		
			item:setBaseHunger(animal:getHungChange() / 6);
			item:setHungChange(animal:getHungChange() / 6);
			item:setActualWeight((animal:getActualWeight() * 0.9) / 75)
			item:setWeight(result:getActualWeight());
			item:setCustomWeight(true)
			item:setCooked(animal:isCooked());
			item:setAge(animal:getAge());
			item:setBurnt(animal:isBurnt());

			player:getInventory():AddItem(item)
		end
		for i=1,2 do
			local item2 = InventoryItemFactory.CreateItem(addType2);		
			item2:setCooked(animal:isCooked());
			item2:setAge(animal:getAge());
			item2:setBurnt(animal:isBurnt());

			player:getInventory():AddItem(item2)
		end

		local item3 = InventoryItemFactory.CreateItem(addType3);		
        player:getInventory():AddItems(item3, 6)

    end
end

function CutMTMooseAnimal_OnCreate(items, result, player)
    local animal = nil;
    for i=0,items:size() - 1 do
        if instanceof(items:get(i), "Food") then
            animal = items:get(i);
            break;
        end
    end
    if animal then
--        local hunger = math.max(animal:getBaseHunger(), animal:getHungChange())
		player:getInventory():AddItem("Base.MooseHead")
        result:setBaseHunger(animal:getHungChange() / 5);
        result:setHungChange(animal:getHungChange() / 5);
        result:setActualWeight((animal:getActualWeight() * 0.9) / 55)
        result:setWeight(result:getActualWeight());
        result:setCustomWeight(true)
		result:setCooked(animal:isCooked());
		result:setAge(animal:getAge());
		result:setBurnt(animal:isBurnt());
    end
end

function CutMTBearAnimal_OnCreate(items, result, player)
    local animal = nil;
    for i=0,items:size() - 1 do
        if instanceof(items:get(i), "Food") then
            animal = items:get(i);
            break;
        end
    end
    if animal then
--        local hunger = math.max(animal:getBaseHunger(), animal:getHungChange())
		player:getInventory():AddItem("Base.BearHead")
        result:setBaseHunger(animal:getHungChange() / 5);
        result:setHungChange(animal:getHungChange() / 5);
        result:setActualWeight((animal:getActualWeight() * 0.9) / 55)
        result:setWeight(result:getActualWeight());
        result:setCustomWeight(true)
		result:setCooked(animal:isCooked());
		result:setAge(animal:getAge());
		result:setBurnt(animal:isBurnt());
    end
end

function CutMTDeerAnimal_OnCreate(items, result, player)
    local animal = nil;
	local addType = "Base.HogCasings"
	local addType2 = "Base.Tendon"
    for i=0,items:size() - 1 do
        if instanceof(items:get(i), "Food") then
            animal = items:get(i);
            break;
        end
    end
    if animal then
--        local hunger = math.max(animal:getBaseHunger(), animal:getHungChange())
--        result:setBaseHunger(animal:getHungChange() / 5);
--        result:setHungChange(animal:getHungChange() / 5);
		player:getInventory():AddItem("Base.DeerHead")
        result:setActualWeight((animal:getActualWeight() * 0.9) / 20)
        result:setWeight(result:getActualWeight());
        result:setCustomWeight(true)
		result:setCooked(animal:isCooked());
		result:setAge(animal:getAge());
		result:setBurnt(animal:isBurnt());
		for i=1,5 do
			local item = InventoryItemFactory.CreateItem(addType);		
			item:setBaseHunger(animal:getHungChange() / 6);
			item:setHungChange(animal:getHungChange() / 6);
			item:setActualWeight((animal:getActualWeight() * 0.9) / 75)
			item:setWeight(result:getActualWeight());
			item:setCustomWeight(true)
			item:setCooked(animal:isCooked());
			item:setAge(animal:getAge());
			item:setBurnt(animal:isBurnt());
			player:getInventory():AddItem(item)
		end

		local item3 = InventoryItemFactory.CreateItem(addType2);		

        player:getInventory():AddItems(item3, 6)
    end
end

function CutMTChicken_OnCreate(items, result, player)
	local addType = "Base.Chickenchest"
	local addType2 = "Base.ChickenWing"
    local animal = nil;
    for i=0,items:size() - 1 do
        if instanceof(items:get(i), "Food") then
            animal = items:get(i);
            break;
        end
    end
    if animal then
		local cooked = animal:isCooked();
		local age = animal:getAge();
		local burnt = animal:isBurnt();
		for i=1,2 do
			local item = InventoryItemFactory.CreateItem(addType);		
			item:setBaseHunger(animal:getHungChange() / 2);
			item:setHungChange(animal:getHungChange() / 2);
			item:setActualWeight((animal:getActualWeight() * 0.9) / 10)
			item:setWeight(result:getActualWeight());
			item:setCustomWeight(true)
			item:setCooked(cooked);
			item:setBurnt(burnt);
			item:setAge(age);
			player:getInventory():AddItem(item)
		end
		
		for i=1,2 do
			local item2 = InventoryItemFactory.CreateItem(addType2);
			item2:setBaseHunger(animal:getHungChange() / 4);
			item2:setHungChange(animal:getHungChange() / 4);
			item2:setActualWeight((animal:getActualWeight() * 0.9) / 15)
			item2:setWeight(result:getActualWeight());
			item2:setCustomWeight(true)
			item2:setCooked(cooked);
			item2:setBurnt(burnt);
			item2:setAge(age);
			player:getInventory():AddItem(item2)
		end


        result:setBaseHunger(animal:getHungChange() / 2);
        result:setHungChange(animal:getHungChange() / 2);
        result:setActualWeight((animal:getActualWeight() * 0.9) / 10)
        result:setWeight(result:getActualWeight());
        result:setCustomWeight(true)
		result:setCooked(cooked);
		result:setAge(age);
		result:setBurnt(burnt);
    end
end

function CutMTSheepAnimal_OnCreate(items, result, player)
    local animal = nil;
	local addType = "Base.HogCasings"
	local addType2 = "Base.Tendon"
    for i=0,items:size() - 1 do
        if instanceof(items:get(i), "Food") then
            animal = items:get(i);
            break;
        end
    end
    if animal then
--        local hunger = math.max(animal:getBaseHunger(), animal:getHungChange())
--        result:setBaseHunger(animal:getHungChange() / 5);
--        result:setHungChange(animal:getHungChange() / 5);
		--player:getInventory():AddItem("Base.DeerHead")
        result:setActualWeight((animal:getActualWeight() * 0.9) / 20)
        result:setWeight(result:getActualWeight());
        result:setCustomWeight(true)
		result:setCooked(animal:isCooked());
		result:setAge(animal:getAge());
		result:setBurnt(animal:isBurnt());
		for i=1,5 do
			local item = InventoryItemFactory.CreateItem(addType);		
			item:setBaseHunger(animal:getHungChange() / 6);
			item:setHungChange(animal:getHungChange() / 6);
			item:setActualWeight((animal:getActualWeight() * 0.9) / 75)
			item:setWeight(result:getActualWeight());
			item:setCustomWeight(true)
			item:setCooked(animal:isCooked());
			item:setAge(animal:getAge());
			item:setBurnt(animal:isBurnt());
		
			player:getInventory():AddItem(item)
		end


		local item3 = InventoryItemFactory.CreateItem(addType2);		

        player:getInventory():AddItems(item3, 6)
    end
end


function Cutcowribs_OnCreate(items, result, player)
    local ribs = nil;
    for i=0,items:size() - 1 do
        if instanceof(items:get(i), "Food") then
            ribs = items:get(i);
            break;
        end
    end
    if ribs then
        local hunger = math.max(ribs:getBaseHunger(), ribs:getHungChange())
        result:setBaseHunger(hunger / 4);
        result:setHungChange(hunger / 4);
        result:setActualWeight((ribs:getActualWeight() * 0.9) / 4)
        result:setWeight(result:getActualWeight());
        result:setCustomWeight(true)
        result:setCarbohydrates(ribs:getCarbohydrates() / 4);
        result:setLipids(ribs:getLipids() / 4);
        result:setProteins(ribs:getProteins() / 4);
        result:setCalories(ribs:getCalories() / 4);
        result:setCooked(ribs:isCooked());
		if result:isCooked() == true then
			result:setUnhappyChange(-5);
		end
    end
end

function OnTakesomethread_OnCreate(items,result,player)
    for i=0,items:size() - 1 do
        if items:get(i):getType() == "Skirt" or items:get(i):getType() == "ShortsLong" or items:get(i):getType() == "Trousers" then
			if ZombRand(2) == 0 then
				--nothing
			else 
				player:getInventory():AddItems("Base.ThreadPieces", ZombRand(1,4));
			end
        end
    end
end

function OnTakesometwine_OnCreate(items,result,player)
    for i=0,items:size() - 1 do
        if items:get(i):getType() == "Jacket" 
		  or items:get(i):getType() == "Blouse" 
		  or items:get(i):getType() == "PaddedJacket" 
		  or items:get(i):getType() == "PaddedTrousers" then
			if ZombRand(2) == 0 then
				--nothing
			else 
				player:getInventory():AddItems("Base.String", ZombRand(1,4));
			end
        end
    end
end

function Untiebranch_OnCreate(items,result,player)
    for i=0,items:size() - 1 do
		if items:get(i):getType() == "BranchPack"
		  or items:get(i):getType() == "TwigsPack" then
			player:getInventory():AddItems("Base.ThreadPieces", 3);
		end
	end
end

function EKScarvxp1(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.PlantScavenging, 1);
end

function EKScarvxp3(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.PlantScavenging, 3);
end

function GiveBowXP(recipe, ingredients, result, player)
    if player:getPerkLevel(Perks.Woodwork) <= 5 then
        player:getXp():AddXP(Perks.Woodwork, 10);
    else
        player:getXp():AddXP(Perks.Woodwork, 5);
    end
end

function GiveNimbleXP(recipe, ingredients, result, player)
    if player:getPerkLevel(Perks.Nimble) <= 5 then
        player:getXp():AddXP(Perks.Nimble, 10);
    else
        player:getXp():AddXP(Perks.Nimble, 5);
    end
end

function GiveNimble1XP(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Nimble, 1);
end

function MakeSlingshot_OnCreate(items, result, player)
    if result then
		local Data = result:getModData();
		if not Data.SlingshotDurability then
			Data.SlingshotDurability = 100;
		end
	end
end

function DestroyPillow_OnCreate(items, result, player)
	player:getInventory():AddItems("Base.Sheet", 2);
	local item2 = InventoryItemFactory.CreateItem("Base.Thread");
	item2:setUsedDelta(0.2);
	player:getInventory():AddItem(item2);
end

function sharpening_TestIsValid(sourceItem, result)
    if sourceItem:getFullType() == "Base.ButterKnife" or
	  sourceItem:getFullType() == "Base.KitchenKnife" or
	  sourceItem:getFullType() == "Base.HuntingKnife" or
	  sourceItem:getFullType() == "Base.MeatCleaver" or
	  sourceItem:getFullType() == "Base.KnifeDepostador" then
		return sourceItem:getCondition() > 0 and sourceItem:getCondition() ~= sourceItem:getConditionMax();
    end
    return true
end

function Sharpening_OnCreate(items,result,player)
    for i=0,items:size() - 1 do
        if items:get(i):getType() == "ButterKnife" or
		  items:get(i):getType() == "KitchenKnife" or
		  items:get(i):getType() == "HuntingKnife" or
		  items:get(i):getType() == "MeatCleaver" or
		  items:get(i):getType() == "KnifeDepostador" then
			local condition = items:get(i):getCondition();
			local chance = items:get(i):getConditionLowerChance();
			if condition > 0 then
				if chance <= 10 then
					if ZombRand(chance*5) == 0 then
						result:setCondition(condition + 1)
					end
				else
					if ZombRand(math.floor(chance/2)) == 0 then
						result:setCondition(condition + 1)
					end
				end
			end
        end
    end
end