LGSurvivalGuideManager = ISBaseObject:derive("LGSurvivalGuideManager");

function LGSurvivalGuideManager:update()
     if self.panel == nil then
         self.panel = LGISTutorialPanel:new(0, 0, 240, 250);
         self.panel:initialise();
         self.panel:addToUIManager();
         self.panel.tutorialSetInfo = ISTutorialSetInfo:new();

         local entry = LGSurvivalGuideEntries.getEntry(0);
         self.panel.tutorialSetInfo:addPage(entry.title, entry.text, entry.moreInfo);

         self.panel.tutorialSetInfo:applyPageToRichTextPanel(self.panel.richtext);
         self.panel.moreInfo = entry.moreInfo;

		 for i=1,LGSurvivalGuideEntries.list:size() -1 do
			entry = LGSurvivalGuideEntries.getEntry(i);
			self.panel.tutorialSetInfo:addPage(entry.title, entry.text, entry.moreInfo);
		 end

		ISLayoutManager.RegisterWindow('lgsurvivalguide', LGSurvivalGuideManager, self) 
     end
end

function LGSurvivalGuideManager:new()
    local o = {}
    setmetatable(o, self)
    self.__index = self
    self.moreInfoVisible = false
    return o
end

function LGSurvivalGuideManager:RestoreLayout(name, layout)
	-- Only save/restore visibility, the size/position is fixed
	if layout.visible == 'false' then
		self.panel:setVisible(false);
        self.panel.showOnStartup = false;
    else
        self.panel.showOnStartup = false;
    end

    -- always show the guide for beginner
    if getCore():getGameMode() == "Beginner" then
        self.panel:setVisible(true);
        self.panel.showOnStartup = false;
        self.panel:setX(getCore():getScreenWidth()/2 - self.panel.width / 2);
        self.panel:setY(getCore():getScreenHeight()/2 - self.panel.height / 2);
        --self.panel.tickBox:setVisible(false);
    end

    --if self.panel.tickBox then
    --    self.panel.tickBox:setSelected(1, self.panel.showOnStartup);
    --end
end

function LGSurvivalGuideManager:SaveLayout(name, layout)
	-- Only save/restore visibility, the size/position is fixed
    if self.panel then
        if not self.panel.showOnStartup then
            layout.visible = 'false';
            self.panel:setVisible(false);
        else
            layout.visible = 'true';
            self.panel:setVisible(true);
        end
        ISLayoutManager.SaveWindowVisible(self.panel, layout);
    end
end

function doLGGuide()
	if isServer() then return; end
	-- Disable with controller for now.
	if JoypadState[1] then return end
    -- hide it for tut
    if getCore():getGameMode() == "Tutorial" and not getCore():isTutorialDone() then
        return;
    end
    -- only happens on single player so no splitscreen support required.
    if LGSurvivalGuideManager.instance == nil then
        LGSurvivalGuideManager.instance = LGSurvivalGuideManager:new();
		--LGSurvivalGuideManager.instance.panel:setVisible(false);
    end

    LGSurvivalGuideManager.instance:update();
	local pl = getSpecificPlayer(0);
	local prhand = nil;
	local schand = nil;
	if pl then
		prhand = pl:getPrimaryHandItem();
		schand = pl:getSecondaryHandItem();
	end
	local panel = LGSurvivalGuideManager.instance.panel
	if pl and ((prhand ~= nil and prhand:getType() == "ManualLG") or (schand ~= nil and schand:getType() == "ManualLG")) then
		if getGameSpeed() == 0 or pl:IsRunning() then
			LGSurvivalGuideManager.instance.panel:setVisible(false);
			if panel.moreinfo and panel:getIsVisible() then
				LGSurvivalGuideManager.instance.moreInfoVisible = panel.moreinfo:getIsVisible()
				panel.moreinfo:setVisible(false)
			elseif panel.moreinfo then
				LGSurvivalGuideManager.instance.moreInfoVisible = panel.moreinfo:getIsVisible()
				panel.moreinfo:setVisible(false)
			end
		end
	else
		LGSurvivalGuideManager.instance.panel:setVisible(false);
		if panel.moreinfo and panel:getIsVisible() then
			LGSurvivalGuideManager.instance.moreInfoVisible = panel.moreinfo:getIsVisible()
			panel.moreinfo:setVisible(false)
		elseif panel.moreinfo then
			LGSurvivalGuideManager.instance.moreInfoVisible = panel.moreinfo:getIsVisible()
			panel.moreinfo:setVisible(false)
		end
	end
    if isDemo() and ISDemoPopup.instance ~= nil then
        LGSurvivalGuideManager.instance.panel:setVisible(false);
    end
end

LGSurvivalGuideManager.OnNewGame = function()
	if isServer() then return; end
	Events.OnTick.Add(doLGGuide);
end


LGSurvivalGuideManager.onKeyPressed = function()

	--if key == getCore():getKey("Toggle Survival Guide") then
		if LGSurvivalGuideManager.instance == nil then
			Events.OnTick.Add(doLGGuide);
		else
			if LGSurvivalGuideManager.instance.panel:getIsVisible() == false then
				LGSurvivalGuideManager.instance.panel:setVisible(not LGSurvivalGuideManager.instance.panel:getIsVisible());
				local panel = LGSurvivalGuideManager.instance.panel
				if panel.moreinfo and panel:getIsVisible() then
					panel.moreinfo:setVisible(LGSurvivalGuideManager.instance.moreInfoVisible)
				elseif panel.moreinfo then
					LGSurvivalGuideManager.instance.moreInfoVisible = panel.moreinfo:getIsVisible()
					panel.moreinfo:setVisible(false)
				end
			end
		end
	--end
end

LGSurvivalGuideManager.OnGameStart = function()
	if getCore():isShowFirstTimeWeatherTutorial() then
		if LGSurvivalGuideManager.instance == nil then
			LGSurvivalGuideManager.instance = LGSurvivalGuideManager:new();
			LGSurvivalGuideManager.instance:update();
		end
		local panel = LGSurvivalGuideManager.instance.panel
		LGSurvivalGuideManager.instance.panel:setVisible(true);
		if not panel.moreinfo then
			panel:initMoreInfoPanel();
		end
		panel.moreinfo:setVisible(true)
		panel.moreInfo = panel.tutorialSetInfo.pages[9].moreTextInfo;
		panel.tut.textDirty = true;
		panel.tut.text = panel.moreInfo;
		panel.tut:paginate();
		panel.tut:setYScroll(0);
		panel.tutorialSetInfo.currentPage = 9;
		panel.tutorialSetInfo:applyPageToRichTextPanel(panel.richtext);
		panel:reloadBtns();
		--getCore():setShowFirstTimeWeatherTutorial(false);
		--getCore():saveOptions();
	end
end

--Events.OnGameStart.Add(LGSurvivalGuideManager.OnGameStart)
--Events.OnEnterVehicle.Add(SurvivalGuideManager.onEnterVehicle);
--Events.OnKeyPressed.Add(LGSurvivalGuideManager.onKeyPressed);
--Events.OnNewGame.Add(SurvivalGuideManager.OnNewGame);
Events.OnTick.Add(doLGGuide);
--~ Events.OnMainMenuEnter.Add(doLGGuide);
