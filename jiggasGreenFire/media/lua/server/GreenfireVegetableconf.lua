--if ProceduralDistributions ~= nil then
--if isClient() then return end
--end
require 'Farming/farming_vegetableconf'
--require "GFGeneBank"


-------------------------------------------------
-- Greenfire Farming by jiggawutt (April 2019) --
-------------------------------------------------
--
-- Thankfully none of the functions in farming_vegetableconf requires overriding. 
-- All of these statements are extensions of pre-existing functions and tables.
--
GreenfireVegetableconf = {};

-- Cannabis
-- Need 2 seeds
-- Water lvl over 60
-- Using same schedule as cabbages
GreenfireVegetableconf.growCannabis = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;

	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);
	--[[
	if getActivatedMods():contains("GreenFireCannabisGenetics") and not GFGeneBank:GFGBgetPlant(planting.x, planting.y, planting.z) then
		GFGeneBank:GFGBLoad(planting.x, planting.y, planting.z, nbOfGrow);
	end
	--]]
	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	if(nbOfGrow <= 0) then -- young
		nbOfGrow = 0;
		planting.nbOfGrow = 0;

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
		if(water >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 168);
			planting:setObjectName(farming_vegetableconf.getObjectName(planting))
			planting:setSpriteName(farming_vegetableconf.getSpriteName(planting))
			planting.hasVegetable = true;
			planting.hasSeed = true;
		else
			badPlant(water, nil, diseaseLvl, planting, nextGrowing, updateNbOfGrow);
		end
	elseif (planting.state ~= "rotten") then -- rotten
		--GFGeneBank:GFGBDelete(planting.x, planting.y, planting.z);
		planting:rottenThis()
	end
	--[[
	if getActivatedMods():contains("GreenFireCannabisGenetics") and GFGeneBank:GFGBgetPlant(planting.x, planting.y, planting.z) then
		GFGeneBank:GFGBsetNbOfGrow(planting.x, planting.y, planting.z, nbOfGrow)
	end
	--]]
	return planting;
end

-- Tobacco
-- Need 2 seeds
-- Water lvl over 60
-- Using same schedule as cabbages
GreenfireVegetableconf.growTobacco = function(planting, nextGrowing, updateNbOfGrow)
	local nbOfGrow = planting.nbOfGrow;
	local water = farming_vegetableconf.calcWater(planting.waterNeeded, planting.waterLvl);

	local diseaseLvl = farming_vegetableconf.calcDisease(planting.mildewLvl);
	
	if(nbOfGrow <= 0) then -- young
		nbOfGrow = 0;
		planting.nbOfGrow = 0;
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
		if(water >= 0 and diseaseLvl >= 0) then
			planting.nextGrowing = calcNextGrowing(nextGrowing, 168);
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

--Adding icons to an already existing table. Not sure if this is the proper way to do it or not, requires some testing.
farming_vegetableconf.icons["Cannabis"] = "media/textures/Item_CannabisBase.png";
farming_vegetableconf.icons["Tobacco"] = "media/textures/Item_Tobacco.png";

-- Cannabis
if not farming_vegetableconf.props["Cannabis"] then
	farming_vegetableconf.props["Cannabis"] = {};
end
farming_vegetableconf.props["Cannabis"].seedsRequired = 1;
farming_vegetableconf.props["Cannabis"].texture = "canna_05";
farming_vegetableconf.props["Cannabis"].waterLvl = 60;
farming_vegetableconf.props["Cannabis"].timeToGrow = ZombRand(89, 112);
farming_vegetableconf.props["Cannabis"].vegetableName = "Greenfire.FreshUnCanna";
farming_vegetableconf.props["Cannabis"].seedName = "Greenfire.CannabisSeed";
farming_vegetableconf.props["Cannabis"].growCode ="GreenfireVegetableconf.growCannabis";
farming_vegetableconf.props["Cannabis"].seedPerVeg = ZombRand(4, 6);
farming_vegetableconf.props["Cannabis"].minVeg = 1;
farming_vegetableconf.props["Cannabis"].maxVeg = 3;
farming_vegetableconf.props["Cannabis"].minVegAutorized = 2;
farming_vegetableconf.props["Cannabis"].maxVegAutorized = 5;


-- Tobacco
if not farming_vegetableconf.props["Tobacco"] then
	farming_vegetableconf.props["Tobacco"] = {};
end
farming_vegetableconf.props["Tobacco"].seedsRequired = 2;
farming_vegetableconf.props["Tobacco"].texture = "tabac_05";
farming_vegetableconf.props["Tobacco"].waterLvl = 60;
farming_vegetableconf.props["Tobacco"].timeToGrow = ZombRand(195, 206);
farming_vegetableconf.props["Tobacco"].vegetableName = "Greenfire.FreshBTobacco";
farming_vegetableconf.props["Tobacco"].seedName = "Greenfire.TobaccoSeed";
farming_vegetableconf.props["Tobacco"].growCode ="GreenfireVegetableconf.growTobacco";
farming_vegetableconf.props["Tobacco"].seedPerVeg = ZombRand(12, 18);
farming_vegetableconf.props["Tobacco"].minVeg = 1;
farming_vegetableconf.props["Tobacco"].maxVeg = 1;
farming_vegetableconf.props["Tobacco"].minVegAutorized = 1;
farming_vegetableconf.props["Tobacco"].maxVegAutorized = 1;

farming_vegetableconf.sprite["Tobacco"] = {
"tabac_00",
"tabac_01",
"tabac_02",
"tabac_03",
"tabac_04",
"tabac_05",
"tabac_06",
"tabac_07"
}

if ProceduralDistributions then
	farming_vegetableconf.props["Cannabis"].waterLvlMax = 100;
	farming_vegetableconf.props["Tobacco"].waterLvlMax = 100;
end

farming_vegetableconf.sprite["Cannabis"] = {
"canna_00",
"canna_01",
"canna_02",
"canna_03",
"canna_04",
"canna_05",
"canna_06",
"canna_07"
}

