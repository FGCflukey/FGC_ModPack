if not getMoreBuildPlusInstance then
  require('MoreBuildPlusings/MoreBuildPluss_Main')
end

local MoreBuildPlus = getMoreBuildPlusInstance()

MoreBuildPlus.wallsRoof5MenuBuilder = function(subMenu, player)
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
    Woodwork = 4
  }

  local _wallsRoof5Data = MoreBuildPlus.getwallsRoof5Data()

  for _, _currentList in pairs(_wallsRoof5Data) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, MoreBuildPlus.onBuildwallsRoof5, _sprite, player, _name)

    _tooltip = MoreBuildPlus.canBuildObject(needSkills, _option, player)
    _tooltip.description = _currentList[6] .. _tooltip.description
    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end


MoreBuildPlus.getwallsRoof5Data = function()
  local _wallsRoof5Data = {

        {
      'walls_exterior_roofs_03_0',
      'walls_exterior_roofs_03_8',
      'walls_exterior_roofs_03_0',
      'walls_exterior_roofs_03_8',
      "Small Right Facing",
      "Roof walls."
    },
    {
      'walls_exterior_roofs_03_1',
      'walls_exterior_roofs_03_9',
      'walls_exterior_roofs_03_1',
      'walls_exterior_roofs_03_9',
      "Medium Right Facing",
      "Roof walls."
    },
    {
      'walls_exterior_roofs_03_2',
      'walls_exterior_roofs_03_10',
      'walls_exterior_roofs_03_2',
      'walls_exterior_roofs_03_10',
      "Large Right Facing",
      "Roof walls."
    },
    {
      'walls_exterior_roofs_03_5',
      'walls_exterior_roofs_03_13',
      'walls_exterior_roofs_03_5',
      'walls_exterior_roofs_03_13',
      "Small Left Facing",
      "Roof walls."
    },
    {
      'walls_exterior_roofs_03_4',
      'walls_exterior_roofs_03_12',
      'walls_exterior_roofs_03_4',
      'walls_exterior_roofs_03_12',
      "Medium Left Facing",
      "Roof walls."
    },
    {
      'walls_exterior_roofs_03_3',
      'walls_exterior_roofs_03_11',
      'walls_exterior_roofs_03_3',
      'walls_exterior_roofs_03_11',
      "Large Left Facing",
      "Roof walls."
    },
    {
      'walls_exterior_roofs_03_15',
      'walls_exterior_roofs_03_7',
      'walls_exterior_roofs_03_15',
      'walls_exterior_roofs_03_7',
      "Half Wall",
      "Roof walls."
    }
	
  }
  return _wallsRoof5Data
end


MoreBuildPlus.onBuildwallsRoof5 = function(ignoreThisArgument, sprite, player, name)
  local _sign = ISSimpleFurniture:new(name, sprite.sprite, sprite.northSprite)

  _sign.player = player
  _sign.name = name
  _sign.eastSprite = sprite.eastSprite
  _sign.southSprite = sprite.southSprite
  _sign.northSprite = sprite.northSprite
  _sign.canPassThrough = false
  _sign.blockAllTheSquare = false
  _sign.isCorner = true

  _sign.modData['need:Base.Plank'] = 4
  _sign.modData['need:Base.Nails'] = 4
  _sign.modData['xp:Woodwork'] = 4

  getCell():setDrag(_sign, player)
end

