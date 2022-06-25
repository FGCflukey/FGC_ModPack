require "Farming/farming_vegetableconf"

-- get the object name depending on his current phase
farming_vegetableconf.getObjectName = function(plant)
	if plant.state == "plow" then return getText("Farming_Plowed_Land") end
	if plant.state == "destroy" then return getText("Farming_Destroyed") .. " " .. getText("Farming_" .. plant.typeOfSeed) end
	if plant.state == "dry" then return getText("Farming_Receding") .. " " .. getText("Farming_" .. plant.typeOfSeed) end
	if plant.state == "rotten" then return getText("Farming_Rotten") .. " " .. getText("Farming_" .. plant.typeOfSeed) end
	if plant.nbOfGrow <= 1 then
		return getText("Farming_Seedling") .. " " .. getText("Farming_" ..plant.typeOfSeed);
	elseif plant.nbOfGrow <= 4 then
		if plant.nbOfGrow == 4 and (plant.typeOfSeed == "Pumpkin" or plant.typeOfSeed == "Watermelon" or plant.typeOfSeed == "Avocado" or plant.typeOfSeed == "Chili" or plant.typeOfSeed == "Jalapeno" or plant.typeOfSeed == "Habanero") then
			return getText("Farming_In_bloom") .. " " .. getText("Farming_" ..plant.typeOfSeed);
		else
			return getText("Farming_Young") .. " " .. getText("Farming_" ..plant.typeOfSeed);
		end
	elseif plant.nbOfGrow == 5 then
        if plant.typeOfSeed == "Tomato" or plant.typeOfSeed == "BellPepper" or plant.typeOfSeed == "Grape" or plant.typeOfSeed == "Pumpkin" or plant.typeOfSeed == "Watermelon" or plant.typeOfSeed == "Orange" or plant.typeOfSeed == "Apple" or plant.typeOfSeed == "Pear" or plant.typeOfSeed == "Peach" or plant.typeOfSeed == "Banana" or plant.typeOfSeed == "Cherry" or plant.typeOfSeed == "Pineapple" or plant.typeOfSeed == "Lime" or plant.typeOfSeed == "GrapeFruit" or plant.typeOfSeed == "Mango" then
            return getText("Farming_Young") .. " " .. getText("Farming_" ..plant.typeOfSeed);
		elseif plant.typeOfSeed == "Pea" or plant.typeOfSeed == "Eggplant" or plant.typeOfSeed == "Bean" or plant.typeOfSeed == "Onion" or plant.typeOfSeed == "Strawberry plant" or plant.typeOfSeed == "Zucchini" or plant.typeOfSeed == "Corn" or plant.typeOfSeed == "Wheat" or plant.typeOfSeed == "Sunflower" or plant.typeOfSeed == "Peanut" or plant.typeOfSeed == "Tobacco" then
			return getText("Farming_In_bloom") .. " " .. getText("Farming_" ..plant.typeOfSeed);
		elseif plant.typeOfSeed == "Lemon" or plant.typeOfSeed == "Avocado" or plant.typeOfSeed == "Coffee" or plant.typeOfSeed == "Chili" or plant.typeOfSeed == "Habanero" or plant.typeOfSeed == "Jalapeno" then
			return getText("Farming_green_fruit") .. " " .. getText("Farming_" ..plant.typeOfSeed);
		else
			return getText("Farming_Ready_for_Harvest") .. " " .. getText("Farming_" ..plant.typeOfSeed);
		end
	elseif plant.nbOfGrow == 6 then
		if plant.typeOfSeed == "Lemon" or plant.typeOfSeed == "Orange" or plant.typeOfSeed == "Apple" or plant.typeOfSeed == "Pear" or plant.typeOfSeed == "Peach" or plant.typeOfSeed == "Banana" or plant.typeOfSeed == "Cherry" or plant.typeOfSeed == "Lime" or plant.typeOfSeed == "Avocado" or plant.typeOfSeed == "GrapeFruit" or plant.typeOfSeed == "Mango" then
			return getText("Farming_Ready_for_Harvest") .. " " .. getText("Farming_" ..plant.typeOfSeed);
		else
			return getText("Farming_Seed-bearing") .. " " .. getText("Farming_" ..plant.typeOfSeed);
		end
	end
	return "Mystery Plant"
end

-- Leek
-- need 6 seeds
-- need to have more than 70 water lvl
-- need 4 weeks (112 hours per phase)
farming_vegetableconf.growLeek = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if (nbOfGrow == 0) then -- young
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = 80;
	elseif (nbOfGrow <= 4) then -- young
		if(water >= 0 and diseaseLvl >= 0) then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 48);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
			planting.hasSeed = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end
---------------------------------------------------------------------------------------------------------
-- Lettuce
-- need 9 seeds
-- need to have more than 85 water lvl
-- need 4 weeks (112 hours per phase)
farming_vegetableconf.growLettuce = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if (nbOfGrow == 0) then -- young
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = 80;
	elseif (nbOfGrow <= 4) then -- young
		if(water >= 0 and diseaseLvl >= 0) then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 48);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
			planting.hasSeed = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end
---------------------------------------------------------------------------------------------------------
-- Onion
-- need 6 seeds
-- need to have more than 65 water lvl
-- need 4 weeks (112 hours per phase)
farming_vegetableconf.growOnion = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if (nbOfGrow == 0) then -- young
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = 60;
	elseif (nbOfGrow <= 4) then -- young
		if(water >= 0 and diseaseLvl >= 0) then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 224);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
			planting.hasSeed = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end
-----------------------------------------------------------------------
-- Peanut
-- Need 8 seeds
-- Need 80 water at phase 1, minimum 70 at 2, then between 35 and 65
-- Grow in 17 days (68h per phase)
farming_vegetableconf.growPeanut = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local waterMax = farming_vegetableconf.calcWater(planting.waterLvl, planting.waterNeededMax);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if nbOfGrow == 0 then -- young
		planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
		planting.waterNeeded = 70;
	elseif (nbOfGrow <= 4) then -- young
		if water >= 0 and waterMax >= 0 and diseaseLvl >= 0 then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
			planting.waterNeededMax = farming_vegetableconf.props[planting.typeOfSeed].waterLvlMax;
			if nbOfGrow == 4 then
				planting:setObjectName(farming_vegetableconf.getObjectName(planting))
				planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			end
		else
			badPlant(water, waterMax, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and waterMax >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
		else
			badPlant(water, waterMax, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0 and waterMax >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 96);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
			planting.hasSeed = true;
		else
			badPlant(water, waterMax, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end
---------------------------------------------------------------------------------------------------------
-- Pumpkin
-- need 6 seeds
-- need to have more than 75 water lvl
-- need 4 weeks (112 hours per phase)
farming_vegetableconf.growPumpkin = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if (nbOfGrow == 0) then -- young
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = 80;
	elseif (nbOfGrow <= 4) then -- young
		if(water >= 0 and diseaseLvl >= 0) then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
			if nbOfGrow == 4 then
				planting:setObjectName(farming_vegetableconf.getObjectName(planting))
				planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			end
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			--planting.hasVegetable = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 224);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
			planting.hasSeed = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end
---------------------------------------------------------------------------------------------------------
-- Watermelon
-- need 6 seeds
-- need to have more than 75 water lvl
-- need 4 weeks (112 hours per phase)
farming_vegetableconf.growWatermelon = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if (nbOfGrow == 0) then -- young
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = 80;
	elseif (nbOfGrow <= 4) then -- young
		if(water >= 0 and diseaseLvl >= 0) then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
			if nbOfGrow == 4 then
				planting:setObjectName(farming_vegetableconf.getObjectName(planting))
				planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			end
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			--planting.hasVegetable = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 224);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
			planting.hasSeed = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end
-------------------------------------------------------------------------------------------
-- Zucchini
-- Need 6 seeds
-- Need 80 water at phase 1, minimum 70 at 2, then between 35 and 65
-- Grow in 17 days (68h per phase)
farming_vegetableconf.growZucchini = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local waterMax = farming_vegetableconf.calcWater(planting.waterLvl, planting.waterNeededMax);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if nbOfGrow == 0 then -- young
		planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
		planting.waterNeeded = 80;
	elseif (nbOfGrow <= 4) then -- young
		if water >= 0 and waterMax >= 0 and diseaseLvl >= 0 then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
			planting.waterNeededMax = farming_vegetableconf.props[planting.typeOfSeed].waterLvlMax;
		else
			badPlant(water, waterMax, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and waterMax >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			--planting.hasVegetable = true;
		else
			badPlant(water, waterMax, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0 and waterMax >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 48);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
			planting.hasSeed = true;
		else
			badPlant(water, waterMax, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end
--------------------------------------------------------------------------------------------------------
-- Corn
-- Need 6 seeds
-- Need 80 water at phase 1, minimum 70 at 2, then between 35 and 65
-- Grow in 17 days (68h per phase)
farming_vegetableconf.growCorn = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local waterMax = farming_vegetableconf.calcWater(planting.waterLvl, planting.waterNeededMax);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if nbOfGrow == 0 then -- young
		planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
		planting.waterNeeded = 80;
	elseif (nbOfGrow <= 4) then -- young
		if water >= 0 and waterMax >= 0 and diseaseLvl >= 0 then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
			planting.waterNeededMax = farming_vegetableconf.props[planting.typeOfSeed].waterLvlMax;
		else
			badPlant(water, waterMax, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and waterMax >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			--planting.hasVegetable = true;
		else
			badPlant(water, waterMax, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0 and waterMax >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 224);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
			planting.hasSeed = true;
		else
			badPlant(water, waterMax, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end
---------------------------------------------------------------------------------------
-- Rice
-- Need 6 seeds
-- Need 80 water at phase 1, minimum 70 at 2, then between 75 and 95
-- Grow in 17 days (68h per phase)
farming_vegetableconf.growRice = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local waterMax = farming_vegetableconf.calcWater(planting.waterLvl, planting.waterNeededMax);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if nbOfGrow == 0 then -- young
		planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
		planting.waterNeeded = 85;
	elseif (nbOfGrow <= 4) then -- young
		if water >= 0 and waterMax >= 0 and diseaseLvl >= 0 then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
			planting.waterNeededMax = farming_vegetableconf.props[planting.typeOfSeed].waterLvlMax;
		else
			badPlant(water, waterMax, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and waterMax >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
		else
			badPlant(water, waterMax, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0 and waterMax >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 224);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
			planting.hasSeed = true;
		else
			badPlant(water, waterMax, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end
--------------------------------------------------------------------------------------------------
-- Pineapple
-- Need 1 seeds
-- Need 80 water at phase 1, minimum 70 at 2, then between 75 and 85
-- Grow in 17 days (68h per phase)
farming_vegetableconf.growPineapple = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local waterMax = farming_vegetableconf.calcWater(planting.waterLvl, planting.waterNeededMax);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if nbOfGrow == 0 then -- young
		planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
		planting.waterNeeded = 80;
	elseif (nbOfGrow <= 4) then -- young
		if water >= 0 and waterMax >= 0 and diseaseLvl >= 0 then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
			planting.waterNeededMax = farming_vegetableconf.props[planting.typeOfSeed].waterLvlMax;
		else
			badPlant(water, waterMax, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and waterMax >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			--planting.hasVegetable = true;
		else
			badPlant(water, waterMax, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0 and waterMax >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 224);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
			planting.hasSeed = true;
		else
			badPlant(water, waterMax, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end
------------------------------------------------------------------------------------------------
-- Bean
-- need 5 seeds
-- need to have more than 70 water lvl
-- need 4 weeks (112 hours per phase)
farming_vegetableconf.growBean = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if (nbOfGrow == 0) then -- young
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = 80;
	elseif (nbOfGrow <= 4) then -- young
		if(water >= 0 and diseaseLvl >= 0) then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 224);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
			planting.hasSeed = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end
--------------------------------------------------------------------------------------------
-- BellPepper
-- need 5 seeds
-- need 2 sticks
-- need to have more than 70 water lvl
-- need 4 weeks (112 hours per phase)
farming_vegetableconf.growBellPepper = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if (nbOfGrow == 0) then -- young
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = 75;
	elseif (nbOfGrow <= 4) then -- young
		if(water >= 0 and diseaseLvl >= 0) then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			--planting.hasVegetable = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 248);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
			planting.hasSeed = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end
--------------------------------------------------------------------------------------------
-- Coffee
-- need 5 seeds
-- need 1 sticks
-- need to have more than 75 water lvl
-- need 4 weeks (112 hours per phase)
farming_vegetableconf.growCoffee = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if (nbOfGrow == 0) then -- young
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = 80;
	elseif (nbOfGrow <= 4) then -- young
		if(water >= 0 and diseaseLvl >= 0) then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			--planting.hasVegetable = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 248);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
			planting.hasSeed = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end
---------------------------------------------------------------------------------------------
-- Wheat
-- Need 20 seeds
-- Need 80 water at phase 1, minimum 70 at 2, then between 75 and 95
-- Grow in 17 days (68h per phase)
farming_vegetableconf.growWheat = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local waterMax = farming_vegetableconf.calcWater(planting.waterLvl, planting.waterNeededMax);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if nbOfGrow == 0 then -- young
		planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
		planting.waterNeeded = 85;
	elseif (nbOfGrow <= 4) then -- young
		if water >= 0 and waterMax >= 0 and diseaseLvl >= 0 then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
			planting.waterNeededMax = farming_vegetableconf.props[planting.typeOfSeed].waterLvlMax;
		else
			badPlant(water, waterMax, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and waterMax >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			--planting.hasVegetable = true;
		else
			badPlant(water, waterMax, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0 and waterMax >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 248);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
			planting.hasSeed = true;
		else
			badPlant(water, waterMax, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end
----------------------------------------------------------------------------------------------
-- Sugarcane
-- Need 8 seeds
-- Need 80 water at phase 1, minimum 70 at 2, then between 75 and 95
-- Grow in 17 days (68h per phase)
farming_vegetableconf.growSugarcane = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local waterMax = farming_vegetableconf.calcWater(planting.waterLvl, planting.waterNeededMax);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if nbOfGrow == 0 then -- young
		planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
		planting.waterNeeded = 85;
	elseif (nbOfGrow <= 4) then -- young
		if water >= 0 and waterMax >= 0 and diseaseLvl >= 0 then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
			planting.waterNeededMax = farming_vegetableconf.props[planting.typeOfSeed].waterLvlMax;
		else
			badPlant(water, waterMax, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and waterMax >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
		else
			badPlant(water, waterMax, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0 and waterMax >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 248);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
			planting.hasSeed = true;
		else
			badPlant(water, waterMax, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end
----------------------------------------------------------------------------------------------
-- SunFlower
-- Need 8 seeds
-- Need 80 water at phase 1, minimum 70 at 2, then between 75 and 95
-- Grow in 17 days (68h per phase)
farming_vegetableconf.growSunflower = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local waterMax = farming_vegetableconf.calcWater(planting.waterLvl, planting.waterNeededMax);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if nbOfGrow == 0 then -- young
		planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
		planting.waterNeeded = 85;
	elseif (nbOfGrow <= 4) then -- young
		if water >= 0 and waterMax >= 0 and diseaseLvl >= 0 then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
			planting.waterNeededMax = farming_vegetableconf.props[planting.typeOfSeed].waterLvlMax;
		else
			badPlant(water, waterMax, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and waterMax >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + waterMax + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			--planting.hasVegetable = true;
		else
			badPlant(water, waterMax, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0 and waterMax >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 96);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
			--planting.hasSeed = true;
		else
			badPlant(water, waterMax, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end
----------------------------------------------------------------------------------------------------
-- Chili
-- need 6 seeds
-- need to have more than 70 water lvl
-- need 4 weeks (112 hours per phase)
farming_vegetableconf.growChili = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if (nbOfGrow == 0) then -- young
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = 80;
	elseif (nbOfGrow <= 4) then -- young
		if(water >= 0 and diseaseLvl >= 0) then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
			if nbOfGrow == 4 then
				planting:setObjectName(farming_vegetableconf.getObjectName(planting))
				planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			end
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			--planting.hasVegetable = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 248);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
			planting.hasSeed = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end

----------------------------------------------------------------------------------------------------
-- PepperJalapeno
-- need 6 seeds
-- need to have more than 70 water lvl
-- need 4 weeks (112 hours per phase)
farming_vegetableconf.growJalapeno = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if (nbOfGrow == 0) then -- young
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = 80;
	elseif (nbOfGrow <= 4) then -- young
		if(water >= 0 and diseaseLvl >= 0) then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
			if nbOfGrow == 4 then
				planting:setObjectName(farming_vegetableconf.getObjectName(planting))
				planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			end
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			--planting.hasVegetable = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 248);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
			planting.hasSeed = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end

----------------------------------------------------------------------------------------------------
-- PepperHabanero
-- need 6 seeds
-- need to have more than 70 water lvl
-- need 4 weeks (112 hours per phase)
farming_vegetableconf.growHabanero = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if (nbOfGrow == 0) then -- young
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = 80;
	elseif (nbOfGrow <= 4) then -- young
		if(water >= 0 and diseaseLvl >= 0) then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
			if nbOfGrow == 4 then
				planting:setObjectName(farming_vegetableconf.getObjectName(planting))
				planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			end
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			--planting.hasVegetable = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 248);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
			planting.hasSeed = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end

---------------------------------------------------------------------------------------------------------
-- Tobacco
-- need 6 seeds
-- need to have more than 75 water lvl
-- need 4 weeks (112 hours per phase)
farming_vegetableconf.growTobacco = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if (nbOfGrow == 0) then -- young
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = 80;
	elseif (nbOfGrow <= 4) then -- young
		if(water >= 0 and diseaseLvl >= 0) then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
			if nbOfGrow == 4 then
				planting:setObjectName(farming_vegetableconf.getObjectName(planting))
				planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			end
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			--planting.hasVegetable = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 224);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
			planting.hasSeed = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end
---------------------------------------------------------------------------------------------
-- Eggplant
-- need 4 seeds
-- need to have more than 70 water lvl
-- need 17 weeks (68 hours per phase)
farming_vegetableconf.growEggplant = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if (nbOfGrow == 0) then -- young
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = 80;
	elseif (nbOfGrow <= 4) then -- young
		if(water >= 0 and diseaseLvl >= 0) then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			--planting.hasVegetable = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 96);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
			planting.hasSeed = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end
-----------------------------------------------------------------------------------------
-- Grape
-- need 5 seeds
-- need 2 sticks
-- need to have more than 70 water lvl
-- need 17 weeks (68 hours per phase)
farming_vegetableconf.growGrape = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if (nbOfGrow == 0) then -- young
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = 80;
	elseif (nbOfGrow <= 4) then -- young
		if(water >= 0 and diseaseLvl >= 0) then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			--planting.hasVegetable = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 96);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
			planting.hasSeed = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end
-- Pea
-- need 5 seeds
-- need 2 sticks
-- need to have more than 70 water lvl
-- need 17 weeks (68 hours per phase)
farming_vegetableconf.growPea = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if (nbOfGrow == 0) then -- young
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = 80;
	elseif (nbOfGrow <= 4) then -- young
		if(water >= 0 and diseaseLvl >= 0) then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			--planting.hasVegetable = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 48);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
			planting.hasSeed = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end

--------------------------------------------------------------------
------------------------------  Trees  -----------------------------
--------------------------------------------------------------------
-- Lemon
-- need 10 seeds
-- need to have more than 85 water lvl
farming_vegetableconf.growLemon = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if (nbOfGrow == 0) then -- young
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = 85;
	elseif (nbOfGrow <= 4) then -- young
		if(water >= 0 and diseaseLvl >= 0) then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = false;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 236);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end

farming_vegetableconf.growOrange = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if (nbOfGrow == 0) then -- young
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = 85;
	elseif (nbOfGrow <= 4) then -- young
		if(water >= 0 and diseaseLvl >= 0) then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = false;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 236);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end

farming_vegetableconf.growApple = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if (nbOfGrow == 0) then -- young
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = 85;
	elseif (nbOfGrow <= 4) then -- young
		if(water >= 0 and diseaseLvl >= 0) then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = false;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 236);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end

farming_vegetableconf.growPear = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if (nbOfGrow == 0) then -- young
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = 85;
	elseif (nbOfGrow <= 4) then -- young
		if(water >= 0 and diseaseLvl >= 0) then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = false;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 236);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end

farming_vegetableconf.growPeach = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if (nbOfGrow == 0) then -- young
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = 85;
	elseif (nbOfGrow <= 4) then -- young
		if(water >= 0 and diseaseLvl >= 0) then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = false;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 236);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end

farming_vegetableconf.growBanana = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if (nbOfGrow == 0) then -- young
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = 85;
	elseif (nbOfGrow <= 4) then -- young
		if(water >= 0 and diseaseLvl >= 0) then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);		
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = false;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 236);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end

farming_vegetableconf.growCherry = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if (nbOfGrow == 0) then -- young
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = 85;
	elseif (nbOfGrow <= 4) then -- young
		if(water >= 0 and diseaseLvl >= 0) then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = false;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 236);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end

farming_vegetableconf.growLime = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if (nbOfGrow == 0) then -- young
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = 85;
	elseif (nbOfGrow <= 4) then -- young
		if(water >= 0 and diseaseLvl >= 0) then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = false;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 236);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end

farming_vegetableconf.growAvocado = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if (nbOfGrow == 0) then -- young
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = 85;
	elseif (nbOfGrow <= 4) then -- young
		if(water >= 0 and diseaseLvl >= 0) then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
			if nbOfGrow == 4 then
				planting:setObjectName(farming_vegetableconf.getObjectName(planting))
				planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			end
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = false;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 236);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end

farming_vegetableconf.growGrapeFruit = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if (nbOfGrow == 0) then -- young
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = 85;
	elseif (nbOfGrow <= 4) then -- young
		if(water >= 0 and diseaseLvl >= 0) then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
			if nbOfGrow == 4 then
				planting:setObjectName(farming_vegetableconf.getObjectName(planting))
				planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			end
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = false;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 236);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end

farming_vegetableconf.growMango = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if (nbOfGrow == 0) then -- young
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = 85;
	elseif (nbOfGrow <= 4) then -- young
		if(water >= 0 and diseaseLvl >= 0) then
			planting = growNext(planting, farming_vegetableconf.getSpriteName(planting), farming_vegetableconf.getObjectName(planting), nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting.waterNeeded = farming_vegetableconf.props[planting.typeOfSeed].waterLvl;
			if nbOfGrow == 4 then
				planting:setObjectName(farming_vegetableconf.getObjectName(planting))
				planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			end
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 5) then -- mature
		if(water >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, farming_vegetableconf.props[planting.typeOfSeed].timeToGrow + water + diseaseLvl);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = false;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (nbOfGrow == 6) then -- mature with seed
		if(water >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 236);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		planting:rottenThis()
	end
	return planting;
end

farming_vegetableconf.icons = {}
farming_vegetableconf.icons["Carrots"] = "Item_Carrots";
farming_vegetableconf.icons["Broccoli"] = "Item_Broccoli";
farming_vegetableconf.icons["Leek"] = "Item_Leek";
farming_vegetableconf.icons["Lettuce"] = "Item_Lettuce";
farming_vegetableconf.icons["Onion"] = "Item_Onion";
farming_vegetableconf.icons["Peanut"] = "Item_Peanut";
farming_vegetableconf.icons["Radishes"] = "Item_TZ_LRRadish";
farming_vegetableconf.icons["Strawberry plant"] = "Item_TZ_Strewberry";
farming_vegetableconf.icons["Potatoes"] = "Item_TZ_Potato";
farming_vegetableconf.icons["Cabbages"] = "Item_TZ_CabbageLettuce";
farming_vegetableconf.icons["Pumpkin"] = "Item_Pumpkin";
farming_vegetableconf.icons["Watermelon"] = "Item_Watermelon";
farming_vegetableconf.icons["Zucchini"] = "Item_Zucchini";
farming_vegetableconf.icons["Corn"] = "Item_Corn";
farming_vegetableconf.icons["Rice"] = "media/textures/Item_Riceplant.png";
farming_vegetableconf.icons["Pineapple"] = "Item_Pineapple";
farming_vegetableconf.icons["Wheat"] = "media/textures/Item_Wheat.png";
farming_vegetableconf.icons["Sugarcane"] = "media/textures/Item_Sugarcane.png";
farming_vegetableconf.icons["Sunflower"] = "media/textures/Item_Sunflower.png";
farming_vegetableconf.icons["Tobacco"] = "media/textures/Item_Tobacco.png";

farming_vegetableconf.icons["Bean"] = "media/textures/Item_LgBeans.png";
farming_vegetableconf.icons["BellPepper"] = "Item_BellPepper";
farming_vegetableconf.icons["Eggplant"] = "Item_Eggplant";
farming_vegetableconf.icons["Grape"] = "Item_Grapes";
farming_vegetableconf.icons["Pea"] = "media/textures/Item_Peas2.png";
farming_vegetableconf.icons["Tomato"] = "Item_TZ_Tomato";
farming_vegetableconf.icons["Coffee"] = "media/textures/Item_Cafeseeds.png";
farming_vegetableconf.icons["Chili"] = "media/textures/Item_Chili.png";
farming_vegetableconf.icons["Jalapeno"] = "Item_PepperJalapeno";
farming_vegetableconf.icons["Habanero"] = "Item_PepperHabanero";

farming_vegetableconf.icons["Lemon"] = "media/textures/Item_Naturallemon.png";
farming_vegetableconf.icons["Orange"] = "Item_Orange";
farming_vegetableconf.icons["Apple"] = "Item_Apple";
farming_vegetableconf.icons["Pear"] = "Item_Pear";
farming_vegetableconf.icons["Peach"] = "Item_Peach";
farming_vegetableconf.icons["Banana"] = "Item_Banana";
farming_vegetableconf.icons["Cherry"] = "Item_Cherry";
farming_vegetableconf.icons["Lime"] = "media/textures/Item_Naturallime.png";
farming_vegetableconf.icons["Avocado"] = "media/textures/Item_Naturalavocado.png";
farming_vegetableconf.icons["Mango"] = "Item_Mango";
farming_vegetableconf.icons["GrapeFruit"] = "Item_Grapefruit";

farming_vegetableconf.props = {};
-- Carrots (12 to 16 weeks to grow)
farming_vegetableconf.props["Carrots"] = {};
farming_vegetableconf.props["Carrots"].requiredskill = 0;
farming_vegetableconf.props["Carrots"].seedsRequired = 6;
farming_vegetableconf.props["Carrots"].sticksRequired = 0;
farming_vegetableconf.props["Carrots"].sheetropeRequired = 0;
farming_vegetableconf.props["Carrots"].plantType = 1;
farming_vegetableconf.props["Carrots"].texture = "vegetation_farming_01_38";
farming_vegetableconf.props["Carrots"].waterLvl = 35;
farming_vegetableconf.props["Carrots"].waterLvlMax = 85;
farming_vegetableconf.props["Carrots"].timeToGrow = ZombRand(50,55);
farming_vegetableconf.props["Carrots"].minVeg = 3;
farming_vegetableconf.props["Carrots"].maxVeg = 6;
farming_vegetableconf.props["Carrots"].minVegAutorized = 10;
farming_vegetableconf.props["Carrots"].maxVegAutorized = 15;
farming_vegetableconf.props["Carrots"].vegetableName = "Base.Carrots";
farming_vegetableconf.props["Carrots"].seedName = "farming.CarrotSeed";
farming_vegetableconf.props["Carrots"].seedPerVeg = ZombRand(1,3);

--~ -- Broccoli (20 to 24 weeks to grow)
farming_vegetableconf.props["Broccoli"] = {};
farming_vegetableconf.props["Broccoli"].requiredskill = 0;
farming_vegetableconf.props["Broccoli"].waterLvl = 70;
farming_vegetableconf.props["Broccoli"].seedsRequired = 4;
farming_vegetableconf.props["Broccoli"].sticksRequired = 0;
farming_vegetableconf.props["Broccoli"].sheetropeRequired = 0;
farming_vegetableconf.props["Broccoli"].plantType = 1;
farming_vegetableconf.props["Broccoli"].texture = "vegetation_farming_01_30";
farming_vegetableconf.props["Broccoli"].timeToGrow = ZombRand(103, 117);
farming_vegetableconf.props["Broccoli"].minVeg = 2;
farming_vegetableconf.props["Broccoli"].maxVeg = 4;
farming_vegetableconf.props["Broccoli"].minVegAutorized = 6;
farming_vegetableconf.props["Broccoli"].maxVegAutorized = 8;
farming_vegetableconf.props["Broccoli"].vegetableName = "Base.Broccoli";
farming_vegetableconf.props["Broccoli"].seedName = "farming.BroccoliSeed";
farming_vegetableconf.props["Broccoli"].seedPerVeg = ZombRand(1,3);
-- Radishes (6 to 8 weeks to grow)
farming_vegetableconf.props["Radishes"] = {};
farming_vegetableconf.props["Radishes"].requiredskill = 0;
farming_vegetableconf.props["Radishes"].seedsRequired = 9;
farming_vegetableconf.props["Radishes"].sticksRequired = 0;
farming_vegetableconf.props["Radishes"].sheetropeRequired = 0;
farming_vegetableconf.props["Radishes"].plantType = 1;
farming_vegetableconf.props["Radishes"].texture = "vegetation_farming_01_54";
farming_vegetableconf.props["Radishes"].waterLvl = 45;
farming_vegetableconf.props["Radishes"].waterLvlMax = 85;
farming_vegetableconf.props["Radishes"].timeToGrow = ZombRand(56, 62);
farming_vegetableconf.props["Radishes"].minVeg = 4;
farming_vegetableconf.props["Radishes"].maxVeg = 9;
farming_vegetableconf.props["Radishes"].minVegAutorized = 11;
farming_vegetableconf.props["Radishes"].maxVegAutorized = 15;
farming_vegetableconf.props["Radishes"].vegetableName = "farming.RedRadish";
farming_vegetableconf.props["Radishes"].seedName = "farming.RedRadishSeed";
farming_vegetableconf.props["Radishes"].seedPerVeg = ZombRand(1,3);
-- Strawberry (24 to 28 weeks to grow)
farming_vegetableconf.props["Strawberry plant"] = {};
farming_vegetableconf.props["Strawberry plant"].requiredskill = 2;
farming_vegetableconf.props["Strawberry plant"].seedsRequired = 6;
farming_vegetableconf.props["Strawberry plant"].sticksRequired = 0;
farming_vegetableconf.props["Strawberry plant"].sheetropeRequired = 0;
farming_vegetableconf.props["Strawberry plant"].plantType = 1;
farming_vegetableconf.props["Strawberry plant"].texture = "vegetation_farming_01_62";
farming_vegetableconf.props["Strawberry plant"].waterLvl = 85;
farming_vegetableconf.props["Strawberry plant"].timeToGrow = ZombRand(103, 131);
farming_vegetableconf.props["Strawberry plant"].minVeg = 4;
farming_vegetableconf.props["Strawberry plant"].maxVeg = 6;
farming_vegetableconf.props["Strawberry plant"].minVegAutorized = 8;
farming_vegetableconf.props["Strawberry plant"].maxVegAutorized = 14;
farming_vegetableconf.props["Strawberry plant"].vegetableName = "farming.Strewberrie";
farming_vegetableconf.props["Strawberry plant"].seedName = "farming.StrewberrieSeed";
farming_vegetableconf.props["Strawberry plant"].seedPerVeg = ZombRand(1,3);
-- Tomatos (16 to 20 weeks to grow)
farming_vegetableconf.props["Tomato"] = {};
farming_vegetableconf.props["Tomato"].requiredskill = 3;
farming_vegetableconf.props["Tomato"].seedsRequired = 5;
farming_vegetableconf.props["Tomato"].sticksRequired = 4;
farming_vegetableconf.props["Tomato"].sheetropeRequired = 6;
farming_vegetableconf.props["Tomato"].plantType = 2;
farming_vegetableconf.props["Tomato"].texture = "vegetation_farming_01_70";
farming_vegetableconf.props["Tomato"].waterLvl = 75;
farming_vegetableconf.props["Tomato"].timeToGrow = ZombRand(89, 103);
farming_vegetableconf.props["Tomato"].minVeg = 2;
farming_vegetableconf.props["Tomato"].maxVeg = 4;
farming_vegetableconf.props["Tomato"].minVegAutorized = 6;
farming_vegetableconf.props["Tomato"].maxVegAutorized = 10;
farming_vegetableconf.props["Tomato"].vegetableName = "farming.Tomato";
farming_vegetableconf.props["Tomato"].seedName = "farming.TomatoSeed";
farming_vegetableconf.props["Tomato"].seedPerVeg = ZombRand(1,3);
-- Tomatos (16 to 20 weeks to grow)
farming_vegetableconf.props["Coffee"] = {};
farming_vegetableconf.props["Coffee"].requiredskill = 5;
farming_vegetableconf.props["Coffee"].seedsRequired = 5;
farming_vegetableconf.props["Coffee"].sticksRequired = 1;
farming_vegetableconf.props["Coffee"].sheetropeRequired = 3;
farming_vegetableconf.props["Coffee"].plantType = 2;
farming_vegetableconf.props["Coffee"].texture = "LegourmetFarming_02_66";
farming_vegetableconf.props["Coffee"].waterLvl = 75;
farming_vegetableconf.props["Coffee"].timeToGrow = ZombRand(89, 103);
farming_vegetableconf.props["Coffee"].minVeg = 4;
farming_vegetableconf.props["Coffee"].maxVeg = 5;
farming_vegetableconf.props["Coffee"].minVegAutorized = 6;
farming_vegetableconf.props["Coffee"].maxVegAutorized = 10;
farming_vegetableconf.props["Coffee"].vegetableName = "legourmetfarming.CafeSeed";
farming_vegetableconf.props["Coffee"].seedName = "legourmetfarming.CafeSeed";
farming_vegetableconf.props["Coffee"].seedPerVeg = ZombRand(1,3);
-- Potatos (16 to 20 weeks to grow)
farming_vegetableconf.props["Potatoes"] = {};
farming_vegetableconf.props["Potatoes"].requiredskill = 1;
farming_vegetableconf.props["Potatoes"].seedsRequired = 4;
farming_vegetableconf.props["Potatoes"].sticksRequired = 0;
farming_vegetableconf.props["Potatoes"].sheetropeRequired = 0;
farming_vegetableconf.props["Potatoes"].plantType = 1;
farming_vegetableconf.props["Potatoes"].texture = "vegetation_farming_01_46";
farming_vegetableconf.props["Potatoes"].waterLvl = 65;
farming_vegetableconf.props["Potatoes"].timeToGrow = ZombRand(89, 103);
farming_vegetableconf.props["Potatoes"].minVeg = 2;
farming_vegetableconf.props["Potatoes"].maxVeg = 4;
farming_vegetableconf.props["Potatoes"].minVegAutorized = 5;
farming_vegetableconf.props["Potatoes"].maxVegAutorized = 9;
farming_vegetableconf.props["Potatoes"].vegetableName = "farming.Potato";
farming_vegetableconf.props["Potatoes"].seedName = "farming.PotatoSeed";
farming_vegetableconf.props["Potatoes"].seedPerVeg = ZombRand(1,3);
-- Cabbage Lettuce (6 to 8 weeks to grow)
farming_vegetableconf.props["Cabbages"] = {};
farming_vegetableconf.props["Cabbages"].requiredskill = 2;
farming_vegetableconf.props["Cabbages"].seedsRequired = 6;
farming_vegetableconf.props["Cabbages"].sticksRequired = 0;
farming_vegetableconf.props["Cabbages"].sheetropeRequired = 0;
farming_vegetableconf.props["Cabbages"].plantType = 1;
farming_vegetableconf.props["Cabbages"].texture = "vegetation_farming_01_21";
farming_vegetableconf.props["Cabbages"].waterLvl = 85;
farming_vegetableconf.props["Cabbages"].timeToGrow = ZombRand(46, 52);
farming_vegetableconf.props["Cabbages"].vegetableName = "farming.Cabbage";
farming_vegetableconf.props["Cabbages"].seedName = "farming.CabbageSeed";
farming_vegetableconf.props["Cabbages"].seedPerVeg = ZombRand(1,3);
farming_vegetableconf.props["Cabbages"].minVeg = 2;
farming_vegetableconf.props["Cabbages"].maxVeg = 4;
farming_vegetableconf.props["Cabbages"].minVegAutorized = 5;
farming_vegetableconf.props["Cabbages"].maxVegAutorized = 9;
-- Leek (6 to 8 weeks to grow)
farming_vegetableconf.props["Leek"] = {};
farming_vegetableconf.props["Leek"].requiredskill = 0;
farming_vegetableconf.props["Leek"].seedsRequired = 6;
farming_vegetableconf.props["Leek"].sticksRequired = 0;
farming_vegetableconf.props["Leek"].sheetropeRequired = 0;
farming_vegetableconf.props["Leek"].plantType = 1;
farming_vegetableconf.props["Leek"].texture = "LegourmetFarming_02_13";
farming_vegetableconf.props["Leek"].waterLvl = 85;
farming_vegetableconf.props["Leek"].timeToGrow = ZombRand(46, 52);
farming_vegetableconf.props["Leek"].vegetableName = "Base.Leek";
farming_vegetableconf.props["Leek"].seedName = "legourmetfarming.LeekSeed";
farming_vegetableconf.props["Leek"].seedPerVeg = ZombRand(1,3);
farming_vegetableconf.props["Leek"].minVeg = 3;
farming_vegetableconf.props["Leek"].maxVeg = 6;
farming_vegetableconf.props["Leek"].minVegAutorized = 10;
farming_vegetableconf.props["Leek"].maxVegAutorized = 15;
-- Lettuce (6 to 8 weeks to grow)
farming_vegetableconf.props["Lettuce"] = {};
farming_vegetableconf.props["Lettuce"].requiredskill = 3;
farming_vegetableconf.props["Lettuce"].seedsRequired = 9;
farming_vegetableconf.props["Lettuce"].sticksRequired = 0;
farming_vegetableconf.props["Lettuce"].sheetropeRequired = 0;
farming_vegetableconf.props["Lettuce"].plantType = 1;
farming_vegetableconf.props["Lettuce"].texture = "LegourmetFarming_02_22";
farming_vegetableconf.props["Lettuce"].waterLvl = 85;
farming_vegetableconf.props["Lettuce"].timeToGrow = ZombRand(46, 52);
farming_vegetableconf.props["Lettuce"].vegetableName = "Base.Lettuce";
farming_vegetableconf.props["Lettuce"].seedName = "legourmetfarming.LettuceSeed";
farming_vegetableconf.props["Lettuce"].seedPerVeg = ZombRand(1,3);
farming_vegetableconf.props["Lettuce"].minVeg = 2;
farming_vegetableconf.props["Lettuce"].maxVeg = 4;
farming_vegetableconf.props["Lettuce"].minVegAutorized = 5;
farming_vegetableconf.props["Lettuce"].maxVegAutorized = 8;
-- Onion (16 to 20 weeks to grow)
farming_vegetableconf.props["Onion"] = {};
farming_vegetableconf.props["Onion"].requiredskill = 0;
farming_vegetableconf.props["Onion"].seedsRequired = 6;
farming_vegetableconf.props["Onion"].sticksRequired = 0;
farming_vegetableconf.props["Onion"].sheetropeRequired = 0;
farming_vegetableconf.props["Onion"].plantType = 1;
farming_vegetableconf.props["Onion"].texture = "LegourmetFarming_02_6";
farming_vegetableconf.props["Onion"].waterLvl = 65;
farming_vegetableconf.props["Onion"].timeToGrow = ZombRand(89, 103);
farming_vegetableconf.props["Onion"].minVeg = 2;
farming_vegetableconf.props["Onion"].maxVeg = 4;
farming_vegetableconf.props["Onion"].minVegAutorized = 5;
farming_vegetableconf.props["Onion"].maxVegAutorized = 8;
farming_vegetableconf.props["Onion"].vegetableName = "Base.Onion";
farming_vegetableconf.props["Onion"].seedName = "legourmetfarming.OnionSeed";
farming_vegetableconf.props["Onion"].seedPerVeg = ZombRand(1,3);
-- Peanuts (16 to 20 weeks to grow)
farming_vegetableconf.props["Peanut"] = {};
farming_vegetableconf.props["Peanut"].requiredskill = 5;
farming_vegetableconf.props["Peanut"].seedsRequired = 4;
farming_vegetableconf.props["Peanut"].sticksRequired = 0;
farming_vegetableconf.props["Peanut"].sheetropeRequired = 0;
farming_vegetableconf.props["Peanut"].plantType = 1;
farming_vegetableconf.props["Peanut"].texture = "LegourmetFarming_02_29";
farming_vegetableconf.props["Peanut"].waterLvl = 50;
farming_vegetableconf.props["Peanut"].waterLvlMax = 85;
farming_vegetableconf.props["Peanut"].timeToGrow = ZombRand(54, 68);
farming_vegetableconf.props["Peanut"].minVeg = 2;
farming_vegetableconf.props["Peanut"].maxVeg = 4;
farming_vegetableconf.props["Peanut"].minVegAutorized = 5;
farming_vegetableconf.props["Peanut"].maxVegAutorized = 8;
farming_vegetableconf.props["Peanut"].vegetableName = "Base.Peanuts";
farming_vegetableconf.props["Peanut"].seedName = "legourmetfarming.PeanutSeed";
farming_vegetableconf.props["Peanut"].seedPerVeg = ZombRand(1,3);
-- Pumpkin (16 to 20 weeks to grow)
farming_vegetableconf.props["Pumpkin"] = {};
farming_vegetableconf.props["Pumpkin"].requiredskill = 7;
farming_vegetableconf.props["Pumpkin"].seedsRequired = 6;
farming_vegetableconf.props["Pumpkin"].sticksRequired = 0;
farming_vegetableconf.props["Pumpkin"].sheetropeRequired = 0;
farming_vegetableconf.props["Pumpkin"].plantType = 1;
farming_vegetableconf.props["Pumpkin"].texture = "LegourmetFarming_01_14";
farming_vegetableconf.props["Pumpkin"].waterLvl = 75;
farming_vegetableconf.props["Pumpkin"].timeToGrow = ZombRand(89, 103);
farming_vegetableconf.props["Pumpkin"].minVeg = 1;
farming_vegetableconf.props["Pumpkin"].maxVeg = 2;
farming_vegetableconf.props["Pumpkin"].minVegAutorized = 4;
farming_vegetableconf.props["Pumpkin"].maxVegAutorized = 5;
farming_vegetableconf.props["Pumpkin"].vegetableName = "Base.Pumpkin";
farming_vegetableconf.props["Pumpkin"].seedName = "legourmetfarming.PumpkinSeed";
farming_vegetableconf.props["Pumpkin"].seedPerVeg = ZombRand(1,3);
-- Watermelon (16 to 20 weeks to grow)
farming_vegetableconf.props["Watermelon"] = {};
farming_vegetableconf.props["Watermelon"].requiredskill = 7;
farming_vegetableconf.props["Watermelon"].seedsRequired = 4;
farming_vegetableconf.props["Watermelon"].sticksRequired = 0;
farming_vegetableconf.props["Watermelon"].sheetropeRequired = 0;
farming_vegetableconf.props["Watermelon"].plantType = 1;
farming_vegetableconf.props["Watermelon"].texture = "LegourmetFarming_01_30";
farming_vegetableconf.props["Watermelon"].waterLvl = 75;
farming_vegetableconf.props["Watermelon"].timeToGrow = ZombRand(89, 103);
farming_vegetableconf.props["Watermelon"].minVeg = 2;
farming_vegetableconf.props["Watermelon"].maxVeg = 4;
farming_vegetableconf.props["Watermelon"].minVegAutorized = 5;
farming_vegetableconf.props["Watermelon"].maxVegAutorized = 6;
farming_vegetableconf.props["Watermelon"].vegetableName = "Base.Watermelon";
farming_vegetableconf.props["Watermelon"].seedName = "legourmetfarming.WatermelonSeed";
farming_vegetableconf.props["Watermelon"].seedPerVeg = ZombRand(1,3);
-- Zucchini (6 to 8 weeks to grow)
farming_vegetableconf.props["Zucchini"] = {};
farming_vegetableconf.props["Zucchini"].requiredskill = 0;
farming_vegetableconf.props["Zucchini"].seedsRequired = 6;
farming_vegetableconf.props["Zucchini"].sticksRequired = 0;
farming_vegetableconf.props["Zucchini"].sheetropeRequired = 0;
farming_vegetableconf.props["Zucchini"].plantType = 1;
farming_vegetableconf.props["Zucchini"].texture = "LegourmetFarming_01_22";
farming_vegetableconf.props["Zucchini"].waterLvl = 65;
farming_vegetableconf.props["Zucchini"].waterLvlMax = 85;
farming_vegetableconf.props["Zucchini"].timeToGrow = ZombRand(56, 62);
farming_vegetableconf.props["Zucchini"].minVeg = 2;
farming_vegetableconf.props["Zucchini"].maxVeg = 4;
farming_vegetableconf.props["Zucchini"].minVegAutorized = 5;
farming_vegetableconf.props["Zucchini"].maxVegAutorized = 8;
farming_vegetableconf.props["Zucchini"].vegetableName = "Base.Zucchini";
farming_vegetableconf.props["Zucchini"].seedName = "legourmetfarming.ZucchiniSeed";
farming_vegetableconf.props["Zucchini"].seedPerVeg = ZombRand(1,3);

-- Corn (6 to 8 weeks to grow)
farming_vegetableconf.props["Corn"] = {};
farming_vegetableconf.props["Corn"].requiredskill = 5;
farming_vegetableconf.props["Corn"].seedsRequired = 6;
farming_vegetableconf.props["Corn"].sticksRequired = 0;
farming_vegetableconf.props["Corn"].sheetropeRequired = 0;
farming_vegetableconf.props["Corn"].plantType = 1;
farming_vegetableconf.props["Corn"].texture = "vegetation_farming_01_78";
farming_vegetableconf.props["Corn"].waterLvl = 65;
farming_vegetableconf.props["Corn"].waterLvlMax = 85;
farming_vegetableconf.props["Corn"].timeToGrow = ZombRand(56, 62);
farming_vegetableconf.props["Corn"].minVeg = 2;
farming_vegetableconf.props["Corn"].maxVeg = 4;
farming_vegetableconf.props["Corn"].minVegAutorized = 5;
farming_vegetableconf.props["Corn"].maxVegAutorized = 8;
farming_vegetableconf.props["Corn"].vegetableName = "Base.Corn";
farming_vegetableconf.props["Corn"].seedName = "legourmetfarming.CornSeed";
farming_vegetableconf.props["Corn"].seedPerVeg = ZombRand(1,3);

-- Corn (6 to 8 weeks to grow)
farming_vegetableconf.props["Rice"] = {};
farming_vegetableconf.props["Rice"].requiredskill = 6;
farming_vegetableconf.props["Rice"].seedsRequired = 6;
farming_vegetableconf.props["Rice"].sticksRequired = 0;
farming_vegetableconf.props["Rice"].sheetropeRequired = 0;
farming_vegetableconf.props["Rice"].plantType = 1;
farming_vegetableconf.props["Rice"].texture = "LegourmetFarming_02_47";
farming_vegetableconf.props["Rice"].waterLvl = 75;
farming_vegetableconf.props["Rice"].waterLvlMax = 95;
farming_vegetableconf.props["Rice"].timeToGrow = ZombRand(54, 62);
farming_vegetableconf.props["Rice"].minVeg = 4;
farming_vegetableconf.props["Rice"].maxVeg = 6;
farming_vegetableconf.props["Rice"].minVegAutorized = 7;
farming_vegetableconf.props["Rice"].maxVegAutorized = 9;
farming_vegetableconf.props["Rice"].vegetableName = "Base.RicePlant";
farming_vegetableconf.props["Rice"].seedName = "legourmetfarming.RiceSeed";
farming_vegetableconf.props["Rice"].seedPerVeg = ZombRand(1,3);

-- Pineapple (6 to 8 weeks to grow)
farming_vegetableconf.props["Pineapple"] = {};
farming_vegetableconf.props["Pineapple"].requiredskill = 3;
farming_vegetableconf.props["Pineapple"].seedsRequired = 1;
farming_vegetableconf.props["Pineapple"].sticksRequired = 0;
farming_vegetableconf.props["Pineapple"].sheetropeRequired = 0;
farming_vegetableconf.props["Pineapple"].plantType = 1;
farming_vegetableconf.props["Pineapple"].texture = "LegourmetFarming_02_58";
farming_vegetableconf.props["Pineapple"].waterLvl = 75;
farming_vegetableconf.props["Pineapple"].waterLvlMax = 85;
farming_vegetableconf.props["Pineapple"].timeToGrow = ZombRand(56, 62);
farming_vegetableconf.props["Pineapple"].minVeg = 1;
farming_vegetableconf.props["Pineapple"].maxVeg = 1;
farming_vegetableconf.props["Pineapple"].minVegAutorized = 1;
farming_vegetableconf.props["Pineapple"].maxVegAutorized = 1;
farming_vegetableconf.props["Pineapple"].vegetableName = "legourmetfarming.NaturalPineapple";
farming_vegetableconf.props["Pineapple"].seedName = "legourmetfarming.PineappleSeed";
farming_vegetableconf.props["Pineapple"].seedPerVeg = ZombRand(1,3);

-- Wheat (6 to 8 weeks to grow)
farming_vegetableconf.props["Wheat"] = {};
farming_vegetableconf.props["Wheat"].requiredskill = 5;
farming_vegetableconf.props["Wheat"].seedsRequired = 20;
farming_vegetableconf.props["Wheat"].sticksRequired = 0;
farming_vegetableconf.props["Wheat"].sheetropeRequired = 0;
farming_vegetableconf.props["Wheat"].plantType = 1;
farming_vegetableconf.props["Wheat"].texture = "LegourmetFarming_01_70";
farming_vegetableconf.props["Wheat"].waterLvl = 75;
farming_vegetableconf.props["Wheat"].waterLvlMax = 95;
farming_vegetableconf.props["Wheat"].timeToGrow = ZombRand(54, 62);
farming_vegetableconf.props["Wheat"].minVeg = 4;
farming_vegetableconf.props["Wheat"].maxVeg = 6;
farming_vegetableconf.props["Wheat"].minVegAutorized = 7;
farming_vegetableconf.props["Wheat"].maxVegAutorized = 9;
farming_vegetableconf.props["Wheat"].vegetableName = "Base.Wheat";
farming_vegetableconf.props["Wheat"].seedName = "legourmetfarming.WheatSeed";
farming_vegetableconf.props["Wheat"].seedPerVeg = ZombRand(1,3);

-- Sugarcane (6 to 8 weeks to grow)
farming_vegetableconf.props["Sugarcane"] = {};
farming_vegetableconf.props["Sugarcane"].requiredskill = 5;
farming_vegetableconf.props["Sugarcane"].seedsRequired = 8;
farming_vegetableconf.props["Sugarcane"].sticksRequired = 0;
farming_vegetableconf.props["Sugarcane"].sheetropeRequired = 0;
farming_vegetableconf.props["Sugarcane"].plantType = 1;
farming_vegetableconf.props["Sugarcane"].texture = "LegourmetFarming_04_6";
farming_vegetableconf.props["Sugarcane"].waterLvl = 75;
farming_vegetableconf.props["Sugarcane"].waterLvlMax = 95;
farming_vegetableconf.props["Sugarcane"].timeToGrow = ZombRand(54, 62);
farming_vegetableconf.props["Sugarcane"].minVeg = 4;
farming_vegetableconf.props["Sugarcane"].maxVeg = 6;
farming_vegetableconf.props["Sugarcane"].minVegAutorized = 7;
farming_vegetableconf.props["Sugarcane"].maxVegAutorized = 9;
farming_vegetableconf.props["Sugarcane"].vegetableName = "Base.Sugarcane";
farming_vegetableconf.props["Sugarcane"].seedName = "legourmetfarming.SugarcaneSeed";
farming_vegetableconf.props["Sugarcane"].seedPerVeg = ZombRand(1,9);

-- SunFlower (6 to 8 weeks to grow)
farming_vegetableconf.props["Sunflower"] = {};
farming_vegetableconf.props["Sunflower"].requiredskill = 5;
farming_vegetableconf.props["Sunflower"].seedsRequired = 8;
farming_vegetableconf.props["Sunflower"].sticksRequired = 0;
farming_vegetableconf.props["Sunflower"].sheetropeRequired = 0;
farming_vegetableconf.props["Sunflower"].plantType = 1;
farming_vegetableconf.props["Sunflower"].texture = "LegourmetFarming_04_14";
farming_vegetableconf.props["Sunflower"].waterLvl = 75;
farming_vegetableconf.props["Sunflower"].waterLvlMax = 95;
farming_vegetableconf.props["Sunflower"].timeToGrow = ZombRand(54, 62);
farming_vegetableconf.props["Sunflower"].minVeg = 4;
farming_vegetableconf.props["Sunflower"].maxVeg = 8;
farming_vegetableconf.props["Sunflower"].minVegAutorized = 4;
farming_vegetableconf.props["Sunflower"].maxVegAutorized = 8;
farming_vegetableconf.props["Sunflower"].vegetableName = "Base.SunFlower";
farming_vegetableconf.props["Sunflower"].seedName = "legourmetfarming.SunFlowerSeed";
farming_vegetableconf.props["Sunflower"].seedPerVeg = ZombRand(1,3);

-- Tobacco (16 to 20 weeks to grow)
farming_vegetableconf.props["Tobacco"] = {};
farming_vegetableconf.props["Tobacco"].requiredskill = 5;
farming_vegetableconf.props["Tobacco"].seedsRequired = 10;
farming_vegetableconf.props["Tobacco"].sticksRequired = 0;
farming_vegetableconf.props["Tobacco"].sheetropeRequired = 0;
farming_vegetableconf.props["Tobacco"].plantType = 1;
farming_vegetableconf.props["Tobacco"].texture = "LegourmetFarming_04_22";
farming_vegetableconf.props["Tobacco"].waterLvl = 75;
farming_vegetableconf.props["Tobacco"].timeToGrow = ZombRand(89, 103);
farming_vegetableconf.props["Tobacco"].minVeg = 6;
farming_vegetableconf.props["Tobacco"].maxVeg = 8;
farming_vegetableconf.props["Tobacco"].minVegAutorized = 9;
farming_vegetableconf.props["Tobacco"].maxVegAutorized = 10;
farming_vegetableconf.props["Tobacco"].vegetableName = "legourmetfarming.Tobacco";
farming_vegetableconf.props["Tobacco"].seedName = "legourmetfarming.TobaccoSeed";
farming_vegetableconf.props["Tobacco"].seedPerVeg = ZombRand(1,3);

-- Beans (16 to 20 weeks to grow)
farming_vegetableconf.props["Bean"] = {};
farming_vegetableconf.props["Bean"].requiredskill = 3;
farming_vegetableconf.props["Bean"].seedsRequired = 5;
farming_vegetableconf.props["Bean"].sticksRequired = 7;
farming_vegetableconf.props["Bean"].sheetropeRequired = 6;
farming_vegetableconf.props["Bean"].plantType = 2;
farming_vegetableconf.props["Bean"].texture = "LegourmetFarming_01_5";
farming_vegetableconf.props["Bean"].waterLvl = 70;
farming_vegetableconf.props["Bean"].timeToGrow = ZombRand(54, 68);
farming_vegetableconf.props["Bean"].minVeg = 4;
farming_vegetableconf.props["Bean"].maxVeg = 5;
farming_vegetableconf.props["Bean"].minVegAutorized = 6;
farming_vegetableconf.props["Bean"].maxVegAutorized = 10;
farming_vegetableconf.props["Bean"].vegetableName = "Base.Beans";
farming_vegetableconf.props["Bean"].seedName = "legourmetfarming.BeanSeed";
farming_vegetableconf.props["Bean"].seedPerVeg = ZombRand(1,3);
-- Bell Peppers (16 to 20 weeks to grow)
farming_vegetableconf.props["BellPepper"] = {};
farming_vegetableconf.props["BellPepper"].requiredskill = 3;
farming_vegetableconf.props["BellPepper"].seedsRequired = 5;
farming_vegetableconf.props["BellPepper"].sticksRequired = 2;
farming_vegetableconf.props["BellPepper"].sheetropeRequired = 3;
farming_vegetableconf.props["BellPepper"].plantType = 2;
farming_vegetableconf.props["BellPepper"].texture = "LegourmetFarming_01_46";
farming_vegetableconf.props["BellPepper"].waterLvl = 70;
farming_vegetableconf.props["BellPepper"].timeToGrow = ZombRand(54, 68);
farming_vegetableconf.props["BellPepper"].minVeg = 2;
farming_vegetableconf.props["BellPepper"].maxVeg = 4;
farming_vegetableconf.props["BellPepper"].minVegAutorized = 5;
farming_vegetableconf.props["BellPepper"].maxVegAutorized = 8;
farming_vegetableconf.props["BellPepper"].vegetableName = "Base.BellPepper";
farming_vegetableconf.props["BellPepper"].seedName = "legourmetfarming.BellPepperSeed";
farming_vegetableconf.props["BellPepper"].seedPerVeg = ZombRand(1,3);
-- Chili (16 to 20 weeks to grow)
farming_vegetableconf.props["Chili"] = {};
farming_vegetableconf.props["Chili"].requiredskill = 3;
farming_vegetableconf.props["Chili"].seedsRequired = 5;
farming_vegetableconf.props["Chili"].sticksRequired = 4;
farming_vegetableconf.props["Chili"].sheetropeRequired = 6;
farming_vegetableconf.props["Chili"].plantType = 2;
farming_vegetableconf.props["Chili"].texture = "LegourmetFarming_02_76";
farming_vegetableconf.props["Chili"].waterLvl = 70;
farming_vegetableconf.props["Chili"].timeToGrow = ZombRand(54, 68);
farming_vegetableconf.props["Chili"].minVeg = 2;
farming_vegetableconf.props["Chili"].maxVeg = 4;
farming_vegetableconf.props["Chili"].minVegAutorized = 5;
farming_vegetableconf.props["Chili"].maxVegAutorized = 8;
farming_vegetableconf.props["Chili"].vegetableName = "Base.Chili";
farming_vegetableconf.props["Chili"].seedName = "legourmetfarming.ChiliSeed";
farming_vegetableconf.props["Chili"].seedPerVeg = ZombRand(1,3);
-- Jalapeno (16 to 20 weeks to grow)
farming_vegetableconf.props["Jalapeno"] = {};
farming_vegetableconf.props["Jalapeno"].requiredskill = 3;
farming_vegetableconf.props["Jalapeno"].seedsRequired = 5;
farming_vegetableconf.props["Jalapeno"].sticksRequired = 4;
farming_vegetableconf.props["Jalapeno"].sheetropeRequired = 6;
farming_vegetableconf.props["Jalapeno"].plantType = 2;
farming_vegetableconf.props["Jalapeno"].texture = "LegourmetFarming_04_38";
farming_vegetableconf.props["Jalapeno"].waterLvl = 70;
farming_vegetableconf.props["Jalapeno"].timeToGrow = ZombRand(54, 68);
farming_vegetableconf.props["Jalapeno"].minVeg = 2;
farming_vegetableconf.props["Jalapeno"].maxVeg = 4;
farming_vegetableconf.props["Jalapeno"].minVegAutorized = 5;
farming_vegetableconf.props["Jalapeno"].maxVegAutorized = 8;
farming_vegetableconf.props["Jalapeno"].vegetableName = "Base.PepperJalapeno";
farming_vegetableconf.props["Jalapeno"].seedName = "legourmetfarming.JalapenoSeed";
farming_vegetableconf.props["Jalapeno"].seedPerVeg = ZombRand(1,3);
-- Habanero (16 to 20 weeks to grow)
farming_vegetableconf.props["Habanero"] = {};
farming_vegetableconf.props["Habanero"].requiredskill = 3;
farming_vegetableconf.props["Habanero"].seedsRequired = 5;
farming_vegetableconf.props["Habanero"].sticksRequired = 4;
farming_vegetableconf.props["Habanero"].sheetropeRequired = 6;
farming_vegetableconf.props["Habanero"].plantType = 2;
farming_vegetableconf.props["Habanero"].texture = "LegourmetFarming_04_30";
farming_vegetableconf.props["Habanero"].waterLvl = 70;
farming_vegetableconf.props["Habanero"].timeToGrow = ZombRand(54, 68);
farming_vegetableconf.props["Habanero"].minVeg = 2;
farming_vegetableconf.props["Habanero"].maxVeg = 4;
farming_vegetableconf.props["Habanero"].minVegAutorized = 5;
farming_vegetableconf.props["Habanero"].maxVegAutorized = 8;
farming_vegetableconf.props["Habanero"].vegetableName = "Base.PepperHabanero";
farming_vegetableconf.props["Habanero"].seedName = "legourmetfarming.HabaneroSeed";
farming_vegetableconf.props["Habanero"].seedPerVeg = ZombRand(1,3);
-- Eggplant (16 to 20 weeks to grow)
farming_vegetableconf.props["Eggplant"] = {};
farming_vegetableconf.props["Eggplant"].requiredskill = 4;
farming_vegetableconf.props["Eggplant"].seedsRequired = 5;
farming_vegetableconf.props["Eggplant"].sticksRequired = 3;
farming_vegetableconf.props["Eggplant"].sheetropeRequired = 7;
farming_vegetableconf.props["Eggplant"].plantType = 2;
farming_vegetableconf.props["Eggplant"].texture = "LegourmetFarming_01_62";
farming_vegetableconf.props["Eggplant"].waterLvl = 70;
farming_vegetableconf.props["Eggplant"].timeToGrow = ZombRand(54, 68);
farming_vegetableconf.props["Eggplant"].minVeg = 2;
farming_vegetableconf.props["Eggplant"].maxVeg = 4;
farming_vegetableconf.props["Eggplant"].minVegAutorized = 5;
farming_vegetableconf.props["Eggplant"].maxVegAutorized = 8;
farming_vegetableconf.props["Eggplant"].vegetableName = "Base.Eggplant";
farming_vegetableconf.props["Eggplant"].seedName = "legourmetfarming.EggplantSeed";
farming_vegetableconf.props["Eggplant"].seedPerVeg = ZombRand(1,3);
-- Grapes (16 to 20 weeks to grow)
farming_vegetableconf.props["Grape"] = {};
farming_vegetableconf.props["Grape"].requiredskill = 5;
farming_vegetableconf.props["Grape"].seedsRequired = 5;
farming_vegetableconf.props["Grape"].sticksRequired = 2;
farming_vegetableconf.props["Grape"].sheetropeRequired = 3;
farming_vegetableconf.props["Grape"].plantType = 2;
farming_vegetableconf.props["Grape"].texture = "LegourmetFarming_01_54";
farming_vegetableconf.props["Grape"].waterLvl = 70;
farming_vegetableconf.props["Grape"].timeToGrow = ZombRand(54, 68);
farming_vegetableconf.props["Grape"].minVeg = 2;
farming_vegetableconf.props["Grape"].maxVeg = 4;
farming_vegetableconf.props["Grape"].minVegAutorized = 5;
farming_vegetableconf.props["Grape"].maxVegAutorized = 8;
farming_vegetableconf.props["Grape"].vegetableName = "Base.Grapes";
farming_vegetableconf.props["Grape"].seedName = "legourmetfarming.GrapeSeed";
farming_vegetableconf.props["Grape"].seedPerVeg = ZombRand(1,3);
-- Peas (16 to 20 weeks to grow)
farming_vegetableconf.props["Pea"] = {};
farming_vegetableconf.props["Pea"].requiredskill = 5;
farming_vegetableconf.props["Pea"].seedsRequired = 5;
farming_vegetableconf.props["Pea"].sticksRequired = 2;
farming_vegetableconf.props["Pea"].sheetropeRequired = 3;
farming_vegetableconf.props["Pea"].plantType = 2;
farming_vegetableconf.props["Pea"].texture = "LegourmetFarming_01_37";
farming_vegetableconf.props["Pea"].waterLvl = 70;
farming_vegetableconf.props["Pea"].timeToGrow = ZombRand(54, 68);
farming_vegetableconf.props["Pea"].minVeg = 2;
farming_vegetableconf.props["Pea"].maxVeg = 4;
farming_vegetableconf.props["Pea"].minVegAutorized = 5;
farming_vegetableconf.props["Pea"].maxVegAutorized = 8;
farming_vegetableconf.props["Pea"].vegetableName = "Base.Peas2";
farming_vegetableconf.props["Pea"].seedName = "legourmetfarming.PeaSeed";
farming_vegetableconf.props["Pea"].seedPerVeg = ZombRand(1,3);

-- Lemon (3.5 months to grow)
farming_vegetableconf.props["Lemon"] = {};
farming_vegetableconf.props["Lemon"].requiredskill = 7;
farming_vegetableconf.props["Lemon"].seedsRequired = 10;
farming_vegetableconf.props["Lemon"].sticksRequired = 0;
farming_vegetableconf.props["Lemon"].sheetropeRequired = 0;
farming_vegetableconf.props["Lemon"].plantType = 3;
farming_vegetableconf.props["Lemon"].texture = "LegourmetFarming_03_7";
farming_vegetableconf.props["Lemon"].waterLvl = 85;
farming_vegetableconf.props["Lemon"].timeToGrow = ZombRand(412, 524);
farming_vegetableconf.props["Lemon"].minVeg = 4;
farming_vegetableconf.props["Lemon"].maxVeg = 6;
farming_vegetableconf.props["Lemon"].minVegAutorized = 8;
farming_vegetableconf.props["Lemon"].maxVegAutorized = 10;
farming_vegetableconf.props["Lemon"].vegetableName = "legourmetfarming.NaturalLemon";
farming_vegetableconf.props["Lemon"].seedName = "legourmetfarming.LemonSeed";
farming_vegetableconf.props["Lemon"].seedPerVeg = 1;

-- Orange (3.5 months to grow)
farming_vegetableconf.props["Orange"] = {};
farming_vegetableconf.props["Orange"].requiredskill = 7;
farming_vegetableconf.props["Orange"].seedsRequired = 10;
farming_vegetableconf.props["Orange"].sticksRequired = 0;
farming_vegetableconf.props["Orange"].sheetropeRequired = 0;
farming_vegetableconf.props["Orange"].plantType = 3;
farming_vegetableconf.props["Orange"].texture = "LegourmetFarming_03_15";
farming_vegetableconf.props["Orange"].waterLvl = 75;
farming_vegetableconf.props["Orange"].timeToGrow = ZombRand(412, 524);
farming_vegetableconf.props["Orange"].minVeg = 4;
farming_vegetableconf.props["Orange"].maxVeg = 6;
farming_vegetableconf.props["Orange"].minVegAutorized = 8;
farming_vegetableconf.props["Orange"].maxVegAutorized = 10;
farming_vegetableconf.props["Orange"].vegetableName = "legourmetfarming.NaturalOrange";
farming_vegetableconf.props["Orange"].seedName = "legourmetfarming.OrangeSeed";
farming_vegetableconf.props["Orange"].seedPerVeg = 1;

-- Apple (3.5 months to grow)
farming_vegetableconf.props["Apple"] = {};
farming_vegetableconf.props["Apple"].requiredskill = 7;
farming_vegetableconf.props["Apple"].seedsRequired = 10;
farming_vegetableconf.props["Apple"].sticksRequired = 0;
farming_vegetableconf.props["Apple"].sheetropeRequired = 0;
farming_vegetableconf.props["Apple"].plantType = 3;
farming_vegetableconf.props["Apple"].texture = "LegourmetFarming_03_23";
farming_vegetableconf.props["Apple"].waterLvl = 75;
farming_vegetableconf.props["Apple"].timeToGrow = ZombRand(412, 524);
farming_vegetableconf.props["Apple"].minVeg = 4;
farming_vegetableconf.props["Apple"].maxVeg = 6;
farming_vegetableconf.props["Apple"].minVegAutorized = 8;
farming_vegetableconf.props["Apple"].maxVegAutorized = 10;
farming_vegetableconf.props["Apple"].vegetableName = "legourmetfarming.NaturalApple";
farming_vegetableconf.props["Apple"].seedName = "legourmetfarming.AppleSeed";
farming_vegetableconf.props["Apple"].seedPerVeg = 1;

-- Pear (3.5 months to grow)
farming_vegetableconf.props["Pear"] = {};
farming_vegetableconf.props["Pear"].requiredskill = 7;
farming_vegetableconf.props["Pear"].seedsRequired = 10;
farming_vegetableconf.props["Pear"].sticksRequired = 0;
farming_vegetableconf.props["Pear"].sheetropeRequired = 0;
farming_vegetableconf.props["Pear"].plantType = 3;
farming_vegetableconf.props["Pear"].texture = "LegourmetFarming_04_46";
farming_vegetableconf.props["Pear"].waterLvl = 75;
farming_vegetableconf.props["Pear"].timeToGrow = ZombRand(412, 524);
farming_vegetableconf.props["Pear"].minVeg = 4;
farming_vegetableconf.props["Pear"].maxVeg = 6;
farming_vegetableconf.props["Pear"].minVegAutorized = 8;
farming_vegetableconf.props["Pear"].maxVegAutorized = 10;
farming_vegetableconf.props["Pear"].vegetableName = "Base.Pear";
farming_vegetableconf.props["Pear"].seedName = "legourmetfarming.PearSeed";
farming_vegetableconf.props["Pear"].seedPerVeg = 1;

-- Peach (3.5 months to grow)
farming_vegetableconf.props["Peach"] = {};
farming_vegetableconf.props["Peach"].requiredskill = 7;
farming_vegetableconf.props["Peach"].seedsRequired = 10;
farming_vegetableconf.props["Peach"].sticksRequired = 0;
farming_vegetableconf.props["Peach"].sheetropeRequired = 0;
farming_vegetableconf.props["Peach"].plantType = 3;
farming_vegetableconf.props["Peach"].texture = "LegourmetFarming_03_31";
farming_vegetableconf.props["Peach"].waterLvl = 80;
farming_vegetableconf.props["Peach"].timeToGrow = ZombRand(412, 524);
farming_vegetableconf.props["Peach"].minVeg = 4;
farming_vegetableconf.props["Peach"].maxVeg = 6;
farming_vegetableconf.props["Peach"].minVegAutorized = 8;
farming_vegetableconf.props["Peach"].maxVegAutorized = 10;
farming_vegetableconf.props["Peach"].vegetableName = "legourmetfarming.NaturalPeach";
farming_vegetableconf.props["Peach"].seedName = "legourmetfarming.PeachSeed";
farming_vegetableconf.props["Peach"].seedPerVeg = 1;

-- Banana (3.5 months to grow)
farming_vegetableconf.props["Banana"] = {};
farming_vegetableconf.props["Banana"].requiredskill = 7;
farming_vegetableconf.props["Banana"].seedsRequired = 10;
farming_vegetableconf.props["Banana"].sticksRequired = 0;
farming_vegetableconf.props["Banana"].sheetropeRequired = 0;
farming_vegetableconf.props["Banana"].plantType = 3;
farming_vegetableconf.props["Banana"].texture = "LegourmetFarming_03_39";
farming_vegetableconf.props["Banana"].waterLvl = 85;
farming_vegetableconf.props["Banana"].timeToGrow = ZombRand(412, 524);
farming_vegetableconf.props["Banana"].minVeg = 4;
farming_vegetableconf.props["Banana"].maxVeg = 6;
farming_vegetableconf.props["Banana"].minVegAutorized = 8;
farming_vegetableconf.props["Banana"].maxVegAutorized = 10;
farming_vegetableconf.props["Banana"].vegetableName = "legourmetfarming.NaturalBanana";
farming_vegetableconf.props["Banana"].seedName = "legourmetfarming.BananaSeed";
farming_vegetableconf.props["Banana"].seedPerVeg = 1;

-- Cherry (3.5 months to grow)
farming_vegetableconf.props["Cherry"] = {};
farming_vegetableconf.props["Cherry"].requiredskill = 7;
farming_vegetableconf.props["Cherry"].seedsRequired = 10;
farming_vegetableconf.props["Cherry"].sticksRequired = 0;
farming_vegetableconf.props["Cherry"].sheetropeRequired = 0;
farming_vegetableconf.props["Cherry"].plantType = 3;
farming_vegetableconf.props["Cherry"].texture = "LegourmetFarming_03_47";
farming_vegetableconf.props["Cherry"].waterLvl = 85;
farming_vegetableconf.props["Cherry"].timeToGrow = ZombRand(412, 524);
farming_vegetableconf.props["Cherry"].minVeg = 8;
farming_vegetableconf.props["Cherry"].maxVeg = 10;
farming_vegetableconf.props["Cherry"].minVegAutorized = 12;
farming_vegetableconf.props["Cherry"].maxVegAutorized = 14;
farming_vegetableconf.props["Cherry"].vegetableName = "legourmetfarming.NaturalCherry";
farming_vegetableconf.props["Cherry"].seedName = "legourmetfarming.CherrySeed";
farming_vegetableconf.props["Cherry"].seedPerVeg = 1;

-- Lime (3.5 months to grow)
farming_vegetableconf.props["Lime"] = {};
farming_vegetableconf.props["Lime"].requiredskill = 7;
farming_vegetableconf.props["Lime"].seedsRequired = 10;
farming_vegetableconf.props["Lime"].sticksRequired = 0;
farming_vegetableconf.props["Lime"].sheetropeRequired = 0;
farming_vegetableconf.props["Lime"].plantType = 3;
farming_vegetableconf.props["Lime"].texture = "LegourmetFarming_03_66";
farming_vegetableconf.props["Lime"].waterLvl = 85;
farming_vegetableconf.props["Lime"].timeToGrow = ZombRand(412, 524);
farming_vegetableconf.props["Lime"].minVeg = 4;
farming_vegetableconf.props["Lime"].maxVeg = 6;
farming_vegetableconf.props["Lime"].minVegAutorized = 8;
farming_vegetableconf.props["Lime"].maxVegAutorized = 10;
farming_vegetableconf.props["Lime"].vegetableName = "legourmetfarming.NaturalLime";
farming_vegetableconf.props["Lime"].seedName = "legourmetfarming.LimeSeed";
farming_vegetableconf.props["Lime"].seedPerVeg = 1;

-- Avocado (3.5 months to grow)
farming_vegetableconf.props["Avocado"] = {};
farming_vegetableconf.props["Avocado"].requiredskill = 7;
farming_vegetableconf.props["Avocado"].seedsRequired = 10;
farming_vegetableconf.props["Avocado"].sticksRequired = 0;
farming_vegetableconf.props["Avocado"].sheetropeRequired = 0;
farming_vegetableconf.props["Avocado"].plantType = 3;
farming_vegetableconf.props["Avocado"].texture = "LegourmetFarming_03_74";
farming_vegetableconf.props["Avocado"].waterLvl = 85;
farming_vegetableconf.props["Avocado"].timeToGrow = ZombRand(412, 524);
farming_vegetableconf.props["Avocado"].minVeg = 4;
farming_vegetableconf.props["Avocado"].maxVeg = 6;
farming_vegetableconf.props["Avocado"].minVegAutorized = 8;
farming_vegetableconf.props["Avocado"].maxVegAutorized = 10;
farming_vegetableconf.props["Avocado"].vegetableName = "legourmetfarming.NaturalAvocado";
farming_vegetableconf.props["Avocado"].seedName = "legourmetfarming.AvocadoSeed";
farming_vegetableconf.props["Avocado"].seedPerVeg = 1;

-- Mango (3.5 months to grow)
farming_vegetableconf.props["Mango"] = {};
farming_vegetableconf.props["Mango"].requiredskill = 7;
farming_vegetableconf.props["Mango"].seedsRequired = 10;
farming_vegetableconf.props["Mango"].sticksRequired = 0;
farming_vegetableconf.props["Mango"].sheetropeRequired = 0;
farming_vegetableconf.props["Mango"].plantType = 3;
farming_vegetableconf.props["Mango"].texture = "LegourmetFarming_04_54";
farming_vegetableconf.props["Mango"].waterLvl = 85;
farming_vegetableconf.props["Mango"].timeToGrow = ZombRand(412, 524);
farming_vegetableconf.props["Mango"].minVeg = 4;
farming_vegetableconf.props["Mango"].maxVeg = 6;
farming_vegetableconf.props["Mango"].minVegAutorized = 8;
farming_vegetableconf.props["Mango"].maxVegAutorized = 10;
farming_vegetableconf.props["Mango"].vegetableName = "Base.Mango";
farming_vegetableconf.props["Mango"].seedName = "legourmetfarming.MangoSeed";
farming_vegetableconf.props["Mango"].seedPerVeg = 1;

-- GrapeFruit (3.5 months to grow)
farming_vegetableconf.props["GrapeFruit"] = {};
farming_vegetableconf.props["GrapeFruit"].requiredskill = 7;
farming_vegetableconf.props["GrapeFruit"].seedsRequired = 10;
farming_vegetableconf.props["GrapeFruit"].sticksRequired = 0;
farming_vegetableconf.props["GrapeFruit"].sheetropeRequired = 0;
farming_vegetableconf.props["GrapeFruit"].plantType = 3;
farming_vegetableconf.props["GrapeFruit"].texture = "LegourmetFarming_04_62";
farming_vegetableconf.props["GrapeFruit"].waterLvl = 85;
farming_vegetableconf.props["GrapeFruit"].timeToGrow = ZombRand(412, 524);
farming_vegetableconf.props["GrapeFruit"].minVeg = 4;
farming_vegetableconf.props["GrapeFruit"].maxVeg = 6;
farming_vegetableconf.props["GrapeFruit"].minVegAutorized = 8;
farming_vegetableconf.props["GrapeFruit"].maxVegAutorized = 10;
farming_vegetableconf.props["GrapeFruit"].vegetableName = "Base.Grapefruit";
farming_vegetableconf.props["GrapeFruit"].seedName = "legourmetfarming.GrapeFruitSeed";
farming_vegetableconf.props["GrapeFruit"].seedPerVeg = 1;

farming_vegetableconf.sprite = {}
farming_vegetableconf.sprite["Carrots"] = {
"vegetation_farming_01_32",
"vegetation_farming_01_33",
"vegetation_farming_01_34",
"vegetation_farming_01_35",
"vegetation_farming_01_36",
"vegetation_farming_01_37",
"vegetation_farming_01_38",
"vegetation_farming_01_39"
}
farming_vegetableconf.sprite["Broccoli"] = {
"vegetation_farming_01_24",
"vegetation_farming_01_25",
"vegetation_farming_01_26",
"vegetation_farming_01_27",
"vegetation_farming_01_28",
"vegetation_farming_01_30",
"vegetation_farming_01_29",
"vegetation_farming_01_31"
}
farming_vegetableconf.sprite["Radishes"] = {
"vegetation_farming_01_48",
"vegetation_farming_01_49",
"vegetation_farming_01_50",
"vegetation_farming_01_51",
"vegetation_farming_01_52",
"vegetation_farming_01_54",
"vegetation_farming_01_53",
"vegetation_farming_01_55"
}
farming_vegetableconf.sprite["Strawberry plant"] = {
"vegetation_farming_01_56",
"vegetation_farming_01_57",
"vegetation_farming_01_58",
"vegetation_farming_01_59",
"vegetation_farming_01_60",
"vegetation_farming_01_61",
"vegetation_farming_01_62",
"vegetation_farming_01_63"
}
farming_vegetableconf.sprite["Tomato"] = {
"vegetation_farming_01_64",
"vegetation_farming_01_65",
"vegetation_farming_01_66",
"vegetation_farming_01_67",
"vegetation_farming_01_68",
"vegetation_farming_01_69",
"vegetation_farming_01_70",
"vegetation_farming_01_71"
}
farming_vegetableconf.sprite["Coffee"] = {
"LegourmetFarming_02_60",
"LegourmetFarming_02_61",
"LegourmetFarming_02_62",
"LegourmetFarming_02_63",
"LegourmetFarming_02_64",
"LegourmetFarming_02_65",
"LegourmetFarming_02_66",
"LegourmetFarming_02_67"
}
farming_vegetableconf.sprite["Potatoes"] = {
"vegetation_farming_01_40",
"vegetation_farming_01_41",
"vegetation_farming_01_42",
"vegetation_farming_01_43",
"vegetation_farming_01_44",
"vegetation_farming_01_46",
"vegetation_farming_01_45",
"vegetation_farming_01_47"
}
farming_vegetableconf.sprite["Cabbages"] = {
"vegetation_farming_01_16",
"vegetation_farming_01_17",
"vegetation_farming_01_18",
"vegetation_farming_01_19",
"vegetation_farming_01_20",
"vegetation_farming_01_22",
"vegetation_farming_01_21",
"vegetation_farming_01_23"
}
farming_vegetableconf.sprite["Leek"] = {
"LegourmetFarming_02_8",
"LegourmetFarming_02_9",
"LegourmetFarming_02_10",
"LegourmetFarming_02_11",
"LegourmetFarming_02_12",
"LegourmetFarming_02_14",
"LegourmetFarming_02_13",
"LegourmetFarming_02_15"
}
farming_vegetableconf.sprite["Lettuce"] = {
"LegourmetFarming_02_16",
"LegourmetFarming_02_17",
"LegourmetFarming_02_18",
"LegourmetFarming_02_19",
"LegourmetFarming_02_20",
"LegourmetFarming_02_21",
"LegourmetFarming_02_22",
"LegourmetFarming_02_23"
}
farming_vegetableconf.sprite["Onion"] = {
"LegourmetFarming_02_0",
"LegourmetFarming_02_1",
"LegourmetFarming_02_2",
"LegourmetFarming_02_3",
"LegourmetFarming_02_4",
"LegourmetFarming_02_6",
"LegourmetFarming_02_5",
"LegourmetFarming_02_7"
}
farming_vegetableconf.sprite["Peanut"] = {
"LegourmetFarming_02_24",
"LegourmetFarming_02_25",
"LegourmetFarming_02_26",
"LegourmetFarming_02_27",
"LegourmetFarming_02_28",
"LegourmetFarming_02_29",
"LegourmetFarming_02_30",
"LegourmetFarming_02_31"
}
farming_vegetableconf.sprite["Pumpkin"] = {
"LegourmetFarming_01_8",
"LegourmetFarming_01_9",
"LegourmetFarming_01_10",
"LegourmetFarming_01_11",
"LegourmetFarming_01_12",
"LegourmetFarming_01_13",
"LegourmetFarming_01_14",
"LegourmetFarming_01_15"
}
farming_vegetableconf.sprite["Watermelon"] = {
"LegourmetFarming_01_24",
"LegourmetFarming_01_25",
"LegourmetFarming_01_26",
"LegourmetFarming_01_27",
"LegourmetFarming_01_28",
"LegourmetFarming_01_29",
"LegourmetFarming_01_30",
"LegourmetFarming_01_31"
}
farming_vegetableconf.sprite["Zucchini"] = {
"LegourmetFarming_01_16",
"LegourmetFarming_01_17",
"LegourmetFarming_01_18",
"LegourmetFarming_01_19",
"LegourmetFarming_01_20",
"LegourmetFarming_01_21",
"LegourmetFarming_01_22",
"LegourmetFarming_01_23"
}
farming_vegetableconf.sprite["Corn"] = {
"vegetation_farming_01_72",
"vegetation_farming_01_73",
"vegetation_farming_01_74",
"vegetation_farming_01_75",
"vegetation_farming_01_76",
"vegetation_farming_01_77",
"vegetation_farming_01_78",
"vegetation_farming_01_79"
}
farming_vegetableconf.sprite["Rice"] = {
"LegourmetFarming_02_42",
"LegourmetFarming_02_43",
"LegourmetFarming_02_44",
"LegourmetFarming_02_45",
"LegourmetFarming_02_46",
"LegourmetFarming_02_47",
"LegourmetFarming_02_48",
"LegourmetFarming_02_49"
}
farming_vegetableconf.sprite["Bean"] = {
"LegourmetFarming_01_0",
"LegourmetFarming_01_1",
"LegourmetFarming_01_2",
"LegourmetFarming_01_3",
"LegourmetFarming_01_4",
"LegourmetFarming_01_5",
"LegourmetFarming_01_6",
"LegourmetFarming_01_7"
}
farming_vegetableconf.sprite["BellPepper"] = {
"LegourmetFarming_01_40",
"LegourmetFarming_01_41",
"LegourmetFarming_01_42",
"LegourmetFarming_01_43",
"LegourmetFarming_01_44",
"LegourmetFarming_01_45",
"LegourmetFarming_01_46",
"LegourmetFarming_01_47"
}
farming_vegetableconf.sprite["Eggplant"] = {
"LegourmetFarming_01_56",
"LegourmetFarming_01_57",
"LegourmetFarming_01_58",
"LegourmetFarming_01_59",
"LegourmetFarming_01_60",
"LegourmetFarming_01_61",
"LegourmetFarming_01_62",
"LegourmetFarming_01_63"
}
farming_vegetableconf.sprite["Wheat"] = {
"LegourmetFarming_01_64",
"LegourmetFarming_01_65",
"LegourmetFarming_01_66",
"LegourmetFarming_01_67",
"LegourmetFarming_01_68",
"LegourmetFarming_01_69",
"LegourmetFarming_01_70",
"LegourmetFarming_01_71"
}
farming_vegetableconf.sprite["Sugarcane"] = {
"LegourmetFarming_04_0",
"LegourmetFarming_04_1",
"LegourmetFarming_04_2",
"LegourmetFarming_04_3",
"LegourmetFarming_04_4",
"LegourmetFarming_04_5",
"LegourmetFarming_04_6",
"LegourmetFarming_04_7"
}
farming_vegetableconf.sprite["Sunflower"] = {
"LegourmetFarming_04_8",
"LegourmetFarming_04_9",
"LegourmetFarming_04_10",
"LegourmetFarming_04_11",
"LegourmetFarming_04_12",
"LegourmetFarming_04_13",
"LegourmetFarming_04_14",
"LegourmetFarming_04_15"
}
farming_vegetableconf.sprite["Grape"] = {
"LegourmetFarming_01_48",
"LegourmetFarming_01_49",
"LegourmetFarming_01_50",
"LegourmetFarming_01_51",
"LegourmetFarming_01_52",
"LegourmetFarming_01_53",
"LegourmetFarming_01_54",
"LegourmetFarming_01_55"
}
farming_vegetableconf.sprite["Pea"] = {
"LegourmetFarming_01_32",
"LegourmetFarming_01_33",
"LegourmetFarming_01_34",
"LegourmetFarming_01_35",
"LegourmetFarming_01_36",
"LegourmetFarming_01_37",
"LegourmetFarming_01_38",
"LegourmetFarming_01_39"
}

farming_vegetableconf.sprite["Lemon"] = {
"LegourmetFarming_03_1",
"LegourmetFarming_03_2",
"LegourmetFarming_03_3",
"LegourmetFarming_03_4",
"LegourmetFarming_03_5",
"LegourmetFarming_03_6",
"LegourmetFarming_03_7",
"LegourmetFarming_03_8"
}

farming_vegetableconf.sprite["Orange"] = {
"LegourmetFarming_03_9",
"LegourmetFarming_03_10",
"LegourmetFarming_03_11",
"LegourmetFarming_03_12",
"LegourmetFarming_03_13",
"LegourmetFarming_03_14",
"LegourmetFarming_03_15",
"LegourmetFarming_03_16"
}

farming_vegetableconf.sprite["Apple"] = {
"LegourmetFarming_03_17",
"LegourmetFarming_03_18",
"LegourmetFarming_03_19",
"LegourmetFarming_03_20",
"LegourmetFarming_03_21",
"LegourmetFarming_03_22",
"LegourmetFarming_03_23",
"LegourmetFarming_03_24"
}

farming_vegetableconf.sprite["Peach"] = {
"LegourmetFarming_03_25",
"LegourmetFarming_03_26",
"LegourmetFarming_03_27",
"LegourmetFarming_03_28",
"LegourmetFarming_03_29",
"LegourmetFarming_03_30",
"LegourmetFarming_03_31",
"LegourmetFarming_03_32"
}

farming_vegetableconf.sprite["Banana"] = {
"LegourmetFarming_03_33",
"LegourmetFarming_03_34",
"LegourmetFarming_03_35",
"LegourmetFarming_03_36",
"LegourmetFarming_03_37",
"LegourmetFarming_03_38",
"LegourmetFarming_03_39",
"LegourmetFarming_03_40"
}

farming_vegetableconf.sprite["Cherry"] = {
"LegourmetFarming_03_41",
"LegourmetFarming_03_42",
"LegourmetFarming_03_43",
"LegourmetFarming_03_44",
"LegourmetFarming_03_45",
"LegourmetFarming_03_46",
"LegourmetFarming_03_47",
"LegourmetFarming_03_48"
}

farming_vegetableconf.sprite["Pineapple"] = {
"LegourmetFarming_02_52",
"LegourmetFarming_02_53",
"LegourmetFarming_02_54",
"LegourmetFarming_02_55",
"LegourmetFarming_02_56",
"LegourmetFarming_02_57",
"LegourmetFarming_02_58",
"LegourmetFarming_02_59"
}

farming_vegetableconf.sprite["Lime"] = {
"LegourmetFarming_03_60",
"LegourmetFarming_03_61",
"LegourmetFarming_03_62",
"LegourmetFarming_03_63",
"LegourmetFarming_03_64",
"LegourmetFarming_03_65",
"LegourmetFarming_03_66",
"LegourmetFarming_03_67"
}

farming_vegetableconf.sprite["Avocado"] = {
"LegourmetFarming_03_68",
"LegourmetFarming_03_69",
"LegourmetFarming_03_70",
"LegourmetFarming_03_71",
"LegourmetFarming_03_72",
"LegourmetFarming_03_73",
"LegourmetFarming_03_74",
"LegourmetFarming_03_75"
}
farming_vegetableconf.sprite["Chili"] = {
"LegourmetFarming_02_70",
"LegourmetFarming_02_71",
"LegourmetFarming_02_72",
"LegourmetFarming_02_73",
"LegourmetFarming_02_74",
"LegourmetFarming_02_75",
"LegourmetFarming_02_76",
"LegourmetFarming_02_77"
}

farming_vegetableconf.sprite["Tobacco"] = {
"LegourmetFarming_04_16",
"LegourmetFarming_04_17",
"LegourmetFarming_04_18",
"LegourmetFarming_04_19",
"LegourmetFarming_04_20",
"LegourmetFarming_04_21",
"LegourmetFarming_04_22",
"LegourmetFarming_04_23"
}

farming_vegetableconf.sprite["Habanero"] = {
"LegourmetFarming_04_24",
"LegourmetFarming_04_25",
"LegourmetFarming_04_26",
"LegourmetFarming_04_27",
"LegourmetFarming_04_28",
"LegourmetFarming_04_29",
"LegourmetFarming_04_30",
"LegourmetFarming_04_31"
}

farming_vegetableconf.sprite["Jalapeno"] = {
"LegourmetFarming_04_32",
"LegourmetFarming_04_33",
"LegourmetFarming_04_34",
"LegourmetFarming_04_35",
"LegourmetFarming_04_36",
"LegourmetFarming_04_37",
"LegourmetFarming_04_38",
"LegourmetFarming_04_39"
}

farming_vegetableconf.sprite["Pear"] = {
"LegourmetFarming_04_40",
"LegourmetFarming_04_41",
"LegourmetFarming_04_42",
"LegourmetFarming_04_43",
"LegourmetFarming_04_44",
"LegourmetFarming_04_45",
"LegourmetFarming_04_46",
"LegourmetFarming_04_47"
}

farming_vegetableconf.sprite["Mango"] = {
"LegourmetFarming_04_48",
"LegourmetFarming_04_49",
"LegourmetFarming_04_50",
"LegourmetFarming_04_51",
"LegourmetFarming_04_52",
"LegourmetFarming_04_53",
"LegourmetFarming_04_54",
"LegourmetFarming_04_55"
}

farming_vegetableconf.sprite["GrapeFruit"] = {
"LegourmetFarming_04_56",
"LegourmetFarming_04_57",
"LegourmetFarming_04_58",
"LegourmetFarming_04_59",
"LegourmetFarming_04_60",
"LegourmetFarming_04_61",
"LegourmetFarming_04_62",
"LegourmetFarming_04_63"
}