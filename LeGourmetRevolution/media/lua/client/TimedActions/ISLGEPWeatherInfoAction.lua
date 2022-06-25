require "TimedActions/ISBaseTimedAction"
require "ISUI/ISLayoutManager"

ISLGEPWeatherInfoAction = ISBaseTimedAction:derive("ISLGEPWeatherInfoAction");

function ISLGEPWeatherInfoAction:isValid()
	local room = self.character:getCurrentSquare():getRoom();
	if self.object ~= nil then
		if room and self.character:getZ() == self.square:getZ() or
			self.character:DistToSquared(self.square:getX() + 0.5, self.square:getY() + 0.5) < 1 * 2 then
			return true;
		else
			return false;
		end
	elseif self.object == nil and (not room) and (not self.character:getVehicle()) then 
		return true;
	else
		return false;
	end

end

function ISLGEPWeatherInfoAction:perform()
	local window = ISLGEPWeatherInfoWindow.windows[self.character];
	if window then
		window:setClimateInfo(self.object)
	else
		local x = getPlayerScreenLeft(self.playerNum);
		local y = getPlayerScreenTop(self.playerNum);
		local w = getPlayerScreenWidth(self.playerNum);
		local h = getPlayerScreenHeight(self.playerNum);
		window = ISLGEPWeatherInfoWindow:new(x + 70, y + 50, self.character, self.object)
		window:initialise();
		window:addToUIManager();
		ISLGEPWeatherInfoWindow.windows[self.character] = window
		if self.character:getPlayerNum() == 0 then
			ISLayoutManager.RegisterWindow('LGEPWeather', ISCollapsableWindow, window);
		end
	end
	window:setVisible(true);
	window:addToUIManager();
	local joypadData = JoypadState.players[self.playerNum+1]
	if joypadData then
		joypadData.focus = window;
	end
	-- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function ISLGEPWeatherInfoAction:new(character, win)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.maxTime = 0;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.character = character;
	o.playerNum = character:getPlayerNum();
	o.object = win;
	if win ~= nil then
		o.square = win:getSquare();
	else
		o.square = nil;
	end
	return o;
end
