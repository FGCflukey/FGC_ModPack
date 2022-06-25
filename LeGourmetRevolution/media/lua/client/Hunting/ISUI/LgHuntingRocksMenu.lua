LGHuntingRocksMenu = {};
LGHuntingRocksMenu.img = {};
LGHuntingRocksMenu.fetchSquares = {}
LGHuntingRocksMenu.DeerCaller = {t=0,v=1};

local function predicateNotBroken(item)
	return not item:isBroken()
end

LGHuntingRocksMenu.clearFetch = function()
	--scavengeZone = nil;
	htree = nil;
	htree2 = nil;
	diana = nil;
	capture = nil;
	capture2 = nil;
	data = nil;
	callzone = nil;
	sqzone = nil;
	LGHuntingRocksMenu.fetchSquares = {}
end

LGHuntingRocksMenu.fetch = function(v, player, doSquare)
    -- check for scavenging
	local scavengeZone = nil;
    if v:getSquare() and v:getSquare():getZ() == 0 then
        local zone = v:getSquare():getChunk():getScavengeZone()
        if zone and (zone:getType() == "Forest" or zone:getType() == "DeepForest") then
            scavengeZone = zone;
			callzone = zone;
			sqzone = v;
        end
    end
	if instanceof(v, "IsoTree") and v:getSize() > 2 and scavengeZone ~= nil then--v:getSquare():getZone() and
	  --(v:getSquare():getZone():getType() == "Forest" or v:getSquare():getZone():getType() == "DeepForest") then
		htree = v
	end
	if instanceof(v, "IsoTree") and v:getSize() > 2 and scavengeZone ~= nil then --v:getSquare():getZone() and
	  --(v:getSquare():getZone():getType() == "Forest" or v:getSquare():getZone():getType() == "DeepForest") then
		htree2 = v
	end
	if instanceof(v, "IsoObject") and v:getSprite() and v:getSprite():getProperties() and ( v:getSprite():getProperties():Val("GroupName") == "Shooting" and v:getSprite():getProperties():Val("CustomName") == "Target") then
		diana = v
	end
	LGHuntingRocksMenu.fetchSquares[v:getSquare()] = true
end

LGHuntingRocksMenu.initContextMenu = function(player, context, worldobjects)

	local playerObj = getSpecificPlayer(player);
	local inventory = playerObj:getInventory();

	LGHuntingRocksMenu.clearFetch()
    for i,v in ipairs(worldobjects) do
		LGHuntingRocksMenu.fetch(v, player, true);
    end
	
	local DeerCall = inventory:containsTypeRecurse("DeerCall");
	local binocular = inventory:getFirstTypeEvalRecurse("LgBinoculars", predicateNotBroken)--inventory:containsTypeRecurse("LgBinoculars");
	local slingshot = inventory:containsTypeRecurse("Slingshot") or inventory:containsTypeRecurse("Slingshot2");
	local rock =  inventory:containsTypeRecurse("SmallStone");
	if DeerCall and sqzone ~= nil then
		Deercall = inventory:getFirstTypeRecurse("DeerCall");
		local zone = ISScavengeAction.getScavengingZone(sqzone:getSquare():getX(), sqzone:getSquare():getY());
		if not zone then
			--nothing
		else
			if zone:getName() == "0" then
				callzone = nil;
			end
		end
		if callzone ~= nil then
			local CallDeerOption = context:addOption(getText("ContextMenu_CallDeer"), sqzone, LGHuntingRocksMenu.onCallDeer, player, DeerCall);
		end
	end
	if htree or htree2 then
		local clickedSquare = nil;
		local zonenumber = 0;
		if htree then
			clickedSquare = htree;
		elseif htree2 then
			clickedSquare = htree2;
		end
		local text = "";
		local zone = ISScavengeAction.getScavengingZone(clickedSquare:getX(), clickedSquare:getY());
		if not zone then
			text = "(100" .. getText("ContextMenu_FullPercent") .. ")"
			zonenumber = 100
		else
			LGHuntingRocksMenu.updatezone(zone)
			if zone:getName() == "0" then
				text = "(" .. getText("ContextMenu_Empty") .. ")";
				zonenumber = 0;
			else
				text = "(" .. math.floor((tonumber(zone:getName()) / tonumber(zone:getOriginalName())) * 100) .. getText("ContextMenu_FullPercent") .. ")";
				zonenumber = math.floor((tonumber(zone:getName()) / tonumber(zone:getOriginalName())) * 100);
			end
		end
		--context:addOption(getText("ContextMenu_Forage") .. " " .. text, nil, ISWorldObjectContextMenu.onScavenge, player, scavengeZone, clickedSquare);
		local Item = playerObj:getPrimaryHandItem();
		if htree and htree:getSquare():DistToProper(playerObj:getSquare()) > 5 then
			if binocular then
				capture = LGHuntingRocksMenu.getcapturedata(zonenumber, playerObj);
				local exploreoption = context:addOption(getText("ContextMenu_ExploreTree")  .. " " .. text, htree, LGHuntingRocksMenu.onHuntTree, player, capture, 1, nil);
				local tooltipexplore = LGHuntingRocksMenu.Tooltip(exploreoption)
				tooltipexplore:setName(getText("ContextMenu_ExploreTree"));
				tooltipexplore:setTexture("media/textures/Item_LgBinoculars.png");
				tooltipexplore.description  =  tooltipexplore.description .. " <RGB:1,1,1> " .. getText("ContextMenu_ExploreTreeTT") .. " <LINE> ";
			elseif htree and slingshot and rock and (not binocular) then
				capture = LGHuntingRocksMenu.getcapturedata(zonenumber, playerObj);
				local trockoption = context:addOption(getText("ContextMenu_TrowRock"), htree, LGHuntingRocksMenu.onHuntTree, player, capture, 1, nil);
				local tooltiptrock = LGHuntingRocksMenu.Tooltip(trockoption);
				tooltiptrock:setName(getText("ContextMenu_TrowRock"));
				if inventory:contains("Slingshot2") then
					tooltiptrock.description = tooltiptrock.description .. " <RGB:1,1,1> " .. getText("ContextMenu_TrowRockTT2") .. " <LINE> ";
					tooltiptrock:setTexture("media/textures/Item_Slingshot2.png");
				else
					tooltiptrock.description = tooltiptrock.description .. " <RGB:1,1,1> " .. getText("ContextMenu_TrowRockTT") .. " <LINE> ";
					tooltiptrock:setTexture("media/textures/Item_Gomera1.png");
				end
			end
		end
		if htree2 and htree2:getSquare():DistToProper(playerObj:getSquare()) > 8 and (instanceof(Item, "HandWeapon") and Item:getCondition() > 0) and Item:getScope() then
			if (Item:getType() == "VarmintRifle" or Item:getType() == "HuntingRifle") then
				local scope = Item:getScope();
				if scope:getType() == "x4Scope" or scope:getType() == "x8Scope" or scope:getType() == "x20Scope" or scope:getType() == "x40Scope" or scope:getType() == "StealthTacticalScope" or scope:getType() == "StealthTacticalScope2" then
					playerObj:faceLocation(htree2:getX(), htree2:getY());
					capture2 = LGHuntingRocksMenu.getcapturedata2();
					local searchoption = context:addOption(getText("ContextMenu_HuntwithRifle") .. " " .. text, htree2, LGHuntingRocksMenu.onHuntTree, player, capture2, 2, Item);
					local tooltipexplore = LGHuntingRocksMenu.Tooltip(searchoption);
					tooltipexplore:setName(getText("ContextMenu_HuntwithRifle"));
					if zonenumber < 100 then
						searchoption.notAvailable = true;
						tooltipexplore.description = tooltipexplore.description .. " <RGB:1,1,1> " .. getText("ContextMenu_HuntwithRifleTT") .. " <LINE> <LINE> <RGB:1,0,0> ".. getText("ContextMenu_CantHuntwithRifleTT");
					else
						tooltipexplore.description = tooltipexplore.description .. " <RGB:1,1,1> " .. getText("ContextMenu_HuntwithRifleTT") .. " <LINE> ";
					end
					tooltipexplore:setTexture("media/ui/HLogo/HuntingLogo.png");
				end
			end
		end
	end
	if diana then
		local pnumber = LGHuntingRocksMenu.doplayerModData(playerObj)
		local Item = playerObj:getPrimaryHandItem();
		if diana and diana:getSquare():DistToProper(playerObj:getSquare()) > 5 then
			local extratxt = LGHuntingRocksMenu.doExtratxt(playerObj)
			local dianaoption = context:addOption(getText("ContextMenu_PracticeHunting"), diana, LGHuntingRocksMenu.onHuntPractice, player, "Diana", 1, nil);
			local tooltipdiana = LGHuntingRocksMenu.Tooltip(dianaoption);
			tooltipdiana:setName(getText("ContextMenu_PracticeHunting"));
			tooltipdiana:setTexture("media/ui/HLogo/HuntingPractice.png");
			tooltipdiana.description = tooltipdiana.description .. " <RGB:1,1,1> " .. getText("ContextMenu_PracticeHuntingTT") .. " <LINE> <LINE> " .. extratxt;
			if not slingshot or not rock then
				tooltipdiana.description = " <RGB:1,1,1> " .. getText("ContextMenu_PracticeHuntingTT") .. " <LINE> <LINE> ".. extratxt;
				dianaoption.notAvailable = true;
			end
		end
	end
end

LGHuntingRocksMenu.doplayerModData = function(playerObj)
	local PlayerData = playerObj:getModData();
	local boost = playerObj:getXp():getPerkBoost(Perks.LGRHunting);
	local pnumber = 0;
	if boost >= 3 then return end
	if boost == 0 then
		pnumber = 25;
	elseif boost == 1 then
		pnumber = 50;
	elseif boost == 2 then
		pnumber = 100;
	end
	if not PlayerData.Practice then
		PlayerData.Practice = pnumber;
	end
	return tostring(PlayerData.Practice)
end

LGHuntingRocksMenu.doExtratxt = function(playerObj)
	local pnumber = playerObj:getXp():getPerkBoost(Perks.LGRHunting);
    local percentage = nil;
    if pnumber == 1 then
        percentage = "75%";
    elseif pnumber == 2 then
        percentage = "100%";
    elseif pnumber == 3 then
        percentage = "125%";
    end
	if percentage ~= nil and pnumber < 3 then
		return getText("Tooltip_ActualBoostLevel") .. getText("IGUI_XP_tooltipxpboost", percentage) .. " <LINE> " .. getText("Tooltip_HitsForNextLevel") .. tostring(playerObj:getModData().Practice);
	else
		return "";
	end
end

LGHuntingRocksMenu.Tooltip = function(option)
	local _tooltip = ISToolTip:new();
	_tooltip:initialise();
	_tooltip:setVisible(false);
	option.toolTip = _tooltip;
	
	return _tooltip;
end

LGHuntingRocksMenu.updatezone = function(zone)
	local plantLeft = tonumber(zone:getName());
	local scavengeZoneIncrease = 0;
	if SandboxVars.NatureAbundance == 1 then -- very poor
		scavengeZoneIncrease = -5;
	elseif SandboxVars.NatureAbundance == 2 then -- poor
		scavengeZoneIncrease = -2;
	elseif SandboxVars.NatureAbundance == 4 then -- abundant
		scavengeZoneIncrease = 2;
	elseif SandboxVars.NatureAbundance == 5 then -- very abundant
		scavengeZoneIncrease = 5;
	end
	local scavengeZoneNumber = ZombRand(5,15) + scavengeZoneIncrease;
	if scavengeZoneNumber <= 0 then
		scavengeZoneNumber = 1;
	end
	if getGametimeTimestamp() - zone:getLastActionTimestamp() > 50000 then
		zone:setName(scavengeZoneNumber .. "");
		zone:setOriginalName(scavengeZoneNumber .. "");
	end
end

LGHuntingRocksMenu.onCallDeer = function(clickedsq, player, called)
	local PlayerObj = getSpecificPlayer(player)
	local item = PlayerObj:getInventory():getFirstTypeRecurse("DeerCall");
	-- Chequear si es necesario moverlo a nuestro inventario
	if luautils.haveToBeTransfered(PlayerObj, item, true) then
		ISTimedActionQueue.add(ISInventoryTransferAction:new(PlayerObj, item, item:getContainer(), PlayerObj:getInventory()))
	end
	if not item:isEquipped() then	
		ISTimedActionQueue.add(ISEquipWeaponAction:new(PlayerObj, item, 50, true, false))
	end
	
	ISTimedActionQueue.add(CallDeerAction:new(PlayerObj, item, clickedsq, nil));
end
LGHuntingRocksMenu.getzonenumber = function(obj)
	local zone = ISScavengeAction.getScavengingZone(obj:getX(), obj:getY());
	local zonenumber = 0;
	if not zone then
		zonenumber = 100
	else
		if zone:getName() == "0" then
			zonenumber = 0;
		else
			zonenumber = math.floor((tonumber(zone:getName()) / tonumber(zone:getOriginalName())) * 100);
		end
	end
	return zonenumber
end

LGHuntingRocksMenu.getcapturedata = function(zonenumber, playerObj)
	local capture;
	if zonenumber and zonenumber > 0 then
		--local playerObj = getPlayer();
		local totalpercent = 5;
		local variable = 0;
		local perklvl = playerObj:getPerkLevel(Perks.LGRHunting);
		local winter = nil;
		if perklvl > 0 then
			variable = perklvl;
			totalpercent = totalpercent + (variable *2);
		end
		if playerObj:HasTrait("ShortSighted") then
			totalpercent = totalpercent - 10;
		elseif playerObj:HasTrait("EagleEyed") then
			totalpercent = totalpercent + 10;
		end
		if playerObj:HasTrait("Lucky") then
			totalpercent = totalpercent + ZombRand(11);
		elseif playerObj:HasTrait("Unlucky") then
			totalpercent = totalpercent - ZombRand(11);
		else
			if ZombRand(2) == 0 then
				totalpercent = totalpercent + ZombRand(6);
			else
				totalpercent = totalpercent - ZombRand(6);
			end
		end
		local c = getClimateManager();
		local PInt = c:getPrecipitationIntensity();
		local fog = c:getFogIntensity();
		if RainManager.isRaining() then
			if c:getPrecipitationIsSnow() then
				totalpercent = totalpercent - 10;
			elseif c:getWeatherPeriod():isRunning() then
				totalpercent = totalpercent - ZombRand(5,11);
			elseif PInt>0.9 then
				totalpercent = totalpercent - 5;
			elseif PInt>0.8 then
				totalpercent = totalpercent - 5;
			elseif PInt>0.6 then
				totalpercent = totalpercent - 4;
			elseif PInt>0.4 then
				totalpercent = totalpercent - 3;
			elseif PInt>0.2 then
				totalpercent = totalpercent - 2;
			elseif PInt>0 then
				totalpercent = totalpercent - 1;
			end
		else
		end
		if fog>0.65 then
			totalpercent = totalpercent - 5;
		elseif fog>0.5 then
			totalpercent = totalpercent - 4;
		elseif fog>0.3 then
			totalpercent = totalpercent - 3;
		elseif fog>0.1 then
			totalpercent = totalpercent - 1;
		end

		-- No podran encontrarse especies habitualmente entre los meses de noviembre y febrero.
		if (getGameTime():getMonth() + 1) >= 11 or (getGameTime():getMonth() + 1) <= 2 then
			totalpercent = totalpercent - ZombRand(25,50);
			winter = true;
		end

		local pants = playerObj:getWornItem("Pants");
		local fulltop = playerObj:getWornItem("FullTop");
		local GhilliePantsFound = false;
		local GhillieFullTopFound = false;
		if pants and fulltop and pants:getClothingItem() and fulltop:getClothingItem() then
			if pants:getClothingItemName() == "Ghillie_Trousers" then
				GhilliePantsFound = true;
			end
			if fulltop:getClothingItemName() == "Ghillie_Top" then
				GhillieFullTopFound = true;
			end
		end
		if GhilliePantsFound and GhillieFullTopFound then
			totalpercent = totalpercent * 1.2;
		end

		if totalpercent <= 0 then
			totalpercent = 2;
		end
		if totalpercent >= 100 then
			totalpercent = 100;
		end
		if ZombRand(1, 101) <= totalpercent then
			local choose = ZombRand(1, 101);
			if winter ~= nil then
				--Temporada Invierno
				--50%cuervo
				--30%panal
				--20%zombie
				if choose >= 80 then
					capture = "Base.Bag_DuffelBag";
				elseif choose >= 50 then
					capture = "Base.BeeNest";
				elseif choose >= 1 then
					capture = "Base.DeadCrow";
				else
					capture = "nothing";
				end	
			else
				--Temporada Normal
				--24%cuervo
				--15%canario
				--10%rata
				--10%Ardilla
				--10%pajaro
				--10%panal
				--5%gallina
				--5%Nido de ave
				--1%zombie
				if choose == 100 then
					capture = "Base.Bag_DuffelBag";
				elseif choose >= 95 then
					capture = "Base.ChickenDead";
				elseif choose >= 75 then
					capture = "Base.BeeNest";
				elseif choose >= 65 then
					capture = "Base.DeadBird";
				elseif choose >= 55 then
					capture = "Base.DeadSquirrel";
				elseif choose >= 45 then
					capture = "Base.DeadRat";
				elseif choose >= 30 then
					capture = "Base.DeadCanary";
				elseif choose >= 25 then
					capture = "Base.BirdNest";
				elseif choose >= 1 then
					capture = "Base.DeadCrow";
				else
					capture = "nothing";
				end	
			end
		else
			capture = "nothing";
		end
	elseif zonenumber < 1 then
		capture = "nothing";
	end

	--capture = "Base.Bag_DuffelBag"; --*Borrame

	return capture;
end

LGHuntingRocksMenu.getcapturetable = function(capture)
	local data;
	if capture == "Base.Bag_DuffelBag" then
		data = "Zombie";
	elseif capture == "Base.ChickenDead" then
		data = "Chicken";
	elseif capture == "Base.BeeNest" then
		data = "Bee";
	elseif capture == "Base.DeadBird" then
		data = "Bird";
	elseif capture == "Base.DeadSquirrel" then
		data = "Squirrel";
	elseif capture == "Base.DeadRat" then
		data = "Rat";
	elseif capture == "Base.DeadCanary" then
		data = "Canary";
	elseif capture == "Base.BirdNest" then
		data = "BNest";
	elseif capture == "Base.DeadCrow" then
		data = "Crow";
	elseif capture == "nothing" then
		data = "Nothing";
	else
		data = "Nothing";
	end

	return data;
end

LGHuntingRocksMenu.getscopetable = function(capture2)
	local data;
	if capture2 == "Base.DeadBison" then
		data = "Bison";
	elseif capture2 == "Base.DeadPork" then
		data = "Pork";
	elseif capture2 == "Base.DeadMoose" then
		data = "Moose";
	elseif capture2 == "Base.DeadDeer" then
		data = "Deer";
	elseif capture2 == "Base.DeadCow" then
		data = "Cow";
	elseif capture2 == "Base.DeadBear" then
		data = "Bear";
	elseif capture2 == "Base.DeadSheep" then
		data = "Sheep";
	elseif capture2 == "nothing" then
		data = "Empty";
	else
		data = "Empty";
	end
	return data;
end

LGHuntingRocksMenu.getcapturedata2 = function()
	local capture2;
	local playerObj = getPlayer();
	local totalpercent = 5;
	local variable = 0;
	local perklvl = playerObj:getPerkLevel(Perks.LGRHunting);
	local Primary = playerObj:getPrimaryHandItem();
	local winter = nil;
	if perklvl > 0 then
		variable = perklvl;
		totalpercent = totalpercent + variable;
	end
	if (instanceof(Primary, "HandWeapon") and Primary:getCondition() > 0) then 
		if Primary:getType() == "VarmintRifle" or Primary:getType() == "HuntingRifle" then
			if Primary:getScope() ~= nil then
				local Scope = Primary:getScope();
				if Scope:getType() == "x4Scope" then
					totalpercent = totalpercent + 2;
				elseif Scope:getType() == "x8Scope" then
					totalpercent = totalpercent + 4;
				elseif Scope:getType() == "x20Scope" then
					totalpercent = totalpercent + 5;
				elseif Scope:getType() == "x40Scope" then
					totalpercent = totalpercent + 6;
				elseif Scope:getType() == "StealthTacticalScope" then
					totalpercent = totalpercent + 7;
				elseif Scope:getType() == "StealthTacticalScope2" then
					totalpercent = totalpercent + 8;
				end
			end
		end
	end
	if playerObj:HasTrait("ShortSighted") then
		totalpercent = totalpercent - 10;
	elseif playerObj:HasTrait("EagleEyed") then
		totalpercent = totalpercent + 10;
	end
	if playerObj:HasTrait("Lucky") then
		totalpercent = totalpercent + ZombRand(11);
	elseif playerObj:HasTrait("Unlucky") then
		totalpercent = totalpercent - ZombRand(11);
	else
		if ZombRand(2) == 0 then
			totalpercent = totalpercent + ZombRand(6);
		else
			totalpercent = totalpercent - ZombRand(6);
		end
	end
	
	local c = getClimateManager();
	local PInt = c:getPrecipitationIntensity();
	local fog = c:getFogIntensity();
	if RainManager.isRaining() then
		if c:getPrecipitationIsSnow() then
			totalpercent = totalpercent - 10;
		elseif c:getWeatherPeriod():isRunning() then
			totalpercent = totalpercent - ZombRand(5,11);
		elseif PInt>0.9 then
			totalpercent = totalpercent - 5;
		elseif PInt>0.8 then
			totalpercent = totalpercent - 5;
		elseif PInt>0.6 then
			totalpercent = totalpercent - 4;
		elseif PInt>0.4 then
			totalpercent = totalpercent - 3;
		elseif PInt>0.2 then
			totalpercent = totalpercent - 2;
		elseif PInt>0 then
			totalpercent = totalpercent - 1;
		end
	else
	end
	if fog>0.65 then
		totalpercent = totalpercent - 5;
	elseif fog>0.5 then
		totalpercent = totalpercent - 4;
	elseif fog>0.3 then
		totalpercent = totalpercent - 3;
	elseif fog>0.1 then
		totalpercent = totalpercent - 1;
	end

	-- No podran encontrarse especies habitualmente entre los meses de noviembre y febrero.
	if (getGameTime():getMonth() + 1) >= 11 or (getGameTime():getMonth() + 1) <= 2 then
		totalpercent = totalpercent - ZombRand(38,50); --Reducción random de porcentaje durante los meses de noviembre y febrero
		winter = true;
	end
	
	local pants = playerObj:getWornItem("Pants");
	local fulltop = playerObj:getWornItem("FullTop");
	local GhilliePantsFound = false;
	local GhillieFullTopFound = false;
	if pants and fulltop and pants:getClothingItem() and fulltop:getClothingItem() then
		if pants:getClothingItemName() == "Ghillie_Trousers" then
			GhilliePantsFound = true;
			--playerObj:Say("Ghillie Trousers Found");
		end
		if fulltop:getClothingItemName() == "Ghillie_Top" then
			GhillieFullTopFound = true;
			--playerObj:Say("Ghillie Top Found");
		end
	end
	if GhilliePantsFound and GhillieFullTopFound then
		totalpercent = totalpercent * 1.2;
	end
	if totalpercent <= 0 then
		totalpercent = 2; --2%de probabilidad de hallar animales en el caso de que el porcentaje de menor o igual a 0.
	end
	if totalpercent >= 100 then
		totalpercent = 100;
	end

	--totalpercent = 100; --*Borrame

	if ZombRand(1, 101) <= totalpercent then
		local choose = ZombRand(1, 101);
		local traitval = 1
		if playerObj:HasTrait("HunterExpert") then
			traitval = 1.5
		end
		if winter ~= nil then
			--Temporada de Invierno:
			--5%Bison
			--10%Jabalí
			--25%Alce
			if choose <= (5 * traitval) then
				capture2 = "Base.DeadBison";
			elseif choose <= (15 * traitval) then
				capture2 = "Base.DeadPork";
			elseif choose <= (40 * traitval) then
				capture2 = "Base.DeadMoose";
			else
				capture2 = "nothing";
			end
		else
			--Temporada Normal:
			--5%Ciervo
			--5%Oveja
			--5%Jabalí
			--5%Vaca
			--30%Oso
			--50% nada
			if choose <= (5 *LGHuntingRocksMenu.DeerCaller.v * traitval) then
				capture2 = "Base.DeadDeer";
			elseif choose <= (10 * traitval) then
				capture2 = "Base.DeadSheep";
			elseif choose <= (15 * traitval) then
				capture2 = "Base.DeadPork";
			elseif choose <= (20 * traitval) then
				capture2 = "Base.DeadCow";
			elseif choose <= (50 * traitval) then
				capture2 = "Base.DeadBear";
			else
				capture2 = "nothing";
			end		
		end
	else
		capture2 = "nothing";
	end
	--capture2 = "Base.DeadSheep"; --*Borrame
	--capture2 = "Base.DeadMoose"; --*Borrame
	return capture2;
end

LGHuntingRocksMenu.Exploreandshoot = function(htree2, player, capture2)
	local playerObj = getSpecificPlayer(player);
	if htree2:getSquare():DistToProper(playerObj:getSquare()) <= 8 then
		playerObj:Say(getText("Tooltip_AnimalGone"));
		return;
	end
	local image = nil;
	
	local currentHour = math.floor(math.floor(GameTime:getInstance():getTimeOfDay() * 3600) / 3600);
	local day = false;
	if currentHour >= 4 and currentHour <= 23 then
		day = true;
	end
	--playerObj:SetVariable("Firearm","strike");
	-- Seteo de imagen segun tablas----------------------------------
	local data = LGHuntingRocksMenu.getscopetable(capture2);
	local datatable = LGHT.Firearm[data];
	if day == true then
		image = datatable.day[ZombRand(1, #datatable.day +1)];
	else
		image = datatable.night[ZombRand(1, #datatable.night +1)];
	end
	------------------------------------------------------------------
	--if capture2 ~= "nothing" then
	--	if playerObj:getPerkLevel(Perks.PlantScavenging) < 10 then
	--		local oldXp = playerObj:getXp():getXP(Perks.PlantScavenging);
	--		playerObj:getXp():AddXP(Perks.PlantScavenging, 3);
	--		local xp = playerObj:getXp():getXP(Perks.PlantScavenging) - oldXp;
	--		if day == true then
	--			playerObj:setHaloNote(getText("IGUI_perks_Foraging").."+"..tonumber(string.format("%." .. (2 or 0) .. "f", xp)), 0,255,0,300);
	--		end
	--	end
	--end
	

	local centered = true;
	local posX;
	local posY;
	local width = 400;
	local height = 300;
	local core = getCore();
	if centered ~= nil then
		posX = core:getScreenWidth() * 0.5 - width * 0.5;
		posY = core:getScreenHeight() * 0.5 - height * 0.5;
	end
	if image ~= nil then
		image = "<H1> " .. image .. " <LINE> <H1>"
	end
	image = image .. getText("Tooltip_Shootwithrifle");
	playerObj:faceLocation(htree2:getX(), htree2:getY());
	local modal = ISModalRichText2:new(posX, posY, width, height, image, true, nil, LGHuntingRocksMenu.onYesButtonClick2, player, htree2, capture2);
	modal:initialise();
	modal:addToUIManager();

	if capture2 == "Base.DeadBear" or capture2 == "Base.DeadPork" or capture2 == "Base.DeadBison" or capture2 == "Base.DeadMoose" then
		--getSoundManager():PlayWorldSound("ZombieSurprisedPlayer", htree:getSquare(), 0, 5, 1, true);
		playerObj:playSound("ZombieSurprisedPlayer");
		if not playerObj:HasTrait("Desensitized") then
			local panicvar = 35;
			if playerObj:HasTrait("Brave") then
				panicvar = 10;
			elseif playerObj:HasTrait("Cowardly") then
				panicvar = 50;
			end
			playerObj:getStats():setPanic(playerObj:getStats():getPanic() + panicvar);
		end
	end
end

LGHuntingRocksMenu.onHuntTree = function(tree, playerObj, capture, mode, HandItem)
	local bo = ISHuntTreeCursor:new("", "", playerObj, capture, tree, mode, HandItem)
	local pl = getSpecificPlayer(playerObj);
	getCell():setDrag(bo, pl:getPlayerNum())
end
LGHuntingRocksMenu.onHuntPractice = function(tree, playerObj, capture, mode, HandItem)
	local bo = ISHuntPracticeCursor:new("", "", playerObj, capture, tree, mode, HandItem)
	local pl = getSpecificPlayer(playerObj);
	getCell():setDrag(bo, pl:getPlayerNum())
end
LGHuntingRocksMenu.Equip = function(square, character, capture)
	local playerObj = getSpecificPlayer(character);
	local playerinv = playerObj:getInventory();
	--local binocular = playerinv:containsTypeRecurse("LgBinoculars");
	local binocular = playerinv:getFirstTypeEvalRecurse("LgBinoculars", predicateNotBroken)
	local slingshot = playerinv:containsTypeRecurse("Slingshot") or playerinv:containsTypeRecurse("Slingshot2");
	local rock = playerinv:containsTypeRecurse("SmallStone");
	local bintime = 75 - (playerObj:getPerkLevel(Perks.LGRHunting)*6);
	if binocular and (not slingshot or not rock) then
		local item = binocular;
		ISInventoryPaneContextMenu.transferIfNeeded(playerObj, item)
		if not item:isEquipped() then
			--playerObj:Say("Not Equipped")
			--ISTimedActionQueue.add(SUPEquipWeaponAction:new(playerObj, item, 50, true, true, square, capture));
			ISTimedActionQueue.clear(playerObj);
			ISWorldObjectContextMenu.equip(playerObj, playerObj:getPrimaryHandItem(), binocular, true, false);
			ISTimedActionQueue.add(WatchTreeAction:new(playerObj, item, bintime, square, capture));
			return
		end
		ISTimedActionQueue.clear(playerObj);
		--ISWorldObjectContextMenu.equip(playerObj, playerObj:getPrimaryHandItem(), binocular, true, false);
		ISTimedActionQueue.add(WatchTreeAction:new(playerObj, item, bintime, square, capture));
		return
	elseif slingshot and rock and (not binocular) then
		local item = nil;
		if playerinv:containsTypeRecurse("Slingshot2") then
			item = playerinv:getFirstTypeRecurse("Slingshot2");
			ISInventoryPaneContextMenu.transferIfNeeded(playerObj, item)
			if not item:isEquipped() then
				ISTimedActionQueue.add(ISEquipWeaponAction:new(playerObj, item, 50, true, false));
			end
		else
			item = playerinv:getFirstTypeRecurse("Slingshot");
			ISInventoryPaneContextMenu.transferIfNeeded(playerObj, item)
			if not item:isEquipped() then
				ISTimedActionQueue.add(ISEquipWeaponAction:new(playerObj, item, 50, true, false));
			end
		end
		if playerinv:containsTypeRecurse("SmallStone") then
			item = playerinv:getFirstTypeRecurse("SmallStone");
			ISInventoryPaneContextMenu.transferIfNeeded(playerObj, item)
			if not item:isEquipped() then
				ISTimedActionQueue.add(SUPEquipWeaponAction:new(playerObj, item, 50, false, false, square, capture));
				return
			end
		end
	elseif slingshot and binocular and rock then
		local item = binocular;
		ISInventoryPaneContextMenu.transferIfNeeded(playerObj, item)
		if not item:isEquipped() then
			--ISTimedActionQueue.add(SUPEquipWeaponAction:new(playerObj, item, 50, true, true, square, capture));
			ISTimedActionQueue.clear(playerObj);
			ISWorldObjectContextMenu.equip(playerObj, playerObj:getPrimaryHandItem(), binocular, true, false);
			ISTimedActionQueue.add(WatchTreeAction:new(playerObj, item, bintime, square, capture));
			return
		end
		ISTimedActionQueue.clear(playerObj);
		--ISWorldObjectContextMenu.equip(playerObj, playerObj:getPrimaryHandItem(), binocular, true, false);
		ISTimedActionQueue.add(WatchTreeAction:new(playerObj, item, bintime, square, capture));
		return
	end
	LGHuntingRocksMenu.ExploreandTrowrock(square, character, capture)
end

LGHuntingRocksMenu.EquipB = function(square, character, capture)
	local playerObj = getSpecificPlayer(character);
	local playerinv = playerObj:getInventory();
	local slingshot = playerinv:containsTypeRecurse("Slingshot") or playerinv:containsTypeRecurse("Slingshot2");
	local rock = playerinv:containsTypeRecurse("SmallStone");
	local bintime = 75 - (playerObj:getPerkLevel(Perks.LGRHunting)*6);
	if slingshot and rock then
		local item = nil;
		if playerinv:containsTypeRecurse("Slingshot2") then
			item = playerinv:getFirstTypeRecurse("Slingshot2");
			ISInventoryPaneContextMenu.transferIfNeeded(playerObj, item)
			if not item:isEquipped() then
				ISTimedActionQueue.add(ISEquipWeaponAction:new(playerObj, item, 50, true, false));
			end
		else
			item = playerinv:getFirstTypeRecurse("Slingshot");
			ISInventoryPaneContextMenu.transferIfNeeded(playerObj, item)
			if not item:isEquipped() then
				ISTimedActionQueue.add(ISEquipWeaponAction:new(playerObj, item, 50, true, false));
			end
		end
		if playerinv:containsTypeRecurse("SmallStone") then
			item = playerinv:getFirstTypeRecurse("SmallStone");
			ISInventoryPaneContextMenu.transferIfNeeded(playerObj, item)
			if not item:isEquipped() then
				ISTimedActionQueue.add(SUPEquipWeaponAction:new(playerObj, item, 50, false, false, square, capture));
				--return
			end
		end
	end
	--LGHuntingRocksMenu.PracticeHunting(square, character, capture)
end

LGHuntingRocksMenu.PracticeHunting = function(diana, player, capture)
	local playerObj = getSpecificPlayer(player);
	local playerinv = playerObj:getInventory();
	if diana:DistToProper(playerObj:getSquare()) <= 5 then
		playerObj:Say(getText("Tooltip_AnimalGoneClose"));
		return;
	end
	local slingshot = playerinv:containsTypeRecurse("Slingshot") or playerinv:containsTypeRecurse("Slingshot2");
	local rock = playerinv:containsTypeRecurse("SmallStone");

	if slingshot and rock then
		playerObj:faceLocation(diana:getX(), diana:getY());
		ISTimedActionQueue.add(LGPracticeHuntingAction:new(playerObj, diana, 50, "Diana"));
	end
end

LGHuntingRocksMenu.ExploreandTrowrock = function(htree, player, capture)
	local playerObj = getSpecificPlayer(player);
	local playerinv = playerObj:getInventory();
	if htree:getSquare():DistToProper(playerObj:getSquare()) <= 5 then
		playerObj:Say(getText("Tooltip_AnimalGoneClose"));
		return;
	end
	local binocular = playerinv:containsTypeRecurse("LgBinoculars");
	local slingshot = playerinv:containsTypeRecurse("Slingshot") or playerinv:containsTypeRecurse("Slingshot2");
	local rock = playerinv:containsTypeRecurse("SmallStone");
	if capture == nil then
		local znumber= LGHuntingRocksMenu.getzonenumber(htree:getSquare())
		LGHuntingRocksMenu.getcapturedata(znumber, playerObj);
	end

	local image = nil;
	
	local currentHour = math.floor(math.floor(GameTime:getInstance():getTimeOfDay() * 3600) / 3600);
	local day = false;
	if currentHour >= 4 and currentHour <= 23 then
		day = true;
	end
	-- Seteo de imagen segun tablas----------------------------------
	local data = LGHuntingRocksMenu.getcapturetable(capture);
	local datatable = LGHT.Slingshot[data];
	if day == true then
		image = datatable.day[ZombRand(1, #datatable.day +1)];
	else
		if playerObj:HasTrait("NightVision") then
			image = datatable.nv[ZombRand(1, #datatable.nv +1)];
		else
			image = datatable.night[ZombRand(1, #datatable.night +1)];
		end
	end
	------------------------------------------------------------------

	--if capture ~= "nothing" then
	--	if playerObj:getPerkLevel(Perks.PlantScavenging) < 10 then
	--		local oldXp = playerObj:getXp():getXP(Perks.PlantScavenging);
	--		playerObj:getXp():AddXP(Perks.PlantScavenging, 3);
	--		local xp = playerObj:getXp():getXP(Perks.PlantScavenging) - oldXp;
	--		if day == true then
	--			playerObj:setHaloNote(getText("IGUI_perks_Foraging").."+"..tonumber(string.format("%." .. (2 or 0) .. "f", xp)), 0,255,0,300);
	--		end
	--	end
	--end
	if binocular and (not slingshot or not rock) then
		playerObj:faceLocation(htree:getX(), htree:getY());
		local centered = true;
		local posX;
		local posY;
		local width = 400;
		local height = 300;
		local core = getCore();
		if centered ~= nil then
			posX = core:getScreenWidth() * 0.5 - width * 0.5;
			posY = core:getScreenHeight() * 0.5 - height * 0.5;
		end
		if image ~= nil then
			image = "<H1> " .. image .. " <LINE> <H1>"
		end
		local modal = ISModalRichText2:new(posX, posY, width, height, image, false, nil, nil, player, htree, capture);

		modal:initialise();
		modal:addToUIManager();
		if capture == "Base.Bag_DuffelBag" then
			--getSoundManager():PlayWorldSound("ZombieSurprisedPlayer", htree:getSquare(), 0, 5, 1, true);
			playerObj:playSound("ZombieSurprisedPlayer");
			if not playerObj:HasTrait("Desensitized") then
				local panicvar = 25;
				if playerObj:HasTrait("Brave") then
					panicvar = 5;
				elseif playerObj:HasTrait("Cowardly") then
					panicvar = 45;
				end
				playerObj:getStats():setPanic(playerObj:getStats():getPanic() + panicvar);
			end
		end
	elseif slingshot and rock and (not binocular) then
		playerObj:faceLocation(htree:getX(), htree:getY());
		ISTimedActionQueue.add(LGHuntingRocksAction:new(playerObj, htree, 50, capture));
	elseif slingshot and binocular and rock then
		playerObj:faceLocation(htree:getX(), htree:getY());
		local item = playerObj:getInventory():getFirstTypeRecurse("LgBinoculars");

		local centered = true;
		local posX;
		local posY;
		local width = 400;
		local height = 300;
		local core = getCore();
		if centered ~= nil then
			posX = core:getScreenWidth() * 0.5 - width * 0.5;
			posY = core:getScreenHeight() * 0.5 - height * 0.5;
		end
		if image ~= nil then
			image = "<H1> " .. image .. " <LINE> <H1>"
		end
		image = image .. getText("Tooltip_Shoot");

		local modal = ISModalRichText2:new(posX, posY, width, height, image, true, nil, LGHuntingRocksMenu.onYesButtonClick, player, htree, capture);
		modal:initialise();
		modal:addToUIManager();
		
		if capture == "Base.Bag_DuffelBag" then
			--getSoundManager():PlayWorldSound("ZombieSurprisedPlayer", htree:getSquare(), 0, 5, 1, true);
			playerObj:playSound("ZombieSurprisedPlayer");
			if not playerObj:HasTrait("Desensitized") then
				local panicvar = 25;
				if playerObj:HasTrait("Brave") then
					panicvar = 5;
				elseif playerObj:HasTrait("Cowardly") then
					panicvar = 45;
				end
				playerObj:getStats():setPanic(playerObj:getStats():getPanic() + panicvar);
			end
		end
	end
end

function LGHuntingRocksMenu:onYesButtonClick(button, htree, capture)
    if button.internal == "YES" then
		local playerObj = getSpecificPlayer(0);
		local playerinv = playerObj:getInventory();
		local binocular = playerinv:containsTypeRecurse("LgBinoculars");
		local slingshot = playerinv:containsTypeRecurse("Slingshot") or playerinv:containsTypeRecurse("Slingshot2");
		local rock = playerinv:containsTypeRecurse("SmallStone");
		
		if not slingshot then return; end
		if not rock then return; end
		if not binocular then return; end
		
		if slingshot and binocular and rock then
			if playerinv:containsTypeRecurse("Slingshot2") then
				local item = playerObj:getInventory():getFirstTypeRecurse("Slingshot2");
				ISInventoryPaneContextMenu.transferIfNeeded(playerObj, item)
				if not item:isEquipped() then
					ISTimedActionQueue.add(ISEquipWeaponAction:new(playerObj, item, 50, true, false));
				end
			else
				local item = playerObj:getInventory():getFirstTypeRecurse("Slingshot");
				ISInventoryPaneContextMenu.transferIfNeeded(playerObj, item)
				if not item:isEquipped() then
					ISTimedActionQueue.add(ISEquipWeaponAction:new(playerObj, item, 50, true, false));
				end
			end
			if rock then
				local item = playerObj:getInventory():getFirstTypeRecurse("SmallStone");
				ISInventoryPaneContextMenu.transferIfNeeded(playerObj, item)
				if not item:isEquipped() then
					ISTimedActionQueue.add(ISEquipWeaponAction:new(playerObj, item, 25, false, false));
				end
			end
			local _capture = capture;
			ISTimedActionQueue.add(LGHuntingRocksAction:new(playerObj, htree, 50, _capture))
		end
    end
end

function LGHuntingRocksMenu:onYesButtonClick2(button, htree2, capture2)
    if button.internal == "YES" then
		local playerObj = getPlayer();
		local _capture2 = capture2;
		ISTimedActionQueue.add(LGHuntingScopeAction:new(playerObj, htree2, 30, _capture2))
    end
end

Events.OnPreFillWorldObjectContextMenu.Add(LGHuntingRocksMenu.initContextMenu);

function LGHuntingRocksMenu:EveryTenMinutes()
	if LGHuntingRocksMenu.DeerCaller.t == 0 then return end
	if LGHuntingRocksMenu.DeerCaller.t > 0 then
		LGHuntingRocksMenu.DeerCaller.t = LGHuntingRocksMenu.DeerCaller.t -1
		if LGHuntingRocksMenu.DeerCaller.t == 0 then 
			if LGHuntingRocksMenu.DeerCaller.v ~= 1 then
				LGHuntingRocksMenu.DeerCaller.v = 1;
			end
			return 
		end
	end
end
local function EveryTenMinutes()
	LGHuntingRocksMenu.EveryTenMinutes()
end

Events.EveryTenMinutes.Add(EveryTenMinutes)