if BMSATM == nil then BMSATM = {} end
BMSATM.Commands = {}
BMSATM.Commands.MoneyBalance = {}

BMSATM.StartMoneySum = 0

-----
-----

function BMSATM.OnInitGlobalModData()
    ModData.getOrCreate("MoneyBalance")
end
Events.OnInitGlobalModData.Add(BMSATM.OnInitGlobalModData)

-----
-----

local function getCurrentDate()
    local gameTime = getGameTime()
    return tostring(gameTime:getMonth()+1) .. "/" .. tostring(gameTime:getDay()+1) .. "/" .. tostring(gameTime:getYear()) .. " " .. tostring(math.floor(gameTime:getTimeOfDay())) .. ":" .. tostring(gameTime:getMinutes())
end

--- MoneyBalance
BMSATM.Commands.MoneyBalance.CreatePlayerAccount = function(playerObj)
    ModData.get("MoneyBalance")[playerObj:getUsername()] = { 
        num = BMSATM.StartMoneySum,
        pin = tostring(ZombRand(10)) .. tostring(ZombRand(10)) .. tostring(ZombRand(10)) .. tostring(ZombRand(10)),
        history = {}
        }
    ModData.transmit("MoneyBalance")
end

BMSATM.Commands.MoneyBalance.DecreaseMoneyBalance = function(playerObj, args)
    local balance = ModData.get("MoneyBalance")
    if balance[playerObj:getUsername()] == nil then
        BMSATM.Commands.MoneyBalance.CreatePlayerAccount(playerObj)
    end
    balance[playerObj:getUsername()].num = balance[playerObj:getUsername()].num - args.num
    
    balance[playerObj:getUsername()].history = balance[playerObj:getUsername()].history or {}
    local val = { operation = "WITHDRAWAL", num = args.num, date = getCurrentDate() }
    table.insert(balance[playerObj:getUsername()].history, val)
    
    ModData.transmit("MoneyBalance")
end

BMSATM.Commands.MoneyBalance.IncreaseMoneyBalance = function(playerObj, args)
    local balance = ModData.get("MoneyBalance")
    if balance[playerObj:getUsername()] == nil then
        BMSATM.Commands.MoneyBalance.CreatePlayerAccount(playerObj)
    end
    balance[playerObj:getUsername()].num = balance[playerObj:getUsername()].num + args.num

    balance[playerObj:getUsername()].history = balance[playerObj:getUsername()].history or {}
    local val = { operation = "DEPOSIT", num = args.num, date = getCurrentDate() }
    table.insert(balance[playerObj:getUsername()].history, val)

    ModData.transmit("MoneyBalance")
end

BMSATM.Commands.MoneyBalance.TransferMoney = function(playerObj, args)
    local balance = ModData.get("MoneyBalance")
    if balance[args.nickname] ~= nil and balance[playerObj:getUsername()] ~= nil then
        balance[playerObj:getUsername()].num = balance[playerObj:getUsername()].num - args.num
        balance[args.nickname].num = balance[args.nickname].num + args.num

        balance[args.nickname].history = balance[args.nickname].history or {}
        balance[playerObj:getUsername()].history = balance[playerObj:getUsername()].history or {}
        local val = { operation = "TRANSFERFROM", num = args.num, date = getCurrentDate(), user = playerObj:getUsername() }
        table.insert(balance[args.nickname].history, val)
        val = { operation = "TRANSFERTO", num = args.num, date = getCurrentDate(), user = args.nickname }
        table.insert(balance[playerObj:getUsername()].history, val)
    else
        print("Wrong transfer operation:" .. args.nickname .. " " .. args.num)
    end
    ModData.transmit("MoneyBalance")
end

-------

BMSATM.Commands.OnClientCommand = function(module, command, playerObj, args)
	if module == 'BMSATMDataBase' and BMSATM.Commands[args.tableName][command] then
		BMSATM.Commands[args.tableName][command](playerObj, args)
	end
end
Events.OnClientCommand.Add(BMSATM.Commands.OnClientCommand)

-------

-- Create bank account
function BMSATM.EveryOneMinute()    
    local balance = ModData.get("MoneyBalance")
    local playerList = getOnlinePlayers()
    if playerList == nil then return end

    for i = 0, playerList:size()-1 do
        local player = playerList:get(i)
        local username = player:getUsername()
        if balance[username] == nil then
            BMSATM.Commands.MoneyBalance.CreatePlayerAccount(player)
        end
    end
end
Events.EveryOneMinute.Add(BMSATM.EveryOneMinute)