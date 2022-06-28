-- ***********************************************************
-- **                    THE INDIE STONE                    **
-- ***********************************************************
require "TimedActions/ISBaseTimedAction"

OnDepostarAction = ISBaseTimedAction:derive("OnDepostarAction")
function OnDepostarAction:isValid()
    if DepostarDefinitions[self.animal:getType()] then return true end
    return false
end

function OnDepostarAction:update()
    if self.character:getAccessLevel() ~= "None" then
        if self.currentTime == 0 then
            self.currentTime = 1
            for i = 1, math.floor(self.maxTime / self.calc) do
                self:chop()
            end
        end
        return
    end

    self.currentTime = self.currentTime + getGameTime():getMultiplier();
    if self.currentTime >= self.calc then

        self:chop();
        self.currentTime = 0;
    end

    self.character:setMetabolicTarget(Metabolics.LightWork);
end

function OnDepostarAction:start()
    if self.square ~= nil then
        if self.square:getSquare() then
            self.character:faceLocation(self.square:getX(), self.square:getY());
        end
    elseif self.animal:getWorldItem() then
        if self.animal:getWorldItem():getSquare() then
            self.character:faceLocation(self.animal:getWorldItem():getX(),
                                        self.animal:getWorldItem():getY());
        end
    end
    self:setActionAnim("Loot");
    if self.knife:getStaticModel() then
        self:setOverrideHandModels(nil, self.knife:getStaticModel());
    else
        self:setOverrideHandModels(nil, nil);
    end
    self.character:clearVariable("LootPosition");
    self:setAnimVariable("LootPosition", "Low");
end

function OnDepostarAction:stop() ISBaseTimedAction.stop(self) end

function OnDepostarAction:perform()
    self.character:getStats():setFatigue(
        self.character:getStats():getFatigue() + 0.025)
    -- needed to remove from queue / start next.
    ISBaseTimedAction.perform(self)
end

function OnDepostarAction:chop()
    self.character:getStats():setEndurance(
        self.character:getStats():getEndurance() - 0.01)

    local item = self:getMeat();
    if item ~= nil then
        self.character:playSound("SliceMeat");
        self:addOrDropItems(item.type, item.count);
        self.character:getXp():AddXP(Perks.Cooking, 7);
        for i = 1, 20 do
            self.character:addBlood(null, false, true, false)
            self.character:splatBlood(3, 0.3)
            -- self.character:splatBloodFloorBig(0.3)
        end
        -- if self.knife ~= nil then
        --	if ZombRand(self.knife:getConditionLowerChance()) == 0 then
        --		self.knife:setCondition(self.knife:getCondition() - 1);
        --		ISWorldObjectContextMenu.checkWeapon(self.character);
        --	end
        -- end
    elseif ZombRand(9) == 0 then -- give some xp even for a fail
        self.character:getXp():AddXP(Perks.Cooking, 1);
    end

    if item ~= nil and item.removal then -- got something
        self:RemoveAnimal(0, 0, 0)
        return true;
    end
    return false;
end

function OnDepostarAction:addOrDropItems(type, count)
    local inv = self.character:getInventory();
    local items = inv:AddItems(type, count)
    for i = 1, items:size() do
        if instanceof(items:get(i - 1), "Food") then
            -- if self.animal:isRotten() then
            if self.animal:getAge() >
                self.animal:getScriptItem():getDaysTotallyRotten() then
                self:setNutrition(items:get(i - 1))
                items:get(i - 1):setAge(self.animal:getAge());
            else
                self:setNutrition(items:get(i - 1))
                items:get(i - 1):setLastAged(getGameTime():getWorldAgeHours())
                items:get(i - 1):setCooked(self.animal:isCooked());
                items:get(i - 1):setBurnt(self.animal:isBurnt());
            end
        end
    end

    for i = 1, items:size() do
        -- self.character:getCurrentSquare():AddWorldInventoryItem(items:get(i-1), 0.0, 0.0, 0.0)
        if self.square ~= nil then
            if self.square:getSquare() then
                self.square:getSquare():AddWorldInventoryItem(items:get(i - 1),
                                                              0.0, 0.0, 0.0)
                addBloodSplat(self.square:getSquare(), ZombRand(7, 12))
            end
        elseif self.animal:getWorldItem() then
            if self.animal:getWorldItem():getSquare() then
                self.animal:getWorldItem():getSquare():AddWorldInventoryItem(
                    items:get(i - 1), 0.0, 0.0, 0.0)
                addBloodSplat(self.animal:getWorldItem():getSquare(),
                              ZombRand(7, 12))
            end
        end
        inv:Remove(items:get(i - 1))
        ISInventoryPage.renderDirty = true;
    end
end

function OnDepostarAction:setNutrition(selitem)
    local knifeval = self:getKnifePenalty();
    local modval = (0.5 + (self.level * 0.05)) * knifeval;

    -- selitem:setBaseHunger(selitem:getBaseHunger() * modval);
    selitem:setHungChange(selitem:getBaseHunger() * modval);
    selitem:setThirstChange(selitem:getThirstChange() * modval);
    selitem:setUnhappyChange(selitem:getUnhappyChange());
    selitem:setBoredomChange(selitem:getBoredomChange());
    selitem:setCarbohydrates(selitem:getCarbohydrates() * modval);
    selitem:setLipids(selitem:getLipids() * modval);
    selitem:setProteins(selitem:getProteins() * modval);
    selitem:setCalories(selitem:getCalories() * modval);
    -- selitem:setActualWeight(selitem:getActualWeight() * modval)
    -- selitem:setWeight(selitem:getActualWeight());
    -- selitem:setCustomWeight(true)
end

function OnDepostarAction:getKnifePenalty()
    local penalty = 1;
    local KnifeType = self.knife:getType()
    if KnifeType ~= nil then
        if KnifeType == "MilitaryKnife" then
            penalty = 0.9;
        elseif KnifeType == "HuntingKnife" then
            penalty = 0.8;
        elseif KnifeType == "MeatCleaver" then
            penalty = 0.65;
        elseif KnifeType == "KitchenKnife" then
            penalty = 0.5;
        elseif KnifeType == "FlintKnife" then
            penalty = 0.25;
        else
            penalty = 1;
        end
    else
    end
    return penalty
end

function OnDepostarAction:getMeat()
    local data = self.animal:getModData();
    local possibilities = {};
    if not data.head then
        if DepostarDefinitions[self.animal:getType()].head then
            data.head = 1;
        else
            data.head = 0;
        end
    end
    if not data.skin then
        if DepostarDefinitions[self.animal:getType()].skin then
            data.skin = 1;
        else
            data.skin = 0;
        end
    end
    for i, v in ipairs(DepostarDefinitions[self.animal:getType()].items) do
        if not data[v.DataName] then data[v.DataName] = v.maxCount; end
        if self.level >= v.minSkill and self.level <= v.maxSkill then
            if data[v.DataName] and data[v.DataName] > 0 then
                table.insert(possibilities, v);
            end
        end
    end

    if #possibilities > 0 then
        local result = {};
        local item = possibilities[ZombRand(#possibilities) + 1];
        local var = 0
        if self.level >= 7 then
            var = 3;
        elseif self.level >= 5 then
            var = 2;
        elseif self.level >= 3 then
            var = 1;
        end
        local count = ZombRand(item.minCount, item.maxCount) + var;
        if count > item.maxCount then count = item.maxCount; end
        if data[item.DataName] and data[item.DataName] > 0 then
            if count > data[item.DataName] then
                count = data[item.DataName];
            end
            data[item.DataName] = data[item.DataName] - count;
            result.type = item.type;
            result.count = count;
            return result;
        end
    elseif #possibilities <= 0 and data.head and data.head > 0 then
        local result2 = {};
        local item2 = DepostarDefinitions[self.animal:getType()].head;
        if item2 ~= nil then
            result2.type = item2;
            result2.count = data.head;
            data.head = data.head - 1;
            if data.skin and data.skin <= 0 then
                result2.removal = true;
            else
                result2.removal = false;
            end
            return result2;
        end
    elseif #possibilities <= 0 and data.skin and data.skin > 0 then
        local result3 = {};
        local item3 = DepostarDefinitions[self.animal:getType()].skin;
        if item3 ~= nil then
            result3.type = item3;
            result3.count = data.skin;
            data.skin = data.skin - 1;
            result3.removal = true;
            if data.head and data.head <= 0 then
                result3.removal = true;
            else
                result3.removal = false;
            end
            return result3;
        end
    else
        self:RemoveAnimal(#possibilities, data.head, data.skin)
    end
    return nil;
end

function OnDepostarAction:RemoveAnimal(possibilities, head, skin)
    if head and head <= 0 and skin and skin <= 0 and possibilities <= 0 then
        if self.square ~= nil then
            local inventoryItem = self.animal;
            if self.square:getSquare() ~= nil then
                for i = 1, 20 do
                    addBloodSplat(self.square:getSquare(), ZombRand(7, 15))
                end
                self.square:getSquare()
                    :transmitRemoveItemFromSquare(self.square);
                self.square:removeFromWorld();
                self.square:removeFromSquare();
                self.square:setSquare(nil);
            end
            inventoryItem:setWorldItem(nil);
            self:forceComplete();
        else
            if self.animal ~= nil and self.animal:getWorldItem() ~= nil then
                local sq = self.animal:getWorldItem():getSquare();
                for i = 1, 20 do
                    addBloodSplat(sq, ZombRand(7, 15))
                end
                sq:transmitRemoveItemFromSquare(self.animal:getWorldItem());
                sq:removeWorldObject(self.animal:getWorldItem());
                self.animal:setWorldItem(nil);
                self:forceComplete();
            end
        end
    end
end

function OnDepostarAction:new(character, animal, knife, square, time)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.character = character;
    o.animal = animal;
    o.knife = knife;
    o.stopOnWalk = true;
    o.stopOnRun = true;
    o.maxTime = 2000;
    o.square = square;
    o.currentTime = 0;
    o.level = character:getPerkLevel(Perks.Cooking);

    if character:isTimedActionInstant() then
        o.maxTime = 5;
    elseif o.level > 0 then
        o.maxTime = o.maxTime - (o.level * 50);
    end
    o.calc = o.maxTime * 0.1;
    return o
end
