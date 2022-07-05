if not isServer() then return end
local Commands = {}
Commands.Event_Teleporter = {}

Commands.Event_Teleporter.OnGameStart = function(player, args)
    if getGameTime():getModData().serverPlayerOriginPos == nil then
        getGameTime():getModData().serverPlayerOriginPos = {}
    end

    if getGameTime():getModData().serverPlayerAtEvent == nil then
        getGameTime():getModData().serverPlayerAtEvent = {}
    end

    local player_at_event = false
    if getGameTime():getModData().serverPlayerAtEvent[player:getUsername()] ~=
        nil then
        player_at_event =
            getGameTime():getModData().serverPlayerAtEvent[player:getUsername()]
    end
    print("OnGameStart:", player:getUsername())
    sendServerCommand(player, "Event_Teleporter", "Update_Player", {
        getGameTime():getModData().serverPlayerOriginPos[player:getUsername()],
        getGameTime():getModData().serverEventTeleportPos,
        player_at_event
    })
end

Commands.Event_Teleporter.OnTeleportToEvent =
    function(player, args)
        if getGameTime():getModData().serverPlayerOriginPos == nil then
            getGameTime():getModData().serverPlayerOriginPos = {}
        end

        if getGameTime():getModData().serverPlayerAtEvent == nil then
            getGameTime():getModData().serverPlayerAtEvent = {}
        end

        getGameTime():getModData().serverPlayerOriginPos[player:getUsername()] =
            {
                player:getX(),
                player:getY(),
                player:getZ()
            }
        getGameTime():getModData().serverPlayerAtEvent[player:getUsername()] =
            true

        sendServerCommand(player, "Event_Teleporter", "Update_Player", {
            getGameTime():getModData().serverPlayerOriginPos[player:getUsername()],
            getGameTime():getModData().serverEventTeleportPos,
            true
        })

        sendServerCommand(player, "Event_Teleporter", "Teleport_Player", {
            getGameTime():getModData().serverEventTeleportPos
        })

    end

Commands.Event_Teleporter.OnTeleportToOrigin =
    function(player, args)
        if getGameTime():getModData().serverPlayerOriginPos == nil then
            getGameTime():getModData().serverPlayerOriginPos = {}
        end

        if getGameTime():getModData().serverPlayerAtEvent == nil then
            getGameTime():getModData().serverPlayerAtEvent = {}
        end

        -- Limit to one round trip
        -- getGameTime():getModData().serverPlayerAtEvent[player:getUsername()] =
        --    false

        sendServerCommand(player, "Event_Teleporter", "Teleport_Player", {
            getGameTime():getModData().serverPlayerOriginPos[player:getUsername()]
        })
        getGameTime():getModData().serverPlayerOriginPos[player:getUsername()] =
            nil
        sendServerCommand(player, "Event_Teleporter", "Update_Player", {
            getGameTime():getModData().serverPlayerOriginPos[player:getUsername()],
            getGameTime():getModData().serverEventTeleportPos,
            getGameTime():getModData().serverPlayerAtEvent[player:getUsername()]
        })

    end
Commands.Event_Teleporter.SetTeleportEvent =
    function(player_not_used, args)
        print(args[0])
        print(args[1])
        getGameTime():getModData().serverEventTeleportPos = args[1]

        if getGameTime():getModData().serverPlayerOriginPos == nil then
            getGameTime():getModData().serverPlayerOriginPos = {}
        end

        if getGameTime():getModData().serverPlayerAtEvent == nil then
            getGameTime():getModData().serverPlayerAtEvent = {}
        end

        local players = getOnlinePlayers();
        local array_size = players:size();
        for i = 0, array_size - 1, 1 do
            local player = players:get(i);

            getGameTime():getModData().serverPlayerAtEvent[player:getUsername()] =
                false

            sendServerCommand(player, "Event_Teleporter", "Update_Player", {
                getGameTime():getModData().serverPlayerOriginPos[player:getUsername()],
                getGameTime():getModData().serverEventTeleportPos,
                false
            })
        end
    end
local onClientCommand = function(module, command, player, args)
    if Commands[module] and Commands[module][command] then
        Commands[module][command](player, args)
    end
end

Events.OnClientCommand.Add(onClientCommand)
