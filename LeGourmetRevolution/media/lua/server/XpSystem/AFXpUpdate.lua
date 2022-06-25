require "XpSystem/XpUpdate";

-- when you gain a level you could win or lose perks
xpUpdate.aflevelPerk = function(owner, perk, level, addBuffer)
	-- first Strength skill, grant you some traits that gonna help you to carry more stuff, hitting harder, etc.
	if perk == Perks.Fishing then
        -- now we add trait depending on your current lvl
        if level == 5 then
			local rsport = nil;
			if owner:getKnownRecipes():contains("Sport Fishing") then
				rsport = true;
			else
				rsport = nil;
			end
			if owner:HasTrait("sportfisherman") then
				--nothing
			elseif rsport ~= nil then
				--nothing
			else
				--luautils.okModal(getText("Tooltip_ReleaseUnlocked"), true);
				owner:getKnownRecipes():add("Sport Fishing");
			end
        end
	end

	if perk == Perks.Cooking then
        -- now we add trait depending on your current lvl
        if level == 10 then
			if owner:HasTrait("Nutritionist2") then
				--nothing
			elseif owner:HasTrait("Nutritionist") then
				--nothing
			else
				owner:getTraits():add("Nutritionist2");
			end
        end
	end

	-- we reset the xp multiplier for this perk
--	owner:getXp():getMultiplierMap():remove(perk);

	-- we add a "buffer" xp, so if you just get your lvl but you're still losing xp (if you've been lazy for a moment), you won't lose your lvl at the next tick
	if addBuffer then
--		owner:getXp():AddXP(perk, 5, false);
	end
end
Events.LevelPerk.Add(xpUpdate.aflevelPerk);

