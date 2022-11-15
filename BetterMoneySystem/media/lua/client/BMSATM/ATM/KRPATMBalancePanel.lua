local FONT_HGT_MEDIUM = getTextManager():getFontHeight(UIFont.Medium)
local FONT_HGT_LARGE = getTextManager():getFontHeight(UIFont.Large)

KRPATMBalancePanel = ISPanel:derive("KRPATMBalancePanel");

function KRPATMBalancePanel:initialise()
	ISPanel.initialise(self);

	local txt = getText("UI_Text_BMSATM_YourBalanceIs") .. ":"
    local label = ISLabel:new(self:getWidth()/2 - getTextManager():MeasureStringX(UIFont.Large, txt)/2, 125, FONT_HGT_LARGE, txt, 1, 1, 1, 1, UIFont.Large, true)
	label:initialise()
	self:addChild(label)

    local num = BMSATM.Money.ATM.getMoneyBalance(self.char)
    txt = tostring(num) .. " USD"
    self.balanceLabel = ISLabel:new(self:getWidth()/2 - getTextManager():MeasureStringX(UIFont.Large, txt)/2, 175, FONT_HGT_LARGE, txt, 0.8, 1, 0.8, 1, UIFont.Large, true)
	self.balanceLabel:initialise()
	self:addChild(self.balanceLabel)

    label = ISLabel:new(self:getWidth() - 15, 339 + (25 - FONT_HGT_MEDIUM/2), FONT_HGT_MEDIUM, "Back", 0.2352941, 0.2745098, 0.3607843, 1, UIFont.Medium, false)
	label:initialise()
	self:addChild(label)
end

function KRPATMBalancePanel:onClick(button)
    if button.internal == "BUTTON_RIGHT_4" then -- EXIT
        self.window:gotoPanel("mainPanel")
	end
end

function KRPATMBalancePanel:setVisible(val)
    ISUIElement.setVisible(self, val)
    local num = BMSATM.Money.ATM.getMoneyBalance(self.char)
    self.balanceLabel:setName(tostring(num) .. " $")
end

function KRPATMBalancePanel:prerender()
	ISPanel:prerender(self)
    self:drawTexture(self.window.rightButtonTexture, 265, 339, 1,1,1,1)
end

function KRPATMBalancePanel:new(x, y, width, height, character, window)
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