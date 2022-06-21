
-- SUPConfig = SUPConfig or {}
-- SUPConfig.mods = SUPConfig.mods or {}

-- SUPConfig.addMod = function(modId, name, config, configMenu, tabName, menuSpecificAccess)
	-- if not config or not configMenu then
		-- return
	-- end

	-- SUPConfig.mods[modId] = {}
	-- SUPConfig.mods[modId].name = name
	-- SUPConfig.mods[modId].config = config
	-- SUPConfig.mods[modId].configMenu = configMenu
	-- SUPConfig.mods[modId].tabName = tabName
	-- SUPConfig.mods[modId].menuSpecificAccess = menuSpecificAccess

	-- for gameOptionName,menuEntry in pairs(configMenu) do
		-- if menuEntry then
			-- if menuEntry.options then
				-- menuEntry.optionsIndexes = menuEntry.options
				-- menuEntry.optionsKeys = {}
				-- menuEntry.optionsValues = {}
				-- menuEntry.optionLabels = {}
				-- for i,table in ipairs(menuEntry.optionsIndexes) do
					-- menuEntry.optionLabels[i] = table[1]
					-- local k = table[1]
					-- local v = table[2]
					-- menuEntry.optionsKeys[k] = {i, v}
					-- menuEntry.optionsValues[v] = {i, k}
				-- end
			-- end
		-- end
	-- end

	-- for gameOptionName,value in pairs(config) do
		-- local menuEntry = configMenu[gameOptionName]
		-- if menuEntry then
			-- if menuEntry.options then
				-- menuEntry.selectedIndex = menuEntry.optionsValues[value][1]
				-- menuEntry.selectedLabel = menuEntry.optionsValues[value][2]
			-- end
			-- menuEntry.selectedValue = value
		-- end
	-- end

-- end


-- local GameOption = ISBaseObject:derive("GameOptions")
-- function GameOption:new(name, control)
	-- local o = {}
	-- setmetatable(o, self)
	-- self.__index = self
	-- o.name = name
	-- o.control = control

	-- if control.isTickBox then
		-- control.changeOptionMethod = self.onChange
		-- control.changeOptionTarget = o
	-- else
		-- local go = o.gameOptions
		-- control.onTextChange = function()
			-- o.gameOptions.changed = true
		-- end
	-- end
	-- return o
-- end
-- function GameOption:onChange()
	-- self.gameOptions:onChange(self)
-- end


-- SUP_MainOptions_create = MainOptions.create

-- function MainOptions:create()

	-- SUP_MainOptions_create(self)

	-- local SUPConfig_self_gameOptions_toUI = self.gameOptions.toUI
	-- function self.gameOptions.toUI(self)
		-- for _,option in ipairs(self.options) do
			-- if option then option:toUI() end
		-- end
		-- self.changed = false
		-- return SUPConfig_self_gameOptions_toUI(self)
	-- end

	-- local SUPConfig_self_gameOptions_apply = self.gameOptions.apply
	-- function self.gameOptions.apply(self)
		-- for _,option in ipairs(self.options) do
			-- if option then option:apply() end
		-- end
		-- SUPConfig.saveConfig()
		-- self.changed = false
		-- return SUPConfig_self_gameOptions_apply(self)
	-- end

	-- local x = self:getWidth()/2.5
	-- local y = 30
	-- local width = 200
	-- local height = 20

	-- function addText(text, font, r, g, b, a, customX)
		-- self.addY = self.addY +7
		-- local label = ISLabel:new(x+(customX or 20),y+self.addY,height, text, r or 1, g or 1, b or 1, a or 1, font or UIFont.Small, true)
		-- label:initialise()
		-- self.mainPanel:addChild(label)
		-- self.addY = self.addY + height +5
		-- return label
	-- end

	-- function addTickBox(text)
		-- local label = ISLabel:new(x,y+self.addY,height, text, 1,1,1,1, UIFont.Small, false)
		-- label:initialise()
		-- self.mainPanel:addChild(label)
		-- local box = ISTickBox:new(x+20,y+self.addY, width,height)
		-- box.choicesColor = {r=1, g=1, b=1, a=1}
		-- box:initialise()
		-- self.mainPanel:addChild(box)
		-- self.mainPanel:insertNewLineOfButtons(box)
		-- box:addOption("", nil)
		-- self.addY = self.addY + height +5
		-- return box
	-- end

	-- function addSpace()
		-- self.addY = self.addY + height +5
	-- end

	-- function createElements(mod)

		-- for gameOptionName,menuEntry in pairs(mod.configMenu) do
			-- --- TEXT ---
			-- if menuEntry.type == "Text" then
				-- addText(menuEntry.text, menuEntry.font, menuEntry.r, menuEntry.g, menuEntry.b, menuEntry.a, menuEntry.customX)
			-- end

			-- --- SPACE ---
			-- if menuEntry.type == "Space" then
				-- local iteration = menuEntry.iteration or 1
				-- for i=1, iteration do
					-- addSpace()
				-- end
			-- end

			-- --- TICK BOX ---
			-- if menuEntry.type == "Tickbox" then
				-- local box = addTickBox(menuEntry.title)
				-- local gameOption = GameOption:new(gameOptionName, box)
				-- function gameOption.toUI(self)
					-- local boxc = self.control
					-- local bool = sup_settings.cursor_settings.customskillwindow
					-- boxc.selected[1] = bool
					-- SUPConfig.applySpecificTooltip(gameOptionName, box)
				-- end
				-- function gameOption.apply(self)
					-- local box = self.control
					-- local bool = box.selected[1]
					-- menuEntry.selectedValue = bool
					-- menuEntry.selectedLabel = tostring(bool)
					-- SUPConfig.applySpecificOption(gameOptionName, bool)
				-- end
				-- self.gameOptions:add(gameOption)
			-- end

		-- end
		-- self.addY = self.addY + 15
	-- end

	-- for modId,mod in pairs(SUPConfig.mods) do
		-- self.addY = 0
		-- self:addPage(mod.tabName)

		-- if (not mod.menuSpecificAccess) or (getPlayer() and mod.menuSpecificAccess=="ingame") or (not getPlayer() and mod.menuSpecificAccess=="mainmenu") then
			-- createElements(mod)
		-- else
			-- if (not getPlayer() and mod.menuSpecificAccess=="ingame") then
			-- end
			-- if (getPlayer() and mod.menuSpecificAccess=="mainmenu") then
			-- end
		-- end

		-- self.addY = self.addY + MainOptions.translatorPane:getHeight() + 22
		-- self.mainPanel:setScrollHeight(self.addY + 20)
	-- end

-- end
-- function SUPConfig.applySpecificTooltip(gameOptionName, option)
	-- if gameOptionName ~= nil and tostring(gameOptionName) == "customskillwindow" then
		-- option.tooltip = getText("IGUI_CustomSkillCursorDesc");
	-- end
-- end
-- function SUPConfig.applySpecificOption(gameOptionName, bool)
	-- if gameOptionName ~= nil and tostring(gameOptionName) == "customskillwindow" then
		-- ISSkillProgressBar.ConfigOption = bool;
		-- sup_settings.cursor_settings.customskillwindow = bool;
	-- end
-- end

-- function SUPConfig.saveConfig()
	-- for modId,mod in pairs(SUPConfig.mods) do
		-- local config = mod.config
		-- local configMenu = mod.configMenu
		-- local cursor_settings = sup_settings.cursor_settings;
		-- for gameOptionName,_ in pairs(config) do
			-- local menuEntry = configMenu[gameOptionName]
			-- if menuEntry then
				-- if menuEntry.selectedLabel then
					-- local menuEntry_selectedLabel = menuEntry.selectedLabel
					-- if type(menuEntry.selectedLabel) == "boolean" then
						-- menuEntry_selectedLabel = tostring(menuEntry_selectedLabel)
					-- end
					-- if cursor_settings["customskillwindow"] then
						-- cursor_settings["customskillwindow"] = menuEntry_selectedLabel;
					-- end
				-- else
					-- local menuEntry_selectedValue = menuEntry.selectedValue
					-- if type(menuEntry.selectedValue) == "boolean" then
						-- menuEntry_selectedValue = tostring(menuEntry_selectedValue)
					-- end
					-- if cursor_settings["customskillwindow"] then
						-- cursor_settings["customskillwindow"] = menuEntry_selectedValue;
					-- end
				-- end
				-- sup_settings:save();
			-- else
			-- end
		-- end
	-- end
-- end