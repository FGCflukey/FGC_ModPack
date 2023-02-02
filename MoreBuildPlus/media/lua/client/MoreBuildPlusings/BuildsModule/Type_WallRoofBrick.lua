if not getMoreBuildPlusInstance then
  require('MoreBuildPlusings/MoreBuildPluss_Main')
end

local MoreBuildPlus = getMoreBuildPlusInstance()

MoreBuildPlus.wallRoofBrickMenuBuilder = function(subMenu, player)
  local _sprite
  local _option
  local _tooltip
  local _name = ''

  MoreBuildPlus.neededMaterials = {
    {
      Material = 'Base.Plank',
      Amount = 4
    },
    {
      Material = 'Base.Nails',
      Amount = 4
    }
  }

  MoreBuildPlus.neededTools = {'Hammer'}

  local needSkills = {
    Woodwork = 2
  }

  local _wallRoofBrickData = MoreBuildPlus.getwallRoofBrickData()

  for _, _currentList in pairs(_wallRoofBrickData) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, MoreBuildPlus.onBuildwallRoofBrick, _sprite, player, _name)

    _tooltip = MoreBuildPlus.canBuildObject(needSkills, _option, player)
    _tooltip.description = _currentList[6] .. _tooltip.description
    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end


MoreBuildPlus.getwallRoofBrickData = function()
  local _wallRoofBrickData = {

        {
      'walls_exterior_roofs_04_0',
      'walls_exterior_roofs_04_8',
      'walls_exterior_roofs_04_0',
      'walls_exterior_roofs_04_8',
      "Small Right Facing",
      "Roof walls."
    },
    {
      'walls_exterior_roofs_04_1',
      'walls_exterior_roofs_04_9',
      'walls_exterior_roofs_04_1',
      'walls_exterior_roofs_04_9',
      "Medium Right Facing",
      "Roof walls."
    },
    {
      'walls_exterior_roofs_04_2',
      'walls_exterior_roofs_04_10',
      'walls_exterior_roofs_04_2',
      'walls_exterior_roofs_04_10',
      "Large Right Facing",
      "Roof walls."
    },
    {
      'walls_exterior_roofs_04_5',
      'walls_exterior_roofs_04_13',
      'walls_exterior_roofs_04_5',
      'walls_exterior_roofs_04_13',
      "Small Left Facing",
      "Roof walls."
    },
    {
      'walls_exterior_roofs_04_4',
      'walls_exterior_roofs_04_12',
      'walls_exterior_roofs_04_4',
      'walls_exterior_roofs_04_12',
      "Medium Left Facing",
      "Roof walls."
    },
    {
      'walls_exterior_roofs_04_3',
      'walls_exterior_roofs_04_11',
      'walls_exterior_roofs_04_3',
      'walls_exterior_roofs_04_11',
      "Large Left Facing",
      "Roof walls."
    },
    {
      'walls_exterior_roofs_04_15',
      'walls_exterior_roofs_04_7',
      'walls_exterior_roofs_04_15',
      'walls_exterior_roofs_04_7',
      "Half Wall",
      "Roof walls."
    }
	
	
  }
  return _wallRoofBrickData
end


MoreBuildPlus.onBuildwallRoofBrick = function(ignoreThisArgument, sprite, player, name)
  local _sign = ISSimpleFurniture:new(name, sprite.sprite, sprite.northSprite)

  _sign.player = player
  _sign.name = name
  _sign.eastSprite = sprite.eastSprite
  _sign.southSprite = sprite.southSprite
  _sign.northSprite = sprite.northSprite
  _sign.canPassThrough = true
  _sign.blockAllTheSquare = false
  _sign.renderFloorHelper = true
  _sign.isCorner = true

  _sign.modData['need:Base.Plank'] = 4
  _sign.modData['need:Base.Nails'] = 4
  _sign.modData['xp:Woodwork'] = 2

  getCell():setDrag(_sign, player)
end

