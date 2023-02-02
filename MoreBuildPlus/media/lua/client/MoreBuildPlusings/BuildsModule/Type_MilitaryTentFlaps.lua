if not getMoreBuildPlusInstance then
  require('MoreBuildPlusings/MoreBuildPluss_Main')
end

local MoreBuildPlus = getMoreBuildPlusInstance()

MoreBuildPlus.militaryTentFlapsMenuBuilder = function(subMenu, player)
  local _sprite
  local _option
  local _tooltip
  local _name = ''

  MoreBuildPlus.neededMaterials = {
    {
      Material = 'camping.TentPeg',
      Amount = 1
    }
  }

  MoreBuildPlus.neededTools = {'Hammer'}

  local needSkills = {
    Woodwork = 1
  }

  local _militaryTentFlapsData = MoreBuildPlus.getmilitaryTentFlapsData()

  for _, _currentList in pairs(_militaryTentFlapsData) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, MoreBuildPlus.onBuildmilitaryTentFlaps, _sprite, player, _name)

    _tooltip = MoreBuildPlus.canBuildObject(needSkills, _option, player)
    _tooltip.description = _currentList[6] .. _tooltip.description
    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end


MoreBuildPlus.getmilitaryTentFlapsData = function()
  local _militaryTentFlapsData = {

        {
      'location_military_tent_01_32',
      'location_military_tent_01_39',
      'location_military_tent_01_32',
      'location_military_tent_01_39',
      "Military Tent Accent",
      ""
    },{
      'location_military_tent_01_33',
      'location_military_tent_01_38',
      'location_military_tent_01_33',
      'location_military_tent_01_38',
      "Military Tent Accent",
      ""
    },{
      'location_military_tent_01_34',
      'location_military_tent_01_37',
      'location_military_tent_01_34',
      'location_military_tent_01_37',
      "Military Tent Accent",
      ""
    },{
      'location_military_tent_01_35',
      'location_military_tent_01_36',
      'location_military_tent_01_35',
      'location_military_tent_01_36',
      "Military Tent Accent",
      ""
    },
	{
      'location_military_tent_01_96',
      'location_military_tent_01_103',
      'location_military_tent_01_96',
      'location_military_tent_01_103',
      "Military Tent Accent",
      ""
    },
	{
      'location_military_tent_01_97',
      'location_military_tent_01_102',
      'location_military_tent_01_97',
      'location_military_tent_01_102',
      "Military Tent Accent",
      ""
    },
	{
      'location_military_tent_01_98',
      'location_military_tent_01_101',
      'location_military_tent_01_98',
      'location_military_tent_01_101',
      "Military Tent Accent",
      ""
    },
	{
      'location_military_tent_01_99',
      'location_military_tent_01_100',
      'location_military_tent_01_99',
      'location_military_tent_01_100',
      "Military Tent Accent",
      ""
    }
	
	
  }
  return _militaryTentFlapsData
end


MoreBuildPlus.onBuildmilitaryTentFlaps = function(ignoreThisArgument, sprite, player, name)
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

  _sign.modData['camping.TentPeg'] = 1
  _sign.modData['xp:Woodwork'] = 2

  getCell():setDrag(_sign, player)
end

