--***********************************************************
--**                    ROBERT JOHNSON                     **
--**       Contextual menu for building when clicking somewhere on the ground       **
--***********************************************************

CTTISBuildMenu = {};
CTTISBuildMenu.woodWorkXp = 0;
CTTISBuildMenu.AmmoMakerMod = 0;
CTTISBuildMenu.LeGourmetEPMod = 0;
CTTISBuildMenu.ZombiesAtWorkMod = 0;
CTTISBuildMenu.TableSawMod = 0;
CTTISBuildMenu.FuelTankMod = 0;
CTTISBuildMenu.LeGourmetBuild = nil;
CTTISBuildMenu.LeGourmetCanBuild = nil;
CTTISBuildMenu.AmmoMakerBuild = nil;
CTTISBuildMenu.AmmoMakerCanBuild = nil;
CTTISBuildMenu.ZombiesAtWorkBuild = nil;
CTTISBuildMenu.ZombiesAtWorkCanBuild = nil;
CTTISBuildMenu.TableSawBuild = nil;
CTTISBuildMenu.TableSawCanBuild = nil;
CTTISBuildMenu.FuelTankBuild = nil;
CTTISBuildMenu.FuelTankCanBuild = nil;

local function predicateNotBroken(item)
	return not item:isBroken()
end

CTTISBuildMenu.doBuildMenu = function(player, context, worldobjects, test)

	if test and ISWorldObjectContextMenu.Test then return true end
	CTTISBuildMenu.LeGourmetBuild = nil;
	CTTISBuildMenu.LeGourmetCanBuild = nil;
	CTTISBuildMenu.AmmoMakerBuild = nil;
	CTTISBuildMenu.AmmoMakerCanBuild = nil;
	CTTISBuildMenu.ZombiesAtWorkBuild = nil;
	CTTISBuildMenu.ZombiesAtWorkCanBuild = nil;
	CTTISBuildMenu.TableSawBuild = nil;
	CTTISBuildMenu.TableSawCanBuild = nil;
	CTTISBuildMenu.FuelTankBuild = nil;
	CTTISBuildMenu.FuelTankCanBuild = nil;
	CTTISBuildMenu.LeGourmetEPMod = 0;
	CTTISBuildMenu.AmmoMakerMod = 0;
	CTTISBuildMenu.ZombiesAtWorkMod = 0;
	CTTISBuildMenu.TableSawMod = 0;
	CTTISBuildMenu.FuelTankMod = 0;
    if getCore():getGameMode()=="LastStand" then
        return;
    end
	local playerObj = getSpecificPlayer(player)
	if playerObj:getVehicle() then return; end
	local playerInv = playerObj:getInventory()
	CTTISBuildMenu.AmmoMakerMod = 0;
	CTTISBuildMenu.woodWorkXp = playerObj:getPerkLevel(Perks.Woodwork);
	local recipes = playerObj:getKnownRecipes();
	local recipeknown = nil;
	local recipeknown2 = nil;
	local recipeknown3 = nil;
	if recipes:contains("Craft Reloading Table") or ISBuildMenu.cheat then
		recipeknown = true;
	end
	if recipes:contains("Craft Table Saw") or ISBuildMenu.cheat then
		recipeknown2 = true;
	end
	--if recipes:contains("Craft Fuel Tanks") or ISBuildMenu.cheat then
	--	recipeknown3 = true;
	--end

	if SWPBaseGameCharacterDetails then
		CTTISBuildMenu.AmmoMakerMod = 1;
		if AMISBuildMenu.haveSomethingtoBuild then
			CTTISBuildMenu.AmmoMakerBuild = true;
		end
	elseif AMBaseGameCharacterDetails then
		CTTISBuildMenu.AmmoMakerMod = 1;
		if AMISBuildMenu.haveSomethingtoBuild then
			CTTISBuildMenu.AmmoMakerBuild = true;
		end
	end
	
	if LGISBuildMenu then
		CTTISBuildMenu.LeGourmetEPMod = 1;
		if LGISBuildMenu.haveSomethingtoBuild then
			CTTISBuildMenu.LeGourmetBuild = true;
		end
	end

	if ZAWISBuildMenu then
		CTTISBuildMenu.ZombiesAtWorkMod = 1;
		if ZAWISBuildMenu.haveAToolToBuildWithWith then
			CTTISBuildMenu.ZombiesAtWorkBuild = true;
		end
	end

	if TableSawBuildMenu then
		CTTISBuildMenu.TableSawMod = 1;
		if TableSawBuildMenu.haveSomethingtoBuild then
			CTTISBuildMenu.TableSawBuild = true;
		end
	end

	if FuelTankBuildMenu then
		CTTISBuildMenu.FuelTankMod = 1;
		if FuelTankBuildMenu.haveSomethingtoBuild then
			CTTISBuildMenu.FuelTankBuild = true;
		end
	end

	local thump = nil;

	local square = nil;

	-- we get the thumpable item (like wall/door/furniture etc.) if exist on the tile we right clicked
	for i,v in ipairs(worldobjects) do
		square = v:getSquare();
		if instanceof(v, "IsoThumpable") and not v:isDoor() then
			thump = v;
		end
    end
	
	if thump and thump:getSprite():getProperties() and (thump:getSprite():getProperties():Val("GroupName") == "Crafted" and thump:getSprite():getProperties():Val("CustomName") == "Reloading Table") then
		return;
	end
	if thump and thump:getSprite():getProperties() and 
	  (thump:getSprite():getProperties():Val("GroupName") == "Crafted" and 
	  (thump:getSprite():getProperties():Val("CustomName") == "Fuel Tank" 
	  or thump:getSprite():getProperties():Val("CustomName") == "Fuel Tank 2" 
	  or thump:getSprite():getProperties():Val("CustomName") == "Fuel Tank 3" 
	  or thump:getSprite():getProperties():Val("CustomName") == "Fuel Tank 4")) then
		return;
	end
	-- build menu
	-- if we have any thing to build in our inventory
	if CTTISBuildMenu.AmmoMakerMod == 1 or CTTISBuildMenu.LeGourmetEPMod == 1 or CTTISBuildMenu.ZombiesAtWorkMod == 1  or CTTISBuildMenu.TableSawMod == 1 then
		if CTTISBuildMenu.LeGourmetBuild ~= nil then
			CTTISBuildMenu.LeGourmetCanBuild = LGISBuildMenu.haveSomethingtoBuild(player)
			--CTTISBuildMenu.LeGourmetCanBuild = true;
		end
		if CTTISBuildMenu.AmmoMakerBuild ~= nil then
			CTTISBuildMenu.AmmoMakerCanBuild = AMISBuildMenu.haveSomethingtoBuild(player)
		end
		if CTTISBuildMenu.ZombiesAtWorkBuild ~= nil then
			CTTISBuildMenu.ZombiesAtWorkCanBuild = ZAWISBuildMenu.haveAToolToBuildWithWith(player)
		end
		if CTTISBuildMenu.TableSawBuild ~= nil then
			CTTISBuildMenu.TableSawCanBuild = TableSawBuildMenu.haveSomethingtoBuild(player)
		end
		if CTTISBuildMenu.FuelTankBuild ~= nil then
			CTTISBuildMenu.FuelTankCanBuild = true;
		end
		if CTTISBuildMenu.AmmoMakerCanBuild ~= nil or CTTISBuildMenu.LeGourmetCanBuild ~= nil or CTTISBuildMenu.ZombiesAtWorkCanBuild ~= nil or CTTISBuildMenu.TableSawCanBuild ~= nil or CTTISBuildMenu.FuelTankCanBuild ~= nil then
		--if AMISBuildMenu.haveSomethingtoBuild(player) ~= nil or LGISBuildMenu.haveSomethingtoBuild(player) ~= nil then
			if test then return ISWorldObjectContextMenu.setTest() end
			if playerInv:containsTypeEvalRecurse("Hammer", predicateNotBroken) or playerInv:containsTypeEvalRecurse("HammerStone", predicateNotBroken) or playerInv:containsTypeEvalRecurse("BallPeenHammer", predicateNotBroken) or  (playerInv:containsTypeRecurse("BlowTorch") and playerInv:containsTypeRecurse("WeldingMask")) or ISBuildMenu.cheat then
				local buildOption = context:addOption(getText("ContextMenu_Extra_Building"), worldobjects, nil);
				-- create a brand new context menu wich contain our different material (wood, stone etc.) to build
				local subMenu = ISContextMenu:getNew(context);
				-- We create the different option for this new menu (wood, stone etc.)
				-- check if we can build something in wood material

				if CTTISBuildMenu.LeGourmetCanBuild ~= nil then
					if haveSomethingtoBuildTrophy(player) then
						context:addSubMenu(buildOption, subMenu);
				
						LGISBuildMenu.doBuildMenu(player, context, worldobjects, test, square, subMenu)
					end
				end

				if recipeknown ~= nil and CTTISBuildMenu.AmmoMakerCanBuild ~= nil then
					if haveSomethingtoBuildAdvanced(player) then
					-- we add the subMenu to our current option (Build)
						if LGISBuildMenu then
							--nothing
						else
							context:addSubMenu(buildOption, subMenu);
							AMISBuildMenu.doBuildMenu(player, context, worldobjects, test, square, subMenu)
						end
					end
				end

				if CTTISBuildMenu.ZombiesAtWorkCanBuild ~= nil then
					--if ZAWISBuildMenu.buildMaterialsList(player) then
						context:addSubMenu(buildOption, subMenu);
				
						ZAWISBuildMenu.doBuildMenu(player, context, worldobjects, test, square, subMenu)
					--end
				end

				if recipeknown2 ~= nil and CTTISBuildMenu.TableSawCanBuild ~= nil then
					if haveSomethingtoBuildTableSaw(player) then
					-- we add the subMenu to our current option (Build)
						if LGISBuildMenu then
							--nothing
						else
							context:addSubMenu(buildOption, subMenu);
							TableSawBuildMenu.doBuildMenu(player, context, worldobjects, test, square, subMenu)
						end
					end
				end
				--if recipeknown3 ~= nil then
					--if haveSomethingtoBuildAdvanced(player) then
					-- we add the subMenu to our current option (Build)
					if FuelTankBuildMenu then
						if LGISBuildMenu then
							--nothing
						else
							context:addSubMenu(buildOption, subMenu);
							FuelTankBuildMenu.doBuildMenu(player, context, worldobjects, test, square, subMenu)
						end
					end
					--end
				--end
			end
		end
	end
end

Events.OnFillWorldObjectContextMenu.Add(CTTISBuildMenu.doBuildMenu);
