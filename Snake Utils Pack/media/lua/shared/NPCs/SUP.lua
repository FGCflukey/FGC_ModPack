-- Made by Snake
SUP = {}
SUP.DoProfessions = function()
	if AMBaseGameCharacterDetails then
		AMBaseGameCharacterDetails.DoProfessions();
	end
	if LGBaseGameCharacterDetails then
		LGBaseGameCharacterDetails.DoProfessions();
	end
	if ABSBaseGameCharacterDetails then
		ABSBaseGameCharacterDetails.DoProfessions();
	end
	if TSBaseGameCharacterDetails then
		TSBaseGameCharacterDetails.DoProfessions();
	end
	if WPABaseGameCharacterDetails then
		WPABaseGameCharacterDetails.DoProfessions();
	end
end