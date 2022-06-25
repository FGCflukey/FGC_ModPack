----------------------------------------------------------------------------------
--
-- LGEPCheckWeather.lua
-- Parte del mod Advanced Fishing.
-- Creado por Snake.
--
--
-- El codigo base se encuentra en ISInventoryBuildMenu.lua
-- los cuales han sido creados por Robert Johnson.
--
----------------------------------------------------------------------------------


LGEPCheckWeather = {};
LGEPCheckWeather.fetchSquares = {}
LGEPCheckWeather .clearFetch = function()
	thumpableWindow = nil
	curtain = nil;
	window = nil;
	invincibleWindow = false;
	windowFrame = nil;
	door = nil;
	doorKeyId = nil;
	LGEPCheckWeather.fetchSquares = {}
end

LGEPCheckWeather.fetch = function(v, player, doSquare)
	if instanceof(v, "IsoWindow") then
		window = v;
	elseif instanceof(v, "IsoCurtain") then
		curtain = v;
	end
	if instanceof(v, "IsoObject") and v:getSprite() and v:getSprite():getProperties() and v:getSprite():getProperties():Is(IsoFlagType.makeWindowInvincible) then
        invincibleWindow = true;
    end
	if IsoWindowFrame.isWindowFrame(v) then
        windowFrame = v
    end
	if instanceof(v, "IsoDoor") or (instanceof(v, "IsoThumpable") and v:isDoor()) then
		door = v;
        if instanceof(v, "IsoDoor") then
            doorKeyId = v:checkKeyId()
            if doorKeyId == -1 then doorKeyId = nil end
        end
        if instanceof(v, "IsoThumpable") then
           if v:getKeyId() ~= -1 then
                doorKeyId = v:getKeyId();
           end
        end
	end
end

LGEPCheckWeather.doBuildMenu = function(player, context, worldobjects, test)
	local playerObj = getSpecificPlayer(player);

	LGEPCheckWeather.clearFetch()
    for i,v in ipairs(worldobjects) do
		LGEPCheckWeather.fetch(v, player, true);
    end

	if playerObj then
		local room = playerObj:getCurrentSquare():getRoom();
		if not room and not playerObj:getVehicle() then
			if JoypadState.players[player+1] == nil then
				--if getSpecificPlayer(player):HasTrait("Outdoorsman") then
					if test == true then return true; end
					context:addOption(getText("ContextMenu_CheckWeather"), worldobjects, LGEPCheckWeather.onCheckWeather, player, nil);
				--end
			end
		elseif window ~= nil and (not window:isBarricaded()) and room then
			local curtain = window:HasCurtains();
			if curtain ~= nil and (not curtain:IsOpen()) then
				return
			else
				context:addOption(getText("ContextMenu_ViewCheckWeather"), worldobjects, LGEPCheckWeather.onCheckWeather, player, window);
			end
			if test == true then return true; end
		elseif door ~= nil and (not door:IsOpen()) and (not door:isBarricaded()) and doorKeyId and room then
			--local objectroom = door:getSquare():getRoom();
			local curtain = door:HasCurtains();
			if curtain ~= nil and (not curtain:IsOpen()) then
				return
			end
			--if objectroom then
				local props = door:getSprite():getProperties();
				if props:Is("doorTrans") and props:Val("doorTrans") then
					context:addOption(getText("ContextMenu_ViewCheckWeather"), worldobjects, LGEPCheckWeather.onCheckWeather, player, door);
				end
			--end
			if test == true then return true; end
		end
    end

end

function LGEPCheckWeather.onCheckWeather(worldobjects, player, window)
	local playerObj = getSpecificPlayer(player);
	if window ~= nil then
		if luautils.walkAdjWindowOrDoor(playerObj, window:getSquare(), window) then
			ISTimedActionQueue.add(ISLGEPWeatherInfoAction:new(playerObj, window));
			return
		else
			ISTimedActionQueue.add(ISLGEPWeatherInfoAction:new(playerObj, window));
			return
		end
	else
		ISTimedActionQueue.add(ISLGEPWeatherInfoAction:new(playerObj, nil));
	end
end

Events.OnFillWorldObjectContextMenu.Add(LGEPCheckWeather.doBuildMenu);
