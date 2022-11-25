local FONT_HGT_MEDIUM = getTextManager():getFontHeight(UIFont.Medium)
local FONT_HGT_LARGE = getTextManager():getFontHeight(UIFont.Large)

--------

KRPATMMainPanel = ISPanel:derive("KRPATMMainPanel");

function KRPATMMainPanel:initialise()
	ISPanel.initialise(self);

	local label = ISLabel:new(25, 50, FONT_HGT_LARGE, getText("UI_Text_BMSATM_ChooseTransaction"), 1, 1, 1, 1, UIFont.Large, true)
	label:initialise()
	self:addChild(label)

    label = ISLabel:new(25, 95, FONT_HGT_MEDIUM, getText("UI_Text_BMSATM_PressCancelToExit"), 1, 1, 1, 0.7, UIFont.Medium, true)
	label:initialise()
	self:addChild(label)

    ---

    label = ISLabel:new(15, 155 + (25 - FONT_HGT_MEDIUM/2), FONT_HGT_MEDIUM, getText("UI_Text_BMSATM_Withdrawal"), 0.2352941, 0.2745098, 0.3607843, 1, UIFont.Medium, true)
	label:initialise()
	self:addChild(label)

    label = ISLabel:new(15, 217 + (25 - FONT_HGT_MEDIUM/2), FONT_HGT_MEDIUM, getText("UI_Text_BMSATM_Deposit"), 0.2352941, 0.2745098, 0.3607843, 1, UIFont.Medium, true)
	label:initialise()
	self:addChild(label)

	label = ISLabel:new(15, 279 + (25 - FONT_HGT_MEDIUM/2), FONT_HGT_MEDIUM, getText("UI_Text_BMSATM_History"), 0.2352941, 0.2745098, 0.3607843, 1, UIFont.Medium, true)
	label:initialise()
	self:addChild(label)

    label = ISLabel:new(self:getWidth() - 15, 155 + (25 - FONT_HGT_MEDIUM/2), FONT_HGT_MEDIUM, getText("UI_Text_BMSATM_Transfer"), 0.2352941, 0.2745098, 0.3607843, 1, UIFont.Medium, false)
	label:initialise()
	self:addChild(label)

    label = ISLabel:new(self:getWidth() - 15, 217 + (25 - FONT_HGT_MEDIUM/2), FONT_HGT_MEDIUM, getText("UI_Text_BMSATM_Balance"), 0.2352941, 0.2745098, 0.3607843, 1, UIFont.Medium, false)
	label:initialise()
	self:addChild(label)

    label = ISLabel:new(self:getWidth() - 15, 339 + (25 - FONT_HGT_MEDIUM/2), FONT_HGT_MEDIUM, getText("UI_Text_BMSATM_Exit"), 0.2352941, 0.2745098, 0.3607843, 1, UIFont.Medium, false)
	label:initialise()
	self:addChild(label)
end

function KRPATMMainPanel:onClick(button)
	if button.internal == "BUTTON_LEFT_1" then  -- WITHDRAWL
		self.window:gotoPanel("withdrawalPanel")
	end
    if button.internal == "BUTTON_LEFT_2" then  -- DEPOSIT
		self.window:gotoPanel("depositPanel")
	end
	if button.internal == "BUTTON_LEFT_3" then  -- HISTORY
		self.window:gotoPanel("historyPanel")
	end
    if button.internal == "BUTTON_RIGHT_1" then -- TRANSFER
		self.window:gotoPanel("transferPanel")
	end
    if button.internal == "BUTTON_RIGHT_2" then -- BALANCE
        self.window:gotoPanel("balancePanel")
	end
    if button.internal == "BUTTON_RIGHT_4" then -- EXIT
        self.window:close()
	end
end

function KRPATMMainPanel:prerender()
	ISPanel:prerender(self)
	self:drawTexture(self.window.leftButtonTexture, 0, 155, 1,1,1,1)
    self:drawTexture(self.window.leftButtonTexture, 0, 217, 1,1,1,1)
	self:drawTexture(self.window.leftButtonTexture, 0, 279, 1,1,1,1)

    self:drawTexture(self.window.rightButtonTexture, 265, 155, 1,1,1,1)
    self:drawTexture(self.window.rightButtonTexture, 265, 217, 1,1,1,1)

    self:drawTexture(self.window.rightButtonTexture, 265, 339, 1,1,1,1)
end

function KRPATMMainPanel:new(x, y, width, height, character, window)
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