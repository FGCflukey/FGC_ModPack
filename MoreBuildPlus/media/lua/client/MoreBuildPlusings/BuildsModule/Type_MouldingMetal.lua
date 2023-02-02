if not getMoreBuildPlusInstance then
  require('MoreBuildPlusings/MoreBuildPluss_Main')
end

local MoreBuildPlus = getMoreBuildPlusInstance()

MoreBuildPlus.mouldingMetalMenuBuilder = function(subMenu, player)
  local _sprite
  local _option
  local _tooltip
  local _name = ''

  MoreBuildPlus.neededMaterials = {
    {
      Material = 'Base.Stone',
      Amount = 1
    }
  }

  MoreBuildPlus.neededTools = {'Hammer'}

  local needSkills = {
    Woodwork = 2
  }

  local _mouldingMetalData = MoreBuildPlus.getmouldingMetalData()

  for _, _currentList in pairs(_mouldingMetalData) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, MoreBuildPlus.onBuildmouldingMetal, _sprite, player, _name)

    _tooltip = MoreBuildPlus.canBuildObject(needSkills, _option, player)
    _tooltip.description = _currentList[6] .. _tooltip.description
    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end

MoreBuildPlus.getmouldingMetalData = function()
  local _mouldingMetalData = {

    {
      'walls_detailing_01_8',
      'walls_detailing_01_10',
      'walls_detailing_01_8',
      'walls_detailing_01_10',
      "Stone Feature Right  ",
      " A stone feature for right facing walls. Usually on the exterior of buildings. "
    },
    {
      'walls_detailing_01_9',
      'walls_detailing_01_11',
      'walls_detailing_01_9',
      'walls_detailing_01_11',
      "Stone Feature Left ",
      " A stone feature for left facing walls. Usually on the exterior of buildings. "
    },
    {
      'walls_detailing_01_12',
      'walls_detailing_01_12',
      'walls_detailing_01_12',
      'walls_detailing_01_12',
      "Stone Feature Edge ",
      " A stone feature for edges or can be used as a pillar. "
    },
	{
      'walls_detailing_01_26',
      'walls_detailing_01_26',
      'walls_detailing_01_26',
      'walls_detailing_01_26',
      "Small Gray Edge",
      "Place after walls."
    },
	{
      'walls_detailing_01_72',
      'walls_detailing_01_73',
      'walls_detailing_01_72',
      'walls_detailing_01_73',
      "Stone Arch Right",
      "Place after walls."
    },
	{
      'walls_detailing_01_74',
      'walls_detailing_01_75',
      'walls_detailing_01_74',
      'walls_detailing_01_75',
      "Stone Arch Left",
      "Place after walls."
    },
	{
      'walls_detailing_01_76',
      'walls_detailing_01_76',
      'walls_detailing_01_76',
      'walls_detailing_01_76',
      "Stone Arch Croner",
      "Place after walls."
    },
	{
      'walls_detailing_01_88',
      'walls_detailing_01_89',
      'walls_detailing_01_88',
      'walls_detailing_01_89',
      "Small Gray Trim",
      "Place after walls."
    },
	{
      'walls_detailing_01_91',
      'walls_detailing_01_91',
      'walls_detailing_01_91',
      'walls_detailing_01_91',
      "Small Gray Croner",
      "Place after walls."
    },
	{
      'walls_detailing_01_90',
      'walls_detailing_01_90',
      'walls_detailing_01_90',
      'walls_detailing_01_90',
      "Small Gray Edge",
      "Place after walls."
    },
	{
      'walls_detailing_01_24',
      'walls_detailing_01_25',
      'walls_detailing_01_24',
      'walls_detailing_01_25',
      "Small Gray Crown",
      "Place after walls."
    },
	{
      'walls_detailing_01_27',
      'walls_detailing_01_27',
      'walls_detailing_01_27',
      'walls_detailing_01_27',
      "Small Gray Corner",
      "Place after walls."
    },
	{
      'walls_interior_detailing_01_48',
      'walls_interior_detailing_01_49',
      'walls_interior_detailing_01_48',
      'walls_interior_detailing_01_49',
      "Brick Trim",
      "Place after walls."
    },
	{
      'walls_interior_detailing_01_50',
      'walls_interior_detailing_01_50',
      'walls_interior_detailing_01_50',
      'walls_interior_detailing_01_50',
      "Brick Corner",
      "Place after walls."
    },
	{
      'walls_interior_detailing_01_51',
      'walls_interior_detailing_01_51',
      'walls_interior_detailing_01_51',
      'walls_interior_detailing_01_51',
      "Brick Edge",
      "Place after walls."
    },
	{
      'walls_interior_detailing_01_52',
      'walls_interior_detailing_01_53',
      'walls_interior_detailing_01_52',
      'walls_interior_detailing_01_53',
      "Dark Brick Trim",
      "Place after walls."
    },
	{
      'walls_interior_detailing_01_54',
      'walls_interior_detailing_01_54',
      'walls_interior_detailing_01_54',
      'walls_interior_detailing_01_54',
      "Dark Brick Corner",
      "Place after walls."
    },
	{
      'walls_interior_detailing_01_55',
      'walls_interior_detailing_01_55',
      'walls_interior_detailing_01_55',
      'walls_interior_detailing_01_55',
      "Gray Brick Edge",
      "Place after walls."
    },
	{
      'walls_interior_detailing_01_96',
      'walls_interior_detailing_01_97',
      'walls_interior_detailing_01_96',
      'walls_interior_detailing_01_97',
      "Gray Brick Trim",
      "Place after walls."
    },
	{
      'walls_interior_detailing_01_98',
      'walls_interior_detailing_01_98',
      'walls_interior_detailing_01_98',
      'walls_interior_detailing_01_98',
      "Gray Brick Corner",
      "Place after walls."
    },
	{
      'walls_interior_detailing_01_99',
      'walls_interior_detailing_01_99',
      'walls_interior_detailing_01_99',
      'walls_interior_detailing_01_99',
      "Gray Brick Edge",
      "Place after walls."
    },
	{
      'walls_interior_detailing_01_100',
      'walls_interior_detailing_01_101',
      'walls_interior_detailing_01_100',
      'walls_interior_detailing_01_101',
      "Gray Stone Trim",
      "Place after walls."
    },
	{
      'walls_interior_detailing_01_102',
      'walls_interior_detailing_01_102',
      'walls_interior_detailing_01_102',
      'walls_interior_detailing_01_102',
      "Gray Stone Corner",
      "Place after walls."
    },
	{
      'walls_interior_detailing_01_58',
      'walls_interior_detailing_01_59',
      'walls_interior_detailing_01_58',
      'walls_interior_detailing_01_59',
      "Brick Door Trim",
      "Place after walls."
    },
	{
      'walls_interior_detailing_01_62',
      'walls_interior_detailing_01_63',
      'walls_interior_detailing_01_62',
      'walls_interior_detailing_01_63',
      "Dark Brick Door Trim",
      "Place after walls."
    },
	{
      'walls_interior_detailing_01_106',
      'walls_interior_detailing_01_107',
      'walls_interior_detailing_01_106',
      'walls_interior_detailing_01_107',
      "Gray Brick Door Trim",
      "  "
    },
	{
      'walls_interior_detailing_01_110',
      'walls_interior_detailing_01_111',
      'walls_interior_detailing_01_110',
      'walls_interior_detailing_01_110',
      "Stone Door Trim",
      "Place after walls."
    }
	
  }
  return _mouldingMetalData
end


MoreBuildPlus.onBuildmouldingMetal = function(ignoreThisArgument, sprite, player, name)
  local _sign = ISSimpleFurniture:new(name, sprite.sprite, sprite.northSprite)

  _sign.player = player
  _sign.name = name
  _sign.eastSprite = sprite.eastSprite
  _sign.southSprite = sprite.southSprite
  _sign.northSprite = sprite.northSprite
  _sign.canPassThrough = false
  _sign.blockAllTheSquare = false
  _sign.isCorner = true

  _sign.modData['need:Base.Stone'] = 1
  _sign.modData['xp:Woodwork'] = 8

  getCell():setDrag(_sign, player)
end

