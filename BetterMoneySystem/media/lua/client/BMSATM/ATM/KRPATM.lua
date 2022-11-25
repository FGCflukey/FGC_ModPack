if BMSATM == nil then BMSATM = {} end
BMSATM.Money = BMSATM.Money or {}
BMSATM.Money.ATM = {}

BMSATM.Money.ATM.getMoneyBalance = function(playerObj)
    local balance = ModData.getOrCreate("MoneyBalance")
    local username = playerObj:getUsername()

    if balance[username] == nil then
        return -1
    else
        return balance[username].num
    end
end

BMSATM.Money.ATM.decreaseMoneyBalance = function(playerObj, nnum)
    sendClientCommand(playerObj, 'BMSATMDataBase', 'DecreaseMoneyBalance', { tableName = "MoneyBalance", num = nnum } )
end

BMSATM.Money.ATM.increaseMoneyBalance = function(playerObj, nnum)
    sendClientCommand(playerObj, 'BMSATMDataBase', 'IncreaseMoneyBalance', { tableName = "MoneyBalance", num = nnum } )
end

BMSATM.Money.ATM.getPIN = function(playerObj)
    local balance = ModData.getOrCreate("MoneyBalance")
    local username = playerObj:getUsername()

    if balance[username] == nil then
        return "0000"
    else
        return balance[username].pin
    end
end

BMSATM.Money.ATM.isAccountExist = function(nickname)
    local balance = ModData.getOrCreate("MoneyBalance")
    return balance[nickname] ~= nil
end

BMSATM.Money.ATM.transferMoney = function(playerObj, nnum, nnickname)
    sendClientCommand(playerObj, 'BMSATMDataBase', 'TransferMoney', { tableName = "MoneyBalance", num = nnum, nickname = nnickname} )
end

BMSATM.Money.ATM.withdrawalMoney = function(playerObj, num)
    while num > 0 do
        local max = 0
        local maxType = ""
        for itemType, data in pairs(BMSATM.Money.Values) do
            if num >= data.v then
                max = data.v
                maxType = itemType
            end
        end
        if max == 0 then return end
        playerObj:getInventory():AddItem(maxType)
        num = num - max
    end
end




