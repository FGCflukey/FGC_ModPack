KRPATMWindow = ISPanel:derive("KRPATMWindow");

function KRPATMWindow:createChildren()
	ISPanel.createChildren(self)

	self:createButton(41, 255, 54, 38, "BUTTON_LEFT_1")
	self:createButton(41, 313, 54, 38, "BUTTON_LEFT_2")
	self:createButton(41, 371, 54, 38, "BUTTON_LEFT_3")
	self:createButton(41, 430, 54, 38, "BUTTON_LEFT_4")

	self:createButton(656, 255, 54, 38, "BUTTON_RIGHT_1")
	self:createButton(656, 313, 54, 38, "BUTTON_RIGHT_2")
	self:createButton(656, 371, 54, 38, "BUTTON_RIGHT_3")
	self:createButton(656, 430, 54, 38, "BUTTON_RIGHT_4")

	self:createButton(761, 191, 47, 47, "BUTTON_PANEL_1")
	self:createButton(815, 191, 47, 47, "BUTTON_PANEL_2")
	self:createButton(869, 191, 47, 47, "BUTTON_PANEL_3")
	self:createButton(761, 243, 47, 47, "BUTTON_PANEL_4")
	self:createButton(815, 243, 47, 47, "BUTTON_PANEL_5")
	self:createButton(869, 243, 47, 47, "BUTTON_PANEL_6")
	self:createButton(761, 296, 47, 47, "BUTTON_PANEL_7")
	self:createButton(815, 296, 47, 47, "BUTTON_PANEL_8")
	self:createButton(869, 296, 47, 47, "BUTTON_PANEL_9")
	self:createButton(815, 348, 47, 47, "BUTTON_PANEL_0")

	self:createButton(923, 191, 62, 47, "BUTTON_PANEL_CANCEL")
	self:createButton(923, 243, 62, 47, "BUTTON_PANEL_CLEAR")
	self:createButton(923, 296, 62, 47, "BUTTON_PANEL_ENTER")

	---

	self.depositDatas = ISScrollingListBox:new(765, 422, 219, 88);
    self.depositDatas:initialise();
    self.depositDatas:instantiate();
    self.depositDatas.itemheight = 22;
    self.depositDatas.selected = 0;
    self.depositDatas.font = UIFont.NewSmall;
    self.depositDatas.drawBorder = true;
	self.depositDatas:setVisible(false)
    self:addChild(self.depositDatas);

	--- PANELS
	self.pinPanel = KRPATMPINPanel:new(116, 88, 520, 390, self.char, self);
	self.pinPanel:initialise();
	self:addChild(self.pinPanel);
	self.currentPanel = self.pinPanel

	self.mainPanel = KRPATMMainPanel:new(116, 88, 520, 390, self.char, self)
	self.mainPanel:initialise();
	self.mainPanel:setVisible(false)
	self:addChild(self.mainPanel);

	self.balancePanel = KRPATMBalancePanel:new(116, 88, 520, 390, self.char, self)
	self.balancePanel:initialise()
	self.balancePanel:setVisible(false)
	self:addChild(self.balancePanel);

	self.withdrawalPanel = KRPATMWithdrawalPanel:new(116, 88, 520, 390, self.char, self)
	self.withdrawalPanel:initialise()
	self.withdrawalPanel:setVisible(false)
	self:addChild(self.withdrawalPanel);

	self.depositPanel = KRPATMDepositPanel:new(116, 88, 520, 390, self.char, self)
	self.depositPanel:initialise()
	self.depositPanel:setVisible(false)
	self:addChild(self.depositPanel);

	self.historyPanel = KRPATMHistoryPanel:new(116, 88, 520, 390, self.char, self)
	self.historyPanel:initialise()
	self.historyPanel:setVisible(false)
	self:addChild(self.historyPanel);

	self.transferPanel = KRPATMTransferPanel:new(116, 88, 520, 390, self.char, self)
	self.transferPanel:initialise()
	self.transferPanel:setVisible(false)
	self:addChild(self.transferPanel);
end

function KRPATMWindow:createButton(x, y, w, h, name)
	self[name] = ISButton:new(x, y, w, h, "", self, KRPATMWindow.onClick)
	self[name].internal = name
	self[name].borderColor = {r=1, g=1, b=1, a=0};
	self[name].backgroundColor = {r=1, g=1, b=1, a=0};
	self[name].backgroundColorMouseOver = {r=0, g=0, b=0, a=0.1};
	self[name].sounds.activate = "BMSATM_ATM_BEEP"
	self[name]:initialise();
	self[name]:instantiate();
	self:addChild(self[name]);
end

function KRPATMWindow:close()
	self:setVisible(false);
	self:removeFromUIManager();
end

function KRPATMWindow:onClick(button)
	if button.internal == "BUTTON_PANEL_CANCEL" then
		self:close()
	else
		self.currentPanel:onClick(button)
	end
end

function KRPATMWindow:update()
	if IsoUtils.DistanceTo(self.interactX, self.interactY, self.char:getX(), self.char:getY()) > 2 then 
		self:close() 
	end
end

function KRPATMWindow:gotoPanel(panelName)
	self.pinPanel:setVisible(false)
	self.mainPanel:setVisible(false)
	self.balancePanel:setVisible(false)
	self.withdrawalPanel:setVisible(false)
	self.depositPanel:setVisible(false)
	self.transferPanel:setVisible(false)
	self.historyPanel:setVisible(false)

	self[panelName]:setVisible(true)
	self.currentPanel = self[panelName]
end

function KRPATMWindow:prerender()
	ISPanel:prerender(self)
	self:drawTexture(self.texture, 0, 0,1,1,1,1)
end

function KRPATMWindow:new(character)
	local o = {}
	local width = 999;
	local height = 572;
	o = ISPanel:new(0, 0, width, height);
	setmetatable(o, self)
	self.__index = self
	o.playerNum = character:getPlayerNum()
	o.x = getCore():getScreenWidth() / 2 - (width / 2);
	o.y = getCore():getScreenHeight() / 2 - (height / 2);
	o:setX(o.x)
	o:setY(o.y)
	o.backgroundColor = {r=0, g=0, b=0, a=0};
	o.texture = getTexture("media/ui/ATM_background.png")
	o.leftButtonTexture = getTexture("media/ui/ATM_leftButton.png")
	o.rightButtonTexture = getTexture("media/ui/ATM_rightButton.png")

	o.width = width;
	o.height = height;
	o.char = character;

	o.interactX = character:getX()
	o.interactY = character:getY()

	return o;
end
