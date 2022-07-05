Event_Menu = {}

Event_Menu.doMenu = function(player, context, worldobjects, test)
    if test and ISWorldObjectContextMenu.Test then return true end
    local playerObj = getPlayer()
    if playerObj:getModData().eventTeleportPos ~= nil and
        playerObj:getModData().playerAtEvent ~= nil and
        not playerObj:getModData().playerAtEvent then
        context:addOption("Teleport to Event", playerObj,
                          Event_Menu.onTeleportToEvent, worldobjects);
    end
    if playerObj:getModData().playerOriginPos ~= nil then
        context:addOption("Teleport to Origin", playerObj,
                          Event_Menu.onTeleportToOrigin, worldobjects);
    end
    if (isClient() and isAdmin()) then
        if playerObj:getModData().eventTeleportPos == nil then
            context:addOption("Set Event Position", playerObj,
                              Event_Menu.onSetTeleportEvent)
        else
            context:addOption("End Event", playerObj,
                              Event_Menu.onUnsetTeleportEvent)
        end
    end
end

Event_Menu.onTeleportToEvent = function(player, worldobjects)
    sendClientCommand(getPlayer(), "Event_Teleporter", "OnTeleportToEvent", {
        player:getOnlineID()
    })
end

Event_Menu.onTeleportToOrigin = function(player, worldobjects)
    sendClientCommand(getPlayer(), "Event_Teleporter", "OnTeleportToOrigin", {
        player:getOnlineID()
    })
end

Event_Menu.onSetTeleportEvent = function(player, worldobjects)
    sendClientCommand(getPlayer(), "Event_Teleporter", "SetTeleportEvent", {
        {
            player:getX(),
            player:getY(),
            0
        },
        player:getOnlineID()
    })
end

Event_Menu.onUnsetTeleportEvent = function(player, worldobjects)
    sendClientCommand(getPlayer(), "Event_Teleporter", "SetTeleportEvent", {
        nil,
        player:getOnlineID()
    })
end

Events.OnFillWorldObjectContextMenu.Add(Event_Menu.doMenu);

