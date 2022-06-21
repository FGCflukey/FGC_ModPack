----------------------------------------------------------------------------------
--
-- AFReleaseFishMenu.lua
-- Parte del mod Advanced Fishing.
-- Creado por Snake.
--
--
-- El codigo base se encuentra en ISInventoryBuildMenu.lua
-- los cuales han sido creados por Robert Johnson.
--
----------------------------------------------------------------------------------


AFReleaseFishMenu = {};

AFReleaseFishMenu.ReleaseMenu = function(player, context, worldobjects, test)

	if test and ISWorldObjectContextMenu.Test then
		return true;
	end
	local player = getSpecificPlayer(player);
    local _inventory = player:getInventory();
	local canrelease = nil;
	local _releaseSourceSquare = nil;
	local fish = nil;
	local sportfisherman = nil;
	local perkflvl = player:getPerkLevel(Perks.Fishing);
	local Palometa = nil;
	local Piranha = nil;
	local Dorado = nil;
	local Tucunare = nil;
	local Pacu = nil;
	local Tararira = nil;
	local Walleye = nil;
	local Dentudo = nil;
	local Payara = nil;
	local Carp = nil;
	local Peje = nil;
	local Rtrout = nil;
	local Salmon = nil;
	local Snakehead = nil;
	local Crab = nil;
	local Crayfish = nil;
	local Rtcatfish = nil;
	local Piraiba = nil;
	local Arapaima = nil;
	local Tarpon = nil;
	local Surubi = nil;
	local Pati = nil;
	local Anguila = nil;
	local Wturtle = nil;
	local Ray = nil;
	local Catfish = nil;
	local Bass = nil;
	local Perch = nil;
	local Crappie = nil;
	local Panfish = nil;
	local Pike = nil;
	local Trout = nil;
	local Baitfish = nil;
	local Arowana = nil;
	local Wilson = nil;
	
	if player:HasTrait("sportfisherman") then
		sportfisherman = true;
	end
    if _inventory:contains("Palometa") then 
		fish = true;
		Palometa = true;
	end
	if  _inventory:contains("Piranha") then
		fish = true;
		Piranha = true;
	end
	if _inventory:contains("Dorado") then
		fish = true;
		Dorado = true;
	end
	if _inventory:contains("Tucunare") then
		fish = true;
		Tucunare = true;
	end
	if _inventory:contains("Pacu") then
		fish = true;
		Pacu = true;
	end
	if _inventory:contains("Tararira") then
		fish = true;
		Tararira = true;
	end
	if _inventory:contains("Walleye") then
		fish = true;
		Walleye = true;
	end
	if _inventory:contains("Dentudo") then
		fish = true;
		Dentudo = true;
	end
	if _inventory:contains("Payara") then
		fish = true;
		Payara = true;
	end
	if _inventory:contains("Carp") then
		fish = true;
		Carp = true;
	end
	if _inventory:contains("Peje") then
		fish = true;
		Peje = true;
	end
	if _inventory:contains("RainbowTrout") then
		fish = true;
		Rtrout = true;
	end
	if _inventory:contains("FSalmon") then
		fish = true;
		Salmon = true;
	end
	if _inventory:contains("Snakehead") then
		fish = true;
		Snakehead = true;
	end
	if _inventory:contains("Crab") then
		fish = true;
		Crab = true;
	end
	if _inventory:contains("Crayfish") then
		fish = true;
		Crayfish = true;
	end
	if _inventory:contains("Rtcatfish") then
		fish = true;
		Rtcatfish = true;
	end
	if _inventory:contains("Piraiba") then
		fish = true;
		Piraiba = true;
	end
	if _inventory:contains("Arapaima") then
		fish = true;
		Arapaima = true;
	end
	if _inventory:contains("Tarpon") then
		fish = true;
		Tarpon = true;
	end
	if _inventory:contains("Surubi") then
		fish = true;
		Surubi = true;
	end
	if _inventory:contains("Pati") then
		fish = true;
		Pati = true;
	end
	if _inventory:contains("Anguila") then
		fish = true;
		Anguila = true;
	end
	if _inventory:contains("Waterturtle") then
		fish = true;
		Wturtle = true;
	end
	if _inventory:contains("Ray") then
		fish = true;
		Ray = true;
	end
    if _inventory:contains("Catfish") then
		fish = true;
		Catfish = true;
	end
    if _inventory:contains("Bass") then
		fish = true;
		Bass = true;
	end
    if _inventory:contains("Perch") then
		fish = true;
		Perch = true;
	end
    if _inventory:contains("Crappie") then
		fish = true;
		Crappie = true;
	end
    if _inventory:contains("Panfish") then
		fish = true;
		Panfish = true;
	end
    if _inventory:contains("Pike") then
		fish = true;
		Pike = true;
	end
    if _inventory:contains("Trout") then
		fish = true;
		Trout = true;
	end
    if _inventory:contains("BaitFish") then
		fish = true;
		Baitfish = true;
	end
    if _inventory:contains("Arowana") then
		fish = true;
		Arowana = true;
	end
    if _inventory:contains("WilsonBall") then
		fish = true;
		Wilson = true;
	end

	local _squares = {};
	local _duplicate = false;
	local _objectSquare = nil;

	for _, _currentObject in pairs(worldobjects) do
		_duplicate = false;
		_objectSquare = _currentObject:getSquare(); 	-- La celda del objeto.
		if _objectSquare ~= nil then
			for _, _currentSquare in pairs(_squares) do
				if _currentSquare == _objectSquare then
					_duplicate = true;
					break
				end
			end
		end

		if not _duplicate then
			table.insert(_squares, _objectSquare);
		end
	end

	local _spriteName = "";
	local _possibleFloor = nil;
	local _objectList = nil;
	for _, _currentSquare in pairs(_squares) do
		_objectList = _currentSquare:getObjects();
		for i = 0, _objectList:size()-1 do
			_possibleFloor = _objectList:get(i)
			if _possibleFloor:getSprite() and _possibleFloor:getSprite():getProperties() then
				_spriteName = _possibleFloor:getSprite():getProperties();
				if _spriteName:Is(IsoFlagType.water) then
					canrelease = true;
					_releaseSourceSquare = _currentSquare;
					break;
				end
			end
		end

		if canrelease == true then
			break;
		end
	end
	
	if canrelease  ~= nil and fish ~= nil and (sportfisherman ~= nil or perkflvl >= 5 or player:getKnownRecipes():contains("Sport Fishing")) then
		local descriptionTT = " <RGB:0,1,0> " .. getText("ContextMenu_ReleaseFishTT");
		local tx = "media/textures/Item_ReleaseFish.png";
        local release = context:addOption(getText("ContextMenu_ReleaseFish"), _releaseSourceSquare, nil)
		local submenurelease = context:getNew(context)
        context:addSubMenu(release, submenurelease)
	    if Palometa ~= nil then
	        local option = submenurelease:addOption(getText("ContextMenu_palometa_info"), _releaseSourceSquare, AFReleaseFishMenu.onReleasePalometa, player);
            local tooltip = ISWorldObjectContextMenu.addToolTip();
			tooltip:setName(getText("ContextMenu_ReleaseFish") .. getText("ContextMenu_palometa_info"));
            tooltip.description = descriptionTT;
			tooltip:setTexture(tx);
            option.toolTip = tooltip;
		end
	    if Piranha ~= nil then
	        local option = submenurelease:addOption(getText("ContextMenu_piranha_info"), _releaseSourceSquare, AFReleaseFishMenu.onReleasePiranha, player);
            local tooltip = ISWorldObjectContextMenu.addToolTip();
			tooltip:setName(getText("ContextMenu_ReleaseFish") .. getText("ContextMenu_piranha_info"));
            tooltip.description = descriptionTT;
			tooltip:setTexture(tx);
            option.toolTip = tooltip;
		end
	    if Walleye ~= nil then
	        local option = submenurelease:addOption(getText("ContextMenu_walleye_info"), _releaseSourceSquare, AFReleaseFishMenu.onReleaseWalleye, player);
            local tooltip = ISWorldObjectContextMenu.addToolTip();
			tooltip:setName(getText("ContextMenu_ReleaseFish") .. getText("ContextMenu_walleye_info"));
            tooltip.description = descriptionTT;
			tooltip:setTexture(tx);
            option.toolTip = tooltip;
		end
	    if Dorado ~= nil then
	        local option = submenurelease:addOption(getText("ContextMenu_dorado_info"), _releaseSourceSquare, AFReleaseFishMenu.onReleaseDorado, player);
            local tooltip = ISWorldObjectContextMenu.addToolTip();
			tooltip:setName(getText("ContextMenu_ReleaseFish") .. getText("ContextMenu_dorado_info"));
            tooltip.description = descriptionTT;
			tooltip:setTexture(tx);
            option.toolTip = tooltip;
		end
	    if Tucunare ~= nil then
	        local option = submenurelease:addOption(getText("ContextMenu_tucunare_info"), _releaseSourceSquare, AFReleaseFishMenu.onReleaseTucunare, player);
            local tooltip = ISWorldObjectContextMenu.addToolTip();
			tooltip:setName(getText("ContextMenu_ReleaseFish") .. getText("ContextMenu_tucunare_info"));
            tooltip.description = descriptionTT;
			tooltip:setTexture(tx);
            option.toolTip = tooltip;
		end
	    if Pacu ~= nil then
	        local option = submenurelease:addOption(getText("ContextMenu_pacu_info"), _releaseSourceSquare, AFReleaseFishMenu.onReleasePacu, player);
            local tooltip = ISWorldObjectContextMenu.addToolTip();
			tooltip:setName(getText("ContextMenu_ReleaseFish") .. getText("ContextMenu_pacu_info"));
            tooltip.description = descriptionTT;
			tooltip:setTexture(tx);
            option.toolTip = tooltip;
		end
	    if Tararira ~= nil then
	        local option = submenurelease:addOption(getText("ContextMenu_tararira_info"), _releaseSourceSquare, AFReleaseFishMenu.onReleaseTararira, player);
            local tooltip = ISWorldObjectContextMenu.addToolTip();
			tooltip:setName(getText("ContextMenu_ReleaseFish") .. getText("ContextMenu_tararira_info"));
            tooltip.description = descriptionTT;
			tooltip:setTexture(tx);
            option.toolTip = tooltip;
		end
	    if Dentudo ~= nil then
	        local option = submenurelease:addOption(getText("ContextMenu_dentudo_info"), _releaseSourceSquare, AFReleaseFishMenu.onReleaseDentudo, player);
            local tooltip = ISWorldObjectContextMenu.addToolTip();
			tooltip:setName(getText("ContextMenu_ReleaseFish") .. getText("ContextMenu_dentudo_info"));
            tooltip.description = descriptionTT;
			tooltip:setTexture(tx);
            option.toolTip = tooltip;
		end
	    if Payara ~= nil then
	        local option = submenurelease:addOption(getText("ContextMenu_payara_info"), _releaseSourceSquare, AFReleaseFishMenu.onReleasePayara, player);
            local tooltip = ISWorldObjectContextMenu.addToolTip();
			tooltip:setName(getText("ContextMenu_ReleaseFish") .. getText("ContextMenu_payara_info"));
            tooltip.description = descriptionTT;
			tooltip:setTexture(tx);
            option.toolTip = tooltip;
		end
	    if Carp ~= nil then
	        local option = submenurelease:addOption(getText("ContextMenu_carp_info"), _releaseSourceSquare, AFReleaseFishMenu.onReleaseCarp, player);
            local tooltip = ISWorldObjectContextMenu.addToolTip();
			tooltip:setName(getText("ContextMenu_ReleaseFish") .. getText("ContextMenu_carp_info"));
            tooltip.description = descriptionTT;
			tooltip:setTexture(tx);
            option.toolTip = tooltip;
		end
	    if Peje ~= nil then
	        local option = submenurelease:addOption(getText("ContextMenu_peje_info"), _releaseSourceSquare, AFReleaseFishMenu.onReleasePeje, player);
            local tooltip = ISWorldObjectContextMenu.addToolTip();
			tooltip:setName(getText("ContextMenu_ReleaseFish") .. getText("ContextMenu_peje_info"));
            tooltip.description = descriptionTT;
			tooltip:setTexture(tx);
            option.toolTip = tooltip;
		end
	    if Rtrout ~= nil then
	        local option = submenurelease:addOption(getText("ContextMenu_rainbowtrout_info"), _releaseSourceSquare, AFReleaseFishMenu.onReleaseRTrout, player);
            local tooltip = ISWorldObjectContextMenu.addToolTip();
			tooltip:setName(getText("ContextMenu_ReleaseFish") .. getText("ContextMenu_rainbowtrout_info"));
            tooltip.description = descriptionTT;
			tooltip:setTexture(tx);
            option.toolTip = tooltip;
		end
	    if Salmon ~= nil then
	        local option = submenurelease:addOption(getText("ContextMenu_salmon_info"), _releaseSourceSquare, AFReleaseFishMenu.onReleaseSalmon, player);
            local tooltip = ISWorldObjectContextMenu.addToolTip();
			tooltip:setName(getText("ContextMenu_ReleaseFish") .. getText("ContextMenu_salmon_info"));
            tooltip.description = descriptionTT;
			tooltip:setTexture(tx);
            option.toolTip = tooltip;
		end
	    if Snakehead ~= nil then
	        local option = submenurelease:addOption(getText("ContextMenu_snakehead_info"), _releaseSourceSquare, AFReleaseFishMenu.onReleaseSnakehead, player);
            local tooltip = ISWorldObjectContextMenu.addToolTip();
			tooltip:setName(getText("ContextMenu_ReleaseFish") .. getText("ContextMenu_snakehead_info"));
            tooltip.description = descriptionTT;
			tooltip:setTexture(tx);
            option.toolTip = tooltip;
		end
	    if Crab ~= nil then
	        local option = submenurelease:addOption(getText("ContextMenu_crab_info"), _releaseSourceSquare, AFReleaseFishMenu.onReleaseCrab, player);
            local tooltip = ISWorldObjectContextMenu.addToolTip();
			tooltip:setName(getText("ContextMenu_ReleaseFish") .. getText("ContextMenu_crab_info"));
            tooltip.description = descriptionTT;
			tooltip:setTexture(tx);
            option.toolTip = tooltip;
		end
	    if Crayfish ~= nil then
	        local option = submenurelease:addOption(getText("ContextMenu_crayfish_info"), _releaseSourceSquare, AFReleaseFishMenu.onReleaseCrayfish, player);
            local tooltip = ISWorldObjectContextMenu.addToolTip();
			tooltip:setName(getText("ContextMenu_ReleaseFish") .. getText("ContextMenu_crayfish_info"));
            tooltip.description = descriptionTT;
			tooltip:setTexture(tx);
            option.toolTip = tooltip;
		end
	    if Rtcatfish ~= nil then
	        local option = submenurelease:addOption(getText("ContextMenu_rtcatfish_info"), _releaseSourceSquare, AFReleaseFishMenu.onReleaseRTCatfish, player);
            local tooltip = ISWorldObjectContextMenu.addToolTip();
			tooltip:setName(getText("ContextMenu_ReleaseFish") .. getText("ContextMenu_rtcatfish_info"));
            tooltip.description = descriptionTT;
			tooltip:setTexture(tx);
            option.toolTip = tooltip;
		end
	    if Piraiba ~= nil then
	        local option = submenurelease:addOption(getText("ContextMenu_piraiba_info"), _releaseSourceSquare, AFReleaseFishMenu.onReleasePiraiba, player);
            local tooltip = ISWorldObjectContextMenu.addToolTip();
			tooltip:setName(getText("ContextMenu_ReleaseFish") .. getText("ContextMenu_piraiba_info"));
            tooltip.description = descriptionTT;
			tooltip:setTexture(tx);
            option.toolTip = tooltip;
		end
	    if Arapaima ~= nil then
	        local option = submenurelease:addOption(getText("ContextMenu_arapaima_info"), _releaseSourceSquare, AFReleaseFishMenu.onReleaseArapaima, player);
            local tooltip = ISWorldObjectContextMenu.addToolTip();
			tooltip:setName(getText("ContextMenu_ReleaseFish") .. getText("ContextMenu_arapaima_info"));
            tooltip.description = descriptionTT;
			tooltip:setTexture(tx);
            option.toolTip = tooltip;
		end
	    if Tarpon ~= nil then
	        local option = submenurelease:addOption(getText("ContextMenu_tarpon_info"), _releaseSourceSquare, AFReleaseFishMenu.onReleaseTarpon, player);
            local tooltip = ISWorldObjectContextMenu.addToolTip();
			tooltip:setName(getText("ContextMenu_ReleaseFish") .. getText("ContextMenu_tarpon_info"));
            tooltip.description = descriptionTT;
			tooltip:setTexture(tx);
            option.toolTip = tooltip;
		end
	    if Surubi ~= nil then
	        local option = submenurelease:addOption(getText("ContextMenu_surubi_info"), _releaseSourceSquare, AFReleaseFishMenu.onReleaseSurubi, player);
            local tooltip = ISWorldObjectContextMenu.addToolTip();
			tooltip:setName(getText("ContextMenu_ReleaseFish") .. getText("ContextMenu_surubi_info"));
            tooltip.description = descriptionTT;
			tooltip:setTexture(tx);
            option.toolTip = tooltip;
		end
	    if Pati ~= nil then
	        local option = submenurelease:addOption(getText("ContextMenu_pati_info"), _releaseSourceSquare, AFReleaseFishMenu.onReleasePati, player);
            local tooltip = ISWorldObjectContextMenu.addToolTip();
			tooltip:setName(getText("ContextMenu_ReleaseFish") .. getText("ContextMenu_pati_info"));
            tooltip.description = descriptionTT;
			tooltip:setTexture(tx);
            option.toolTip = tooltip;
		end
	    if Anguila ~= nil then
	        local option = submenurelease:addOption(getText("ContextMenu_anguila_info"), _releaseSourceSquare, AFReleaseFishMenu.onReleaseAnguila, player);
            local tooltip = ISWorldObjectContextMenu.addToolTip();
			tooltip:setName(getText("ContextMenu_ReleaseFish") .. getText("ContextMenu_anguila_info"));
            tooltip.description = descriptionTT;
			tooltip:setTexture(tx);
            option.toolTip = tooltip;
		end
	    if Wturtle ~= nil then
	        local option = submenurelease:addOption(getText("ContextMenu_waterturtle_info"), _releaseSourceSquare, AFReleaseFishMenu.onReleaseWTurtle, player);
            local tooltip = ISWorldObjectContextMenu.addToolTip();
			tooltip:setName(getText("ContextMenu_ReleaseFish") .. getText("ContextMenu_waterturtle_info"));
            tooltip.description = descriptionTT;
			tooltip:setTexture(tx);
            option.toolTip = tooltip;
		end
	    if Ray ~= nil then
	        local option = submenurelease:addOption(getText("ContextMenu_ray_info"), _releaseSourceSquare, AFReleaseFishMenu.onReleaseRay, player);
            local tooltip = ISWorldObjectContextMenu.addToolTip();
			tooltip:setName(getText("ContextMenu_ReleaseFish") .. getText("ContextMenu_ray_info"));
            tooltip.description = descriptionTT;
			tooltip:setTexture(tx);
            option.toolTip = tooltip;
		end
	    if Catfish ~= nil then
	        local option = submenurelease:addOption(getText("ContextMenu_catfish_info"), _releaseSourceSquare, AFReleaseFishMenu.onReleaseCatfish, player);
            local tooltip = ISWorldObjectContextMenu.addToolTip();
			tooltip:setName(getText("ContextMenu_ReleaseFish") .. getText("ContextMenu_catfish_info"));
            tooltip.description = descriptionTT;
			tooltip:setTexture(tx);
            option.toolTip = tooltip;
		end
	    if Bass ~= nil then
	        local option = submenurelease:addOption(getText("ContextMenu_bass_info"), _releaseSourceSquare, AFReleaseFishMenu.onReleaseBass, player);
            local tooltip = ISWorldObjectContextMenu.addToolTip();
			tooltip:setName(getText("ContextMenu_ReleaseFish") .. getText("ContextMenu_bass_info"));
            tooltip.description = descriptionTT;
			tooltip:setTexture(tx);
            option.toolTip = tooltip;
		end
	    if Perch ~= nil then
	        local option = submenurelease:addOption(getText("ContextMenu_perch_info"), _releaseSourceSquare, AFReleaseFishMenu.onReleasePerch, player);
            local tooltip = ISWorldObjectContextMenu.addToolTip();
			tooltip:setName(getText("ContextMenu_ReleaseFish") .. getText("ContextMenu_perch_info"));
            tooltip.description = descriptionTT;
			tooltip:setTexture(tx);
            option.toolTip = tooltip;
		end
	    if Crappie ~= nil then
	        local option = submenurelease:addOption(getText("ContextMenu_crappie_info"), _releaseSourceSquare, AFReleaseFishMenu.onReleaseCrappie, player);
            local tooltip = ISWorldObjectContextMenu.addToolTip();
			tooltip:setName(getText("ContextMenu_ReleaseFish") .. getText("ContextMenu_crappie_info"));
            tooltip.description = descriptionTT;
			tooltip:setTexture(tx);
            option.toolTip = tooltip;
		end
	    if Panfish ~= nil then
	        local option = submenurelease:addOption(getText("ContextMenu_panfish_info"), _releaseSourceSquare, AFReleaseFishMenu.onReleasePanfish, player);
            local tooltip = ISWorldObjectContextMenu.addToolTip();
			tooltip:setName(getText("ContextMenu_ReleaseFish") .. getText("ContextMenu_panfish_info"));
            tooltip.description = descriptionTT;
			tooltip:setTexture(tx);
            option.toolTip = tooltip;
		end
	    if Pike ~= nil then
	        local option = submenurelease:addOption(getText("ContextMenu_pike_info"), _releaseSourceSquare, AFReleaseFishMenu.onReleasePike, player);
            local tooltip = ISWorldObjectContextMenu.addToolTip();
			tooltip:setName(getText("ContextMenu_ReleaseFish") .. getText("ContextMenu_pike_info"));
            tooltip.description = descriptionTT;
			tooltip:setTexture(tx);
            option.toolTip = tooltip;
		end
	    if Trout ~= nil then
	        local option = submenurelease:addOption(getText("ContextMenu_trout_info"), _releaseSourceSquare, AFReleaseFishMenu.onReleaseTrout, player);
            local tooltip = ISWorldObjectContextMenu.addToolTip();
			tooltip:setName(getText("ContextMenu_ReleaseFish") .. getText("ContextMenu_trout_info"));
            tooltip.description = descriptionTT;
			tooltip:setTexture(tx);
            option.toolTip = tooltip;
		end
	    if Baitfish ~= nil then
	        local option = submenurelease:addOption(getText("ContextMenu_baitfish_info"), _releaseSourceSquare, AFReleaseFishMenu.onReleaseBaitfish, player);
            local tooltip = ISWorldObjectContextMenu.addToolTip();
			tooltip:setName(getText("ContextMenu_ReleaseFish") .. getText("ContextMenu_baitfish_info"));
            tooltip.description = descriptionTT;
			tooltip:setTexture(tx);
            option.toolTip = tooltip;
		end
	    if Arowana ~= nil then
	        local option = submenurelease:addOption(getText("ContextMenu_arowana_info"), _releaseSourceSquare, AFReleaseFishMenu.onReleaseArowana, player);
            local tooltip = ISWorldObjectContextMenu.addToolTip();
			tooltip:setName(getText("ContextMenu_ReleaseFish") .. getText("ContextMenu_arowana_info"));
            tooltip.description = descriptionTT;
			tooltip:setTexture(tx);
            option.toolTip = tooltip;
		end
	    if Wilson ~= nil then
	        local option = submenurelease:addOption(getText("ContextMenu_wilson_info"), _releaseSourceSquare, AFReleaseFishMenu.onReleaseWilson, player);
            local tooltip = ISWorldObjectContextMenu.addToolTip();
			tooltip:setName(getText("ContextMenu_ReleaseFish") .. getText("ContextMenu_wilson_info"));
            tooltip.description = descriptionTT;
			tooltip:setTexture(tx);
            option.toolTip = tooltip;
		end
	end
end

AFReleaseFishMenu.onReleaseWilson = function(targetSquare, player)
	if luautils.walkAdj(player, targetSquare) then
		local _inventory = player:getInventory();
		if _inventory:contains("WilsonBall") then
			for i=1, 1 do
				local ball = "WilsonBall";
				player:getInventory():Remove(ball);
			end
--			ISWorldObjectContextMenu.equip(player, player:getPrimaryHandItem(), "WilsonBall", true);
			local time = 1200;
			ISTimedActionQueue.add(AFReleaseWilsonAction:new(player, targetSquare, time));
		end
	else
		luautils.okModal(getText("Tooltip_TooFar"), true);
	end
end

AFReleaseFishMenu.onReleasePalometa = function(targetSquare, player)
	if luautils.walkAdj(player, targetSquare) then
		ISWorldObjectContextMenu.equip(player, player:getPrimaryHandItem(), "Palometa", true);
		local time = 50;
		ISTimedActionQueue.add(AFReleaseFishAction:new(player, targetSquare, time));
	else
		luautils.okModal(getText("Tooltip_TooFar"), true);
	end
end

AFReleaseFishMenu.onReleasePiranha = function(targetSquare, player)
	if luautils.walkAdj(player, targetSquare) then
		ISWorldObjectContextMenu.equip(player, player:getPrimaryHandItem(), "Piranha", true);
		local time = 50;
		ISTimedActionQueue.add(AFReleaseFishAction:new(player, targetSquare, time));
	else
		luautils.okModal(getText("Tooltip_TooFar"), true);
	end
end

AFReleaseFishMenu.onReleaseWalleye = function(targetSquare, player)

--    local Player = getSpecificPlayer(0);
--	local Item = Player:getPrimaryHandItem();
--    if (instanceof(Item, "Food") and Player:getPrimaryHandItem():getType() == "Walleye") then
--		if Item ~= nil and (Item:isCooked() or Item:isRotten() or Item:isBurnt()) then
--			luautils.okModal(getText("Tooltip_BadRelease"), true);
--		else
--			if luautils.walkAdj(player, targetSquare) then
--				local time = 50;
--				ISTimedActionQueue.add(AFReleaseFishAction:new(player, targetSquare, time));
--			end
--        end
--    end
	if luautils.walkAdj(player, targetSquare) then
		ISWorldObjectContextMenu.equip(player, player:getPrimaryHandItem(), "Walleye", true);
		local time = 50;
		ISTimedActionQueue.add(AFReleaseFishAction:new(player, targetSquare, time));
	else
		luautils.okModal(getText("Tooltip_TooFar"), true);
	end
end

AFReleaseFishMenu.onReleaseDorado = function(targetSquare, player)
	if luautils.walkAdj(player, targetSquare) then
		ISWorldObjectContextMenu.equip(player, player:getPrimaryHandItem(), "Dorado", true);
		local time = 50;
		ISTimedActionQueue.add(AFReleaseFishAction:new(player, targetSquare, time));
	else
		luautils.okModal(getText("Tooltip_TooFar"), true);
	end
end

AFReleaseFishMenu.onReleaseTucunare = function(targetSquare, player)
	if luautils.walkAdj(player, targetSquare) then
		ISWorldObjectContextMenu.equip(player, player:getPrimaryHandItem(), "Tucunare", true);
		local time = 50;
		ISTimedActionQueue.add(AFReleaseFishAction:new(player, targetSquare, time));
	else
		luautils.okModal(getText("Tooltip_TooFar"), true);
	end
end

AFReleaseFishMenu.onReleasePacu = function(targetSquare, player)
	if luautils.walkAdj(player, targetSquare) then
		ISWorldObjectContextMenu.equip(player, player:getPrimaryHandItem(), "Pacu", true);
		local time = 50;
		ISTimedActionQueue.add(AFReleaseFishAction:new(player, targetSquare, time));
	else
		luautils.okModal(getText("Tooltip_TooFar"), true);
	end
end

AFReleaseFishMenu.onReleaseTararira = function(targetSquare, player)
	if luautils.walkAdj(player, targetSquare) then
		ISWorldObjectContextMenu.equip(player, player:getPrimaryHandItem(), "Tararira", true);
		local time = 50;
		ISTimedActionQueue.add(AFReleaseFishAction:new(player, targetSquare, time));
	else
		luautils.okModal(getText("Tooltip_TooFar"), true);
	end
end

AFReleaseFishMenu.onReleaseDentudo = function(targetSquare, player)
	if luautils.walkAdj(player, targetSquare) then
		ISWorldObjectContextMenu.equip(player, player:getPrimaryHandItem(), "Dentudo", true);
		local time = 50;
		ISTimedActionQueue.add(AFReleaseFishAction:new(player, targetSquare, time));
	else
		luautils.okModal(getText("Tooltip_TooFar"), true);
	end
end

AFReleaseFishMenu.onReleasePayara = function(targetSquare, player)
	if luautils.walkAdj(player, targetSquare) then
		ISWorldObjectContextMenu.equip(player, player:getPrimaryHandItem(), "Payara", true);
		local time = 50;
		ISTimedActionQueue.add(AFReleaseFishAction:new(player, targetSquare, time));
	else
		luautils.okModal(getText("Tooltip_TooFar"), true);
	end
end

AFReleaseFishMenu.onReleaseCarp = function(targetSquare, player)
	if luautils.walkAdj(player, targetSquare) then
		ISWorldObjectContextMenu.equip(player, player:getPrimaryHandItem(), "Carp", true);
		local time = 50;
		ISTimedActionQueue.add(AFReleaseFishAction:new(player, targetSquare, time));
	else
		luautils.okModal(getText("Tooltip_TooFar"), true);
	end
end

AFReleaseFishMenu.onReleasePeje = function(targetSquare, player)
	if luautils.walkAdj(player, targetSquare) then
		ISWorldObjectContextMenu.equip(player, player:getPrimaryHandItem(), "Peje", true);
		local time = 50;
		ISTimedActionQueue.add(AFReleaseFishAction:new(player, targetSquare, time));
	else
		luautils.okModal(getText("Tooltip_TooFar"), true);
	end
end

AFReleaseFishMenu.onReleaseRTrout = function(targetSquare, player)
	if luautils.walkAdj(player, targetSquare) then
		ISWorldObjectContextMenu.equip(player, player:getPrimaryHandItem(), "RainbowTrout", true);
		local time = 50;
		ISTimedActionQueue.add(AFReleaseFishAction:new(player, targetSquare, time));
	else
		luautils.okModal(getText("Tooltip_TooFar"), true);
	end
end

AFReleaseFishMenu.onReleaseSalmon = function(targetSquare, player)
	if luautils.walkAdj(player, targetSquare) then
		ISWorldObjectContextMenu.equip(player, player:getPrimaryHandItem(), "FSalmon", true);
		local time = 50;
		ISTimedActionQueue.add(AFReleaseFishAction:new(player, targetSquare, time));
	else
		luautils.okModal(getText("Tooltip_TooFar"), true);
	end
end

AFReleaseFishMenu.onReleaseSnakehead = function(targetSquare, player)
	if luautils.walkAdj(player, targetSquare) then
		ISWorldObjectContextMenu.equip(player, player:getPrimaryHandItem(), "Snakehead", true);
		local time = 50;
		ISTimedActionQueue.add(AFReleaseFishAction:new(player, targetSquare, time));
	else
		luautils.okModal(getText("Tooltip_TooFar"), true);
	end
end

AFReleaseFishMenu.onReleaseCrab = function(targetSquare, player)
	if luautils.walkAdj(player, targetSquare) then
		ISWorldObjectContextMenu.equip(player, player:getPrimaryHandItem(), "Crab", true);
		local time = 50;
		ISTimedActionQueue.add(AFReleaseFishAction:new(player, targetSquare, time));
	else
		luautils.okModal(getText("Tooltip_TooFar"), true);
	end
end

AFReleaseFishMenu.onReleaseCrayfish = function(targetSquare, player)
	if luautils.walkAdj(player, targetSquare) then
		ISWorldObjectContextMenu.equip(player, player:getPrimaryHandItem(), "Crayfish", true);
		local time = 50;
		ISTimedActionQueue.add(AFReleaseFishAction:new(player, targetSquare, time));
	else
		luautils.okModal(getText("Tooltip_TooFar"), true);
	end
end

AFReleaseFishMenu.onReleaseRTCatfish = function(targetSquare, player)
	if luautils.walkAdj(player, targetSquare) then
		ISWorldObjectContextMenu.equip(player, player:getPrimaryHandItem(), "Rtcatfish", true);
		local time = 50;
		ISTimedActionQueue.add(AFReleaseFishAction:new(player, targetSquare, time));
	else
		luautils.okModal(getText("Tooltip_TooFar"), true);
	end
end

AFReleaseFishMenu.onReleasePiraiba = function(targetSquare, player)
	if luautils.walkAdj(player, targetSquare) then
		ISWorldObjectContextMenu.equip(player, player:getPrimaryHandItem(), "Piraiba", true);
		local time = 50;
		ISTimedActionQueue.add(AFReleaseFishAction:new(player, targetSquare, time));
	else
		luautils.okModal(getText("Tooltip_TooFar"), true);
	end
end

AFReleaseFishMenu.onReleaseArapaima = function(targetSquare, player)
	if luautils.walkAdj(player, targetSquare) then
		ISWorldObjectContextMenu.equip(player, player:getPrimaryHandItem(), "Arapaima", true);
		local time = 50;
		ISTimedActionQueue.add(AFReleaseFishAction:new(player, targetSquare, time));
	else
		luautils.okModal(getText("Tooltip_TooFar"), true);
	end
end

AFReleaseFishMenu.onReleaseTarpon = function(targetSquare, player)
	if luautils.walkAdj(player, targetSquare) then
		ISWorldObjectContextMenu.equip(player, player:getPrimaryHandItem(), "Tarpon", true);
		local time = 50;
		ISTimedActionQueue.add(AFReleaseFishAction:new(player, targetSquare, time));
	else
		luautils.okModal(getText("Tooltip_TooFar"), true);
	end
end

AFReleaseFishMenu.onReleaseSurubi = function(targetSquare, player)
	if luautils.walkAdj(player, targetSquare) then
		ISWorldObjectContextMenu.equip(player, player:getPrimaryHandItem(), "Surubi", true);
		local time = 50;
		ISTimedActionQueue.add(AFReleaseFishAction:new(player, targetSquare, time));
	else
		luautils.okModal(getText("Tooltip_TooFar"), true);
	end
end

AFReleaseFishMenu.onReleasePati = function(targetSquare, player)
	if luautils.walkAdj(player, targetSquare) then
		ISWorldObjectContextMenu.equip(player, player:getPrimaryHandItem(), "Pati", true);
		local time = 50;
		ISTimedActionQueue.add(AFReleaseFishAction:new(player, targetSquare, time));
	else
		luautils.okModal(getText("Tooltip_TooFar"), true);
	end
end

AFReleaseFishMenu.onReleaseAnguila = function(targetSquare, player)
	if luautils.walkAdj(player, targetSquare) then
		ISWorldObjectContextMenu.equip(player, player:getPrimaryHandItem(), "Anguila", true);
		local time = 50;
		ISTimedActionQueue.add(AFReleaseFishAction:new(player, targetSquare, time));
	else
		luautils.okModal(getText("Tooltip_TooFar"), true);
	end
end

AFReleaseFishMenu.onReleaseWTurtle = function(targetSquare, player)
	if luautils.walkAdj(player, targetSquare) then
		ISWorldObjectContextMenu.equip(player, player:getPrimaryHandItem(), "Waterturtle", true);
		local time = 50;
		ISTimedActionQueue.add(AFReleaseFishAction:new(player, targetSquare, time));
	else
		luautils.okModal(getText("Tooltip_TooFar"), true);
	end
end

AFReleaseFishMenu.onReleaseRay = function(targetSquare, player)
	if luautils.walkAdj(player, targetSquare) then
		ISWorldObjectContextMenu.equip(player, player:getPrimaryHandItem(), "Ray", true);
		local time = 50;
		ISTimedActionQueue.add(AFReleaseFishAction:new(player, targetSquare, time));
	else
		luautils.okModal(getText("Tooltip_TooFar"), true);
	end
end

AFReleaseFishMenu.onReleaseCatfish = function(targetSquare, player)
	if luautils.walkAdj(player, targetSquare) then
		ISWorldObjectContextMenu.equip(player, player:getPrimaryHandItem(), "Catfish", true);
		local time = 50;
		ISTimedActionQueue.add(AFReleaseFishAction:new(player, targetSquare, time));
	else
		luautils.okModal(getText("Tooltip_TooFar"), true);
	end
end

AFReleaseFishMenu.onReleaseBass = function(targetSquare, player)
	if luautils.walkAdj(player, targetSquare) then
		ISWorldObjectContextMenu.equip(player, player:getPrimaryHandItem(), "Bass", true);
		local time = 50;
		ISTimedActionQueue.add(AFReleaseFishAction:new(player, targetSquare, time));
	else
		luautils.okModal(getText("Tooltip_TooFar"), true);
	end
end

AFReleaseFishMenu.onReleasePerch = function(targetSquare, player)
	if luautils.walkAdj(player, targetSquare) then
		ISWorldObjectContextMenu.equip(player, player:getPrimaryHandItem(), "Perch", true);
		local time = 50;
		ISTimedActionQueue.add(AFReleaseFishAction:new(player, targetSquare, time));
	else
		luautils.okModal(getText("Tooltip_TooFar"), true);
	end
end

AFReleaseFishMenu.onReleaseCrappie = function(targetSquare, player)
	if luautils.walkAdj(player, targetSquare) then
		ISWorldObjectContextMenu.equip(player, player:getPrimaryHandItem(), "Crappie", true);
		local time = 50;
		ISTimedActionQueue.add(AFReleaseFishAction:new(player, targetSquare, time));
	else
		luautils.okModal(getText("Tooltip_TooFar"), true);
	end
end

AFReleaseFishMenu.onReleasePanfish = function(targetSquare, player)
	if luautils.walkAdj(player, targetSquare) then
		ISWorldObjectContextMenu.equip(player, player:getPrimaryHandItem(), "Panfish", true);
		local time = 50;
		ISTimedActionQueue.add(AFReleaseFishAction:new(player, targetSquare, time));
	else
		luautils.okModal(getText("Tooltip_TooFar"), true);
	end
end

AFReleaseFishMenu.onReleasePike = function(_releaseSourceSquare, player)
	if luautils.walkAdj(player, _releaseSourceSquare) then
		ISWorldObjectContextMenu.equip(player, player:getPrimaryHandItem(), "Pike", true);
		local time = 50;
		ISTimedActionQueue.add(AFReleaseFishAction:new(player, _releaseSourceSquare, time));
	else
		luautils.okModal(getText("Tooltip_TooFar"), true);
	end
end

AFReleaseFishMenu.onReleaseTrout = function(targetSquare, player)
	if luautils.walkAdj(player, targetSquare) then
		ISWorldObjectContextMenu.equip(player, player:getPrimaryHandItem(), "Trout", true);
		local time = 50;
		ISTimedActionQueue.add(AFReleaseFishAction:new(player, targetSquare, time));
	else
		luautils.okModal(getText("Tooltip_TooFar"), true);
	end
end

AFReleaseFishMenu.onReleaseBaitfish = function(targetSquare, player)
	if luautils.walkAdj(player, targetSquare) then
		ISWorldObjectContextMenu.equip(player, player:getPrimaryHandItem(), "BaitFish", true);
		local time = 50;
		ISTimedActionQueue.add(AFReleaseFishAction:new(player, targetSquare, time));
	else
		luautils.okModal(getText("Tooltip_TooFar"), true);
	end
end

AFReleaseFishMenu.onReleaseArowana = function(targetSquare, player)
	if luautils.walkAdj(player, targetSquare) then
		ISWorldObjectContextMenu.equip(player, player:getPrimaryHandItem(), "Arowana", true);
		local time = 50;
		ISTimedActionQueue.add(AFReleaseFishAction:new(player, targetSquare, time));
	else
		luautils.okModal(getText("Tooltip_TooFar"), true);
	end
end

Events.OnFillWorldObjectContextMenu.Add(AFReleaseFishMenu.ReleaseMenu);
