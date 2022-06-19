if not getGreggiesGarageDoorsInstance then
  require('GreggiesGarageDoors/Main')
end

local GreggiesGarageDoors = getGreggiesGarageDoorsInstance()

GreggiesGarageDoors.garageDoorMenuBuilder3x3 = function(subMenu, player)
  local _sprite
  local _option
  local _tooltip
  local _name = ''

  GreggiesGarageDoors.neededMaterials = {
    {
      Material = 'Plank',
      Amount = 8,
      Text = getItemNameFromFullType('Base.Plank')
    },
    {
      Material = 'Nails',
      Amount = 8,
      Text = getItemNameFromFullType('Base.Nails')
    },
    {
      Material = 'Doorknob',
      Amount = 2,
      Text = getItemNameFromFullType('Base.Doorknob')
    },
    {
      Material = 'Hinge',
      Amount = 4,
      Text = getItemNameFromFullType('Base.Hinge')
    },
    {
      Material = 'Screws',
      Amount = 8,
      Text = getItemNameFromFullType('Base.Screws')
    },
    {
      Material = 'SmallSheetMetal',
      Amount = 4,
      Text = getItemNameFromFullType('Base.SmallSheetMetal')
    }
  }

  GreggiesGarageDoors.neededTools = {'Hammer', 'Screwdriver', 'Saw'}

  _sprite = {}
  _sprite.sprite = 'walls_garage_01_'

  _name = getText 'ContextMenu_Small_Green_Garage_Door'

  _option = subMenu:addOption(_name, nil, GreggiesGarageDoors.onBuildGarageDoor3x3, _sprite, 16, player)
  _tooltip = GreggiesGarageDoors.canBuildObject(GreggiesGarageDoors.skillLevel.garageDoorObject, _option, player)
  _tooltip:setName(_name)
  _tooltip.description = getText 'Tooltip_Small_Green_Garage_Door' .. _tooltip.description
  _tooltip:setTexture(_sprite.sprite .. 17)

  _name = getText 'ContextMenu_Small_White_Garage_Door'

  _option = subMenu:addOption(_name, nil, GreggiesGarageDoors.onBuildGarageDoor3x3, _sprite, 0, player)
  _tooltip = GreggiesGarageDoors.canBuildObject(GreggiesGarageDoors.skillLevel.garageDoorObject, _option, player)
  _tooltip:setName(_name)
  _tooltip.description = getText 'Tooltip_Small_White_Garage_Door' .. _tooltip.description
  _tooltip:setTexture(_sprite.sprite .. 1)

  _name = getText 'ContextMenu_Small_Grey_Garage_Door'

  _option = subMenu:addOption(_name, nil, GreggiesGarageDoors.onBuildGarageDoor3x3, _sprite, 48, player)
  _tooltip = GreggiesGarageDoors.canBuildObject(GreggiesGarageDoors.skillLevel.garageDoorObject, _option, player)
  _tooltip:setName(_name)
  _tooltip.description = getText 'Tooltip_Small_Grey_Garage_Door' .. _tooltip.description
  _tooltip:setTexture(_sprite.sprite .. 49)

  _sprite = {}
  _sprite.sprite = 'walls_garage_02_'

  _name = getText 'ContextMenu_Small_Red_Window_Garage_Door'

  _option = subMenu:addOption(_name, nil, GreggiesGarageDoors.onBuildGarageDoor3x3, _sprite, 32, player)
  _tooltip = GreggiesGarageDoors.canBuildObject(GreggiesGarageDoors.skillLevel.garageDoorObject, _option, player)
  _tooltip:setName(_name)
  _tooltip.description = getText 'Tooltip_Small_Red_Window_Garage_Door' .. _tooltip.description
  _tooltip:setTexture(_sprite.sprite .. 33)

  _name = getText 'ContextMenu_Small_Rolling_Garage_Door'

  _option = subMenu:addOption(_name, nil, GreggiesGarageDoors.onBuildGarageDoor3x3, _sprite, 0, player)
  _tooltip = GreggiesGarageDoors.canBuildObject(GreggiesGarageDoors.skillLevel.garageDoorObject, _option, player)
  _tooltip:setName(_name)
  _tooltip.description = getText 'Tooltip_Small_Rolling_Garage_Door' .. _tooltip.description
  _tooltip:setTexture(_sprite.sprite .. 1)

  _name = getText 'ContextMenu_Small_Gray_Window_Garage_Door'

  _option = subMenu:addOption(_name, nil, GreggiesGarageDoors.onBuildGarageDoor3x3, _sprite, 48, player)
  _tooltip = GreggiesGarageDoors.canBuildObject(GreggiesGarageDoors.skillLevel.garageDoorObject, _option, player)
  _tooltip:setName(_name)
  _tooltip.description = getText 'Tooltip_Small_Gray_Window_Garage_Door' .. _tooltip.description
  _tooltip:setTexture(_sprite.sprite .. 49)

end

GreggiesGarageDoors.garageDoorMenuBuilder4x4 = function(subMenu, player)
  local _sprite
  local _option
  local _tooltip
  local _name = ''

  GreggiesGarageDoors.neededMaterials = {
    {
      Material = 'Plank',
      Amount = 14,
      Text = getItemNameFromFullType('Base.Plank')
    },
    {
      Material = 'Nails',
      Amount = 16,
      Text = getItemNameFromFullType('Base.Nails')
    },
    {
      Material = 'Doorknob',
      Amount = 4,
      Text = getItemNameFromFullType('Base.Doorknob')
    },
    {
      Material = 'Hinge',
      Amount = 8,
      Text = getItemNameFromFullType('Base.Hinge')
    },
    {
      Material = 'Screws',
      Amount = 18,
      Text = getItemNameFromFullType('Base.Screws')
    },
    {
      Material = 'SmallSheetMetal',
      Amount = 14,
      Text = getItemNameFromFullType('Base.SmallSheetMetal')
    }
  }

  GreggiesGarageDoors.neededTools = {'Hammer', 'Screwdriver', 'Saw'}

  -- walls_garage_01
  -- ****************************************************
  _sprite = {}
  _sprite.sprite = 'walls_garage_01_'

  _name = getText 'ContextMenu_Large_White_Garage_Door'

  _option = subMenu:addOption(_name, nil, GreggiesGarageDoors.onBuildGarageDoor4x4, _sprite, 0, player)
  _tooltip = GreggiesGarageDoors.canBuildObject(GreggiesGarageDoors.skillLevel.garageDoorObject, _option, player)
  _tooltip:setName(_name)
  _tooltip.description = getText 'Tooltip_Large_White_Garage_Door' .. _tooltip.description
  _tooltip:setTexture(_sprite.sprite .. 1)

  _name = getText 'ContextMenu_Large_Green_Garage_Door'

  _option = subMenu:addOption(_name, nil, GreggiesGarageDoors.onBuildGarageDoor4x4, _sprite, 16, player)
  _tooltip = GreggiesGarageDoors.canBuildObject(GreggiesGarageDoors.skillLevel.garageDoorObject, _option, player)
  _tooltip:setName(_name)
  _tooltip.description = getText 'Tooltip_Large_Green_Garage_Door' .. _tooltip.description
  _tooltip:setTexture(_sprite.sprite .. 17)

  _name = getText 'ContextMenu_Large_Grey_Garage_Door'

  _option = subMenu:addOption(_name, nil, GreggiesGarageDoors.onBuildGarageDoor4x4, _sprite, 48, player)
  _tooltip = GreggiesGarageDoors.canBuildObject(GreggiesGarageDoors.skillLevel.garageDoorObject, _option, player)
  _tooltip:setName(_name)
  _tooltip.description = getText 'Tooltip_Large_Grey_Garage_Door' .. _tooltip.description
  _tooltip:setTexture(_sprite.sprite .. 49)

  -- walls_garage_02
  -- ****************************************************
  _sprite = {}
  _sprite.sprite = 'walls_garage_02_'

  _name = getText 'ContextMenu_Large_Rolling_Garage_Door'

  _option = subMenu:addOption(_name, nil, GreggiesGarageDoors.onBuildGarageDoor4x4, _sprite, 0, player)
  _tooltip = GreggiesGarageDoors.canBuildObject(GreggiesGarageDoors.skillLevel.garageDoorObject, _option, player)
  _tooltip:setName(_name)
  _tooltip.description = getText 'Tooltip_Large_Rolling_Garage_Door' .. _tooltip.description
  _tooltip:setTexture(_sprite.sprite .. 1)

  _name = getText 'ContextMenu_Large_Red_Window_Garage_Door'

  _option = subMenu:addOption(_name, nil, GreggiesGarageDoors.onBuildGarageDoor4x4, _sprite, 32, player)
  _tooltip = GreggiesGarageDoors.canBuildObject(GreggiesGarageDoors.skillLevel.garageDoorObject, _option, player)
  _tooltip:setName(_name)
  _tooltip.description = getText 'Tooltip_Large_Red_Window_Garage_Door' .. _tooltip.description
  _tooltip:setTexture(_sprite.sprite .. 33)

  _name = getText 'ContextMenu_Large_Gray_Window_Garage_Door'

  _option = subMenu:addOption(_name, nil, GreggiesGarageDoors.onBuildGarageDoor4x4, _sprite, 48, player)
  _tooltip = GreggiesGarageDoors.canBuildObject(GreggiesGarageDoors.skillLevel.garageDoorObject, _option, player)
  _tooltip:setName(_name)
  _tooltip.description = getText 'Tooltip_Large_Gray_Window_Garage_Door' .. _tooltip.description
  _tooltip:setTexture(_sprite.sprite .. 49)

end

GreggiesGarageDoors.garageDoorMenuBuilderFancy = function(subMenu, player)
  local _sprite
  local _option
  local _tooltip
  local _name = ''

  GreggiesGarageDoors.neededMaterials = {
    {
      Material = 'Plank',
      Amount = 10,
      Text = getItemNameFromFullType('Base.Plank')
    },
    {
      Material = 'Nails',
      Amount = 10,
      Text = getItemNameFromFullType('Base.Nails')
    },
    {
      Material = 'Doorknob',
      Amount = 4,
      Text = getItemNameFromFullType('Base.Doorknob')
    },
    {
      Material = 'Hinge',
      Amount = 8,
      Text = getItemNameFromFullType('Base.Hinge')
    },
    {
      Material = 'Screws',
      Amount = 12,
      Text = getItemNameFromFullType('Base.Screws')
    },
    {
      Material = 'SmallSheetMetal',
      Amount = 6,
      Text = getItemNameFromFullType('Base.SmallSheetMetal')
    }
  }

  GreggiesGarageDoors.neededTools = {'Hammer', 'Screwdriver', 'Saw'}

  -- walls_garage_06_1
  -- ****************************************************
  _sprite = {}
  _sprite.sprite = 'walls_garage_06_'

  _name = getText 'ContextMenu_Fancy_Cheese_Door'

  _option = subMenu:addOption(_name, nil, GreggiesGarageDoors.onBuildGarageDoorFancy, _sprite, 0, player)
  _tooltip = GreggiesGarageDoors.canBuildObject(GreggiesGarageDoors.skillLevel.garageDoorObject, _option, player)
  _tooltip:setName(_name)
  _tooltip.description = getText 'Tooltip_Fancy_Cheese_Door' .. _tooltip.description
  _tooltip:setTexture(_sprite.sprite .. 1)

  _name = getText 'ContextMenu_Fancy_Falafel_Door'

  _option = subMenu:addOption(_name, nil, GreggiesGarageDoors.onBuildGarageDoorFancy, _sprite, 32, player)
  _tooltip = GreggiesGarageDoors.canBuildObject(GreggiesGarageDoors.skillLevel.garageDoorObject, _option, player)
  _tooltip:setName(_name)
  _tooltip.description = getText 'Tooltip_Fancy_Falafel_Door' .. _tooltip.description
  _tooltip:setTexture(_sprite.sprite .. 33)

  _name = getText 'ContextMenu_Fancy_xCudi_Door'

  _option = subMenu:addOption(_name, nil, GreggiesGarageDoors.onBuildGarageDoorFancy, _sprite, 48, player)
  _tooltip = GreggiesGarageDoors.canBuildObject(GreggiesGarageDoors.skillLevel.garageDoorObject, _option, player)
  _tooltip:setName(_name)
  _tooltip.description = getText 'Tooltip_Fancy_xCudi_Door' .. _tooltip.description
  _tooltip:setTexture(_sprite.sprite .. 49)

  -- walls_garage_07_1
  -- ****************************************************
  _name = getText 'ContextMenu_Fancy_Spiffo_Door'
  _sprite = {}
  _sprite.sprite = 'walls_garage_07_'

  _option = subMenu:addOption(_name, nil, GreggiesGarageDoors.onBuildGarageDoorFancy, _sprite, 0, player)
  _tooltip = GreggiesGarageDoors.canBuildObject(GreggiesGarageDoors.skillLevel.garageDoorObject, _option, player)
  _tooltip:setName(_name)
  _tooltip.description = getText 'Tooltip_Fancy_Spiffo_Door' .. _tooltip.description
  _tooltip:setTexture(_sprite.sprite .. 1)

end

GreggiesGarageDoors.onBuildGarageDoor3x3 = function(whoActuallyCares, sprite, spriteIndex, player)
  local _garageDoor = ISGarageDoor:new1(sprite.sprite, spriteIndex)

  _garageDoor.player = player

  _garageDoor.modData['need:Base.Plank'] = '8'
  _garageDoor.modData['need:Base.Nails'] = '8'
  _garageDoor.modData['need:Base.Doorknob'] = '2'
  _garageDoor.modData['need:Base.Hinge'] = '4'
  _garageDoor.modData['need:Base.Screws'] = '8'
  _garageDoor.modData['need:Base.SmallSheetMetal'] = '4'
  _garageDoor.modData['xp:Woodwork'] = '15'

  getCell():setDrag(_garageDoor, player)
end

GreggiesGarageDoors.onBuildGarageDoor4x4 = function(whoActuallyCares, sprite, spriteIndex, player)
  local _garageDoor = ISBigGarageDoor:new2(sprite.sprite, spriteIndex)

  _garageDoor.player = player

  _garageDoor.modData['need:Base.Plank'] = '14'
  _garageDoor.modData['need:Base.Nails'] = '16'
  _garageDoor.modData['need:Base.Doorknob'] = '4'
  _garageDoor.modData['need:Base.Hinge'] = '8'
  _garageDoor.modData['need:Base.Screws'] = '18'
  _garageDoor.modData['need:Base.SmallSheetMetal'] = '14'
  _garageDoor.modData['xp:Woodwork'] = '15'

  getCell():setDrag(_garageDoor, player)
end

GreggiesGarageDoors.onBuildGarageDoorFancy = function(whoActuallyCares, sprite, spriteIndex, player)
  local _garageDoor = ISFancyGarageDoor:new3(sprite.sprite, spriteIndex)

  _garageDoor.player = player

  _garageDoor.modData['need:Base.Plank'] = '10'
  _garageDoor.modData['need:Base.Nails'] = '10'
  _garageDoor.modData['need:Base.Doorknob'] = '4'
  _garageDoor.modData['need:Base.Hinge'] = '8'
  _garageDoor.modData['need:Base.Screws'] = '12'
  _garageDoor.modData['need:Base.SmallSheetMetal'] = '6'
  _garageDoor.modData['xp:Woodwork'] = '15'

  getCell():setDrag(_garageDoor, player)
end