--***********************************************************
--** PseudonymousEd, the Dev
--** Play Modded Arcades 41.50+
--** Context menu for playing modded arcade machines
--***********************************************************

PMAPlayModdedGameMenu = {};

-- Add play option to arcade machine context menus
PMAPlayModdedGameMenu.doBuildMenu = function(player, context, worldobjects)

	-- Default to using Custom Animations	
	local USE_CUSTOM_ANIMATION = true
	
	local thisPlayer = getSpecificPlayer(player);

	-- Default to not using Custom Animations if in Build 41.50
	if getCore():getVersionNumber() == "41.50 - IWBUMS" then
		USE_CUSTOM_ANIMATION = false
	end
	--****************************************
	--* ATTENTION: If you have installed
	--*      the custom animations manually for Build 41.50,
	--*      make sure to uncomment
	--*      (remove -- from the front of)
	--*      local USE_CUSTOM_ANIMATION = true
	--****************************************
	
	-- To enable Custom Animations for Build 41.50,
	-- remove the -- from the following line:
	--local USE_CUSTOM_ANIMATION = true

	local arcadeMachine = nil
	local arcadeGroupName = nil
	local arcadeCustomName = nil
	local arcadeSpriteName = nil

	for _,object in ipairs(worldobjects) do
		local square = object:getSquare()
		if square then
			for i=1,square:getObjects():size() do
				local thisObject = square:getObjects():get(i-1)
				
				if thisObject:getSprite() then

					local properties = thisObject:getSprite():getProperties()

					if properties ~= nil then
						local groupName = nil
						local customName = nil
						
						if properties:Is("GroupName") then
							groupName = properties:Val("GroupName")
							print("PseudoEdPMA: Sprite GroupName: " .. groupName);
						end
						
						if properties:Is("CustomName") then
							customName = properties:Val("CustomName")
							print("PseudoEdPMA: Sprite CustomName: " .. customName);
						end

						local spriteName = thisObject:getSprite():getName()
	--					print("PseudoEdPMA: sprite name = " .. spriteName);
			
						-- For Arcade Machines, Custom Name = "Machine" and the Group Name is more specific 
--						if customName == "Back to the Past Arcade Machine" or
						if customName == "Back 2 The Past" or
--							customName == "Super Plumber Brothers Arcade" or
							customName == "Super Plumber" or
							customName == "Royale with Cheese Arcade" or
							customName == "Machine" or
							groupName == "arcadian" or 
							groupName == "ValleyArcade" then

							print("PseudoEdPMA: Getting ready to play arcade machine " .. customName);

							if not ((SandboxVars.ElecShutModifier > -1 and
									 GameTime:getInstance():getNightsSurvived() < SandboxVars.ElecShutModifier) or
								thisObject:getSquare():haveElectricity()) then
								print("PseudoEdPMA: This object is unpowered");
								return
							end
							arcadeMachine = thisObject
							arcadeGroupName = groupName
							arcadeCustomName = customName
							arcadeSpriteName = spriteName
				
							-- TODO:  Attempt to favor the square right in front of you
							-- thisPlayer:Say("Found " .. arcadeGroupName)
						end
					end
				end
			end
		end
	end
	if not arcadeMachine then return end
	
	local machine = nil;
	local soundFile = nil;
	local contextMenu = nil;
	local actionType = nil;
	local length = 720;

--	if arcadeCustomName == "Back to the Past Arcade Machine" then
	if arcadeCustomName == "Back 2 The Past" then
		soundFile = "PAMGBTTPplay"
		soundEnd = "PAMGBTTPend"
		contextMenu = "ContextMenu_Play_BTTP"
		actionType = "Loot"
		if USE_CUSTOM_ANIMATION then
			actionType = "PlayArcade"
		end
--	elseif arcadeCustomName == "Super Plumber Brothers Arcade" then
	elseif arcadeCustomName == "Super Plumber" then
		soundFile = "PAMGPlumberplay"
		soundEnd = "PAMGPlumberend"
		contextMenu = "ContextMenu_Play_Plumber"
		actionType = "Loot"
		if USE_CUSTOM_ANIMATION then
			actionType = "PlayArcade"
		end
--	elseif arcadeCustomName == "Royale with Cheese Arcade" then
	elseif arcadeSpriteName == "DylansBar01_16" or arcadeSpriteName == "DylansBar01_17" or arcadeSpriteName == "DylanRandomAssetPack3_24" or arcadeSpriteName == "DylanRandomAssetPack3_25" then
		soundFile = "PAMGRoyaleplay"
		soundEnd = "PAMGRoyaleend"
		contextMenu = "ContextMenu_Play_RoyalewCheese"
		actionType = "Loot"
		if USE_CUSTOM_ANIMATION then
			actionType = "PlayArcade"
		end
	elseif arcadeSpriteName == "d_location_arcadian_01_0" then
		soundFile = "PMACubesplay"
		soundEnd = "PAMGArcadianend"
		contextMenu = "ContextMenu_Play_CubeCraft"
		actionType = "Loot"
		length = 912
		if USE_CUSTOM_ANIMATION then
			actionType = "PlayArcadian"
		end
	elseif arcadeSpriteName == "d_location_arcadian_01_1" then
		soundFile = "PMACubesplay"
		soundEnd = "PAMGArcadianend"
		contextMenu = "ContextMenu_Play_JumpShoot"
		actionType = "Loot"
		length = 912
		if USE_CUSTOM_ANIMATION then
			actionType = "PlayArcadian"
		end
	elseif arcadeSpriteName == "d_location_arcadian_01_2" then
		soundFile = "PMACubesplay"
		soundEnd = "PAMGArcadianend"
		contextMenu = "ContextMenu_Play_TestFacility"
		actionType = "Loot"
		length = 912
		if USE_CUSTOM_ANIMATION then
			actionType = "PlayArcadian"
		end
	elseif arcadeSpriteName == "d_location_arcadian_01_3" then
		soundFile = "PMAWabaplay"
		soundEnd = "PMAWabaend"
		contextMenu = "ContextMenu_Play_SpiffoArcade"
		actionType = "Loot"
		if USE_CUSTOM_ANIMATION then
			actionType = "PlayArcadian"
		end
	elseif arcadeSpriteName == "d_location_arcadian_01_8" then
		soundFile = "PAMGArcadianplay"
		soundEnd = "PAMGArcadianend"
		contextMenu = "ContextMenu_Play_Kilmandio"
		actionType = "Loot"
		if USE_CUSTOM_ANIMATION then
			actionType = "PlayArcadian"
		end
	elseif arcadeSpriteName == "d_location_arcadian_01_9" then
		soundFile = "PMACubesplay"
		soundEnd = "PAMGArcadianend"
		contextMenu = "ContextMenu_Play_CubeismII"
		actionType = "Loot"
		length = 912
		if USE_CUSTOM_ANIMATION then
			actionType = "PlayArcadian"
		end
	elseif arcadeSpriteName == "d_location_arcadian_01_10" then
		soundFile = "PMAWabaplay"
		soundEnd = "PMAWabaend"
		contextMenu = "ContextMenu_Play_Wabalabadubudb"
		actionType = "Loot"
		if USE_CUSTOM_ANIMATION then
			actionType = "PlayArcadian"
		end
	elseif arcadeSpriteName == "d_location_arcadian_01_11" then
		soundFile = "PMAWabaplay"
		soundEnd = "PMAWabaend"
		contextMenu = "ContextMenu_Play_Zomboid"
		actionType = "Loot"
		if USE_CUSTOM_ANIMATION then
			actionType = "PlayArcadian"
		end
	elseif arcadeSpriteName == "d_location_arcadian_01_12" then
		soundFile = "PAMpinballplay"
		soundEnd = "PAMpinballend"
		contextMenu = "ContextMenu_Play_ToyDay99_Pinball"
		actionType = "Loot"
		if USE_CUSTOM_ANIMATION then
			actionType = "PlayPinball"
		end
	elseif arcadeSpriteName == "d_location_arcadian_01_16" then
		soundFile = "PAMGArcadianplay"
		soundEnd = "PAMGArcadianend"
		contextMenu = "ContextMenu_Play_Dielord"
		actionType = "Loot"
		if USE_CUSTOM_ANIMATION then
			actionType = "PlayArcadian"
		end
	elseif arcadeSpriteName == "d_location_arcadian_01_17" then
		soundFile = "PAMGArcadianplay"
		soundEnd = "PAMGArcadianend"
		contextMenu = "ContextMenu_Play_StarLord"
		actionType = "Loot"
		if USE_CUSTOM_ANIMATION then
			actionType = "PlayArcadian"
		end
	elseif arcadeSpriteName == "d_location_arcadian_01_18" then
		soundFile = "PMADladrlkvplay"
		soundEnd = "PMADladrlkvend"
		contextMenu = "ContextMenu_Play_DladerlkV"
		actionType = "Loot"
		if USE_CUSTOM_ANIMATION then
			actionType = "PlayArcadian"
		end
	elseif arcadeSpriteName == "d_location_arcadian_01_19" then
		soundFile = "PMADladrlkvplay"
		soundEnd = "PMADladrlkvend"
		contextMenu = "ContextMenu_Play_SecretAgent"
		actionType = "Loot"
		if USE_CUSTOM_ANIMATION then
			actionType = "PlayArcadian"
		end
	elseif arcadeSpriteName == "d_location_arcadian_01_20" then
		soundFile = "PAMpinballplay"
		soundEnd = "PAMpinballend"
		contextMenu = "ContextMenu_Play_Pinnnnballll"
		actionType = "Loot"
		if USE_CUSTOM_ANIMATION then
			actionType = "PlayPinball"
		end
	elseif arcadeSpriteName == "d_location_arcadian_01_24" then
		soundFile = "PAMGArcadianplay"
		soundEnd = "PAMGArcadianend"
		contextMenu = "ContextMenu_Play_3Nights"
		actionType = "Loot"
		if USE_CUSTOM_ANIMATION then
			actionType = "PlayArcadian"
		end
	elseif arcadeSpriteName == "d_location_arcadian_01_25" then
		soundFile = "PAMGArcadianplay"
		soundEnd = "PAMGArcadianend"
		contextMenu = "ContextMenu_Play_Exile5088"
		actionType = "Loot"
		if USE_CUSTOM_ANIMATION then
			actionType = "PlayArcadian"
		end
	elseif arcadeSpriteName == "d_location_arcadian_01_26" then
		soundFile = "PAMGArcadianplay"
		soundEnd = "PAMGArcadianend"
		contextMenu = "ContextMenu_Play_SuperbSmushPros"
		actionType = "Loot"
		if USE_CUSTOM_ANIMATION then
			actionType = "PlayArcadian"
		end
	elseif arcadeSpriteName == "d_location_arcadian_01_27" then
		soundFile = "PAMGArcadianplay"
		soundEnd = "PAMGArcadianend"
		contextMenu = "ContextMenu_Play_ColorDodge"
		actionType = "Loot"
		if USE_CUSTOM_ANIMATION then
			actionType = "PlayArcadian"
		end
	else
		print("PseudoEdPMA: Unassigned machine")
		return
	end -- if customname

	print("PseudoEdPMA: Post arcadeCustomName " .. arcadeCustomName)
	print("PseudoEdPMA: Post arcadeSpriteName " .. arcadeSpriteName)
	
	context:addOption(getText(contextMenu),
					  worldobjects,
					  PMAPlayModdedGameMenu.onPlayGame,
					  getSpecificPlayer(player),
					  arcadeMachine,
					  soundFile,
					  soundEnd,
					  actionType,
					  length,
					  6,
					  3);
	
end

-- Moreso than the rest of the code, I don't really know what I'm doing here
PMAPlayModdedGameMenu.walkToFront = function(thisPlayer, thisObject)
	local frontSquare = nil
	local controllerSquare = nil
	local spriteName = thisObject:getSprite():getName()
	if not spriteName then
		return false
	end

	print("PseudoEdPMA: Walk to front " .. spriteName);

	local properties = thisObject:getSprite():getProperties()
	
	local facing = nil
	if spriteName == "ValleyArcade_20" then
		facing = "S"
	elseif spriteName == "ValleyArcade_21" then
		facing = "E"
	elseif spriteName == "ValleyArcade_22" then
		facing = "S"
	elseif spriteName == "ValleyArcade_23" then
		facing = "E"
	elseif spriteName == "DylansBar01_16" or spriteName == "DylanRandomAssetPack3_24" then
		facing = "E"
	elseif spriteName == "DylansBar01_17" or spriteName == "DylanRandomAssetPack3_25" then
		facing = "S"
	elseif spriteName == "d_location_arcadian_01_0" then
		facing = "E"
	elseif spriteName == "d_location_arcadian_01_1" then
		facing = "S"
	elseif spriteName == "d_location_arcadian_01_2" then
		facing = "W"
	elseif spriteName == "d_location_arcadian_01_3" then
		facing = "N"
	elseif spriteName == "d_location_arcadian_01_8" then
		facing = "E"
	elseif spriteName == "d_location_arcadian_01_9" then
		facing = "S"
	elseif spriteName == "d_location_arcadian_01_10" then
		facing = "W"
	elseif spriteName == "d_location_arcadian_01_11" then
		facing = "N"
	elseif spriteName == "d_location_arcadian_01_12" then
		facing = "S"
	elseif spriteName == "d_location_arcadian_01_16" then
		facing = "E"
	elseif spriteName == "d_location_arcadian_01_17" then
		facing = "S"
	elseif spriteName == "d_location_arcadian_01_18" then
		facing = "W"
	elseif spriteName == "d_location_arcadian_01_19" then
		facing = "N"
	elseif spriteName == "d_location_arcadian_01_20" then
		facing = "S"
	elseif spriteName == "d_location_arcadian_01_24" then
		facing = "E"
	elseif spriteName == "d_location_arcadian_01_25" then
		facing = "S"
	elseif spriteName == "d_location_arcadian_01_26" then
		facing = "W"
	elseif spriteName == "d_location_arcadian_01_27" then
		facing = "N"
	else
		print("PseudoEdPMA: " .. spriteName .. " is not coded for facing")
		return
	end
	
	if facing == "S" then
		frontSquare = thisObject:getSquare():getS()
	elseif facing == "E" then
		frontSquare = thisObject:getSquare():getE()
	elseif facing == "W" then
		frontSquare = thisObject:getSquare():getW()
	elseif facing == "N" then
		frontSquare = thisObject:getSquare():getN()
	end
	
	if not frontSquare then
		return false
	end
	
	if not controllerSquare then
		controllerSquare = thisObject:getSquare()
	end

	-- If the front of machine square is valid, walk to it
	if AdjacentFreeTileFinder.privTrySquare(controllerSquare, frontSquare) then
		-- TODO: AdjacentFreeTileFinder didn't work for me on 1st floor for pinball back
		-- Also didn't work on the 2nd floor if I used getOrCreateGridSquare for frontSquare
		--print("PseudoEdPAM: Valid front square, moving")
		ISTimedActionQueue.add(ISWalkToTimedAction:new(thisPlayer, frontSquare))
		return true
	end
	return false
end

-- Do when player selects option to play the game (from context menu)
PMAPlayModdedGameMenu.onPlayGame = function(worldobjects, player, machine, soundFile, soundEnd, actionType, length, boredomReduction, stressReduction)
	if PMAPlayModdedGameMenu.walkToFront(player, machine) then
		ISTimedActionQueue.add(PAMPlayGame:new(player, machine, soundFile, soundEnd, actionType, length, boredomReduction, stressReduction));
	end
end

Events.OnPreFillWorldObjectContextMenu.Add(PMAPlayModdedGameMenu.doBuildMenu);
