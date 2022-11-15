if BMSATM == nil then BMSATM = {} end
BMSATM.WOContext = {}

function BMSATM.WOContext.removeDuplicates(wObjects)
    local newObjects = {}

    for i, v1 in ipairs(wObjects) do
        local isInList = false
        for j, v2 in ipairs(newObjects) do
            if v2 == v1 then
                isInList = true
                break
            end
        end
        if not isInList then
            table.insert(newObjects, v1)
        end
    end
    return newObjects
end

function BMSATM.WOContext.OnFillWorldObjectContextMenu(player, context, worldObjects, test)
	local playerObj = getSpecificPlayer(player)
    worldObjects = BMSATM.WOContext.removeDuplicates(worldObjects)

    local square = nil
    for i,v in ipairs(worldObjects) do
        local sq = v:getSquare()
        if sq ~= nil then
            square = sq
        end

        if v:getSprite() ~= nil and (v:getSprite():getName() == "ProjectRP_0" or v:getSprite():getName() == "ProjectRP_1") then
            context:addOption(getText("UI_Text_BMSATM_UseATM"), playerObj, function(pl) 
                local win = KRPATMWindow:new(pl);
                win:initialise();
                win:addToUIManager();
            end)
        end
    end

    if square ~= nil then
        if isClient() and isAdmin() or not isClient() then
            local adminOption = context:addOption("ATM", worldobjects)
            local subMenuAdmin = context:getNew(context)
            context:addSubMenu(adminOption, subMenuAdmin)

            subMenuAdmin:addOption("Add (north)", player, function(pl)
                getCell():setDrag(TilePickerPlacer:new("ProjectRP_0", "ProjectRP_0", getSpecificPlayer(pl)), pl)
            end)
            subMenuAdmin:addOption("Add (west)", player, function(pl)
                getCell():setDrag(TilePickerPlacer:new("ProjectRP_1", "ProjectRP_1", getSpecificPlayer(pl)), pl)
            end)
        end
    end
end
Events.OnFillWorldObjectContextMenu.Add(BMSATM.WOContext.OnFillWorldObjectContextMenu)