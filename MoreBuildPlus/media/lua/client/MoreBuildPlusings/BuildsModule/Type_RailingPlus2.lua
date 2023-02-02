if not getMoreBuildPlusInstance then
  require('MoreBuildPlusings/MoreBuildPluss_Main')
end

local MoreBuildPlus = getMoreBuildPlusInstance()

MoreBuildPlus.railingPlusTwoMenuBuilder = function(subMenu, player)
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
      Amount = 2
    }
  }

  MoreBuildPlus.neededTools = {'Hammer'}

  local needSkills = {
    Woodwork = 2
  }

  local _railingPlusTwoData = MoreBuildPlus.getrailingPlusTwoData()

  for _, _currentList in pairs(_railingPlusTwoData) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, MoreBuildPlus.onBuildrailingPlusTwo, _sprite, player, _name)

    _tooltip = MoreBuildPlus.canBuildObject(needSkills, _option, player)
    _tooltip.description = _currentList[6] .. _tooltip.description
    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end

MoreBuildPlus.getrailingPlusTwoData = function()
  local _railingPlusTwoData = {

        {
      'fixtures_railings_01_40',
      'fixtures_railings_01_61',
      'fixtures_railings_01_40',
      'fixtures_railings_01_61',
      "Wood Railing 1",
      " Place before you place stairs! "
    },
	{
      'fixtures_railings_01_41',
      'fixtures_railings_01_60',
      'fixtures_railings_01_41',
      'fixtures_railings_01_60',
      "Wood Railing 2",
      " Place before you place stairs! "
    },
	{
      'fixtures_railings_01_42',
      'fixtures_railings_01_59',
      'fixtures_railings_01_42',
      'fixtures_railings_01_59',
      "Wood Railing 3",
      " Place before you place stairs! "
    },
	{
      'fixtures_railings_01_43',
      'fixtures_railings_01_58',
      'fixtures_railings_01_43',
      'fixtures_railings_01_58',
      "Wood Railing 4",
      " Place before you place stairs! "
    },
	{
      'fixtures_railings_01_44',
      'fixtures_railings_01_57',
      'fixtures_railings_01_44',
      'fixtures_railings_01_57',
      "Wood Railing 5",
      " Place before you place stairs! "
    },
	{
      'fixtures_railings_01_48',
      'fixtures_railings_01_49',
      'fixtures_railings_01_48',
      'fixtures_railings_01_49',
      "Wood Railing Main",
      " "
    },
	{
      'fixtures_railings_01_52',
      'fixtures_railings_01_52',
      'fixtures_railings_01_52',
      'fixtures_railings_01_52',
      "Wood Railing Corner",
      " Wooden railing. "
    },
	{
      'fixtures_railings_01_50',
      'fixtures_railings_01_50',
      'fixtures_railings_01_50',
      'fixtures_railings_01_50',
      "Wood Railing Edge",
      " Wooden railing. "
    }


  }
  return _railingPlusTwoData
end


MoreBuildPlus.onBuildrailingPlusTwo = function(ignoreThisArgument, sprite, player, name)
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

