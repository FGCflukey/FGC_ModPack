announced = 0

local joined_msg = "...has joined the server."
local left_msg = "...has left the server."

local function announceArrival()
    if not isClient() or announced >= 2 then return end
    if not SandboxVars.ServerMessages.EnableAnnounceJoinServer then return end
    
    -- first iteration is always too early so skip it
    if announced == 0 then 
        announced = announced + 1
        return
    end

    -- now chat should be ready
    processGeneralMessage(joined_msg)
    announced = announced + 1
    
end

Events.OnGameTimeLoaded.Add(announceArrival)

local og_onMenuItemMouseDownMainMenu = MainScreen.onMenuItemMouseDownMainMenu

MainScreen.onMenuItemMouseDownMainMenu = function(item, x, y)
    if SandboxVars.ServerMessages.EnableAnnounceLeaveServer ~= true or item.internal ~= "EXIT" or MainScreen.instance.inGame ~= true then 
        og_onMenuItemMouseDownMainMenu(item, x, y) 
        return 
    end

    print("EXITDEBUG: onMenuItemMouseDownMainMenu 1 (item="..tostring(item.internal)..")")

    if item.internal ~= "LATESTSAVE" then
        -- "Continue" will either play this or UIActivatePlayButton depending
        -- on whether the player exists.
        getSoundManager():playUISound("UIActivateMainMenuItem")
    end

    if DebugScenarios.instance ~= nil then
        MainScreen.instance:removeChild(DebugScenarios.instance);
        DebugScenarios.instance = nil;
    end

    if MainScreen.instance.animPopup ~= nil then
        MainScreen.instance.animPopup:removeFromUIManager();
    end

    if MainScreen.instance.delay > 0 then return; end
    if MainScreen.instance.tutorialButton then return end
    if MainScreen.instance.checkSavefileModal then return end

    if (item.internal == "JOINSERVER" or item.internal == "CHALLENGE" or item.internal == "SANDBOX" or item.internal == "BEGINNER" or item.internal == "APOCALYPSE" or item.internal == "SOLO") and not MainScreen.checkTutorial(item) then
        return;
    end

    if item.internal == "LATESTSAVE" then
        MainScreen.continueLatestSave(MainScreen.latestSaveGameMode, MainScreen.latestSaveWorld)
        return
    end

    local joypadData = JoypadState.getMainMenuJoypad()

    if item.internal == "EXIT" then
        print("EXITDEBUG: onMenuItemMouseDownMainMenu 2")
--        if MainScreen.instance.inGame then
--            saveGame();
--            MainScreen.instance:getLatestSave();
--        end
        if MainScreen.instance.inGame == true then
            processGeneralMessage(left_msg)
            setGameSpeed(1);
            pauseSoundAndMusic();
            setShowPausedMessage(true);
            getCore():quit();
        else
            MainScreen:quitToDesktopFunc()
        end
        print("EXITDEBUG: onMenuItemMouseDownMainMenu 3")
    end
    if item.internal == "QUIT_TO_DESKTOP" then
        print("EXITDEBUG: onMenuItemMouseDownMainMenu 4")
        MainScreen:quitToDesktopFunc()
        return
    end
    if item.internal == "RETURN" then
        print("EXITDEBUG: onMenuItemMouseDownMainMenu 5")
        ToggleEscapeMenu(getCore():getKey("Main Menu"))
        return
    end

    if item.internal == "JOINSERVER" then
        MainScreen.instance.bottomPanel:setVisible(false);
        MainScreen.instance.joinServer:pingServers(true);
        MainScreen.instance.joinServer:setVisible(true, joypadData);
    end
    if item.internal == "COOP" then
        MainScreen.instance.bottomPanel:setVisible(false);
        MainScreen.instance.onlineCoopScreen:aboutToShow()
        MainScreen.instance.onlineCoopScreen:setVisible(true, joypadData);
    end
	
    if item.internal == "SCOREBOARD" then
        MainScreen.instance.scoreboard:setVisible(true, joypadData);
        scoreboardUpdate()
    end

    if item.internal == "OPTIONS" then
        MainScreen.instance.mainOptions:toUI()
        MainScreen.instance.mainOptions:setVisible(true, joypadData);
    end
    if item.internal == "SOLO" then
        ActiveMods.getById("currentGame"):copyFrom(ActiveMods.getById("default"))
        MainScreen.instance.soloScreen:setVisible(true, joypadData);
        MainScreen.instance.soloScreen.onMenuItemMouseDown(MainScreen.instance.soloScreen.survival,0,0);
    end
    if item.internal == "LOAD" then
        MainScreen.instance.loadScreen:setSaveGamesList();
        MainScreen.instance.loadScreen:setVisible(true, joypadData);
    end
    if item.internal == "MODS" then
        MainScreen.instance.modSelect.isNewGame = false
        MainScreen.instance.modSelect:setVisible(true, joypadData);
        MainScreen.instance.modSelect:populateListBox(getModDirectoryTable());
        ModSelector.showNagPanel()
    end
    if item.internal == "ADMINPANEL" then
        print("EXITDEBUG: onMenuItemMouseDownMainMenu 5")
        if ISAdminPanelUI.instance then
            ISAdminPanelUI.instance:close()
        end
        local modal = ISAdminPanelUI:new(200, 200, 350, 400)
        modal:initialise();
        modal:addToUIManager();
        print("EXITDEBUG: onMenuItemMouseDownMainMenu 6")
        ToggleEscapeMenu(getCore():getKey("Main Menu"))
        return
    end
    if item.internal == "USERPANEL" then
        print("EXITDEBUG: onMenuItemMouseDownMainMenu 7")
        if ISUserPanelUI.instance then
            ISUserPanelUI.instance:close()
        end
        local modal = ISUserPanelUI:new(200, 200, 350, 250, getPlayer())
        modal:initialise();
        modal:addToUIManager();
        print("EXITDEBUG: onMenuItemMouseDownMainMenu 8")
        ToggleEscapeMenu(getCore():getKey("Main Menu"))
        return
    end
    if item.internal == "TUTORIAL" then
--        if joypadData then
--            MainScreen.onTutorialControllerWarn()
--            return
--        end
        MainScreen.startTutorial();
    end
    if item.internal == "APOCALYPSE" then
        MainScreen.instance:setDefaultSandboxVars()
            getWorld():setGameMode("Sandbox");
            getWorld():setMap("DEFAULT")
            getWorld():setWorld("demo");
            deleteSave("Sandbox/demo");
            createWorld("demo");
--[[
            -- menu activated via joypad, we disable the joypads and will re-set them automatically when the game is started
            if MainScreen.instance.joyfocus then
                local joypadData = MainScreen.instance.joyfocus
                joypadData.focus = nil;
                updateJoypadFocus(joypadData)
                JoypadState.count = 0
                JoypadState.players = {};
                JoypadState.joypads = {};
                JoypadState.forceActivate = joypadData.id;
            end
--]]
            GameWindow.doRenderEvent(false);
            forceChangeState(GameLoadingState.new());
    end

    if item.internal == "INVITE" then
        InviteFriends.instance:fillList();
--        InviteFriends.instance:setVisible(true);
        MainScreen.instance.inviteFriends:setVisible(true, joypadData);
    end

    if item.internal == "WORKSHOP" then
        MainScreen.instance.workshopSubmit:fillList()
        MainScreen.instance.workshopSubmit:setVisible(true, joypadData)
    end

    MainScreen.instance.bottomPanel:setVisible(false)
end

local og_MainScreen_onConfirmQuitToDesktop = MainScreen.onConfirmQuitToDesktop

function MainScreen:onConfirmQuitToDesktop(button)
    if SandboxVars.ServerMessages.EnableAnnounceLeaveServer ~= true or button.internal ~= "YES" then 
        og_MainScreen_onConfirmQuitToDesktop(self, button) 
        return 
    end
    if button.internal == "YES" then
        processGeneralMessage(left_msg)
        setGameSpeed(1)
        pauseSoundAndMusic()
        setShowPausedMessage(true)
        getCore():quitToDesktop()
    end
    self.quitToDesktopDialog = nil
end

local og_ISPostDeathUI_onExit = ISPostDeathUI.onExit

function ISPostDeathUI:onExit()
    if SandboxVars.ServerMessages.EnableAnnounceLeaveServer ~= true or MainScreen.instance:isReallyVisible() then 
        og_ISPostDeathUI_onExit(self)
        return 
    end
    processGeneralMessage(left_msg)
	self:removeFromUIManager()
	getCore():exitToMenu()
end

local og_ISPostDeathUI_onConfirmQuitToDesktop = ISPostDeathUI.onConfirmQuitToDesktop

function ISPostDeathUI:onConfirmQuitToDesktop(button)
    if SandboxVars.ServerMessages.EnableAnnounceLeaveServer ~= true or button.internal ~= "YES" then
        og_ISPostDeathUI_onConfirmQuitToDesktop(self, button)
        return
    end
	if button.internal == "YES" then
        processGeneralMessage(left_msg)
		setGameSpeed(1)
		pauseSoundAndMusic()
		setShowPausedMessage(true)
		getCore():quitToDesktop()
	end
	self.quitToDesktopDialog = nil
end