function CantFinishSmoking(char)
	char:Say(getText("UI_speech_cough0"));
	local diceroll = ZombRand(1,6);
	if diceroll == 1 then
		char:Say(getText("UI_speech_cough1"));
	elseif diceroll == 2 then
		char:Say(getText("UI_speech_cough2"));
	elseif diceroll == 3 then
		char:Say(getText("UI_speech_cough3"));
	elseif diceroll == 4 then
		char:Say(getText("UI_speech_cough4"));
	elseif diceroll == 5 then
		char:Say(getText("UI_speech_cough5"));
	elseif diceroll == 6 then
		char:Say(getText("UI_speech_cough6"));
	end
end