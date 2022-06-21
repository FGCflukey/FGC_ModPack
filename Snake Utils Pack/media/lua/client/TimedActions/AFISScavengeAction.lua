--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************
require "TimedActions/ISScavengeAction"
require "TimedActions/ISBaseTimedAction"

function ISScavengeAction:start()
	local detector = self.character:getPrimaryHandItem();
	if detector ~= nil and detector:getType() == "MetalDetector" and detector:isActivated() and detector:getUsedDelta() > 0 and self.options["Metals"] then
		--nothing we can see detector in hands
	else
		self:setActionAnim("Forage");
		self:setOverrideHandModels(nil, nil)
	end
end

-- random a plant/insect, more chance in deep forest
-- function ISScavengeAction:scavenge()
    -- self.character:getStats():setEndurance(self.character:getStats():getEndurance() - 0.004)
    -- local zone = self:getScavengeZone();

    -- local scavengeZoneNumber = ZombRand(5,15) + self.scavengeZoneIncrease;
    -- if scavengeZoneNumber <= 0 then
        -- scavengeZoneNumber = 1;
    -- end
    -- if zone then
        -- local plantLeft = tonumber(zone:getName());
        -- if getGametimeTimestamp() - zone:getLastActionTimestamp() > 50000 then
            -- --            print("refill zone");
            -- zone:setName(tostring(scavengeZoneNumber));
            -- zone:setOriginalName(tostring(scavengeZoneNumber));
        -- elseif plantLeft == 0 then return; end
    -- end
	
	-- local itemsAdded = nil;
    -- local item = self:getPlant();
    -- if item ~= nil then
		-- self.character:playSound("RemovePlant");
        -- itemsAdded = self:addOrDropItems(item.type, item.count);
        -- self.character:getXp():AddXP(Perks.PlantScavenging, 7);
		-- if self.scavengeUI then
            -- self.scavengeUI:setItemScavenged(itemsAdded);
		-- end
    -- elseif ZombRand(9) == 0 then -- give some xp even for a fail
        -- self.character:getXp():AddXP(Perks.PlantScavenging, 1);
    -- end

    -- local goods = self:getForestGoods();
    -- if goods ~= nil then
		-- self.character:playSound("RemovePlant");
        -- itemsAdded = self:addOrDropItems(goods.type, goods.count);
        -- self.character:getXp():AddXP(Perks.PlantScavenging, 3);
		-- if self.scavengeUI then
            -- self.scavengeUI:setItemScavenged(itemsAdded);
		-- end
    -- elseif ZombRand(9) == 0 then -- give some xp even for a fail
        -- self.character:getXp():AddXP(Perks.PlantScavenging, 1);
    -- end
	
	-- local metals = nil;
	-- local primdetector = self.character:getPrimaryHandItem();
	-- if primdetector ~= nil and primdetector:getType() == "MetalDetector" and primdetector:isActivated() and primdetector:getUsedDelta() > 0 then
		-- metals = self:getMetals();
		-- if metals ~= nil then
			-- self.character:playSound("detectorbeeping");
			-- itemsAdded = self:addOrDropItems(metals.type, metals.count);
			-- self.character:getXp():AddXP(Perks.PlantScavenging, 3);
			-- if self.scavengeUI then
				-- self.scavengeUI:setItemScavenged(itemsAdded);
			-- end
		-- elseif ZombRand(9) == 0 then -- give some xp even for a fail
			-- self.character:getXp():AddXP(Perks.PlantScavenging, 1);
		-- end
	-- end
	
	-- local medicinal = nil;
    -- if self.character:getKnownRecipes():contains("Herbalist") then
        -- medicinal = self:getMedicinalHerbs();
        -- if medicinal ~= nil then
			-- self.character:playSound("RemovePlant");
            -- itemsAdded = self:addOrDropItems(medicinal.type, medicinal.count);
            -- self.character:getXp():AddXP(Perks.PlantScavenging, 5);
			-- if self.scavengeUI then
				-- self.scavengeUI:setItemScavenged(itemsAdded);
			-- end
        -- elseif ZombRand(9) == 0 then -- give some xp even for a fail
            -- self.character:getXp():AddXP(Perks.PlantScavenging, 1);
        -- end
    -- end

	-- local dyes = nil;
    -- if self.character:getKnownRecipes():contains("Dyes") then
        -- dyes = self:getPlantDyes();
        -- if dyes ~= nil then
			-- self.character:playSound("RemovePlant");
            -- itemsAdded = self:addOrDropItems(dyes.type, dyes.count);
            -- self.character:getXp():AddXP(Perks.PlantScavenging, 3);
			-- if self.scavengeUI then
				-- self.scavengeUI:setItemScavenged(itemsAdded);
			-- end
        -- elseif ZombRand(9) == 0 then -- give some xp even for a fail
            -- self.character:getXp():AddXP(Perks.PlantScavenging, 1);
        -- end
    -- end

    -- local seedcat = nil;
    -- if self.character:getKnownRecipes():contains("Herbalist") then
        -- seedcat = self:getSeeds();
        -- if seedcat ~= nil then
			-- self.character:playSound("RemovePlant");
            -- itemsAdded = self:addOrDropItems(seedcat.type, seedcat.count);
            -- self.character:getXp():AddXP(Perks.PlantScavenging, 3);
			-- if self.scavengeUI then
				-- self.scavengeUI:setItemScavenged(itemsAdded);
			-- end
        -- elseif ZombRand(9) == 0 then -- give some xp even for a fail
            -- self.character:getXp():AddXP(Perks.PlantScavenging, 1);
        -- end
    -- end

	-- local mining = nil;
	-- local primpickaxe = self.character:getPrimaryHandItem();
	-- if primpickaxe ~= nil and primpickaxe:getType() == "PickAxe" and primpickaxe:getCondition() and primpickaxe:getCondition() > 0 then
		-- mining = self:getMining();
		-- if mining ~= nil then
			-- --self.character:playSound("detectorbeeping");
			-- itemsAdded = self:addOrDropItems(mining.type, mining.count);
			-- self.character:getXp():AddXP(Perks.PlantScavenging, 3);
			-- if self.scavengeUI then
				-- self.scavengeUI:setItemScavenged(itemsAdded);
			-- end
		-- elseif ZombRand(9) == 0 then -- give some xp even for a fail
			-- self.character:getXp():AddXP(Perks.PlantScavenging, 1);
		-- end
	-- end

    -- if item or goods or metals or medicinal or seedcat or dyes or mining then -- got something
        -- if not zone then -- register the new zone
            -- --            print("register new zone");
            -- zone = getWorld():registerZone(tostring(scavengeZoneNumber), "PlantScavenge",self.x - 20, self.y - 20, 0, 40, 40);
            -- zone:setLastActionTimestamp(getGametimeTimestamp());
        -- else -- update the plant available
            -- local plantLeft = tonumber(zone:getName());
            -- zone:setName(tostring(plantLeft - 1));
-- --            print("got somethiong",plantLeft)
            -- --            print("plant left : " .. plantLeft - 1);
            -- zone:setLastActionTimestamp(getGametimeTimestamp());
        -- end
        -- if self.scavengeUI then
            -- --self.scavengeUI:setItemScavenged(itemsAdded);
            -- self.scavengeUI:updateZoneProgress(zone);
        -- end
        -- if isClient() then zone:sendToServer() end
        -- return true;
    -- end
    -- return false;
-- end

-- random a plant/insect, more chance in deep forest
function ISScavengeAction:scavenge()
    self.character:getStats():setEndurance(self.character:getStats():getEndurance() - 0.004)
    local zone = self:getScavengeZone();

    local scavengeZoneNumber = ZombRand(5,15) + self.scavengeZoneIncrease;
    if scavengeZoneNumber <= 0 then
        scavengeZoneNumber = 1;
    end
    if zone then
        local plantLeft = tonumber(zone:getName());
        if getGametimeTimestamp() - zone:getLastActionTimestamp() > 50000 then
            --            print("refill zone");
            zone:setName(tostring(scavengeZoneNumber));
            zone:setOriginalName(tostring(scavengeZoneNumber));
        elseif plantLeft == 0 then return; end
    end

    local choices = {};
    local giveXP = false;

    local possible = nil;
    local item = nil;
    possible,item = self:getPlant();
    if item ~= nil then
        table.insert(choices, { type = item.type, count = item.count, xp = 7 })
		self.character:playSound("RemovePlant");
    elseif possible and (ZombRand(9) == 0) then 
        giveXP = true;
    end

    possible,item = self:getForestGoods();
    if item ~= nil then
        table.insert(choices, { type = item.type, count = item.count, xp = 3 })
		self.character:playSound("RemovePlant");
    elseif possible and (ZombRand(9) == 0) then
        giveXP = true;
    end
	local primdetector = self.character:getPrimaryHandItem();
	if primdetector ~= nil and primdetector:getType() == "MetalDetector" and primdetector:isActivated() and primdetector:getUsedDelta() > 0 then
		possible,item = self:getMetals();
		if item ~= nil then
			table.insert(choices, { type = item.type, count = item.count, xp = 3 })
			self.character:playSound("detectorbeeping");
		elseif possible and (ZombRand(9) == 0) then
			giveXP = true;
		end
	end
    if self.character:getKnownRecipes():contains("Herbalist") then
        possible,item = self:getMedicinalHerbs();
        if item ~= nil then
            table.insert(choices, { type = item.type, count = item.count, xp = 5 })
        elseif possible and (ZombRand(9) == 0) then
            giveXP = true;
        end
    end
    if self.character:getKnownRecipes():contains("Dyes") then
        possible,item = self:getPlantDyes();
        if item ~= nil then
            table.insert(choices, { type = item.type, count = item.count, xp = 5 })
			self.character:playSound("RemovePlant");
        elseif possible and (ZombRand(9) == 0) then
            giveXP = true;
        end
    end
    if self.character:getKnownRecipes():contains("Herbalist") then
        possible,item = self:getSeeds();
        if item ~= nil then
            table.insert(choices, { type = item.type, count = item.count, xp = 5 })
			self.character:playSound("RemovePlant");
        elseif possible and (ZombRand(9) == 0) then
            giveXP = true;
        end
    end
	local primpickaxe = self.character:getPrimaryHandItem();
	if primpickaxe ~= nil and primpickaxe:getType() == "PickAxe" and primpickaxe:getCondition() and primpickaxe:getCondition() > 0 then
		possible,item = self:getMining();
		if item ~= nil then
			table.insert(choices, { type = item.type, count = item.count, xp = 3 })
		elseif possible and (ZombRand(9) == 0) then
			giveXP = true;
		end	
	end
    if #choices == 0 then
        if giveXP then
            -- give some xp even for a fail
            self.character:getXp():AddXP(Perks.PlantScavenging, 1);
        end
        return false;
    end

    -- got something
    item = choices[ZombRand(#choices) + 1];
    local itemsAdded = self:addOrDropItems(item.type, item.count);
    self.character:getXp():AddXP(Perks.PlantScavenging, item.xp);

    if not zone then
        -- register the new zone
--      print("register new zone");
        zone = getWorld():registerZone(tostring(scavengeZoneNumber), "PlantScavenge",self.x - 20, self.y - 20, 0, 40, 40);
        zone:setLastActionTimestamp(getGametimeTimestamp());
    else
        -- update the plant available
        local plantLeft = tonumber(zone:getName());
        zone:setName(tostring(plantLeft - 1));
--      print("got something", plantLeft)
--      print("plant left : " .. plantLeft - 1);
        zone:setLastActionTimestamp(getGametimeTimestamp());
    end

    if self.scavengeUI then
        self.scavengeUI:setItemScavenged(itemsAdded);
        self.scavengeUI:updateZoneProgress(zone);
    end

    if isClient() then zone:sendToServer() end

    return true;
end

function ISScavengeAction:addOrDropItems(type, count)
    local inv = self:getUsedInventory(type);
    local items = inv:AddItems(type, count)
    for i=1,items:size() do
        if instanceof(items:get(i-1), "Food") then
            items:get(i-1):setLastAged(getGameTime():getWorldAgeHours())
        end
		if instanceof(items:get(i-1), "DrainableComboItem") then
			--local number = 1 / items:get(i-1):getUseDelta();
			local val = items:get(i-1):getUseDelta();
			items:get(i-1):setUsedDelta(val);
		end
    end
    if inv:getCapacityWeight() > inv:getEffectiveCapacity(self.character) then
        for i=1,items:size() do
            self.character:getCurrentSquare():AddWorldInventoryItem(items:get(i-1), 0.0, 0.0, 0.0)
            inv:Remove(items:get(i-1))
        end
    end
    return items;
end


function ISScavengeAction:getMetals()
    if not self.options["Metals"] then
        return false,nil;
    end
    local level = self.character:getPerkLevel(Perks.PlantScavenging);
    local baseChance = 8;
    if self.zone:getType() == "DeepForest" then
        baseChance = 15;
    end
    baseChance = baseChance + (4 * level);
    baseChance = baseChance + self.bonusFindingChance;
    if baseChance > (30 + self.bonusFindingChance) then
        baseChance = 30 + self.bonusFindingChance;
    end

    local possibilities = {};
    -- check for all the scavenging possibilities
    for i,v in ipairs(scavenges.Metals) do
        if v.skill <= level then
            table.insert(possibilities, v);
        end
    end

    if #possibilities == 0 then
        return false,nil
    end
    --    baseChance = 100;

    -- you now get more than 1 plants
    if ZombRand(100) < baseChance then
        local result = {};
        local item = possibilities[ZombRand(#possibilities) + 1];
        local count = ZombRand(item.minCount, item.maxCount) + (level);
        if count > item.maxCount then
            count = item.maxCount;
        end
        result.type = item.type;
        result.count = count;
        return true,result;
    end

    return true,nil;
end

function ISScavengeAction:getSeeds()
    if not self.options["Seeds"] then
        return false,nil;
    end
    -- no foraging from november to february
    if (getGameTime():getMonth() + 1) >= 11 or (getGameTime():getMonth() + 1) <= 2 then
        return false,nil;
    end

    local level = self.character:getPerkLevel(Perks.PlantScavenging);
    local baseChance = 3;
    if self.zone:getType() == "DeepForest" then
        baseChance = 7;
    end
    baseChance = baseChance + (2 * level);
    baseChance = baseChance + self.bonusFindingChance;

    if baseChance > (23 + self.bonusFindingChance) then
        baseChance = 23 + self.bonusFindingChance;
    end

    local possibilities = {};
    -- check for all the scavenging possibilities
    for i,v in ipairs(scavenges.Seeds) do
        if v.skill <= level then
            table.insert(possibilities, v);
        end
    end

    if #possibilities == 0 then
        return false,nil
    end

    --    baseChance = 100;

    -- you now get more than 1 plants
    if ZombRand(100) < baseChance then
        local result = {};
        local item = possibilities[ZombRand(#possibilities) + 1];
        local count = ZombRand(item.minCount, item.maxCount) + (level / 2);
        if count > item.maxCount then
            count = item.maxCount;
        end
        result.type = item.type;
        result.count = count;
        return true,result;
    end

    return true,nil;
end

function ISScavengeAction:getPlantDyes()
    if not self.options["Dyes"] then
        return false,nil;
    end
    -- no foraging from november to february
    if (getGameTime():getMonth() + 1) >= 11 or (getGameTime():getMonth() + 1) <= 2 then
        return false,nil;
    end

    local level = self.character:getPerkLevel(Perks.PlantScavenging);
    local baseChance = 3;
    if self.zone:getType() == "DeepForest" then
        baseChance = 7;
    end
    baseChance = baseChance + (2 * level);
    baseChance = baseChance + self.bonusFindingChance;

    if baseChance > (23 + self.bonusFindingChance) then
        baseChance = 23 + self.bonusFindingChance;
    end

    local possibilities = {};
    -- check for all the scavenging possibilities
    for i,v in ipairs(scavenges.Dyes) do
        if v.skill <= level then
            table.insert(possibilities, v);
        end
    end

    if #possibilities == 0 then
        return false,nil
    end

    --    baseChance = 100;

    -- you now get more than 1 plants
    if ZombRand(100) < baseChance then
        local result = {};
        local item = possibilities[ZombRand(#possibilities) + 1];
        local count = ZombRand(item.minCount, item.maxCount) + (level / 2);
        if count > item.maxCount then
            count = item.maxCount;
        end
        result.type = item.type;
        result.count = count;
        return true,result;
    end

    return true,nil;
end

function ISScavengeAction:getMining()
    if not self.options["Mining"] then
        return false,nil;
    end
    local level = self.character:getPerkLevel(Perks.PlantScavenging);
    local baseChance = 5;
    if self.zone:getType() == "DeepForest" then
        baseChance = 10;
    end
    baseChance = baseChance + (level);
    baseChance = baseChance + self.bonusFindingChance;
    if baseChance > (20 + self.bonusFindingChance) then
        baseChance = 20 + self.bonusFindingChance;
    end
	if baseChance < 0 then
		baseChance = 5;
	end

    local possibilities = {};
    -- check for all the scavenging possibilities
    for i,v in ipairs(scavenges.Mining) do
        if v.skill <= level then
            table.insert(possibilities, v);
        end
    end

    if #possibilities == 0 then
        return false,nil
    end
    --    baseChance = 100;

    -- you now get more than 1 plants
    if ZombRand(100) < baseChance then
        local result = {};
        local item = possibilities[ZombRand(#possibilities) + 1];
        local count = ZombRand(item.minCount, item.maxCount) + (level);
        if count > item.maxCount then
            count = item.maxCount;
        end
        result.type = item.type;
        result.count = count;
        return true,result;
    end

    return true,nil;
end