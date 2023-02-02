if not getMoreBuildPlusInstance then
  require('MoreBuildPlusings/MoreBuildPluss_Main')
end

local MoreBuildPlus = getMoreBuildPlusInstance()

MoreBuildPlus.WindowsPlusExteriorMenuBuilder = function(subMenu, player)
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

  local _WindowsPlusExteriorData = MoreBuildPlus.getWindowsPlusExteriorData()

  for _, _currentList in pairs(_WindowsPlusExteriorData) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, MoreBuildPlus.onBuildWindowsPlusExterior, _sprite, player, _name)

    _tooltip = MoreBuildPlus.canBuildObject(needSkills, _option, player)
    _tooltip.description = _currentList[6] .. _tooltip.description
    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end

MoreBuildPlus.getWindowsPlusExteriorData = function()
  local _WindowsPlusExteriorData = {

        {
      'walls_exterior_house_01_40',
      'walls_exterior_house_01_41',
      'walls_exterior_house_01_40',
      'walls_exterior_house_01_41',
      "White Wood Window",
      "Exterior wall."
    },
    {
      'walls_exterior_house_01_42',
      'walls_exterior_house_01_43',
      'walls_exterior_house_01_42',
      'walls_exterior_house_01_43',
      "White Wood Door Frame",
      "Exterior wall."
    },
    {
      'walls_exterior_house_01_56',
      'walls_exterior_house_01_57',
      'walls_exterior_house_01_56',
      'walls_exterior_house_01_57',
      "Brown Wood Window",
      "Exterior wall."
    },
    {
      'walls_exterior_house_01_58',
      'walls_exterior_house_01_59',
      'walls_exterior_house_01_58',
      'walls_exterior_house_01_59',
      "Brown Wood Door Frame",
      "Exterior wall."
    },
    {
      'walls_exterior_house_02_40',
      'walls_exterior_house_02_41',
      'walls_exterior_house_02_40',
      'walls_exterior_house_02_41',
      "Beige Wood Window ",
      "Exterior wall."
    },
    {
      'walls_exterior_house_02_42',
      'walls_exterior_house_02_43',
      'walls_exterior_house_02_42',
      'walls_exterior_house_02_43',
      "Beige Wood Door Frame ",
      "Exterior wall."
    },
    {
      'walls_exterior_house_02_76',
      'walls_exterior_house_02_77',
      'walls_exterior_house_02_76',
      'walls_exterior_house_02_77',
      "Pink Wood Window",
      "Exterior wall."
    },
    {
      'walls_exterior_house_02_78',
      'walls_exterior_house_02_79',
      'walls_exterior_house_02_78',
      'walls_exterior_house_02_79',
      "Pink Wood Door Frame",
      "Exterior wall."
    },
    {
      'walls_exterior_house_02_88',
      'walls_exterior_house_02_89',
      'walls_exterior_house_02_88',
      'walls_exterior_house_02_89',
      "Green Wood Window",
      "Exterior wall."
    },
    {
      'walls_exterior_house_02_90',
      'walls_exterior_house_02_91',
      'walls_exterior_house_02_90',
      'walls_exterior_house_02_91',
      "Green Wood Door Frame",
      "Exterior wall."
    },
    {
      'walls_exterior_house_02_8',
      'walls_exterior_house_02_9',
      'walls_exterior_house_02_8',
      'walls_exterior_house_02_9',
      "Gray Stone Window",
      "Exterior wall."
    },
    {
      'walls_exterior_house_02_10',
      'walls_exterior_house_02_11',
      'walls_exterior_house_02_10',
      'walls_exterior_house_02_11',
      "Gray Stone Door Frame",
      "Exterior wall."
    },
    {
      'walls_exterior_house_02_12',
      'walls_exterior_house_02_13',
      'walls_exterior_house_02_12',
      'walls_exterior_house_02_13',
      "Beige Stone Window",
      "Exterior wall."
    },
    {
      'walls_exterior_house_02_14',
      'walls_exterior_house_02_15',
      'walls_exterior_house_02_14',
      'walls_exterior_house_02_15',
      "Beige Stone Door Frame",
      "Exterior wall."
    }
	
	
	
	
	
  }
  return _WindowsPlusExteriorData
end


MoreBuildPlus.onBuildWindowsPlusExterior = function(ignoreThisArgument, sprite, player, name)
  local _sign = ISWoodenDoorFrame:new(sprite.sprite, sprite.northSprite, sprite.corner)

  _sign.player = player
  _sign.name = name
  _sign.eastSprite = sprite.eastSprite
  _sign.southSprite = sprite.southSprite
  _sign.northSprite = sprite.northSprite
  _sign.renderFloorHelper = true

  _sign.modData['need:Base.Plank'] = 4
  _sign.modData['need:Base.Nails'] = 4
  _sign.modData['xp:Woodwork'] = 10

  getCell():setDrag(_sign, player)
end

