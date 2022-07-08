if not isClient() then return end
local function OnGameStart()
    sendClientCommand(getPlayer(), "Event_Teleporter", "OnGameStart", {
        getPlayer():getOnlineID()
    });
    Events.OnTick.Remove(OnGameStart)
end

local Commands = {}
Commands.Event_Teleporter = {}

Commands.Event_Teleporter.Teleport_Player = function(arguments)
    print(arguments[0])
    print(arguments[1])
    print(arguments[2])
    local pos = arguments[1]
    local cellPosX = pos[1]
    local cellPosY = pos[2]
    print("X", cellPosX, " Y", cellPosY)
    local player = getPlayer()
    player:setX(cellPosX)
    player:setY(cellPosY)
    player:setZ(0)
    player:setLx(cellPosX)
    player:setLy(cellPosY)
    player:setLz(0)
end

Commands.Event_Teleporter.Update_Player = function(arguments)
    local player = getPlayer()
    print(arguments[1])
    print(arguments[2])
    print(arguments[3])
    player:getModData().playerOriginPos = arguments[1]
    player:getModData().eventTeleportPos = arguments[2]
    player:getModData().playerAtEvent = arguments[3]
end

local function OnServerCommand(module, command, arguments)
    if Commands[module] and Commands[module][command] then
        Commands[module][command](arguments)
    end
end

Events.OnServerCommand.Add(OnServerCommand)
Events.OnTick.Add(OnGameStart)
