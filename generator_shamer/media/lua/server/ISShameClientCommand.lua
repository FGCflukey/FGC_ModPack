if not isServer() then return end
local Commands = {}
Commands.GenShame = {}

Commands.GenShame.Shame = function(player, args)
    if isClient() then return end
    sendServerCommand("GenShamer", "Shamer", {
        player:getUsername()
    })
end

local onClientCommand = function(module, command, player, args)
    print("CLIENT COMMAND " .. module .. " " .. command)
    if Commands[module] and Commands[module][command] then
        Commands[module][command](player, args)
    end
end

Events.OnClientCommand.Add(onClientCommand)
