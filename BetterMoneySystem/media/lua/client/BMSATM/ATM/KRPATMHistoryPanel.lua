local FONT_HGT_MEDIUM = getTextManager():getFontHeight(UIFont.Medium)
local FONT_HGT_LARGE = getTextManager():getFontHeight(UIFont.Large)

KRPATMHistoryPanel = ISPanel:derive("KRPATMHistoryPanel");

function KRPATMHistoryPanel:initialise()
	ISPanel.initialise(self);

	self.historyList = ISScrollingListBox:new(50, 50, 400, 250);
	self.historyList:initialise();
	self.historyList:instantiate();
	self.historyList.itemheight = 22;
	self.historyList.selected = 0;
	self.historyList.font = UIFont.NewSmall;
	self.historyList.drawBorder = true;
	self:addChild(self.historyList);

	local alldata = ModData.get("MoneyBalance")
	if alldata ~= nil then
		local playerData = alldata[self.char:getUsername()]
		if playerData ~= nil then
			if playerData.history ~= nil then
				for i, val in ipairs(playerData.history) do
					local text = ""
					if val.operation == "DEPOSIT" then
						text = text .. getText("UI_Text_BMSATM_Deposit") .. ": " .. val.num .. "$ (" .. val.date .. ")"
					elseif val.operation == "WITHDRAWAL" then
						text = text .. getText("UI_Text_BMSATM_Withdrawal") .. ": " .. val.num .. "$ (" .. val.date .. ")"
					elseif val.operation == "TRANSFERFROM" then
						text = text .. getText("UI_Text_BMSATM_TranseferFrom") .. " '" .. val.user .. "': " .. val.num .. "$ (" .. val.date .. ")"
					elseif val.operation == "TRANSFERTO" then
						text = text .. getText("UI_Text_BMSATM_TranseferTo") .. " '" .. val.user .. "': " .. val.num .. "$ (" .. val.date .. ")"
					end

					self.historyList:addItem(text, text)
				end
			end
		end
	end

    local label = ISLabel:new(self:getWidth() - 15, 339 + (25 - FONT_HGT_MEDIUM/2), FONT_HGT_MEDIUM, "Back", 0.2352941, 0.2745098, 0.3607843, 1, UIFont.Medium, false)
	label:initialise()
	self:addChild(label)
end

function KRPATMHistoryPanel:onClick(button)
    if button.internal == "BUTTON_RIGHT_4" then -- EXIT
        self.window:gotoPanel("mainPanel")
	end
end

function KRPATMHistoryPanel:setVisible(val)
    ISUIElement.setVisible(self, val)
    
	self.historyList:clear()
	local alldata = ModData.get("MoneyBalance")
	if alldata ~= nil then
		local playerData = alldata[self.char:getUsername()]
		if playerData ~= nil then
			if playerData.history ~= nil then
				for i, val in ipairs(playerData.history) do
					local text = ""
					if val.operation == "DEPOSIT" then
						text = text .. getText("UI_Text_BMSATM_Deposit") .. ": " .. val.num .. "$ (" .. val.date .. ")"
					elseif val.operation == "WITHDRAWAL" then
						text = text .. getText("UI_Text_BMSATM_Withdrawal") .. ": " .. val.num .. "$ (" .. val.date .. ")"
					elseif val.operation == "TRANSFERFROM" then
						text = text .. getText("UI_Text_BMSATM_TranseferFrom") .. " '" .. val.user .. "': " .. val.num .. "$ (" .. val.date .. ")"
					elseif val.operation == "TRANSFERTO" then
						text = text .. getText("UI_Text_BMSATM_TranseferTo") .. " '" .. val.user .. "': " .. val.num .. "$ (" .. val.date .. ")"
					end

					self.historyList:addItem(text, text)
				end
			end
		end
	end
end

function KRPATMHistoryPanel:prerender()
	ISPanel:prerender(self)
    self:drawTexture(self.window.rightButtonTexture, 265, 339, 1,1,1,1)
end

function KRPATMHistoryPanel:new(x, y, width, height, character, window)
	local o = {}
	o = ISPanel:new(x, y, width, height);
	setmetatable(o, self)
	self.__index = self

	o.backgroundColor = {r=0, g=0, b=0, a=0};
	o.borderColor = {r=0, g=0, b=0, a=0};
	o.width = width;
	o.height = height;
	o.anchorLeft = true;
	o.anchorRight = true;
	o.anchorTop = true;
	o.anchorBottom = true;

	o.char = character;
	o.window = window

	return o;
end