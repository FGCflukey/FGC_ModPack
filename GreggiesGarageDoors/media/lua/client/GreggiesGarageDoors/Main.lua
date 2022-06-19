local CacheObjectContext = {}
local GreggiesGarageDoors = {}

GreggiesGarageDoors.availableMaterialsList = {}
GreggiesGarageDoors.neededMaterials = {}
GreggiesGarageDoors.neededTools = {}
GreggiesGarageDoors.toolsList = {}
GreggiesGarageDoors.toolsText = {}
GreggiesGarageDoors.playerCarpentrySkill = 0
GreggiesGarageDoors.playerCanPlaster = false
GreggiesGarageDoors.textTooltipHeader = ' <RGB:2,2,2> <LINE> <LINE>' .. getText('Tooltip_craft_Needs') .. ' : <LINE> '
GreggiesGarageDoors.textCarpentryRed = ''
GreggiesGarageDoors.textCarpentryGreen = ''
GreggiesGarageDoors.textCanRotate = '<LINE> <RGB:1,1,1>' .. getText('Tooltip_craft_pressToRotate', Keyboard.getKeyName(getCore():getKey('Rotate building')))
GreggiesGarageDoors.textDoorFrameDescription = getText('Tooltip_DoorFrame_Description')

GreggiesGarageDoors.skillLevel = {
  simpleObject = 1,
  doorObject = 3,
  garageDoorObject = 6,
  none = 0
}

GreggiesGarageDoors.getMoveableDisplayName = function(sprite)
  local props = getSprite(sprite):getProperties()
  local getMoveableDisplayName = Translator.getMoveableDisplayName
  if props:Is('CustomName') then
    local name = props:Val('CustomName')
    if props:Is('GroupName') then
      name = props:Val('GroupName') .. ' ' .. name
    end
    return getMoveableDisplayName(name)
  end
  return false
end

GreggiesGarageDoors.doBuildMenu = function(player, context, worldobjects, test)
  if getCore():getGameMode() == 'LastStand' then
    return
  end

  if test and ISWorldObjectContextMenu.Test then
    return true
  end

  local playerObj = getSpecificPlayer(player)
  print(playerObj)
  if playerObj:getVehicle() then
    return
  end

  if GreggiesGarageDoors.haveAToolToBuildWithWith(player) then
    GreggiesGarageDoors.playerCarpentrySkill = getSpecificPlayer(player):getPerkLevel(Perks.Woodwork)

    if GreggiesGarageDoors.playerCarpentrySkill > 7 or ISBuildMenu.cheat then
      GreggiesGarageDoors.playerCanPlaster = true
    else
      GreggiesGarageDoors.playerCanPlaster = false
    end

    GreggiesGarageDoors.textCarpentryRed = ' <RGB:1,0,0>' .. getText('IGUI_perks_Carpentry') .. ' ' .. GreggiesGarageDoors.playerCarpentrySkill .. '/'
    GreggiesGarageDoors.textCarpentryGreen = ' <RGB:1,1,1>' .. getText('IGUI_perks_Carpentry') .. ' '
    GreggiesGarageDoors.buildMaterialsList(player)

    -- Build Garage Door
    -- ****************************************************
    local _firstTierMenu = context:addOption(getText('ContextMenu_GreggiesGarageDoors'), worldobjects, nil)
    local _secondTierMenu = ISContextMenu:getNew(context)
    context:addSubMenu(_firstTierMenu, _secondTierMenu)

    -- Small Garage
    -- *****************************************************
    local _garageOption = _secondTierMenu:addOption(getText('ContextMenu_GreggiesGarageDoors_Small'), worldobjects, nil)
    local _garageThirdTierMenu = _secondTierMenu:getNew(_secondTierMenu)
    context:addSubMenu(_garageOption, _garageThirdTierMenu)
    GreggiesGarageDoors.garageDoorMenuBuilder3x3(_garageThirdTierMenu, player, context, worldobjects)

    -- Large Garage
    -- *****************************************************
    local _garageOption2 = _secondTierMenu:addOption(getText('ContextMenu_GreggiesGarageDoors_Large'), worldobjects, nil)
    local _garageThirdTierMenu2 = _secondTierMenu:getNew(_secondTierMenu)
    context:addSubMenu(_garageOption2, _garageThirdTierMenu2)
    GreggiesGarageDoors.garageDoorMenuBuilder4x4(_garageThirdTierMenu2, player, context, worldobjects)

    -- Fancy Garage
    -- *****************************************************
    local _garageOption3 = _secondTierMenu:addOption(getText('ContextMenu_GreggiesGarageDoors_Fancy'), worldobjects, nil)
    local _garageThirdTierMenu3 = _secondTierMenu:getNew(_secondTierMenu)
    context:addSubMenu(_garageOption3, _garageThirdTierMenu3)
    GreggiesGarageDoors.garageDoorMenuBuilderFancy(_garageThirdTierMenu3, player, context, worldobjects)

  end
end

GreggiesGarageDoors.haveAToolToBuildWithWith = function(player)
  local _inventory = getSpecificPlayer(player):getInventory()
  GreggiesGarageDoors.toolsList = {}
	GreggiesGarageDoors.toolsList['Hammer'] = _inventory:contains('Hammer')
  GreggiesGarageDoors.toolsList['Screwdriver'] = _inventory:contains('Screwdriver')
  GreggiesGarageDoors.toolsList['HandShovel'] = _inventory:contains('HandShovel')
  GreggiesGarageDoors.toolsList['Saw'] = _inventory:contains('Saw')
  GreggiesGarageDoors.toolsList['Spade'] = _inventory:contains('Shovel')

  GreggiesGarageDoors.toolsText['Hammer'] = getItemNameFromFullType('Base.Hammer')
  GreggiesGarageDoors.toolsText['Screwdriver'] = getItemNameFromFullType('Base.Screwdriver')
  GreggiesGarageDoors.toolsText['HandShovel'] = getItemNameFromFullType('farming.HandShovel')
  GreggiesGarageDoors.toolsText['Saw'] = getItemNameFromFullType('base.Saw')
  GreggiesGarageDoors.toolsText['Spade'] = getItemNameFromFullType('Base.Shovel')

  return GreggiesGarageDoors.toolsList['Hammer']
end

local function predicateNotBroken(item)
	return not item:isBroken()
end

GreggiesGarageDoors.equipToolPrimary = function(object, player, tool)
  local tool = nil
  if GreggiesGarageDoors.toolsList[tool] then
    tool = getSpecificPlayer(player):getInventory():getFirstTagEvalRecurse(tool, predicateNotBroken)
    if not tool then error("invalid tool!") return end
    ISInventoryPaneContextMenu.equipWeapon(tool, true, false, player)

    object.noNeedHammer = true
  end
end

GreggiesGarageDoors.equipToolSecondary = function(object, player, tool)
  local tool = nil
  if GreggiesGarageDoors.toolsList[tool] then
    tool = getSpecificPlayer(player):getInventory():getFirstTagEvalRecurse(tool, predicateNotBroken)
    if not tool then error("invalid tool!") return end
    ISInventoryPaneContextMenu.equipWeapon(tool, false, false, player)
  end
end

GreggiesGarageDoors.buildMaterialsList = function(player)
  GreggiesGarageDoors.availableMaterialsList = buildUtil.checkMaterialOnGround(getSpecificPlayer(player):getCurrentSquare())

  local _inventoryList = getSpecificPlayer(player):getInventory():getItems()
  local _size = _inventoryList:size()
  local _currentItemType = ''

  for i = 0, _size - 1 do
    _currentItemType = _inventoryList:get(i):getType()

    if GreggiesGarageDoors.availableMaterialsList[_currentItemType] then
      GreggiesGarageDoors.availableMaterialsList[_currentItemType] = GreggiesGarageDoors.availableMaterialsList[_currentItemType] + 1
    else
      GreggiesGarageDoors.availableMaterialsList[_currentItemType] = 1
    end
  end
end

GreggiesGarageDoors.tooltipCheckForMaterial = function(material, amount, text, tooltip)
  if amount > 0 then
    local _thisItemCount = 0

    if GreggiesGarageDoors.availableMaterialsList[material] then
      _thisItemCount = GreggiesGarageDoors.availableMaterialsList[material]
    else
      _thisItemCount = 0
    end

    if _thisItemCount < amount then
      tooltip.description = tooltip.description .. ' <RGB:1,0,0>' .. text .. ' ' .. _thisItemCount .. '/' .. amount .. ' <LINE>'
      return false
    else
      tooltip.description = tooltip.description .. ' <RGB:1,1,1>' .. text .. ' ' .. amount .. ' <LINE>'
      return true
    end
  end
  return true
end

GreggiesGarageDoors.tooltipCheckForTool = function(tool, tooltip)
  if GreggiesGarageDoors.toolsList and GreggiesGarageDoors.toolsList[tool] then
    tooltip.description = tooltip.description .. ' <RGB:1,1,1>' .. GreggiesGarageDoors.toolsText[tool] .. ' <LINE>'
    return true
  else
    tooltip.description = tooltip.description .. ' <RGB:1,0,0>' .. GreggiesGarageDoors.toolsText[tool] .. ' <LINE>'
    return false
  end
end

GreggiesGarageDoors.canBuildObject = function(carpentry, option, player)
  local _tooltip = ISToolTip:new()
  _tooltip:initialise()
  _tooltip:setVisible(false)
  option.toolTip = _tooltip

  local _canBuildResult = true

  _tooltip.description = GreggiesGarageDoors.textTooltipHeader

  local _currentResult = true

  for _, _currentMaterial in pairs(GreggiesGarageDoors.neededMaterials) do
    if _currentMaterial['Material'] and _currentMaterial['Amount'] and _currentMaterial['Text'] then
      _currentResult = GreggiesGarageDoors.tooltipCheckForMaterial(_currentMaterial['Material'], _currentMaterial['Amount'], _currentMaterial['Text'], _tooltip)
    else
      _tooltip.description = _tooltip.description .. ' <RGB:1,0,0> Error in required material definition. <LINE>'
      _canBuildResult = false
    end

    if not _currentResult then
      _canBuildResult = false
    end
  end

  for _, _currentTool in pairs(GreggiesGarageDoors.neededTools) do
    _currentResult = GreggiesGarageDoors.tooltipCheckForTool(_currentTool, _tooltip)

    if not _currentResult then
      _canBuildResult = false
    end
  end

  if carpentry > 0 then
    if GreggiesGarageDoors.playerCarpentrySkill < carpentry then
      _tooltip.description = _tooltip.description .. GreggiesGarageDoors.textCarpentryRed
      _canBuildResult = false
    else
      _tooltip.description = _tooltip.description .. GreggiesGarageDoors.textCarpentryGreen
    end

    _tooltip.description = _tooltip.description .. carpentry .. ' <LINE>'
  end

  if not _canBuildResult and not ISBuildMenu.cheat then
    option.onSelect = nil
    option.notAvailable = true
  end
  return _tooltip
end

function getGreggiesGarageDoorsInstance()
  return GreggiesGarageDoors
end

Events.OnFillWorldObjectContextMenu.Add(GreggiesGarageDoors.doBuildMenu)