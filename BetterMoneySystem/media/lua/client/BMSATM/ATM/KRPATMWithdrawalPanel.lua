local FONT_HGT_MEDIUM = getTextManager():getFontHeight(UIFont.Medium)
local FONT_HGT_LARGE = getTextManager():getFontHeight(UIFont.Large)

--------

KRPATMWithdrawalPanel = ISPanel:derive("KRPATMWithdrawalPanel");

function KRPATMWithdrawalPanel:initialise()
	ISPanel.initialise(self);

    local label = ISLabel:new(50, 50, FONT_HGT_MEDIUM, getText("UI_Text_BMSATM_EnterAmountOfMoney"), 1, 1, 1, 0.7, UIFont.Medium, true)
	label:initialise()
	self:addChild(label)

	self.entrySum = ISTextEntryBox:new("", 50, 100, 250, FONT_HGT_LARGE)
	self.entrySum.font = UIFont.Large
    self.entrySum.backgroundColor = {r=0, g=0, b=0, a=0.3}
    self.entrySum.borderColor = {r=0.188, g=0.2, b=0.215686, a=1}
	self.entrySum:initialise();
	self.entrySum:instantiate();
    self.entrySum:setOnlyNumbers(true)
	self:addChild(self.entrySum)

    label = ISLabel:new(self:getWidth() - 15, 155 + (25 - FONT_HGT_MEDIUM/2), FONT_HGT_MEDIUM, getText("UI_Text_BMSATM_Withdrawal"), 0.2352941, 0.2745098, 0.3607843, 1, UIFont.Medium, false)
	label:initialise()
	self:addChild(label)

    label = ISLabel:new(self:getWidth() - 15, 339 + (25 - FONT_HGT_MEDIUM/2), FONT_HGT_MEDIUM, getText("UI_Text_BMSATM_Back"), 0.2352941, 0.2745098, 0.3607843, 1, UIFont.Medium, false)
	label:initialise()
	self:addChild(label)
end

function KRPATMWithdrawalPanel:onClick(button)
    if button.internal == "BUTTON_RIGHT_1" then -- Withdrawal
        if self.entrySum:getText() ~= "" and tonumber(self.entrySum:getText()) ~= nil and tonumber(self.entrySum:getText()) > 0 then
            local num = tonumber(self.entrySum:getText())
            if num <= BMSATM.Money.ATM.getMoneyBalance(self.char) then
                BMSATM.Money.ATM.decreaseMoneyBalance(self.char, num)
                BMSATM.Money.ATM.withdrawalMoney(self.char, num)
                self.window:close()
            end
        end
	end
    if button.internal == "BUTTON_RIGHT_4" then -- EXIT
        self.window:gotoPanel("mainPanel")
	end
end

function KRPATMWithdrawalPanel:prerender()
	ISPanel:prerender(self)

    self:drawTexture(self.window.rightButtonTexture, 265, 155, 1,1,1,1)
    self:drawTexture(self.window.rightButtonTexture, 265, 339, 1,1,1,1)
end

function KRPATMWithdrawalPanel:update()
    if self.entrySum:getText() ~= self.lastNum then
        self.lastNum = self.entrySum:getText()
        if self.lastNum ~= "" and tonumber(self.lastNum) ~= nil and tonumber(self.lastNum) > 0 then
            if tonumber(self.lastNum) > BMSATM.Money.ATM.getMoneyBalance(self.char) then
                self.entrySum.javaObject:setTextColor(self.badColor)
            else
                self.entrySum.javaObject:setTextColor(self.goodColor)
            end
        end
    end 
end

function KRPATMWithdrawalPanel:new(x, y, width, height, character, window)
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
    o.lastNum = ""

    o.goodColor = ColorInfo.new(1, 1, 1, 1)
    o.badColor = ColorInfo.new(1, 0, 0, 1)

	return o;
end