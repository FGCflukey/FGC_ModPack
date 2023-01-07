if not getMoreBuildPlusInstance then
  require('MoreBuildPlusings/MoreBuildPluss_Main')
end

local MoreBuildPlus = getMoreBuildPlusInstance()

MoreBuildPlus.railingPlus5MenuBuilder = function(subMenu, player)
  local _sprite
  local _option
  local _tooltip
  local _name = ''

  MoreBuildPlus.neededMaterials = {
    {
      Material = 'Base.Plank',
      Amount = 2
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

  local _railingPlus5Data = MoreBuildPlus.getrailingPlus5Data()

  for _, _currentList in pairs(_railingPlus5Data) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, MoreBuildPlus.onBuildrailingPlus5, _sprite, player, _name)

    _tooltip = MoreBuildPlus.canBuildObject(needSkills, _option, player)
    _tooltip.description = _currentList[6] .. _tooltip.description
    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end

MoreBuildPlus.getrailingPlus5Data = function()
  local _railingPlus5Data = {

    {
      'fixtures_railings_01_24',
      'fixtures_railings_01_25',
      'fixtures_railings_01_24',
      'fixtures_railings_01_25',
      "Railing",
      " Wooden railing. "
    },
    {
      'fixtures_railings_01_26',
      'fixtures_railings_01_26',
      'fixtures_railings_01_26',
      'fixtures_railings_01_26',
      "Corner",
      " Wooden railing. "
    },
    {
      'fixtures_railings_01_27',
      'fixtures_railings_01_27',
      'fixtures_railings_01_27',
      'fixtures_railings_01_27',
      "Pillar",
      " Wooden railing. "
    },
    {
      'fixtures_railings_01_35',
      'fixtures_railings_01_35',
      'fixtures_railings_01_35',
      'fixtures_railings_01_35',
      "Pillar Large",
      " pillar. "
    },
    {
      'fixtures_railings_01_64',
      'fixtures_railings_01_65',
      'fixtures_railings_01_64',
      'fixtures_railings_01_65',
      "White Railing",
      " Wooden railing. "
    },
    {
      'fixtures_railings_01_66',
      'fixtures_railings_01_66',
      'fixtures_railings_01_66',
      'fixtures_railings_01_66',
      "White Corner",
      " Wooden railing. "
    },
    {
      'fixtures_railings_01_67',
      'fixtures_railings_01_67',
      'fixtures_railings_01_67',
      'fixtures_railings_01_67',
      "White Pillar ",
      " Wooden railing. "
    },
    {
      'fixtures_railings_01_75',
      'fixtures_railings_01_75',
      'fixtures_railings_01_75',
      'fixtures_railings_01_75',
      "White Pillar Medium",
      " Wooden railing. "
    },
    {
      'fixtures_railings_01_79',
      'fixtures_railings_01_79',
      'fixtures_railings_01_79',
      'fixtures_railings_01_79',
      "White Pillar Large",
      " White pillar. "
    },
    {
      'location_shop_mall_01_24',
      'location_shop_mall_01_25',
      'location_shop_mall_01_24',
      'location_shop_mall_01_25',
      "Glass Railing",
      " Glass Railing "
    },
	{
      'location_shop_mall_01_26',
      'location_shop_mall_01_26',
      'location_shop_mall_01_26',
      'location_shop_mall_01_26',
      "Glass Railing",
      " Glass Railing "
    },
	{
      'location_shop_mall_01_27',
      'location_shop_mall_01_27',
      'location_shop_mall_01_27',
      'location_shop_mall_01_27',
      "Glass Railing",
      " Glass Railing "
    }
	
  }
	
  return _railingPlus5Data
end


MoreBuildPlus.onBuildrailingPlus5 = function(ignoreThisArgument, sprite, player, name)
  local _sign = ISSimpleFurniture:new(name, sprite.sprite, sprite.northSprite)

  _sign.player = player
  _sign.name = name
  _sign.eastSprite = sprite.eastSprite
  _sign.southSprite = sprite.southSprite
  _sign.northSprite = sprite.northSprite
  _sign.canPassThrough = false
  _sign.blockAllTheSquare = false
  _sign.renderFloorHelper = true
  _sign.isCorner = true

  _sign.modData['need:Base.Plank'] = 2
  _sign.modData['need:Base.Nails'] = 4
  _sign.modData['xp:Woodwork'] = 4

  getCell():setDrag(_sign, player)
end

