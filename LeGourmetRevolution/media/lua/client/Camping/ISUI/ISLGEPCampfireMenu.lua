--************************************************************
--**          Inspirado por un código similar al            **
--**             mod Crematorium de ShadowCop               **
--************************************************************

ISLGEPCampfireMenu = {};
ISLGEPCampfireMenu.campfire = nil;

-- local function timeCalc(fueltime)
	-- local hourTxt = getText("IGUI_Gametime_hour");
	-- local minuteTxt = getText("IGUI_Gametime_minute");
	-- local adviceStr = "<LINE> <LINE>" .. "<RGB:0.596078431372549,0.9843137254901961,0.596078431372549>" .. getText("IGUI_Consumption_advice");
	-- local rainNb = 1;
	-- if RainManager.isRaining() and exterior then
		-- rainNb = 2;
	-- end
	-- local hours = math.floor((fueltime/rainNb) / 60);
	-- local minutes = (fueltime/rainNb) % 60;
	-- if hours ~= 1 then hourTxt = getText("IGUI_Gametime_hours"); end
	-- if minutes ~= 1 then minuteTxt = getText("IGUI_Gametime_minutes"); end
	-- local text = ""
	-- local rgb = "<RGB:1,1,1>";
	-- if hours ~= 0 then
		-- rgb = "<RGB:0,0.8,0>";
		-- if minutes ~= 0 then
			-- text =  rgb .. hours .. ' ' .. hourTxt;
		-- else
			-- text =  rgb .. hours .. ' ' .. hourTxt .. "."  .. ' ' .. adviceStr;
		-- end
	-- end
	-- if text == '' or minutes ~= 0 then
		-- if hours == 0 then
			-- if minutes <= 10 then
				-- rgb = "<RGB:1,0,0>"; -- rojo
			-- elseif minutes > 10 and minutes < 30 then
				-- rgb = "<RGB:0.98,0.55,0>"; -- naranja
			-- elseif minutes >= 30 and minutes < 40 then
				-- rgb = "<RGB:1,1,0>"; -- amarillo
			-- elseif minutes >= 40 and minutes < 60 then
				-- rgb = "<RGB:0,0.8,0>"; -- verde
			-- end
		-- else
			-- rgb = "<RGB:0,0.8,0>"; -- verde
		-- end
		-- if text ~= '' then text = text .. ', ' end
		-- text = rgb .. text .. math.floor(minutes) .. ' ' .. minuteTxt .. "."  .. ' ' .. adviceStr;
	-- end
	-- return text
-- end

ISLGEPCampfireMenu.doMenu = function(player, context, worldobjects)
	if ISCrematoriumMenu then return end;
	local playerObj = getSpecificPlayer(player);
	local playerInv = getSpecificPlayer(player):getInventory();
	local containers = ISInventoryPaneContextMenu.getContainers(playerObj);
	local campfire = nil;
	local Glass = playerInv:getFirstTypeRecurse("magnifyingglass");

	-- Search for campfire
	for i,v in ipairs(worldobjects) do
		ISLGEPCampfireMenu.campfire = CCampfireSystem.instance:getLuaObjectOnSquare(v:getSquare());
		if ISLGEPCampfireMenu.campfire ~= nil then
			campfire = ISLGEPCampfireMenu.campfire;
		end		
	end
	-- Campfire Menu
	if campfire ~= nil then
		local canlit = ISLGEPCampfireMenu.CanLit(campfire)
		if Glass then
			local option = context:addOption(getText("ContextMenu_GlassUse"), worldobjects, ISLGEPCampfireMenu.onLightFromGlass, player, Glass, campfire)
			option.toolTip = ISToolTip:new();
			option.toolTip:initialise();
			option.toolTip:setVisible(false);
			option.toolTip:setName(getText("ContextMenu_GlassUse"));
			option.toolTip:setTexture("media/textures/Item_Lupa.png");
			option.toolTip.description = getText("ContextMenu_Campfire_UseGlass");
			if not canlit then
				option.notAvailable = true;
				option.toolTip.description = option.toolTip.description .. ISLGEPCampfireMenu.getDescription(campfire);
			end
			option.toolTip.description = option.toolTip.description .. " <LINE> <LINE>" .. getText("ContextMenu_Campfire_UseGlass2");
		end
		--local option = context:addOption(getText("ContextMenu_CampfireInfo"), worldobjects, ISLGEPCampfireMenu.onCampfireInfo, player, campfire)
		--if playerObj:DistToSquared(campfire.x + 0.5, campfire.y + 0.5) < 3 * 2 then
		--	option.toolTip = ISToolTip:new();
		--	option.toolTip:initialise();
		--	option.toolTip:setVisible(false);
		--	option.toolTip:setName(getText("IGUI_Campfire"));
		--	option.toolTip:setTexture(campfire:getObject():getSpriteName());
		--	option.toolTip.description = getText("IGUI_Campfire_FuelAmount", timeCalc(campfire.fuelAmt, campfire.exterior));
		--end
	end
end
ISLGEPCampfireMenu.getDescription = function(campfire)
	local text = ""
	local currentHour = math.floor(math.floor(GameTime:getInstance():getTimeOfDay() * 3600) / 3600); --La hora del día
	local c = getClimateManager();
	local clouds = c:getCloudIntensity();
	if (currentHour >= 5 and currentHour <= 20) then
	else
		text = text .. getText("ContextMenu_NeedToBeDay");
		return text;
	end
	if clouds>0.25 then
		if text ~= "" then
			text = text .. " <LINE>";
		else
		end
		
		text = text .. getText("ContextMenu_TooCloudy");
	end
	if campfire.fuelAmt == 0 then
		if text ~= "" then
			text = text .. " <LINE>";
		else
		end
		
		text = text .. getText("ContextMenu_NeedFuel");
	end
	return text;
end
ISLGEPCampfireMenu.CanLit = function(campfire)
	local currentHour = math.floor(math.floor(GameTime:getInstance():getTimeOfDay() * 3600) / 3600); --La hora del día
	local c = getClimateManager();
	local clouds = c:getCloudIntensity();
	local CanLit = false;
	if (currentHour >= 5 and currentHour <= 20) and clouds<0.25 and (not RainManager.isRaining() or c:getPrecipitationIntensity() == 0) and campfire.fuelAmt > 0 and not campfire.isLit then
		CanLit = true;
	end
	return CanLit;
end

ISLGEPCampfireMenu.onLightFromGlass = function(worldobjects, player, Glass, campfire)
	local playerObj = getSpecificPlayer(player)
	local item = nil;
	if Glass then 
		item = playerObj:getInventory():getFirstTypeRecurse("magnifyingglass")
        ISWorldObjectContextMenu.transferIfNeeded(playerObj, item)
		--ISCampingMenu.toPlayerInventory(playerObj, item)
		if not item:isEquipped() then
			ISTimedActionQueue.add(ISEquipWeaponAction:new(playerObj, item, 50, true, false))
		end
	end

	if luautils.walkAdj(playerObj, campfire:getSquare(), true) then
		ISTimedActionQueue.add(ISLightFromGlass:new(playerObj, item, campfire, 1500));
	end
end


Events.OnFillWorldObjectContextMenu.Add(ISLGEPCampfireMenu.doMenu);
