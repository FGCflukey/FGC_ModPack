if ProceduralDistributions == nil then
function OnEat_Cigarettes(food, character)
	if getActivatedMods():contains("jiggasAddictionMod") then
		character:getModData().cigsmoked = true;
	end
    if character:HasTrait("Smoker") then
        character:getBodyDamage():setUnhappynessLevel(character:getBodyDamage():getUnhappynessLevel() - 10);
        if character:getBodyDamage():getUnhappynessLevel() < 0 then
            character:getBodyDamage():setUnhappynessLevel(0);
        end
        character:getStats():setStress(character:getStats():getStress() - 10);
        if character:getStats():getStress() then
            character:getStats():setStress(0);
        end
        character:getStats():setStressFromCigarettes(0);
        character:setTimeSinceLastSmoke(0);
    else
        character:getBodyDamage():setFoodSicknessLevel(character:getBodyDamage():getFoodSicknessLevel() + 14);
        if character:getBodyDamage():getFoodSicknessLevel() > 100 then
            character:getBodyDamage():setFoodSicknessLevel(100);
        end
    end
end
else
function OnEat_Cigarettes(food, character, percent)
	if getActivatedMods():contains("jiggasAddictionMod") then
		character:getModData().cigsmoked = true;
	end
    local script = food:getScriptItem()
    percent = percent * (food:getStressChange() * 100) / script:getStressChange()
    local bodyDamage = character:getBodyDamage()
    local stats = character:getStats()
    if character:HasTrait("Smoker") then
        bodyDamage:setUnhappynessLevel(bodyDamage:getUnhappynessLevel() - 10 * percent);
        if bodyDamage:getUnhappynessLevel() < 0 then
            bodyDamage:setUnhappynessLevel(0);
        end
        stats:setStress(stats:getStress() - 10 * percent);
        if stats:getStress() < 0 then
            stats:setStress(0);
        end
        local reduceSFC = stats:getMaxStressFromCigarettes()
        stats:setStressFromCigarettes(stats:getStressFromCigarettes() - reduceSFC * percent);
        character:setTimeSinceLastSmoke(stats:getStressFromCigarettes() / stats:getMaxStressFromCigarettes());
    else
--        bodyDamage:setUnhappynessLevel(bodyDamage:getUnhappynessLevel() + 5);
--        if bodyDamage:getUnhappynessLevel() > 100 then
--            bodyDamage:setUnhappynessLevel(100);
--        end
        bodyDamage:setFoodSicknessLevel(bodyDamage:getFoodSicknessLevel() + 14 * percent);
        if bodyDamage:getFoodSicknessLevel() > 100 then
            bodyDamage:setFoodSicknessLevel(100);
        end
    end
end
end