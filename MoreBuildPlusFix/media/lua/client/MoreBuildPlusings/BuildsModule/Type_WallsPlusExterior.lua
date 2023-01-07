if not getMoreBuildPlusInstance then
  require('MoreBuildPlusings/MoreBuildPluss_Main')
end

local MoreBuildPlus = getMoreBuildPlusInstance()

MoreBuildPlus.wallsPlusExteriorMenuBuilder = function(subMenu, player)
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

  local _wallsPlusExteriorData = MoreBuildPlus.getwallsPlusExteriorData()

  for _, _currentList in pairs(_wallsPlusExteriorData) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, MoreBuildPlus.onBuildwallsPlusExterior, _sprite, player, _name)

    _tooltip = MoreBuildPlus.canBuildObject(needSkills, _option, player)
    _tooltip.description = _currentList[6] .. _tooltip.description
    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end


MoreBuildPlus.getwallsPlusExteriorData = function()
  local _wallsPlusExteriorData = {

        {
      'walls_exterior_house_01_32',
      'walls_exterior_house_01_33',
      'walls_exterior_house_01_32',
      'walls_exterior_house_01_33',
      "White Wood Panel",
      "Exterior wall."
    },
    {
      'walls_exterior_house_01_34',
      'walls_exterior_house_01_34',
      'walls_exterior_house_01_34',
      'walls_exterior_house_01_34',
      "White Wood Corner",
      "Exterior wall."
    },
    {
      'walls_exterior_house_01_48',
      'walls_exterior_house_01_49',
      'walls_exterior_house_01_48',
      'walls_exterior_house_01_49',
      "Brown Wood Panel",
      "Exterior wall."
    },
    {
      'walls_exterior_house_01_50',
      'walls_exterior_house_01_50',
      'walls_exterior_house_01_50',
      'walls_exterior_house_01_50',
      "Brown Wood Corner",
      "Exterior wall."
    },
    {
      'walls_exterior_house_02_32',
      'walls_exterior_house_02_33',
      'walls_exterior_house_02_32',
      'walls_exterior_house_02_33',
      "Beige Wood Panel ",
      "Exterior wall."
    },
    {
      'walls_exterior_house_02_34',
      'walls_exterior_house_02_34',
      'walls_exterior_house_02_34',
      'walls_exterior_house_02_34',
      "Beige Wood Corner ",
      "Exterior wall."
    },
    {
      'walls_exterior_house_02_68',
      'walls_exterior_house_02_69',
      'walls_exterior_house_02_68',
      'walls_exterior_house_02_69',
      "Pink Wood Panel",
      "Exterior wall."
    },
    {
      'walls_exterior_house_02_70',
      'walls_exterior_house_02_70',
      'walls_exterior_house_02_70',
      'walls_exterior_house_02_70',
      "Pink Wood Corner",
      "Exterior wall."
    },
    {
      'walls_exterior_house_02_80',
      'walls_exterior_house_02_81',
      'walls_exterior_house_02_80',
      'walls_exterior_house_02_81',
      "Green Wood Panel",
      "Exterior wall."
    },
    {
      'walls_exterior_house_02_82',
      'walls_exterior_house_02_82',
      'walls_exterior_house_02_82',
      'walls_exterior_house_02_82',
      "Green Wood Corner",
      "Exterior wall."
    },
    {
      'walls_exterior_house_02_0',
      'walls_exterior_house_02_1',
      'walls_exterior_house_02_0',
      'walls_exterior_house_02_1',
      "Gray Stone Walls",
      "Exterior wall."
    },
    {
      'walls_exterior_house_02_2',
      'walls_exterior_house_02_2',
      'walls_exterior_house_02_2',
      'walls_exterior_house_02_2',
      "Gray Stone Corner",
      "Exterior wall."
    },
    {
      'walls_exterior_house_02_4',
      'walls_exterior_house_02_5',
      'walls_exterior_house_02_4',
      'walls_exterior_house_02_5',
      "Beige Stone Walls",
      "Exterior wall."
    },
    {
      'walls_exterior_house_02_6',
      'walls_exterior_house_02_6',
      'walls_exterior_house_02_6',
      'walls_exterior_house_02_6',
      "Beige Stone Corner",
      "Exterior wall."
    }
	
	
  }
  return _wallsPlusExteriorData
end


MoreBuildPlus.onBuildwallsPlusExterior = function(ignoreThisArgument, sprite, player, name)
  local _sign = ISSimpleFurniture:new(name, sprite.sprite, sprite.northSprite)

  _sign.player = player
  _sign.name = name
  _sign.eastSprite = sprite.eastSprite
  _sign.southSprite = sprite.southSprite
  _sign.northSprite = sprite.northSprite
  _sign.canPassThrough = false
  _sign.blockAllTheSquare = false
  _sign.isCorner = true
  _sign.renderFloorHelper = true

  _sign.modData['need:Base.Plank'] = 4
  _sign.modData['need:Base.Nails'] = 4
  _sign.modData['xp:Woodwork'] = 10

  getCell():setDrag(_sign, player)
end

