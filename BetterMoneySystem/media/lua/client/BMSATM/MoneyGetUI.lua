MoneyGetUI = ISPanelJoypad:derive("MoneyGetUI");

local FONT_HGT_SMALL = getTextManager():getFontHeight(UIFont.Small)
local FONT_HGT_MEDIUM = getTextManager():getFontHeight(UIFont.Medium)
local FONT_HGT_LARGE = getTextManager():getFontHeight(UIFont.Large)

function MoneyGetUI:initialise()
	ISPanelJoypad.initialise(self);
	
	local fontHgt = FONT_HGT_SMALL
	local buttonWid = 150
	local buttonHgt = math.max(fontHgt + 6, 25)
	local padBottom = 10
	
	self.close = ISButton:new(self:getWidth()/2 - buttonWid/2, self:getHeight() - padBottom - buttonHgt, buttonWid, buttonHgt, getText("UI_Close"), self, MoneyGetUI.onClick);
	self.close.internal = "CLOSE";
	self.close:initialise();
	self.close:instantiate();
	self.close.borderColor = {r=1, g=1, b=1, a=0.1};
	self:addChild(self.close);

	self.get = ISButton:new(self:getWidth()/2 - buttonWid/2, self.close:getY() - padBottom - buttonHgt, buttonWid, buttonHgt, "Get", self, MoneyGetUI.onClick);
	self.get.internal = "GET";
	self.get:initialise();
	self.get:instantiate();
	self.get.borderColor = {r=1, g=1, b=1, a=0.1};
	self:addChild(self.get);

    local txt = getText("UI_Text_BMSATM_Money") .. ": " .. self.wallet:getModData().moneyCount .. "$"
    self.labelMoneyCount = ISLabel:new(self:getWidth()/2 - getTextManager():MeasureStringX(UIFont.Large, txt)/2, 30, FONT_HGT_LARGE, txt, 1, 1, 1, 1, UIFont.Large, true)
	self.labelMoneyCount:initialise()
	self:addChild(self.labelMoneyCount)

    self.entrySum = ISTextEntryBox:new("", 10, self.labelMoneyCount:getBottom() + 10, 180, FONT_HGT_MEDIUM)
	self.entrySum.font = UIFont.Medium
	self.entrySum:initialise();
	self.entrySum:instantiate();
    self.entrySum:setOnlyNumbers(true)
	self:addChild(self.entrySum)
end

function MoneyGetUI:destroy()
	UIManager.setShowPausedMessage(true);
	self:setVisible(false);
	self:removeFromUIManager();
end

function MoneyGetUI:onClick(button)
    if button.internal == "CLOSE" then
		self:destroy();
		return;
	end
	if button.internal == "GET" and self.entrySum:getText() ~= nil and tonumber(self.entrySum:getText()) <= self.wallet:getModData().moneyCount and tonumber(self.entrySum:getText()) > 0 then
        BMSATM.Money.ATM.withdrawalMoney(self.player, tonumber(self.entrySum:getText()))
        self.wallet:getModData().moneyCount = self.wallet:getModData().moneyCount - tonumber(self.entrySum:getText())
		self:destroy()
	end
end

function MoneyGetUI:titleBarHeight()
	return 16
end

function MoneyGetUI:prerender()
	self.backgroundColor.a = 0.8
	
	self:drawRect(0, 0, self.width, self.height, self.backgroundColor.a, self.backgroundColor.r, self.backgroundColor.g, self.backgroundColor.b);
	
	local th = self:titleBarHeight()
	self:drawTextureScaled(self.titlebarbkg, 2, 1, self:getWidth() - 4, th - 2, 1, 1, 1, 1);
	
	self:drawRectBorder(0, 0, self.width, self.height, self.borderColor.a, self.borderColor.r, self.borderColor.g, self.borderColor.b);
end

function MoneyGetUI:onMouseMove(dx, dy)
	self.mouseOver = true
	if self.moving then
		self:setX(self.x + dx)
		self:setY(self.y + dy)
		self:bringToTop()
	end
end

function MoneyGetUI:onMouseMoveOutside(dx, dy)
	self.mouseOver = false
	if self.moving then
		self:setX(self.x + dx)
		self:setY(self.y + dy)
		self:bringToTop()
	end
end

function MoneyGetUI:onMouseDown(x, y)
	if not self:getIsVisible() then
		return
	end
	self.downX = x
	self.downY = y
	self.moving = true
	self:bringToTop()
end

function MoneyGetUI:onMouseUp(x, y)
	if not self:getIsVisible() then
		return;
	end
	self.moving = false
	if ISMouseDrag.tabPanel then
		ISMouseDrag.tabPanel:onMouseUp(x,y)
	end
	ISMouseDrag.dragView = nil
end

function MoneyGetUI:onMouseUpOutside(x, y)
	if not self:getIsVisible() then
		return
	end
	self.moving = false
	ISMouseDrag.dragView = nil
end

function MoneyGetUI:new(wallet, playerObj)
	local o = {}
	local w = 200
	local h = 180
	o = ISPanelJoypad:new(0, 0, w, h);
	setmetatable(o, self)
	self.__index = self

    o.x = getCore():getScreenWidth() / 2 - (w / 2);
    o:setX(o.x)
	o.y = getCore():getScreenHeight() / 2 - (h / 2);
    o:setY(o.y)

	o.name = nil;
	o.backgroundColor = {r=0, g=0, b=0, a=0.5};
	o.borderColor = {r=0.4, g=0.4, b=0.4, a=1};
	o.width = w;
	o.height = h;
    o.wallet = wallet
    o.player = playerObj
	o.anchorLeft = true;
	o.anchorRight = true;
	o.anchorTop = true;
	o.anchorBottom = true;
	o.titlebarbkg = getTexture("media/ui/Panel_TitleBar.png");
	return o;
end
