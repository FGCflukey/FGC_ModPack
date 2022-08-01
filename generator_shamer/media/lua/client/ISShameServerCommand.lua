if not isClient() then return end
local Commands = {}
Commands.GenShamer = {}

Commands.GenShamer.Shamer = function(arguments)
    local player_name = arguments[1]
    ISChat.shame("SHAME ON " .. player_name ..
                     ", THEY TRIED TO STEAL A GENERATOR FROM A GAS STATION!!")
end

local function OnServerCommand(module, command, arguments)
    if Commands[module] and Commands[module][command] then
        Commands[module][command](arguments)
    end
end

Events.OnServerCommand.Add(OnServerCommand)
