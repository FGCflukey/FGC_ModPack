function OnEat_Gum(food, character)
    if character:HasTrait("Smoker") then
        character:getBodyDamage():setUnhappynessLevel(character:getBodyDamage():getUnhappynessLevel() - 2);
        if character:getBodyDamage():getUnhappynessLevel() < 0 then
            character:getBodyDamage():setUnhappynessLevel(0);
        end
        character:getStats():setStress(character:getStats():getStress() - 2);
        if character:getStats():getStress() then
            character:getStats():setStress(0);
        end
        character:getStats():setStressFromCigarettes(0);
        --character:setTimeSinceLastSmoke(0);
    else
    end
end

function OnEat_Tobacco(food, character)
    if character:HasTrait("Smoker") then
        character:getBodyDamage():setUnhappynessLevel(character:getBodyDamage():getUnhappynessLevel() - 5);
        if character:getBodyDamage():getUnhappynessLevel() < 0 then
            character:getBodyDamage():setUnhappynessLevel(0);
        end
        character:getStats():setStress(character:getStats():getStress() - 5);
        if character:getStats():getStress() then
            character:getStats():setStress(0);
        end
        character:getStats():setStressFromCigarettes(0);
        character:setTimeSinceLastSmoke(0);
		character:getBodyDamage():setFoodSicknessLevel(character:getBodyDamage():getFoodSicknessLevel() + 1);
        if character:getBodyDamage():getFoodSicknessLevel() > 100 then
            character:getBodyDamage():setFoodSicknessLevel(100);
        end
    else
        character:getBodyDamage():setFoodSicknessLevel(character:getBodyDamage():getFoodSicknessLevel() + 14);
        if character:getBodyDamage():getFoodSicknessLevel() > 100 then
            character:getBodyDamage():setFoodSicknessLevel(100);
        end
    end
end

function LgGrindCoffee_TestIsValid(sourceItem, result)
    if sourceItem:getFullType() == "Base.CoffeePan" then
        return sourceItem:isCooked()
    end
    return true
end

function LgTakeCoffee_OnCreate(items,result,player)
    for i=0,items:size() - 1 do
        if items:get(i):getType() == "CoffeePan" then
			result:setBaseHunger(items:get(i):getHungChange());
            result:setHungChange(items:get(i):getHungChange());
			result:setThirstChange(items:get(i):getThirstChange());
			result:setBoredomChange(items:get(i):getBoredomChange())
			result:setUnhappyChange(items:get(i):getUnhappyChange())
			result:setFatigueChange(items:get(i):getFatigueChange());
			player:getInventory():AddItem("Base.BakingPan");
        end
    end
end

function ReturnCubeboxEmpty_OnCreate(items,result,player)
	player:getInventory():AddItem("Base.CubeboxEmpty");
end

function LGGrindCoffee_OnCreate(items,result,player)
    for i=0,items:size() - 1 do
        if items:get(i):getType() == "CoffeePan" then
			result:setBaseHunger(result:getBaseHunger() + (result:getBaseHunger()/2));
            result:setHungChange(result:getHungChange() + (result:getHungChange()/2));
			result:setFatigueChange(result:getFatigueChange() + (result:getFatigueChange()/2));
			player:getInventory():AddItem("Base.BakingPan");
        end
    end
end

function AddDryData_OnCreate(items,result,player)
    for i=0,items:size() - 1 do
        if items:get(i):getType() == "DrySugarcane" then
			local itemdata = result:getModData();
			if not itemdata.dry then
				itemdata.dry = 1;
			end
        end
    end
end

function CheeseFinish_TestIsValid(sourceItem, result)
    if sourceItem:getFullType() == "Base.CheeseMoldFull" 
	  or sourceItem:getFullType() == "Base.CheeseMoldFull2"
	  or sourceItem:getFullType() == "Base.CheeseMoldFull3" then
		local notrotten = false;
		if sourceItem:getAge() <= sourceItem:getScriptItem():getDaysTotallyRotten() then
			notrotten = true;
		end
		local itemdata = sourceItem:getModData();
		if itemdata.dry then
			return itemdata.dry == 1 and (notrotten);
		end
    end
    return true
end

function LgCanned_TestIsValid(sourceItem, result)
    if sourceItem:getFullType() == "Base.HuntingKnife" 
	  or sourceItem:getFullType() == "Base.KitchenKnife" 
	  or sourceItem:getFullType() == "Base.Screwdriver" 
	  or sourceItem:getFullType() == "Base.Axe" then
	  local player = getSpecificPlayer(0);
	  local backpack = player:getClothingItem_Back();
	  if (player and player:getInventory():contains("TinOpener")) or (player and backpack and player:getClothingItem_Back():getCategory() == "Container" and player:getClothingItem_Back():getItemContainer():contains("TinOpener")) then return false end
	  else return sourceItem:getCondition() > 0 end
    return true
end

function LGOpenCannedFood2_OnCreate(items, result, player)
	local perk = player:getPerkLevel(Perks.Nimble);
	local number = 5 - perk;
	if number <= 0 then
		number = 1;
	end
	local totalpercent = 25;
	local variable = 0;
	if perk > 0 then
		variable = perk * 2
		totalpercent = totalpercent - variable;
	end
	if player:HasTrait("Unlucky") then
		totalpercent = totalpercent + 15;
	elseif player:HasTrait("Lucky") then
		totalpercent = totalpercent - 15;
	end
	if totalpercent <= 0 then
		totalpercent = 0;
	end
	if ZombRand(1, 101) <= totalpercent then
		if ZombRand(2) == 0 then
            player:getBodyDamage():getBodyPart(BodyPartType.Hand_L):SetScratchedWeapon(true);
        else
            player:getBodyDamage():getBodyPart(BodyPartType.Hand_R):SetScratchedWeapon(true);
        end
		player:getEmitter():playSound("zombiescratch");
	end
    for i=0,items:size() - 1 do
        if items:get(i):getType() == "TinnedSoup" 
		  or items:get(i):getType() == "TinnedBeans" 
		  or items:get(i):getType() == "Dogfood" 
		  or items:get(i):getType() == "TunaTin" 
		  or items:get(i):getType() == "CannedCorn" 
		  or items:get(i):getType() == "CannedBolognese" 
		  or items:get(i):getType() == "CannedChili" 
		  or items:get(i):getType() == "CannedMushroomSoup" 
		  or items:get(i):getType() == "CannedPeas" 
		  or items:get(i):getType() == "CannedPotato2" 
		  or items:get(i):getType() == "CannedTomato2" 
		  or items:get(i):getType() == "CannedCarrots2" 
		  or items:get(i):getType() == "CannedFruitCocktail" 
		  or items:get(i):getType() == "CannedPeaches" 
		  or items:get(i):getType() == "CannedPineapple" then
			result:setBaseHunger(result:getBaseHunger() / number);
            result:setHungChange(result:getHungChange() / number);
            result:setThirstChange(result:getThirstChange() / number);
            result:setBoredomChange(result:getBoredomChange() / number);
            result:setUnhappyChange(result:getUnhappyChange() / number);
            result:setCarbohydrates(result:getCarbohydrates() / number);
            result:setLipids(result:getLipids() / number);
            result:setProteins(result:getProteins() / number);
            result:setCalories(result:getCalories() / number);
        end
		if items:get(i):getType() == "HuntingKnife" or
		  items:get(i):getType() == "KitchenKnife" or
		  items:get(i):getType() == "Screwdriver" or
		  items:get(i):getType() == "Screwdriver" then
		    if ZombRand(items:get(i):getConditionLowerChance() + player:getMaintenanceMod() * 2) == 0 then
		        items:get(i):setCondition(items:get(i):getCondition() - 1);
		    else
			    player:getXp():AddXP(Perks.Maintenance, 1);
		    end
		end
    end
end

function OpenCannedFoodOlives_OnCreate(items, result, player)
	for i=0,items:size() - 1 do
		if items:get(i):getType() == "JarOlives2" then
			local jar = items:get(0);
			local aged = jar:getAge() / jar:getOffAgeMax();
			result:setAge(result:getOffAgeMax() * aged);
		end
	end
	
	player:getInventory():AddItem("Base.EmptyJar");
    player:getInventory():AddItem("Base.JarLid");

--    print("you're new food have age " .. result:getAge());
end

function OpenCannedFoodOlives2_OnCreate(items, result, player)
	for i=0,items:size() - 1 do
		if items:get(i):getType() == "JarOlives4" then
			local jar = items:get(0);
			local aged = jar:getAge() / jar:getOffAgeMax();
			result:setAge(result:getOffAgeMax() * aged);
		end
	end
	
	player:getInventory():AddItem("Base.EmptyJar");
    player:getInventory():AddItem("Base.JarLid");

--    print("you're new food have age " .. result:getAge());
end

function LGReturnCork(items, result, player)
    player:getInventory():AddItem("Base.Corks");
end

function OnSavePipeCondition(items, result, player)
	for i=0,items:size() - 1 do
		if items:get(i):getType() == "MetalPipe" then
			if result then
				local pipe = items:get(0);
				local data = result:getModData();
				if not data.pipecond then
					data.pipecond = pipe:getCondition();
				end
			end
		end
	end
end

function Ontakepipe(items, result, player)
	for i=0,items:size() - 1 do
		if items:get(i):getType() == "ElectricMeatMincerS" then
			local mincer = items:get(0);
			local data = mincer:getModData();
			local item = InventoryItemFactory.CreateItem("Base.MetalPipe");	
			if data.pipecond then
				item:setCondition(data.pipecond);
			end
			player:getInventory():AddItem(item);
		end
	end
end

function LGNoExpGain(recipe, ingredients, result, player)
	-- Intencionalmente esta funcion no hace nada.
end

function LG_ThreeXP_Cooking(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Cooking, 3);
end

function OneFarmXP_OnGiveXP(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Farming, 1);
end

function OnmakePatty(items, result, player)
    for i=0,items:size() - 1 do
        if items:get(i):getType() == "Choppedmeat" then
            result:setBaseHunger(items:get(i):getHungChange() / 2);
            result:setHungChange(items:get(i):getHungChange() / 2);
            result:setThirstChange(items:get(i):getThirstChange() / 2);
            result:setUnhappyChange(items:get(i):getUnhappyChange() / 2);
            result:setBoredomChange(items:get(i):getBoredomChange() / 2);
            result:setCarbohydrates(items:get(i):getCarbohydrates() / 2);
            result:setLipids(items:get(i):getLipids() / 2);
            result:setProteins(items:get(i):getProteins() / 2);
            result:setCalories(items:get(i):getCalories() / 2);
            result:setCooked(items:get(i):isCooked());
			result:setAge(items:get(i):getAge());
			result:setBurnt(items:get(i):isBurnt());
        end
    end
end

function SliceCupcake_OnCreate(items, result, player)
    for i=0,items:size() - 1 do
        if items:get(i):getType() == "CupcakeRaw" then
            result:setBaseHunger(items:get(i):getBaseHunger() / 6);
            result:setHungChange(items:get(i):getBaseHunger() / 6);
        end
    end
    player:getInventory():AddItem("Base.RoastingPan");
end

function SliceChocolate_OnCreate(items, result, player)
    for i=0,items:size() - 1 do
        if items:get(i):getType() == "Chocolate" then
            result:setBaseHunger(items:get(i):getBaseHunger() / 10);
            result:setHungChange(items:get(i):getHungChange() / 10);
			result:setCarbohydrates(items:get(i):getCarbohydrates() / 10);
			result:setLipids(items:get(i):getLipids() / 10);
			result:setProteins(items:get(i):getProteins() / 10);
			result:setCalories(items:get(i):getCalories() / 10);
        end
    end
end

function OnPutCupCakeBatterInRoasting(items,result,player)
    for i=0,items:size() - 1 do
        if items:get(i):getType() == "CupcakeBatter" then
            result:setBaseHunger(items:get(i):getBaseHunger() * 12);
            result:setHungChange(items:get(i):getBaseHunger() * 12);
        end
    end
    player:getInventory():AddItem("Base.Bowl");
end

function Returnsheetrope_OnCreate(items,result,player)
    player:getInventory():AddItems("Base.SheetRope", 2);
end

function ReturnBowl_OnCreate(items,result,player)
    player:getInventory():AddItem("Base.Bowl");
end

function Butter_OnCreate(items,result,player)
    for i=0,items:size() - 1 do
        if items:get(i):getType() == "MilkCream" then
            result:setCooked(items:get(i):isCooked());
			result:setAge(items:get(i):getAge());
			result:setBurnt(items:get(i):isBurnt());
        end
    end
    player:getInventory():AddItem("Base.Bowl");
end

function putpeasinpackets_OnCreate(items,result,player)
    for i=0,items:size() - 1 do
        if items:get(i):getType() == "Peas2" then
            result:setBaseHunger(items:get(i):getHungChange() * 2);
            result:setHungChange(items:get(i):getHungChange() * 2);
			result:setAge(items:get(i):getAge());
        end
    end
end

function OnPutChickenInPan(items,result,player)
    for i=0,items:size() - 1 do
        if items:get(i):getType() == "Chicken" then
			local hunger = math.max(items:get(i):getBaseHunger(), items:get(i):getHungChange())
            result:setBaseHunger(hunger);
            result:setHungChange(hunger);
        end
    end
end

function OnTakeChickenPan(items,result,player)
    for i=0,items:size() - 1 do
        if items:get(i):getType() == "ChickenPan" then
            result:setBaseHunger(items:get(i):getHungChange());
            result:setHungChange(items:get(i):getHungChange());
			result:setUnhappyChange(items:get(i):getUnhappyChange());
        end
    end
	player:getInventory():AddItem("Base.Pan");
end

function CupCakeBatterOnCreate(items,result,player)
    for i=0,items:size() - 1 do
        if items:get(i):getType() == "Bowl" then
			result:setCarbohydrates(result:getCarbohydrates());
			result:setLipids(result:getLipids());
			result:setProteins(result:getProteins());
			result:setCalories(result:getCalories());
        end
    end
end

function Cupcakerawcooked_TestIsValid(sourceItem, result)
    if sourceItem:getFullType() == "Base.CupcakeRaw" then
        return sourceItem:isCooked()
    end
    return true
end

function marshmallow_TestIsValid(sourceItem, result)
    if sourceItem:getFullType() == "Base.Saucepancaramel" then
        return sourceItem:isCooked()
    end
    return true
end

function ChickenPan_TestIsValid(sourceItem, result)
    if sourceItem:getFullType() == "Base.ChickenPan" then
		local notrotten = false;
		if sourceItem:getAge() <= sourceItem:getScriptItem():getDaysTotallyRotten() then
			notrotten = true;
		end
        return sourceItem:isCooked() or sourceItem:isBurnt() or notrotten;
    end
    return true
end

function riceplantrotten_TestIsValid(sourceItem, result)
    if sourceItem:getFullType() == "Base.RicePlant" then
		local notrotten = false;
		if sourceItem:getAge() <= sourceItem:getScriptItem():getDaysTotallyRotten() then
			notrotten = true;
		end
		return notrotten;
    end
    return true
end

function wheatrotten_TestIsValid(sourceItem, result)
    if sourceItem:getFullType() == "Base.Wheat" then
		local notrotten = false;
		if sourceItem:getAge() <= sourceItem:getScriptItem():getDaysTotallyRotten() then
			notrotten = true;
		end
		return notrotten;
    end
    return true
end

function Cornflour_TestIsValid(sourceItem, result)
    if sourceItem:getFullType() == "Base.Corn" then
		local notrotten = false;
		if sourceItem:getAge() <= sourceItem:getScriptItem():getDaysTotallyRotten() then
			notrotten = true;
		end
		return notrotten;
    end
    return true
end

function Cupcakebatterrotten_TestIsValid(sourceItem, result)
    if sourceItem:getFullType() == "Base.CupcakeBatter" then
		local notrotten = false;
		if sourceItem:getAge() <= sourceItem:getScriptItem():getDaysTotallyRotten() then
			notrotten = true;
		end
		return notrotten;
    end
    return true
end

function tomatorotten_TestIsValid(sourceItem, result)
    if sourceItem:getFullType() == "farming.Tomato" then
		local notrotten = false;
		if sourceItem:getAge() <= sourceItem:getScriptItem():getDaysTotallyRotten() then
			notrotten = true;
		end
		return notrotten;
    end
    return true
end

function tomato2rotten_TestIsValid(sourceItem, result)
    if sourceItem:getFullType() == "Base.CannedTomatoOpen" then
		local notrotten = false;
		if sourceItem:getAge() <= sourceItem:getScriptItem():getDaysTotallyRotten() then
			notrotten = true;
		end
		return notrotten;
    end
    return true
end

function Honeyrotten_TestIsValid(sourceItem, result)
    if sourceItem:getFullType() == "Base.HoneyJar" then
		local notrotten = false;
		if sourceItem:getAge() <= sourceItem:getScriptItem():getDaysTotallyRotten() then
			notrotten = true;
		end
		return notrotten;
    end
    return true
end

function Marinararotten_TestIsValid(sourceItem, result)
    if sourceItem:getFullType() == "Base.HandmadeMarinara" then
		local notrotten = false;
		if sourceItem:getAge() <= sourceItem:getScriptItem():getDaysTotallyRotten() then
			notrotten = true;
		end
		return notrotten;
    end
    return true
end

function Ketchuprotten_TestIsValid(sourceItem, result)
    if sourceItem:getFullType() == "Base.HandmadeKetchup" then
		local notrotten = false;
		if sourceItem:getAge() <= sourceItem:getScriptItem():getDaysTotallyRotten() then
			notrotten = true;
		end
		return notrotten;
    end
    return true
end

function Mustardrotten_TestIsValid(sourceItem, result)
    if sourceItem:getFullType() == "Base.Homemademustard" then
		local notrotten = false;
		if sourceItem:getAge() <= sourceItem:getScriptItem():getDaysTotallyRotten() then
			notrotten = true;
		end
		return notrotten;
    end
    return true
end

function Mayonnaiserotten_TestIsValid(sourceItem, result)
    if sourceItem:getFullType() == "Base.HandmadeMayonnaise" then
		local notrotten = false;
		if sourceItem:getAge() <= sourceItem:getScriptItem():getDaysTotallyRotten() then
			notrotten = true;
		end
		return notrotten;
    end
    return true
end

function PeanutButterrotten_TestIsValid(sourceItem, result)
    if sourceItem:getFullType() == "Base.HMPeanutButter" then
		local notrotten = false;
		if sourceItem:getAge() <= sourceItem:getScriptItem():getDaysTotallyRotten() then
			notrotten = true;
		end
		return notrotten;
    end
    return true
end

function potatorotten_TestIsValid(sourceItem, result)
    if sourceItem:getFullType() == "farming.Potato" then
		local notrotten = false;
		if sourceItem:getAge() <= sourceItem:getScriptItem():getDaysTotallyRotten() then
			notrotten = true;
		end
		return notrotten;
    end
    return true
end

function friespotatorotten_TestIsValid(sourceItem, result)
    if sourceItem:getFullType() == "Base.Potatopan" then
		local notrotten = false;
		if sourceItem:getAge() <= sourceItem:getScriptItem():getDaysTotallyRotten() then
			notrotten = true;
		end
		return notrotten;
    end
    return true
end

function Tomatosauce_TestIsValid(sourceItem, result)
    if sourceItem:getFullType() == "Base.Tomatosauce" then
        return sourceItem:isCooked();
    end
    return true
end

function CutPizza_TestIsValid(sourceItem, result)
    if sourceItem:getFullType() == "Base.PizzaRaw" then
        return sourceItem:isCooked()
    end
    return true
end

function Give1or3CookingXP(recipe, ingredients, result, player)
    if player:getPerkLevel(Perks.Cooking) <= 3 then
        player:getXp():AddXP(Perks.Cooking, 3);
    else
        player:getXp():AddXP(Perks.Cooking, 1);
    end
end

function Give1CookingXP(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Cooking, 1);
end

function Cheeseprep_TestIsValid(sourceItem, result)
    if sourceItem:getFullType() == "Base.SaucepanMilk" then
        return sourceItem:isCooked()
    end
    return true
end

function boilsausages_TestIsValid(sourceItem, result)
    if sourceItem:getFullType() == "Base.Salchicha" then
		local notrotten = false;
		if sourceItem:getAge() <= sourceItem:getScriptItem():getDaysTotallyRotten() then
			notrotten = true;
		end
        return (not sourceItem:isCooked() and not sourceItem:isBurnt() and notrotten)
    end
    return true
end


function TakeCanes_TestIsValid(sourceItem, result)
    if sourceItem:getFullType() == "Base.SugarcanePile" or sourceItem:getFullType() == "Base.SugarcanePileDry" then
		local itemdata = sourceItem:getModData();
		if itemdata.dry then
			return itemdata.dry == 1;
		end
    end
    return true
end

function Hotdog_TestIsValid(sourceItem, result)
    if instanceof(sourceItem, "Food") then
        return sourceItem:isCooked()
    end
    return true
end

function Takefriedpotatos_OnCreate(items, result, player)
    local potato = nil;
    for i=0,items:size() - 1 do
        if instanceof(items:get(i), "Food") then
            potato = items:get(i);
            break;
        end
    end
    if potato then
--        local hunger = math.max(cheese:getBaseHunger(), cheese:getHungChange())
        result:setBaseHunger(potato:getHungChange() / 4);
        result:setHungChange(potato:getHungChange() / 4);
        result:setCarbohydrates(potato:getCarbohydrates() / 4);
        result:setLipids(potato:getLipids() / 4);
        result:setProteins(potato:getProteins() / 4);
        result:setCalories(potato:getCalories() / 4);
		
		player:getInventory():AddItem("Base.Pan");
    end
end

function CutCheese_OnCreate(items, result, player)
    local cheese = nil;
    for i=0,items:size() - 1 do
        if instanceof(items:get(i), "Food") then
            cheese = items:get(i);
            break;
        end
    end
    if cheese then
--        local hunger = math.max(cheese:getBaseHunger(), cheese:getHungChange())
        result:setBaseHunger(cheese:getHungChange() / 10);
        result:setHungChange(cheese:getHungChange() / 10);
        result:setActualWeight(cheese:getActualWeight() / 10)
        result:setWeight(result:getActualWeight());
        result:setCustomWeight(true)
        result:setCarbohydrates(cheese:getCarbohydrates() / 10);
        result:setLipids(cheese:getLipids() / 10);
        result:setProteins(cheese:getProteins() / 10);
        result:setCalories(cheese:getCalories() / 10);
        result:setUnhappyChange(cheese:getUnhappyChange());
        result:setBoredomChange(cheese:getBoredomChange());
    end
end

function CutCheese2_OnCreate(items, result, player)
    local cheese = nil;
    for i=0,items:size() - 1 do
        if instanceof(items:get(i), "Food") then
            cheese = items:get(i);
            break;
        end
    end
    if cheese then
--        local hunger = math.max(cheese:getBaseHunger(), cheese:getHungChange())
        result:setBaseHunger(cheese:getHungChange() / 10);
        result:setHungChange(cheese:getHungChange() / 10);
        result:setActualWeight(cheese:getActualWeight() / 20)
        result:setWeight(result:getActualWeight());
        result:setCustomWeight(true)
        result:setCarbohydrates(cheese:getCarbohydrates() / 10);
        result:setLipids(cheese:getLipids() / 10);
        result:setProteins(cheese:getProteins() / 10);
        result:setCalories(cheese:getCalories() / 10);
        result:setUnhappyChange(cheese:getUnhappyChange());
        result:setBoredomChange(cheese:getBoredomChange());
    end
end

function Returnpotsaucepan_OnCreate(items, result, player)
    player:getInventory():AddItem("Base.Pot");
	player:getInventory():AddItem("Base.Saucepan");
end

function Give20CookingXP(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Cooking, 20);
end

function MakePizza_OnCreate(items, result, player)
	player:getInventory():AddItem("Base.Saucepan");
end

function CutPizza_OnCreate(items, result, player)
	player:getInventory():AddItem("Base.BakingPan");
end

function Returnsaucepan_OnCreate(items, result, player)
	player:getInventory():AddItem("Base.Saucepan");
end

function Returnmugl_OnCreate_OnCreate(items, result, player)
	player:getInventory():AddItem("Base.Mugl");
end

function Returncheesemold_OnCreate(items, result, player)
    local rcheese = nil
    for i=0,items:size() - 1 do
        if items:get(i):getType() == "CheeseMoldFull" then
            rcheese = items:get(i)
            break
        end
    end
	if rcheese then
		result:setBaseHunger(rcheese:getHungChange()* 5);
		result:setHungChange(rcheese:getHungChange()* 5);
	end
    player:getInventory():AddItem("Base.CheeseMoldEmpty");
end

function Returncheesemold2_OnCreate(items, result, player)
	local prklvl = player:getPerkLevel(Perks.Cooking);
    local rcheese2 = nil
    for i=0,items:size() - 1 do
        if items:get(i):getType() == "CheeseMoldFull2" then
            rcheese2 = items:get(i)
            break
        end
    end
	if rcheese2 then
		local Ecnumber = ((prklvl) * (-0.025))
		result:setBaseHunger((rcheese2:getHungChange()* 2) + Ecnumber);
		result:setHungChange((rcheese2:getHungChange()* 2) + Ecnumber);
	end
    player:getInventory():AddItem("Base.CheeseMoldEmpty2");
end

function Returncheesemold3_OnCreate(items, result, player)
	--local prklvl = player:getPerkLevel(Perks.Cooking);
    local rcheese3 = nil
    for i=0,items:size() - 1 do
        if items:get(i):getType() == "CheeseMoldFull3" then
            rcheese3 = items:get(i)
            break
        end
    end
	if rcheese3 then
--		local Ecnumber = ((prklvl) * (-0.025))
--		result:setBaseHunger((rcheese3:getHungChange()* 2) + Ecnumber);
--		result:setHungChange((rcheese3:getHungChange()* 2) + Ecnumber);
		result:setBaseHunger(rcheese3:getHungChange()* 5);
		result:setHungChange(rcheese3:getHungChange()* 5);
	end
    player:getInventory():AddItem("Base.CheeseMoldEmpty3");
end

function Paintcheese_OnCreate(items, result, player)
	local prklvl = player:getPerkLevel(Perks.Cooking);
    local rcheese1 = nil
    for i=0,items:size() - 1 do
        if items:get(i):getType() == "RCheese1" then
            rcheese1 = items:get(i)
            break
        end
    end
	if rcheese1 then
		local Ecnumber = ((prklvl) * (-0.025))
		result:setBaseHunger((rcheese1:getHungChange() * 2) + Ecnumber);
		result:setHungChange((rcheese1:getHungChange() * 2) + Ecnumber);
	end
end

function Onmakepeanutbutter_OnCreate(items, result, player)
	local prklvl = player:getPerkLevel(Perks.Cooking);
	local Ecnumber = ((prklvl) * (-0.025));
	result:setBaseHunger(result:getBaseHunger() + Ecnumber);
	result:setHungChange(result:getHungChange() + Ecnumber);

    player:getInventory():AddItem("Base.MortarPestle");
end

function ReturnJarLid_OnCreate(items, result, player)
    player:getInventory():AddItem("Base.JarLid");
end

function TorchDismantle_OnCreate(items, result, player, selectedItem)
    local success = 50 + (player:getPerkLevel(Perks.Electricity)*5);
	for i=0, items:size()-1 do
		-- En el caso de que el GPS tenga energía restante trasladar la cantidad delta del GPS a su resultante (La Pila)
		if items:get(i):getType() == "Torch" and items:get(i):getUsedDelta() > 0 then
			local item = InventoryItemFactory.CreateItem("Base.Battery");	
			item:setUsedDelta(items:get(i):getUsedDelta());
			
			if isServer() then
				player:sendObjectChange('addItem', { item = item})
			else
				player:getInventory():AddItem(item)
			end
		end
		if ZombRand(0,100)<success then
			player:getInventory():AddItem("Base.LightBulb");
		end
    end
end

function CigarretesPack_OnCreate(items, result, player)
    player:getInventory():AddItem(instanceItem("Base.Cigarettes"));
	player:getInventory():AddItem(instanceItem("Base.Cigarettes"));
	player:getInventory():AddItem(instanceItem("Base.Cigarettes"));
	player:getInventory():AddItem(instanceItem("Base.Cigarettes"));
	player:getInventory():AddItem(instanceItem("Base.Cigarettes"));
	player:getInventory():AddItem(instanceItem("Base.Cigarettes"));
	player:getInventory():AddItem(instanceItem("Base.Cigarettes"));
	player:getInventory():AddItem(instanceItem("Base.Cigarettes"));
	player:getInventory():AddItem(instanceItem("Base.Cigarettes"));
	player:getInventory():AddItem(instanceItem("Base.Cigarettes"));
	player:getInventory():AddItem(instanceItem("Base.Cigarettes"));
	player:getInventory():AddItem(instanceItem("Base.Cigarettes"));
	player:getInventory():AddItem(instanceItem("Base.Cigarettes"));
	player:getInventory():AddItem(instanceItem("Base.Cigarettes"));
	player:getInventory():AddItem(instanceItem("Base.Cigarettes"));
	player:getInventory():AddItem(instanceItem("Base.Cigarettes"));
	player:getInventory():AddItem(instanceItem("Base.Cigarettes"));
	player:getInventory():AddItem(instanceItem("Base.Cigarettes"));
	player:getInventory():AddItem(instanceItem("Base.Cigarettes"));
end

function ReturnCompleteJar_Oncreate(items, result, player)
	player:getInventory():AddItem("Base.EmptyJar");
    player:getInventory():AddItem("Base.JarLid");
end

function CrashBottles_OnCreate(items, result, player)
    --if ZombRand(1,101) <= 10 then -- 10% chance of getting hurt
	--	player:playSound("ZombieScratch", false);
    --    if ZombRand(2) == 0 then --izquierda
	--		local hand = player:getBodyDamage():getBodyPart(BodyPartType.Hand_L);
	--		if ZombRand(1, 101) <= 10 then --10% chance deep hurt
	--			hand:SetScratchedWindow(true);
	--		else
	--			hand:SetScratchedWeapon(true);
	--		end
    --    else --derecha
	--		local hand = player:getBodyDamage():getBodyPart(BodyPartType.Hand_R);
	--		if ZombRand(1, 101) <= 10 then --10% chance deep hurt
	--			hand:SetScratchedWindow(true);
	--		else
	--			hand:SetScratchedWeapon(true);
	--		end
    --    end
    --end

	if ZombRand(1,101) <= 5 then -- 5% chance of getting hurt
		local hand = player:getBodyDamage():getBodyPart(BodyPartType.Hand_L);
		if ZombRand(2) == 0 then --Derecha
			hand = player:getBodyDamage():getBodyPart(BodyPartType.Hand_R);
		end
		--local bleedTime = hand:getBleedingTime();
		if ZombRand(1, 101) <= 10 then --10% chance deep hurt
			--local deepWoundTime = hand:getDeepWoundTime()
			hand:setDeepWoundTime(15);
			hand:setDeepWounded(true);
			hand:setBleedingTime(1.5);
			hand:setBleeding(true);
			if ZombRand(2) == 0 then --Vidrios
				hand:setHaveGlass(true);
			end
		else
			local infected = bodyPart:IsInfected();
			hand:setScratched(true);
			hand:setBleedingTime(1.5);
			hand:setBleeding(true);
			hand:SetInfected(infected);
			if ZombRand(1,11) == 5 then --Vidrios
				hand:setHaveGlass(true);
			end
		end
	end
end

function OnEat_Chili(food, character)
	local bd = character:getBodyDamage();
	local pltemp = bd:getTemperature();
	if pltemp < 40 then
		local temperature = 36;
		if pltemp >= 35 then
			temperature = pltemp + 2;
		else
			temperature = pltemp + 4;
		end
		if temperature >= 39 then
			temperature = 39;
		end
		bd:setTemperature(temperature);
	end
end

function OnEat_IceCubes(food, character)
	local bd = character:getBodyDamage();
	local pltemp = bd:getTemperature();
	if pltemp > 35 then
		local temperature = 36;
		if food:isFrozen() then
			if pltemp >= 37 then
				temperature = pltemp - 1;
			else
				temperature = pltemp - 0.5;
			end
		else
			temperature = pltemp - 0.2;
		end
		if temperature <= 35 then
			temperature = 35;
		end
		bd:setTemperature(temperature);
	end
end

function OnEat_Tragos(food, character)
	local bd = character:getBodyDamage();
	local pltemp = bd:getTemperature();
	if pltemp < 38 then
		local temperature = 36;
		if pltemp <= 30 then
			temperature = pltemp + 2;
		else
			temperature = pltemp + 1.5;
		end
		if temperature >= 38 then
			temperature = 38;
		end
		bd:setTemperature(temperature);
	end
end

function Tortillacooked_TestIsValid(sourceItem, result)
    if sourceItem:getFullType() == "Base.Tortillapan" then
        return sourceItem:isCooked();
    end
    return true
end

function TakeTortilla_OnCreate(items, result, player)
    local tortilla = nil;
    for i=0,items:size() - 1 do
        if instanceof(items:get(i), "Food") then
            tortilla = items:get(i);
            break;
        end
    end
    if tortilla then
--        local hunger = math.max(cheese:getBaseHunger(), cheese:getHungChange())
        result:setBaseHunger(tortilla:getHungChange());
        result:setHungChange(tortilla:getHungChange());
        result:setCarbohydrates(tortilla:getCarbohydrates());
        result:setLipids(tortilla:getLipids());
        result:setProteins(tortilla:getProteins());
        result:setCalories(tortilla:getCalories());
		
		player:getInventory():AddItem("Base.Pan");
    end
end


function tacoshellcooked_TestIsValid(sourceItem, result)
    if sourceItem:getFullType() == "Base.TacoShellpan" then
        return sourceItem:isCooked();
    end
    return true
end

function TakeTacoShell_OnCreate(items, result, player)
    local tacoshell = nil;
    for i=0,items:size() - 1 do
        if instanceof(items:get(i), "Food") then
            tacoshell = items:get(i);
            break;
        end
    end
    if tacoshell then
--        local hunger = math.max(cheese:getBaseHunger(), cheese:getHungChange())
        result:setBaseHunger(tacoshell:getHungChange());
        result:setHungChange(tacoshell:getHungChange());
        result:setCarbohydrates(tacoshell:getCarbohydrates());
        result:setLipids(tacoshell:getLipids());
        result:setProteins(tacoshell:getProteins());
        result:setCalories(tacoshell:getCalories());
		
		player:getInventory():AddItem("Base.Pan");
    end
end