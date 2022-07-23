function SmokerRelief(character)
		character:getBodyDamage():setUnhappynessLevel(character:getBodyDamage():getUnhappynessLevel() - 10);
		if character:getBodyDamage():getUnhappynessLevel() < 0 then
			character:getBodyDamage():setUnhappynessLevel(0);
		end
		character:getStats():setStress(character:getStats():getStress() - 10);
		if character:getStats():getStress() < 0 then
			character:getStats():setStress(0);
		end
		character:getStats():setStressFromCigarettes(0);
		character:setTimeSinceLastSmoke(0);
end