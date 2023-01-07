if not getMoreBuildPlusInstance then
  require('MoreBuildPlusings/MoreBuildPluss_Main')
end

local MoreBuildPlus = getMoreBuildPlusInstance()

MoreBuildPlus.wallsRoof2MenuBuilder = function(subMenu, player)
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

  local _wallsRoof2Data = MoreBuildPlus.getwallsRoof2Data()

  for _, _currentList in pairs(_wallsRoof2Data) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, MoreBuildPlus.onBuildwallsRoof2, _sprite, player, _name)

    _tooltip = MoreBuildPlus.canBuildObject(needSkills, _option, player)
    _tooltip.description = _currentList[6] .. _tooltip.description
    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end


MoreBuildPlus.getwallsRoof2Data = function()
  local _wallsRoof2Data = {

        {
      'walls_exterior_roofs_03_24',
      'walls_exterior_roofs_03_32',
      'walls_exterior_roofs_03_24',
      'walls_exterior_roofs_03_32',
      "Small Right Facing",
      "Roof walls."
    },
    {
      'walls_exterior_roofs_03_25',
      'walls_exterior_roofs_03_33',
      'walls_exterior_roofs_03_25',
      'walls_exterior_roofs_03_33',
      "Medium Right Facing",
      "Roof walls."
    },
    {
      'walls_exterior_roofs_03_26',
      'walls_exterior_roofs_03_34',
      'walls_exterior_roofs_03_26',
      'walls_exterior_roofs_03_34',
      "Large Right Facing",
      "Roof walls."
    },
    {
      'walls_exterior_roofs_03_29',
      'walls_exterior_roofs_03_37',
      'walls_exterior_roofs_03_29',
      'walls_exterior_roofs_03_37',
      "Small Left Facing",
      "Roof walls."
    },
    {
      'walls_exterior_roofs_03_28',
      'walls_exterior_roofs_03_36',
      'walls_exterior_roofs_03_28',
      'walls_exterior_roofs_03_36',
      "Medium Left Facing",
      "Roof walls."
    },
    {
      'walls_exterior_roofs_03_27',
      'walls_exterior_roofs_03_35',
      'walls_exterior_roofs_03_27',
      'walls_exterior_roofs_03_35',
      "Large Left Facing",
      "Roof walls."
    },
    {
      'walls_exterior_roofs_03_39',
      'walls_exterior_roofs_03_31',
      'walls_exterior_roofs_03_39',
      'walls_exterior_roofs_03_31',
      "Half Wall",
      "Roof walls."
    }
	
  }
  return _wallsRoof2Data
end


MoreBuildPlus.onBuildwallsRoof2 = function(ignoreThisArgument, sprite, player, name)
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
  _sign.modData['xp:Woodwork'] = 5

  getCell():setDrag(_sign, player)
end

