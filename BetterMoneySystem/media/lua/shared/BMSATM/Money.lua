if BMSATM == nil then BMSATM = {} end
BMSATM.Money = BMSATM.Money or {}
BMSATM.Money.Values = {}

BMSATM.Money.Values["BMSATM.1Dollar"] = { v = 1 }
BMSATM.Money.Values["BMSATM.2Dollar"] = { v = 2 }
BMSATM.Money.Values["BMSATM.5Dollar"] = { v = 5 }
BMSATM.Money.Values["BMSATM.10Dollar"] = { v = 10 }
BMSATM.Money.Values["BMSATM.20Dollar"] = { v = 20 }
BMSATM.Money.Values["BMSATM.50Dollar"] = { v = 50 }
BMSATM.Money.Values["BMSATM.100Dollar"] = { v = 100 }
BMSATM.Money.Values["BMSATM.1KDollar"] = { v = 1000 }
BMSATM.Money.Values["BMSATM.2KDollar"] = { v = 2000 }
BMSATM.Money.Values["BMSATM.5KDollar"] = { v = 5000 }
BMSATM.Money.Values["BMSATM.10KDollar"] = { v = 10000 }
BMSATM.Money.Values["BMSATM.20KDollar"] = { v = 20000 }
BMSATM.Money.Values["BMSATM.50KDollar"] = { v = 50000 }
BMSATM.Money.Values["BMSATM.100KDollar"] = { v = 100000 }

BMSATM.Money.Wallets = {}
BMSATM.Money.Wallets["Base.Wallet"] = true
BMSATM.Money.Wallets["Base.Wallet2"] = true
BMSATM.Money.Wallets["Base.Wallet3"] = true
BMSATM.Money.Wallets["Base.Wallet4"] = true

BMSATM.Money.getMoneyCountInContainer = function(container)
    local sum = 0
    local itemsList = container:getItems()
    for i = 0, itemsList:size()-1 do
        local item = itemsList:get(i)
        if item:getCategory() == "Container" then
            sum = sum + BMSATM.Money.getMoneyCountInContainer(item:getItemContainer())
        end
        if BMSATM.Money.Values[item:getFullType()] ~= nil then
            sum = sum + BMSATM.Money.Values[item:getFullType()].v
        end
    end
    return sum
end