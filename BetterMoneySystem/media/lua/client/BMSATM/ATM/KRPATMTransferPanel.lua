local FONT_HGT_MEDIUM = getTextManager():getFontHeight(UIFont.Medium)
local FONT_HGT_LARGE = getTextManager():getFontHeight(UIFont.Large)

--------

KRPATMTransferPanel = ISPanel:derive("KRPATMTransferPanel");

function KRPATMTransferPanel:initialise()
	ISPanel.initialise(self);

    local label = ISLabel:new(180, 50, FONT_HGT_MEDIUM, getText("UI_Text_BMSATM_AmountOfMoney"), 1, 1, 1, 0.7, UIFont.Medium)
	label:initialise()
	self:addChild(label)

    label = ISLabel:new(180, 100, FONT_HGT_MEDIUM, getText("UI_Text_BMSATM_Nickname"), 1, 1, 1, 0.7, UIFont.Medium)
	label:initialise()
	self:addChild(label)

	self.entrySum = ISTextEntryBox:new("", 200, 50, 250, FONT_HGT_LARGE)
	self.entrySum.font = UIFont.Large
    self.entrySum.backgroundColor = {r=0, g=0, b=0, a=0.3}
    self.entrySum.borderColor = {r=0.188, g=0.2, b=0.215686, a=1}
	self.entrySum:initialise();
	self.entrySum:instantiate();
    self.entrySum:setOnlyNumbers(true)
	self:addChild(self.entrySum)

    self.entryNickname = ISTextEntryBox:new("", 200, 100, 250, FONT_HGT_LARGE)
	self.entryNickname.font = UIFont.Large
    self.entryNickname.backgroundColor = {r=0, g=0, b=0, a=0.3}
    self.entryNickname.borderColor = {r=0.188, g=0.2, b=0.215686, a=1}
	self.entryNickname:initialise();
	self.entryNickname:instantiate();
	self:addChild(self.entryNickname)

    label = ISLabel:new(self:getWidth() - 15, 155 + (25 - FONT_HGT_MEDIUM/2), FONT_HGT_MEDIUM, getText("UI_Text_BMSATM_Transfer"), 0.2352941, 0.2745098, 0.3607843, 1, UIFont.Medium, false)
	label:initialise()
	self:addChild(label)

    label = ISLabel:new(self:getWidth() - 15, 339 + (25 - FONT_HGT_MEDIUM/2), FONT_HGT_MEDIUM, getText("UI_Text_BMSATM_Back"), 0.2352941, 0.2745098, 0.3607843, 1, UIFont.Medium, false)
	label:initialise()
	self:addChild(label)
end

function KRPATMTransferPanel:onClick(button)
    if button.internal == "BUTTON_RIGHT_1" then -- Transfer
        if self.entrySum:getText() ~= "" and tonumber(self.entrySum:getText()) ~= nil and tonumber(self.entrySum:getText()) > 0 and self.entryNickname:getText() ~= nil then
            local num = tonumber(self.entrySum:getText())
            if num <= BMSATM.Money.ATM.getMoneyBalance(self.char) and BMSATM.Money.ATM.isAccountExist(self.entryNickname:getText()) then
                BMSATM.Money.ATM.transferMoney(self.char, num, self.entryNickname:getText())
                self.window:gotoPanel("mainPanel")
            end
        end
	end
    if button.internal == "BUTTON_RIGHT_4" then -- EXIT
        self.window:gotoPanel("mainPanel")
	end
end

function KRPATMTransferPanel:prerender()
	ISPanel:prerender(self)

    self:drawTexture(self.window.rightButtonTexture, 265, 155, 1,1,1,1)
    self:drawTexture(self.window.rightButtonTexture, 265, 339, 1,1,1,1)
end

function KRPATMTransferPanel:update()
    if self.entryNickname:getText() ~= self.lastName then
        self.lastName = self.entryNickname:getText()
        if self.lastName ~= "" then
            if BMSATM.Money.ATM.isAccountExist(self.entryNickname:getText()) then
                self.entryNickname.javaObject:setTextColor(self.goodColor)                
            else
                self.entryNickname.javaObject:setTextColor(self.badColor)
            end
        end
    end 
    if self.entrySum:getText() ~= self.lastNum then
        self.lastNum = self.entrySum:getText()
        if self.lastNum ~= "" then
            if tonumber(self.lastNum) > BMSATM.Money.ATM.getMoneyBalance(self.char) then
                self.entrySum.javaObject:setTextColor(self.badColor)
            else
                self.entrySum.javaObject:setTextColor(self.goodColor)
            end
        end
    end 
end

function KRPATMTransferPanel:new(x, y, width, height, character, window)
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
    o.lastName = ""
    o.lastNum = ""

    o.goodColor = ColorInfo.new(1, 1, 1, 1)
    o.badColor = ColorInfo.new(1, 0, 0, 1)

	return o;
end