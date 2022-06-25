SUPlocked_spawn_event = function(roomName, containerType, container)
	--locked_Spawn2(roomName, containerType, container)
	SUPlocked_Spawn(roomName, containerType, container)
end
local function IsActivatedMod(mod_Name)
    local mods = getActivatedMods();
    for i=0, mods:size()-1, 1 do
        if mods:get(i) == mod_Name then
            return true;
        end
    end
    return false;
end

if IsActivatedMod("Even Worse Looting") then
	Events.OnFillContainer.Add ( SUPlocked_spawn_event )
end

