if ProceduralDistributions ~= nil then
if isClient() then return end
end

require "Farming/SFarmingSystem"
require "Farming/SPlantGlobalObject"
require "Map/CGlobalObject"
require "GreenfireVegetableconf"

if (getActivatedMods():contains("Hydrocraft")) then
	require "Farming/HCFarmingSystem"
end

if getActivatedMods():contains("GreenFireCannabisGenetics") then
	require "GFGeneBank"
end




-- grow the plant
function SFarmingSystem:growPlant(luaObject, nextGrowing, updateNbOfGrow)
	if(luaObject.state == "seeded") then
		local new = luaObject.nbOfGrow <= 0

		if (getActivatedMods():contains("FarmingNeverRot")) then
			--NeverRot is this if statement.
			if (luaObject.nbOfGrow >6) then
				luaObject.nbOfGrow = 6
			end
		end

		if(luaObject.typeOfSeed == "Carrots") then
			luaObject = farming_vegetableconf.growCarrots(luaObject, nextGrowing, updateNbOfGrow)
		elseif(luaObject.typeOfSeed == "Broccoli") then
			luaObject = farming_vegetableconf.growBroccoli(luaObject, nextGrowing, updateNbOfGrow)
		elseif(luaObject.typeOfSeed == "Strawberry plant") then
			luaObject = farming_vegetableconf.growStrewberries(luaObject, nextGrowing, updateNbOfGrow)
		elseif(luaObject.typeOfSeed == "Radishes") then
			luaObject = farming_vegetableconf.growRedRadish(luaObject, nextGrowing, updateNbOfGrow)
		elseif(luaObject.typeOfSeed == "Tomato") then
			luaObject = farming_vegetableconf.growTomato(luaObject, nextGrowing, updateNbOfGrow)
		elseif(luaObject.typeOfSeed == "Potatoes") then
			luaObject = farming_vegetableconf.growPotato(luaObject, nextGrowing, updateNbOfGrow)
		elseif(luaObject.typeOfSeed == "Cabbages") then
			luaObject = farming_vegetableconf.growCabbage(luaObject, nextGrowing, updateNbOfGrow)
		elseif luaObject.typeOfSeed then
			if farming_vegetableconf.props[luaObject.typeOfSeed].growCode ~= nil then
				local growCode = farming_vegetableconf.props[luaObject.typeOfSeed].growCode
				luaObject = assert(loadstring('return '..growCode..'(...)'))(luaObject, nextGrowing, updateNbOfGrow)
			end
			if (getActivatedMods():contains("Hydrocraft")) then
				luaObject = farming_vegetableconf.HCgrowAllPlants(luaObject, nextGrowing, updateNbOfGrow)				
			end
		end
		-- maybe this plant gonna be disease
		if not new and luaObject.nbOfGrow > 0 then
			self:diseaseThis(luaObject, true)
		end
		luaObject.nbOfGrow = luaObject.nbOfGrow + 1
	end
end

function SFarmingSystem:harvest(luaObject, player)

if getActivatedMods():contains("GreenFireCannabisGenetics") then
	local AA_Aa = { "AA", "AA", "Aa", "Aa" }
	local AA_aa = { "Aa", "Aa", "Aa", "Aa" }
	local Aa_Aa = { "AA", "Aa", "Aa", "aa" }
	local Aa_aa = { "Aa", "Aa", "aa", "aa" }
end

	local props = farming_vegetableconf.props[luaObject.typeOfSeed]
	local numberOfVeg = getVegetablesNumber(props.minVeg, props.maxVeg, props.minVegAutorized, props.maxVegAutorized, luaObject)

	if getActivatedMods():contains("GreenFireCannabisGenetics") then
	if luaObject.typeOfSeed == "Cannabis" then
		local alleles = {"AA", "Aa", "aa"};
		local allele1 = nil;
		local allele2 = nil;
		local allele3 = nil;
		local allele4 = nil;
		local x0 = luaObject.x
		local y0 = luaObject.y
		local z0 = luaObject.z

		if not GFGeneBank:GFGBgetPlant(x0, y0, z0) then
			player:Say("plant not found");
			GFGeneBank:GFGBLoad(x0, y0, z0);
		end


		local matefound = false;
		local mate = nil;
		for j=0, 3 do
			for i=(-j-1), (1+j) do
				mate = CFarmingSystem.instance:getIsoObjectOnSquare(getWorld():getCell():getGridSquare(x0+1+j, y0+i, z0));

				if mate then
					if mate.typeOfSeed == "Cannabis" then

						if not GFGeneBank:GFGBgetPlant(x0+1+j, y0+i, z0) then
							GFGeneBank:GFGBLoad(x0+1+j, y0+i, z0);
						end
						if mate.nbOfGrow <= 6 and mate.nbOfGrow >= 4 then
							matefound = true;
							break;
						end
					end
				end
			end
			for i=(-j-1), (1+j) do
				if not i == 0 and not j == 0 then
					mate = CFarmingSystem.instance:getIsoObjectOnSquare(getWorld():getCell():getGridSquare(x0+i+j, y0, z0));
				end
				if mate then
					if mate.typeOfSeed == "Cannabis" then
						if not GFGeneBank:GFGBgetPlant(x0+i+j, y0, z0) then
							GFGeneBank:GFGBLoad(x0+i+j, y0, z0);
						end
						if mate.nbOfGrow <= 6 and mate.nbOfGrow >= 4 then
							matefound = true;
							break;
						end
					end
				end
			end
			for i=(-j-1), (1+j) do
				mate = CFarmingSystem.instance:getIsoObjectOnSquare(getWorld():getCell():getGridSquare(x0-1-j, y0+i, z0));
				if mate then
					if mate.typeOfSeed == "Cannabis" then
						if not GFGeneBank:GFGBgetPlant(x0-1-j, y0+i, z0) then
							GFGeneBank:GFGBLoad(x0-1-j, y0+i, z0);
						end
						if mate.nbOfGrow <= 6 and mate.nbOfGrow >= 4 then
							matefound = true;
							break;
						end
					end
				end
			end
			if matefound then
				break;	
			end
		end

		if not mate then
			player:Say("Mate not found");
			local coinflip = ZombRand(1, 2);
			if coinflip == 1 then
				mate = {};
				mate.GFAllele1 = alleles[ZombRand(1, 3)];
				mate.GFAllele2 = alleles[ZombRand(1, 3)];
				mate.GFAllele3 = alleles[ZombRand(1, 3)];
				mate.GFAllele4 = alleles[ZombRand(1, 3)];
			elseif coinflip == 2 then
				mate = {};
				mate.GFAllele1 = GFGeneBank:GFGBgetAllele(x0, y0, z0, 1);
				mate.GFAllele2 = GFGeneBank:GFGBgetAllele(x0, y0, z0, 2);
				mate.GFAllele3 = GFGeneBank:GFGBgetAllele(x0, y0, z0, 3);
				mate.GFAllele4 = GFGeneBank:GFGBgetAllele(x0, y0, z0, 4);
			end
		end
		local plantAllele1 = GFGeneBank:GFGBgetAllele(x0, y0, z0, 1);
		local plantAllele2 = GFGeneBank:GFGBgetAllele(x0, y0, z0, 2);
		local plantAllele3 = GFGeneBank:GFGBgetAllele(x0, y0, z0, 3);
		local plantAllele4 = GFGeneBank:GFGBgetAllele(x0, y0, z0, 4);
			if not mate.GFAllele1 then
				mate.GFAllele1 = alleles[ZombRand(1, 3)];
			end

				if mate.GFAllele1 == "AA" and plantAllele1 == "AA" then
					allele1 = "AA";
				elseif mate.GFAllele1 == "AA" and plantAllele1 == "Aa" then
					allele1 = AA_Aa[ZombRand(1, 4)];
				elseif mate.GFAllele1 == "AA" and plantAllele1 == "aa" then
					allele1 = AA_aa[ZombRand(1, 4)];
				elseif mate.GFAllele1 == "Aa" and plantAllele1 == "AA" then
					allele1 = AA_Aa[ZombRand(1, 4)];
				elseif mate.GFAllele1 == "aa" and plantAllele1 == "AA" then
					allele1 = AA_aa[ZombRand(1, 4)];
				elseif mate.GFAllele1 == "Aa" and plantAllele1 == "Aa" then
					allele1 = Aa_Aa[ZombRand(1, 4)];
				elseif mate.GFAllele1 == "Aa" and plantAllele1 == "aa" then
					allele1 = Aa_aa[ZombRand(1, 4)];
				elseif mate.GFAllele1 == "aa" and plantAllele1 == "Aa" then
					allele1 = Aa_aa[ZombRand(1, 4)];
				elseif mate.GFAllele1 == "aa" and plantAllele1 == "aa" then
					allele1 = "aa";
				end

			if not mate.GFAllele2 then
				mate.GFAllele2 = alleles[ZombRand(1, 3)];
			end

				if mate.GFAllele2 == "AA" and plantAllele2 == "AA" then
					allele2 = "AA";
				elseif mate.GFAllele2 == "AA" and plantAllele2 == "Aa" then
					allele2 = AA_Aa[ZombRand(1, 4)];
				elseif mate.GFAllele2 == "AA" and plantAllele2 == "aa" then
					allele2 = AA_aa[ZombRand(1, 4)];
				elseif mate.GFAllele2 == "Aa" and plantAllele2 == "AA" then
					allele2 = AA_Aa[ZombRand(1, 4)];
				elseif mate.GFAllele2 == "aa" and plantAllele2 == "AA" then
					allele2 = AA_aa[ZombRand(1, 4)];
				elseif mate.GFAllele2 == "Aa" and plantAllele2 == "Aa" then
					allele2 = Aa_Aa[ZombRand(1, 4)];
				elseif mate.GFAllele2 == "Aa" and plantAllele2 == "aa" then
					allele2 = Aa_aa[ZombRand(1, 4)];
				elseif mate.GFAllele2 == "aa" and plantAllele2 == "Aa" then
					allele2 = Aa_aa[ZombRand(1, 4)];
				elseif mate.GFAllele2 == "aa" and plantAllele2 == "aa" then
					allele2 = "aa";
				end

			if not mate.GFAllele3 then
				mate.GFAllele3 = alleles[ZombRand(1, 3)];
			end

				if mate.GFAllele3 == "AA" and plantAllele3 == "AA" then
					allele3 = "AA";
				elseif mate.GFAllele3 == "AA" and plantAllele3 == "Aa" then
					allele3 = AA_Aa[ZombRand(1, 4)];
				elseif mate.GFAllele3 == "AA" and plantAllele3 == "aa" then
					allele3 = AA_aa[ZombRand(1, 4)];
				elseif mate.GFAllele3 == "Aa" and plantAllele3 == "AA" then
					allele3 = AA_Aa[ZombRand(1, 4)];
				elseif mate.GFAllele3 == "aa" and plantAllele3 == "AA" then
					allele3 = AA_aa[ZombRand(1, 4)];
				elseif mate.GFAllele3 == "Aa" and plantAllele3 == "Aa" then
					allele3 = Aa_Aa[ZombRand(1, 4)];
				elseif mate.GFAllele3 == "Aa" and plantAllele3 == "aa" then
					allele3 = Aa_aa[ZombRand(1, 4)];
				elseif mate.GFAllele3 == "aa" and plantAllele3 == "Aa" then
					allele3 = Aa_aa[ZombRand(1, 4)];
				elseif mate.GFAllele3 == "aa" and plantAllele3 == "aa" then
					allele3 = "aa";
				end


			if not mate.GFAllele4 then
				mate.GFAllele4 = alleles[ZombRand(1, 3)];
			end

				if mate.GFAllele4 == "AA" and plantAllele4 == "AA" then
					allele4 = "AA";
				elseif mate.GFAllele4 == "AA" and plantAllele4 == "Aa" then
					allele4 = AA_Aa[ZombRand(1, 4)];
				elseif mate.GFAllele4 == "AA" and plantAllele4 == "aa" then
					allele4 = AA_aa[ZombRand(1, 4)];
				elseif mate.GFAllele4 == "Aa" and plantAllele4 == "AA" then
					allele4 = AA_Aa[ZombRand(1, 4)];
				elseif mate.GFAllele4 == "aa" and plantAllele4 == "AA" then
					allele4 = AA_aa[ZombRand(1, 4)];
				elseif mate.GFAllele4 == "Aa" and plantAllele4 == "Aa" then
					allele4 = Aa_Aa[ZombRand(1, 4)];
				elseif mate.GFAllele4 == "Aa" and plantAllele4 == "aa" then
					allele4 = Aa_aa[ZombRand(1, 4)];
				elseif mate.GFAllele4 == "aa" and plantAllele4 == "Aa" then
					allele4 = Aa_aa[ZombRand(1, 4)];
				elseif mate.GFAllele4 == "aa" and plantAllele4 == "aa" then
					allele4 = "aa";
				end

		if player then
			for i=1, numberOfVeg do
				player:getInventory():AddItem(props.vegetableName):getModData().GFalleles = {allele1, allele2, allele3, allele4};
			end
			player:Say(allele1 .. " " .. allele2 .. " " .. allele3 .. " " .. allele4);
		end
		if luaObject.hasSeed and player then
			for i=1, (props.seedPerVeg * numberOfVeg) do
				player:getInventory():AddItem("Greenfire.CannabisSeed"):getModData().GFalleles = {allele1, allele2, allele3, allele4};
			end
		end
		GFGeneBank:GFGBDelete(x0, y0, z0);
	else
		if player then
			player:sendObjectChange('addItemOfType', { type = props.vegetableName, count = numberOfVeg })
		end

		if luaObject.hasSeed and player then
			player:sendObjectChange('addItemOfType', { type = props.seedName, count = (props.seedPerVeg * numberOfVeg) })
		end
	end
	else
		if player then
			player:sendObjectChange('addItemOfType', { type = props.vegetableName, count = numberOfVeg })
		end

		if luaObject.hasSeed and player then
			player:sendObjectChange('addItemOfType', { type = props.seedName, count = (props.seedPerVeg * numberOfVeg) })
		end
	end
	luaObject.hasVegetable = false
	luaObject.hasSeed = false

	-- the strawberrie don't disapear, it goes on phase 2 again
	local props = farming_vegetableconf.props[luaObject.typeOfSeed];
	if luaObject.typeOfSeed == "Strawberry plant" then
		luaObject.nbOfGrow = 1
		self:growPlant(luaObject, nil, true)
		luaObject:saveData()
	elseif luaObject.retainOnHarvest ~= nil then
		luaObject.nbOfGrow = luaObject.retainOnHarvest
		self:growPlant(luaObject, nil, true)
		luaObject:saveData()
	elseif props.multiHarvest ~= nil and props.multiHarvest then
		luaObject.nbOfGrow = 3;
		luaObject.fertilizer = 0;
		self.growPlant(luaObject, nil, true);
		luaObject:saveData();
	else
		self:removePlant(luaObject)
	end
end

function SPlantGlobalObject:rottenThis()
	local texture = nil
	if self.typeOfSeed == "Carrots" then
		texture = "vegetation_farming_01_13"
	elseif self.typeOfSeed == "Broccoli" then
		texture = "vegetation_farming_01_23"
	elseif self.typeOfSeed == "Strawberry plant" then
		texture = "vegetation_farming_01_63"
	elseif self.typeOfSeed == "Radishes" then
		texture = "vegetation_farming_01_39"
	elseif self.typeOfSeed == "Tomato" then
		texture = "vegetation_farming_01_71"
	elseif self.typeOfSeed == "Potatoes" then
		texture = "vegetation_farming_01_47"
	elseif self.typeOfSeed == "Cabbages" then
		texture = "vegetation_farming_01_31"
	elseif self.typeOfSeed then
		if farming_vegetableconf.sprite[self.typeOfSeed][8] ~= nil then
			texture = farming_vegetableconf.sprite[self.typeOfSeed][8]
			if getActivatedMods():contains("GreenFireCannabisGenetics") then
				if self.typeOfSeed == "Cannabis" and GFGeneBank:GFGBgetPlant(self.x, self.y, self.z) then
					GFGeneBank:GFGBDelete(self.x, self.y, self.z);
				end
			end
		else
			print("jigga says; WARNING: Texture for rotten farming object, '" .. self.typeOfSeed .. ",' was not found! Rotten farming object is now invisible!");
		end
	end
	if texture ~= nil then
		self:setSpriteName(texture)
	end
	self.state = "rotten"
	self:setObjectName(farming_vegetableconf.getObjectName(self))
	self:deadPlant()
end