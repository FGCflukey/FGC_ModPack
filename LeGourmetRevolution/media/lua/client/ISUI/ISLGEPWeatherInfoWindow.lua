require "ISUI/ISCollapsableWindow"

ISLGEPWeatherInfoWindow = ISCollapsableWindow:derive("ISLGEPWeatherInfoWindow");
ISLGEPWeatherInfoWindow.windows = {};

function ISLGEPWeatherInfoWindow:createChildren()
	ISCollapsableWindow.createChildren(self);
	self.panel = ISClimaToolTip:new();
	self.panel.followMouse = false;
	self.panel:initialise();
	self:setClimateInfo(self.object);
	self:addView(self.panel);
end

function ISLGEPWeatherInfoWindow:lgepcheckweather1(needed)
	local currentHour = math.floor(math.floor(GameTime:getInstance():getTimeOfDay() * 3600) / 3600); --La hora del día
	local ipath = "media/ui/WeatherIcons/";
	local icon = "";
	local number = "1";
	local tod;
	local c = getClimateManager();
	local clouds = c:getCloudIntensity();
	local fog = c:getFogIntensity();
	local wind = c:getWindPower();
	local windspeed = c:getWindspeedKph();
	local text = "";
	local PInt = c:getPrecipitationIntensity();
	local PrcStr = getText("Tooltip_NoRain");
	local windStr = "";
	local fogStr = "";
	local fishingchance = 0;
	local fishingtext = getText("Tooltip_NotAffect");
	local color = "";
	local color2 = "";

	if (currentHour >= 5 and currentHour <= 20) then --dia/noche
		tod = "Dia";
	else
		tod = "Noche";
	end
	
	icon = ipath .. tod .. ".png";
	if RainManager.isRaining() or (c:getPrecipitationIntensity() and c:getPrecipitationIntensity() > 0) then --lluvia
		icon = ipath .. tod .. "Rain.png";
		text = getText("Tooltip_rain");
		if c:getPrecipitationIsSnow() then --nieve
			icon = ipath .. tod .. "Snow.png";
			text = getText("Tooltip_Snow");
			fishingchance = 10;
		else 
			--periodos climáticos
			if c:getWeatherPeriod():isRunning() then
				local wp = c:getWeatherPeriod();
				if wp:isThunderStorm() then
					icon = ipath .. tod .. "Thunderstorm.png";
					text = getText("Tooltip_thunderstorm");
				elseif wp:isTropicalStorm() then
					icon = ipath .. tod .. "Tropicalstorm.png";
					text = getText("Tooltip_tropicalstorm");
				elseif wp:isBlizzard() then
					icon = ipath .. tod .. "Blizzard.png";
					text = getText("Tooltip_blizzard");
				end
				fishingchance = ZombRand(5, 11);
			end
		end
		if PInt>0.9 then
			PrcStr = getText("Tooltip_Torrential");
			color2 = " <RGB:1,0,0> ";
			if fishingchance == 0 then
				fishingchance = 5;
			end
		elseif PInt>0.8 then
			PrcStr = getText("Tooltip_very_strong");
			color2 = " <RGB:1,0,0> ";
			if fishingchance == 0 then
				fishingchance = 5;
			end
		elseif PInt>0.6 then
			PrcStr = getText("Tooltip_strong");
			color2 = " <RGB:0.98,0.55,0> ";
			if fishingchance == 0 then
				fishingchance = 4;
			end
		elseif PInt>0.4 then
			PrcStr = getText("Tooltip_moderate");
			color2 = " <RGB:1,1,0> ";
			if fishingchance == 0 then
				fishingchance = 3;
			end
		elseif PInt>0.2 then
			PrcStr = getText("Tooltip_light2");
			color2 = " <RGB:0,0.8,0> ";
			if fishingchance == 0 then
				fishingchance = 2;
			end
		elseif PInt>0 then
			PrcStr = getText("Tooltip_light");
			color2 = " <RGB:0,0.8,0.8> ";
			if fishingchance == 0 then
				fishingchance = 1;
			end
		else
		end
	elseif (not RainManager.isRaining()) then
		------------Nubosidad sin lluvia
			if clouds>0.35 then
				number = "5";
				text = getText("Tooltip_Extremely_cloudy");
				fishingchance = -6;
			elseif clouds>0.25 then
				number = "4";
				text = getText("Tooltip_Very_cloudy");
				fishingchance = -5;
			elseif clouds>0.125 then
				number = "3";
				text = getText("Tooltip_Cloudy");
				fishingchance = -4;
			elseif clouds>0.05 then
				number = "2";
				text = getText("Tooltip_Slightly_cloudy");
				fishingchance = -3;
			elseif clouds>0.02 then
				number = "1";
				text = getText("Tooltip_Mostly_clear_sky");
				fishingchance = -2;
			else
				icon = ipath .. tod .. ".png";
				text = getText("Tooltip_Sunny");
			end
			if c:getPrecipitationIntensity() and c:getPrecipitationIntensity() > 0 and c:getPrecipitationIsSnow() then --nieve
				icon = ipath .. tod .. "Snow.png";
				text = getText("Tooltip_Snow");
				fishingchance = 10;
			elseif fog > 0 then
				icon = ipath .. tod .. "Fog.png";
				text = getText("Tooltip_Fog");
			else
				icon = ipath .. tod .. "Nubes" .. number .. ".png";
			end

	end
	if wind>0.65 then
        windStr = getText("Tooltip_Extremely_windy");
		color = " <RGB:1,0,0> ";
    elseif wind>0.45 then
        windStr = getText("Tooltip_Very_strong_wind");
		color = " <RGB:1,0,0> ";
    elseif wind>0.3 then
        windStr = getText("Tooltip_Very_windy");
		color = " <RGB:0.98,0.55,0> ";
    elseif wind>0.2 then
        windStr = getText("Tooltip_Windy");
		color = " <RGB:1,1,0> ";
    elseif wind>0.1 then
        windStr = getText("Tooltip_Slightly_windy");
		color = " <RGB:0,0.8,0> ";
    elseif wind>0 then
        windStr = getText("Tooltip_Minor_breezes");
		color = " <RGB:0,0.8,0.8> ";
	else
		windStr = "";
		color = " <RGB:1,1,1> ";
    end
	--next updates!! ClimateMoon.getMoonPhase() or ClimateMoon.getPhaseName()
	text = text .. " " .. windStr .. " <LINE> <LINE> ";

	if self.recipeknown then
		fogStr = self:getFogInfo(fog);
		text = text .. getText("Tooltip_Wind") .. color .. tonumber(string.format("%." .. (0) .. "f",(c:getWindspeedKph()))) .. " Km/h. <LINE> ";
		text = text .. " <RGB:1,1,1> " .. getText("Tooltip_Precipitation") .. color2 .. PrcStr  .. " <LINE> ";
		text = text .. " <RGB:1,1,1> " .. getText("Tooltip_FogDensity") .. fogStr  .. " <LINE> <LINE> ";
	else
		text = text .. " <RGB:1,0,0> " .. getText("Tooltip_needclimatologymag") .. " <LINE> ";
	end
	if self.character:getPerkLevel(Perks.Fishing) >= 3 and self.recipeknown then
		if windspeed>60 then --Viento extremo
			fishingchance = fishingchance + 15;
		elseif windspeed>50 then --Viento muy fuerte
			fishingchance = fishingchance + 10;
		elseif windspeed>40 then -- ventoso
			fishingchance = fishingchance + 7;
		elseif windspeed>30 then -- viento leve
			fishingchance = fishingchance + 5;
		elseif windspeed>10 then -- brisas
			fishingchance = fishingchance + -5;
		else -- brisas menores
			fishingchance = fishingchance + -10;
		end
		local currentHour = math.floor(math.floor(GameTime:getInstance():getTimeOfDay() * 3600) / 3600);
		if (currentHour >= 4 and currentHour <= 6) or (currentHour >= 18 and currentHour <= 20) then
			fishingchance = fishingchance - 10;
		end
		if fishingchance <= -7 then
			fishingtext = " <RGB:0,0.8,0.8> " .. getText("Tooltip_VeryGood");
		elseif fishingchance < 0 then
			fishingtext = " <RGB:0,0.8,0> " .. getText("Tooltip_Good");
		elseif fishingchance == 0 then
			fishingtext = " <RGB:1,1,1> " .. getText("Tooltip_Neutral");
		elseif fishingchance < 10 then
			fishingtext = " <RGB:1,1,0> " .. getText("Tooltip_Bad");
		elseif fishingchance < 15 then
			fishingtext = " <RGB:0.98,0.55,0> " .. getText("Tooltip_VeryBad");
		elseif fishingchance < 50 then
			fishingtext = " <RGB:1,0,0> " .. getText("Tooltip_ExtremeBad");
		end
	elseif self.character:getPerkLevel(Perks.Fishing) < 3 and self.recipeknown then
		fishingtext = " <RGB:1,0,0> " .. getText("Tooltip_needfishinglvl");
	end
	if self.recipeknown then
		text = text .. " <RGB:1,1,1> " .. getText("Tooltip_FishingPointsChance") .. " " .. fishingtext;
	end
	--if RainManager.isRaining() then
	--end
	--CloudStr = getClimateMoon():getPhaseName();
	--text = text .. getText("Tooltip_Clouds") .. CloudStr ..  " <LINE> ";

	if needed == "texture" then
		return icon;
	elseif needed == "text" then
		return text;
	end

	--local c = getClimateManager();

	--c:getPrecipitationIntensity(); //float from 0.0 to 1.0.
	--c:getPrecipitationIsSnow(); //bool to check if its snowing instead of rain.

	--c:getWeatherPeriod():isRunning(); //to check if theres a active weather period

	--weather periods run different segments, sometimes with clearings in between.

	--wp = c:getWeatherPeriod();

	--to check if the current segment is any of the following special types:

	--wp:isThunderStorm();
	--wp:isTropicalStorm();
	--wp:isBlizzard();

end

function ISLGEPWeatherInfoWindow:update()
	ISCollapsableWindow.update(self)
	
	local room = self.character:getCurrentSquare():getRoom();
	if self.object == nil then
		if self:getIsVisible() and ((not self.character) or room) then
			if self.joyfocus then
				self.joyfocus.focus = nil;
				updateJoypadFocus(self.joyfocus);
			end
			self:removeFromUIManager();
			--self.character:Say("object nil")
			return
		end
	elseif self.object ~= nil and self.square ~= nil then
		if self:getIsVisible() and (self.character:getZ() ~= self.square:getZ() or
		  self.character:DistToSquared(self.square:getX() + 0.5, self.square:getY() + 0.5) > 1 * 2) then
			if self.joyfocus then
				self.joyfocus.focus = nil;
				updateJoypadFocus(self.joyfocus);
			end
			self:removeFromUIManager();
			--self.character:Say("object true");
			--self.character:Say(tostring(self.character:getZ()));
			--self.character:Say(tostring(self.square:getZ()));
			return
		end
	elseif self.character:isAsleep() then
		if self.joyfocus then
			self.joyfocus.focus = nil;
			updateJoypadFocus(self.joyfocus);
		end
		self:removeFromUIManager();
		--self.character:Say("object true");
		--self.character:Say(tostring(self.character:getZ()));
		--self.character:Say(tostring(self.square:getZ()));
		return
	end
	if self.clouds ~= getClimateManager():getCloudIntensity() 
	  or self.rain ~= RainManager.isRaining()
	  or self.wperiod ~= getClimateManager():getWeatherPeriod():isRunning() then
		self:setClimateInfo(self.object);
	end

	self:setWidth(self.panel:getWidth());
	self:setHeight(self:titleBarHeight() + self.panel:getHeight());
end

function ISLGEPWeatherInfoWindow:onJoypadDown(button)
	if button == Joypad.BButton then
		self:removeFromUIManager();
		setJoypadFocus(self.playerNum, nil);
	end
end

function ISLGEPWeatherInfoWindow:getFogInfo(value)
	local fogstring = "";
	if value>0.65 then
		fogstring = " <RGB:1,0,0> " .. getText("Tooltip_FogDExtreme");
	elseif value>0.5 then
		fogstring = " <RGB:0.98,0.55,0> " .. getText("Tooltip_FogDStrong");
	elseif value>0.3 then
		fogstring = " <RGB:1,1,0> " .. getText("Tooltip_FogDModerate");
	elseif value>0.1 then
		fogstring = " <RGB:0,0.8,0> " .. getText("Tooltip_FogDNormal");
	elseif value>0 then
		fogstring = " <RGB:0,0.8,0.8> " .. getText("Tooltip_FogDLight");
	else
		fogstring = " <RGB:1,1,1> " .. getText("Tooltip_NoFog");
	end
	return fogstring
end

function ISLGEPWeatherInfoWindow:setClimateInfo(obj)
	self.object = obj;
	if self.object ~= nil then
		self.square = self.object:getSquare();
	else
		self.square = nil;
	end
	if self.character:getKnownRecipes():contains("Advanced Climatology") then --Validar si tiene la receta indicada.
		self.recipeknown = true;
	else
		self.recipeknown = false;
	end
	self.panel:setName(getText("ContextMenu_CheckWeather"));
	self.spriteName = self:lgepcheckweather1("texture");
	self.panel:setTexture(self.spriteName);
	self.clouds = getClimateManager():getCloudIntensity();
	self.rain = RainManager.isRaining();
	self.wperiod = getClimateManager():getWeatherPeriod():isRunning();
	self.currentHour = math.floor(math.floor(GameTime:getInstance():getTimeOfDay() * 3600) / 3600);
	self.panel.description = getText("Tooltip_GeneralWeather") .. " <LINE> " .. self:lgepcheckweather1("text");
end


function ISLGEPWeatherInfoWindow:onGainJoypadFocus(joypadData)
	self.drawJoypadFocus = true;
end

function ISLGEPWeatherInfoWindow:close()
	self:removeFromUIManager();
end

function ISLGEPWeatherInfoWindow:new(x, y, character, win)
	local width = 350
	local height = 16 + 64 + 16 + 16
	local o = ISCollapsableWindow:new(x, y, width, height)
	setmetatable(o, self)
	self.__index = self;
	o.character = character;
	o.playerNum = character:getPlayerNum();
	o.object = win;
	if win ~= nil then
		o.square = win:getSquare();
	else
		o.square = nil;
	end
	if character:getKnownRecipes():contains("Advanced Climatology") then --Validar si tiene la receta indicada.
		o.recipeknown = true;
	else
		o.recipeknown = false;
	end
	o.fishinglvl = character:getPerkLevel(Perks.Fishing);
	o:setTitle(getText("ContextMenu_CheckWeather"));
	o:setResizable(false);
	return o;
end
