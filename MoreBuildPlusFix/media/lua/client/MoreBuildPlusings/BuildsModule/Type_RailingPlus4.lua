if not getMoreBuildPlusInstance then
  require('MoreBuildPlusings/MoreBuildPluss_Main')
end

local MoreBuildPlus = getMoreBuildPlusInstance()

MoreBuildPlus.railingPlusFourMenuBuilder = function(subMenu, player)
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

  local _railingPlusFourData = MoreBuildPlus.getrailingPlusFourData()

  for _, _currentList in pairs(_railingPlusFourData) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, MoreBuildPlus.onBuildrailingPlusFour, _sprite, player, _name)

    _tooltip = MoreBuildPlus.canBuildObject(needSkills, _option, player)
    _tooltip.description = _currentList[6] .. _tooltip.description
    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end

MoreBuildPlus.getrailingPlusFourData = function()
  local _railingPlusFourData = {

        {
      'fixtures_railings_01_141',
      'fixtures_railings_01_120',
      'fixtures_railings_01_141',
      'fixtures_railings_01_120',
      "Wood Railing 1",
      " Place before you place stairs! "
    },
	{
      'fixtures_railings_01_140',
      'fixtures_railings_01_121',
      'fixtures_railings_01_140',
      'fixtures_railings_01_121',
      "Wood Railing 2",
      " Place before you place stairs! "
    },
	{
      'fixtures_railings_01_139',
      'fixtures_railings_01_122',
      'fixtures_railings_01_139',
      'fixtures_railings_01_122',
      "Wood Railing 3",
      " Place before you place stairs! "
    },
	{
      'fixtures_railings_01_138',
      'fixtures_railings_01_123',
      'fixtures_railings_01_138',
      'fixtures_railings_01_123',
      "Wood Railing 4",
      " Place before you place stairs! "
    },
	{
      'fixtures_railings_01_137',
      'fixtures_railings_01_124',
      'fixtures_railings_01_137',
      'fixtures_railings_01_124',
      "Wood Railing 5",
      " Place before you place stairs! "
    },
	{
      'fixtures_railings_01_128',
      'fixtures_railings_01_129',
      'fixtures_railings_01_128',
      'fixtures_railings_01_129',
      "Wood Railing Main",
      " Place before you place stairs! "
    },
	{
      'fixtures_railings_01_130',
      'fixtures_railings_01_130',
      'fixtures_railings_01_130',
      'fixtures_railings_01_130',
      "Wood Railing Corner ",
      " Wooden railing. "
    },
	{
      'fixtures_railings_01_131',
      'fixtures_railings_01_131',
      'fixtures_railings_01_131',
      'fixtures_railings_01_131',
      "Wood Railing Edge",
      " Wooden railing. "
    }


  }
  return _railingPlusFourData
end


MoreBuildPlus.onBuildrailingPlusFour = function(ignoreThisArgument, sprite, player, name)
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

