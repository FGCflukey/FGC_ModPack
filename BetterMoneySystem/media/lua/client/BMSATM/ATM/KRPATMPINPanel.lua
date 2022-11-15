local FONT_HGT_SMALL = getTextManager():getFontHeight(UIFont.Small)
local FONT_HGT_MEDIUM = getTextManager():getFontHeight(UIFont.Medium)
local FONT_HGT_LARGE = getTextManager():getFontHeight(UIFont.Large)

--------

KRPATMPINPanel = ISPanel:derive("KRPATMPINPanel");

function KRPATMPINPanel:initialise()
	ISPanel.initialise(self);

	local txt = getText("UI_Text_BMSATM_EnterPIN")
	local label = ISLabel:new(self:getWidth()/2 - getTextManager():MeasureStringX(UIFont.Large, txt)/2, 130, FONT_HGT_LARGE, txt, 1, 1, 1, 1, UIFont.Large, true)
	label:initialise()
	self:addChild(label)

	local txt2 = getText("UI_Text_BMSATM_YourPINCode") .. ": " .. BMSATM.Money.ATM.getPIN(self.char)
	local label2 = ISLabel:new(680, 53, FONT_HGT_LARGE, txt2, 1, 1, 1, 1, UIFont.Large, true)
	label2:initialise()
	self:addChild(label2)

	local wCode = getTextManager():MeasureStringX(UIFont.Large, "_")

	self.CODE_1 = ISLabel:new(self:getWidth()/2 - wCode*2 - 10 - 5, label:getBottom() + 60, FONT_HGT_LARGE, "_", 1, 1, 1, 1, UIFont.Large, true)
	self.CODE_1:initialise()
	self:addChild(self.CODE_1)

	self.CODE_2 = ISLabel:new(self:getWidth()/2 - wCode - 5, label:getBottom() + 60, FONT_HGT_LARGE, "_", 1, 1, 1, 1, UIFont.Large, true)
	self.CODE_2:initialise()
	self:addChild(self.CODE_2)

	self.CODE_3 = ISLabel:new(self:getWidth()/2 + 5, label:getBottom() + 60, FONT_HGT_LARGE, "_", 1, 1, 1, 1, UIFont.Large, true)
	self.CODE_3:initialise()
	self:addChild(self.CODE_3)

	self.CODE_4 = ISLabel:new(self:getWidth()/2 + 5 + wCode + 10, label:getBottom() + 60, FONT_HGT_LARGE, "_", 1, 1, 1, 1, UIFont.Large, true)
	self.CODE_4:initialise()
	self:addChild(self.CODE_4)


end

function KRPATMPINPanel:onClick(button)
	for i = 0, 9 do
		local num = tostring(i)
		if button.internal == ("BUTTON_PANEL_" .. num) then
			self:addNumber(num)
		end
	end
	if button.internal == "BUTTON_PANEL_CLEAR" then
		self.pinNumber = ""
		self.countOfNumbers = 0
	end
	if button.internal == "BUTTON_PANEL_ENTER" and self.countOfNumbers == 4 then
		if self:isCodeValid() then
			self.window:gotoPanel("mainPanel")
		else
			self.pinNumber = ""
			self.countOfNumbers = 0
		end
	end
	self:updatePinVisual()
end

function KRPATMPINPanel:isCodeValid()
	return self.pinNumber == BMSATM.Money.ATM.getPIN(self.char)
end

function KRPATMPINPanel:addNumber(number)
	if self.countOfNumbers < 4 then
		self.pinNumber = self.pinNumber .. number
		self.countOfNumbers = self.countOfNumbers + 1
	end
end

function KRPATMPINPanel:updatePinVisual()
	for i = 1, 4 do
		if i <= self.countOfNumbers then
			self[("CODE_" .. tostring(i))]:setName("*")
		else
			self[("CODE_" .. tostring(i))]:setName("_")
		end
	end
end

function KRPATMPINPanel:new(x, y, width, height, character, window)
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
	o.pinNumber = ""
	o.countOfNumbers = 0

	return o;
end