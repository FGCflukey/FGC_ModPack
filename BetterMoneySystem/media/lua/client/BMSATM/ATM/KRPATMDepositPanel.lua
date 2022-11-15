local FONT_HGT_MEDIUM = getTextManager():getFontHeight(UIFont.Medium)
local FONT_HGT_LARGE = getTextManager():getFontHeight(UIFont.Large)

--------

KRPATMDepositPanel = ISPanel:derive("KRPATMDepositPanel");

function KRPATMDepositPanel:initialise()
	ISPanel.initialise(self);

    local label = ISLabel:new(50, 50, FONT_HGT_MEDIUM, getText("UI_Text_BMSATM_DragAndDropMoney"), 1, 1, 1, 0.7, UIFont.Medium, true)
	label:initialise()
	self:addChild(label)
    
    label = ISLabel:new(50, 75, FONT_HGT_MEDIUM, "(" .. getText("UI_Text_BMSATM_MoneyReceivingUnit") .. ")", 1, 1, 1, 0.7, UIFont.Medium, true)
	label:initialise()
	self:addChild(label)

    self.depositDatas = self.window.depositDatas
    self.depositDatas.doDrawItem = self.drawOffer;
    self.depositDatas.onMouseUp = self.yourOfferMouseUp;

    label = ISLabel:new(self:getWidth() - 15, 155 + (25 - FONT_HGT_MEDIUM/2), FONT_HGT_MEDIUM, getText("UI_Text_BMSATM_Deposit"), 0.2352941, 0.2745098, 0.3607843, 1, UIFont.Medium, false)
	label:initialise()
	self:addChild(label)

    label = ISLabel:new(self:getWidth() - 15, 339 + (25 - FONT_HGT_MEDIUM/2), FONT_HGT_MEDIUM, getText("UI_Text_BMSATM_Back"), 0.2352941, 0.2745098, 0.3607843, 1, UIFont.Medium, false)
	label:initialise()
	self:addChild(label)
end

function KRPATMDepositPanel:drawOffer(y, item, alt)
    local a = 0.9;

    self:drawRectBorder(0, (y), self:getWidth(), self.itemheight - 1, a, self.borderColor.r, self.borderColor.g, self.borderColor.b);

    if self.selected == item.index then
        self:drawRect(0, (y), self:getWidth(), self.itemheight - 1, 0.3, 0.7, 0.35, 0.15);
    end

    self:drawTextureScaledAspect(item.item:getTex(), 5, y + 2, 18, 18, 1, item.item:getR(), item.item:getG(), item.item:getB());
    self:drawText(item.text, 25, y + 2, 1, 1, 1, a, self.font);

    return y + self.itemheight;
end
  
function KRPATMDepositPanel:setVisible(val)
    ISUIElement.setVisible(self, val)
    self.depositDatas:setVisible(val)
end

function KRPATMDepositPanel:yourOfferMouseUp(x, y)
    if self.vscroll then
        self.vscroll.scrolling = false;
    end
    local counta = 1;
    if ISMouseDrag.dragging then
        for i,v in ipairs(ISMouseDrag.dragging) do
            counta = 1;
            if instanceof(v, "InventoryItem") then
                if BMSATM.Money.Values[v:getFullType()] ~= nil and v:getOutermostContainer() == getPlayer():getInventory() then
                    self.parent.depositPanel:addItemToYourOffer(v);
                end
            else
                if v.invPanel.collapsed[v.name] then
                    counta = 1;
                    for i2,v2 in ipairs(v.items) do
                        if counta > 1 then
                                if BMSATM.Money.Values[v2:getFullType()] ~= nil and v2:getOutermostContainer() == getPlayer():getInventory() then
                                    self.parent.depositPanel:addItemToYourOffer(v2);
                                end
                        end
                        counta = counta + 1;
                    end
                end
            end
        end
    end
end


function KRPATMDepositPanel:addItemToYourOffer(item)
    local add = true;
    for i,v in ipairs(self.depositDatas.items) do
        if v.item == item then
            add = false;
            break;
        end
    end
    if add then
        self.depositDatas:addItem(item:getName(), item);
        if #self.depositDatas.items == 1 then
            self.depositDatas.selected = 1;
        end
    end
end

function KRPATMDepositPanel:onClick(button)
    if button.internal == "BUTTON_RIGHT_1" and #self.depositDatas.items > 0 then
        local sum = 0
        for _, item in ipairs(self.depositDatas.items) do
            sum = sum + BMSATM.Money.Values[item.item:getFullType()].v
            item.item:getContainer():Remove(item.item)
        end
        
        BMSATM.Money.ATM.increaseMoneyBalance(self.char, sum)

        self.depositDatas:clear()
        self.window:gotoPanel("mainPanel")
	end
    if button.internal == "BUTTON_RIGHT_4" then -- EXIT
        self.window:gotoPanel("mainPanel")
	end
end

function KRPATMDepositPanel:prerender()
	ISPanel:prerender(self)

    self:drawTexture(self.window.rightButtonTexture, 265, 155, 1,1,1,1)
    self:drawTexture(self.window.rightButtonTexture, 265, 339, 1,1,1,1)
end

function KRPATMDepositPanel:new(x, y, width, height, character, window)
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