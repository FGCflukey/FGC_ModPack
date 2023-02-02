if not getMoreBuildPlusInstance then
  require('MoreBuildPlusings/MoreBuildPluss_Main')
end

local MoreBuildPlus = getMoreBuildPlusInstance()

MoreBuildPlus.wallsRoof6MenuBuilder = function(subMenu, player)
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

  local _wallsRoof6Data = MoreBuildPlus.getwallsRoof6Data()

  for _, _currentList in pairs(_wallsRoof6Data) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, MoreBuildPlus.onBuildwallsRoof6, _sprite, player, _name)

    _tooltip = MoreBuildPlus.canBuildObject(needSkills, _option, player)
    _tooltip.description = _currentList[6] .. _tooltip.description
    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end


MoreBuildPlus.getwallsRoof6Data = function()
  local _wallsRoof6Data = {

        {
      'walls_exterior_roofs_09_0',
      'walls_exterior_roofs_09_8',
      'walls_exterior_roofs_09_0',
      'walls_exterior_roofs_09_8',
      "Small Right Facing",
      "Roof walls."
    },
    {
      'walls_exterior_roofs_09_1',
      'walls_exterior_roofs_09_9',
      'walls_exterior_roofs_09_1',
      'walls_exterior_roofs_09_9',
      "Medium Right Facing",
      "Roof walls."
    },
    {
      'walls_exterior_roofs_09_2',
      'walls_exterior_roofs_09_10',
      'walls_exterior_roofs_09_2',
      'walls_exterior_roofs_09_10',
      "Large Right Facing",
      "Roof walls."
    },
    {
      'walls_exterior_roofs_09_5',
      'walls_exterior_roofs_09_13',
      'walls_exterior_roofs_09_5',
      'walls_exterior_roofs_09_13',
      "Small Left Facing",
      "Roof walls."
    },
    {
      'walls_exterior_roofs_09_4',
      'walls_exterior_roofs_09_12',
      'walls_exterior_roofs_09_4',
      'walls_exterior_roofs_09_12',
      "Medium Left Facing",
      "Roof walls."
    },
    {
      'walls_exterior_roofs_09_3',
      'walls_exterior_roofs_09_11',
      'walls_exterior_roofs_09_3',
      'walls_exterior_roofs_09_11',
      "Large Left Facing",
      "Roof walls."
    },
    {
      'walls_exterior_roofs_09_15',
      'walls_exterior_roofs_09_7',
      'walls_exterior_roofs_09_15',
      'walls_exterior_roofs_09_7',
      "Half Wall",
      "Roof walls."
    }
	
  }
  return _wallsRoof6Data
end


MoreBuildPlus.onBuildwallsRoof6 = function(ignoreThisArgument, sprite, player, name)
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

