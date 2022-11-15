if BMSATM == nil then BMSATM = {} end
BMSATM.Money = BMSATM.Money or {}

function BMSATM.Money.PackMoneyContextOptions(player, context, items)
    local playerObj = getSpecificPlayer(player)
    local isWalletCheck = false
    local moneyItems = {}
    items = ISInventoryPane.getActualItems(items)
    for _, item in ipairs(items) do
        if item:getContainer() ~= playerObj:getInventory() then return end
        if BMSATM.Money.Values[item:getFullType()] ~= nil then
            table.insert(moneyItems, item)
        end        
        if BMSATM.Money.Wallets[item:getFullType()] then
            isWalletCheck = true
        end
    end

    local wallet = nil
    
    local invItems = playerObj:getInventory():getItems()
    for i = 0, invItems:size()-1 do
        local item = invItems:get(i) 
        if BMSATM.Money.Wallets[item:getFullType()] then
            wallet = item
            break           
        end
    end

    if wallet ~= nil then
        if wallet:getModData().moneyCount == nil then
            wallet:getModData().moneyCount = 0
        end
        if #moneyItems > 0 then
            context:addOption(getText("UI_Text_BMSATM_PutMoneyInWallet"), wallet, function(w, mItems) 
                local count = 0
                for _, val in ipairs(mItems) do
                    count = count + BMSATM.Money.Values[val:getFullType()].v
                    val:getContainer():Remove(val)
                end 
                w:getModData().moneyCount = w:getModData().moneyCount + count
            end, moneyItems)
        end
        if isWalletCheck then
            context:addOption(getText("UI_Text_BMSATM_GetMoney"), wallet, function(w, pl)
                local win = MoneyGetUI:new(w, pl) 
                win:initialise();
                win:addToUIManager();
            end, playerObj)
        end
    end
end
Events.OnFillInventoryObjectContextMenu.Add(BMSATM.Money.PackMoneyContextOptions)

-------------------------------------------

BMSATM.ItemTooltip = require("BMSATM/ItemTooltipAPI/ItemTooltipAPIClient")

local walletTooltip = BMSATM.ItemTooltip.CreateToolTip("Base.Wallet")
local function getTextLabelFunc(result, item)
    local count = item:getModData().moneyCount
    if count == nil then
        count = 0
    end
    result.value = getText("UI_Text_BMSATM_AmountOfMoney") .. ": " .. count
    result.labelColor = { r=0.6, g=1, b=0.6, a=1 }
end
walletTooltip:addLabel(getTextLabelFunc)

local walletTooltip2 = BMSATM.ItemTooltip.CreateToolTip("Base.Wallet2")
walletTooltip2:addLabel(getTextLabelFunc)

local walletTooltip3 = BMSATM.ItemTooltip.CreateToolTip("Base.Wallet3")
walletTooltip3:addLabel(getTextLabelFunc)

local walletTooltip4 = BMSATM.ItemTooltip.CreateToolTip("Base.Wallet4")
walletTooltip4:addLabel(getTextLabelFunc)