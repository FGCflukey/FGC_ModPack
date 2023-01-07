if not getMoreBuildPlusInstance then
  require('MoreBuildPlusings/MoreBuildPluss_Main')
end

local MoreBuildPlus = getMoreBuildPlusInstance()

MoreBuildPlus.railingPlusThreeMenuBuilder = function(subMenu, player)
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

  local _railingPlusThreeData = MoreBuildPlus.getrailingPlusThreeData()

  for _, _currentList in pairs(_railingPlusThreeData) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, MoreBuildPlus.onBuildrailingPlusThree, _sprite, player, _name)

    _tooltip = MoreBuildPlus.canBuildObject(needSkills, _option, player)
    _tooltip.description = _currentList[6] .. _tooltip.description
    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end

MoreBuildPlus.getrailingPlusThreeData = function()
  local _railingPlusThreeData = {

        {
      'fixtures_railings_01_101',
      'fixtures_railings_01_80',
      'fixtures_railings_01_101',
      'fixtures_railings_01_80',
      "Wood Railing 1",
      " Place before you place stairs! "
    },
	{
      'fixtures_railings_01_100',
      'fixtures_railings_01_81',
      'fixtures_railings_01_100',
      'fixtures_railings_01_81',
      "Wood Railing 2",
      " Place before you place stairs! "
    },
	{
      'fixtures_railings_01_99',
      'fixtures_railings_01_82',
      'fixtures_railings_01_99',
      'fixtures_railings_01_82',
      "Wood Railing 3",
      " Place before you place stairs! "
    },
	{
      'fixtures_railings_01_98',
      'fixtures_railings_01_83',
      'fixtures_railings_01_98',
      'fixtures_railings_01_83',
      "Wood Railing 4",
      " Place before you place stairs! "
    },
	{
      'fixtures_railings_01_97',
      'fixtures_railings_01_84',
      'fixtures_railings_01_97',
      'fixtures_railings_01_84',
      "Wood Railing 5",
      " Place before you place stairs! "
    },
	{
      'fixtures_railings_01_88',
      'fixtures_railings_01_89',
      'fixtures_railings_01_88',
      'fixtures_railings_01_89',
      "Wood Railing Main",
      " "
    },
	{
      'fixtures_railings_01_90',
      'fixtures_railings_01_90',
      'fixtures_railings_01_90',
      'fixtures_railings_01_90',
      "Wood Railing Corner",
      " Wooden railing. "
    },
	{
      'fixtures_railings_01_91',
      'fixtures_railings_01_91',
      'fixtures_railings_01_91',
      'fixtures_railings_01_91',
      "Wood Railing Edge",
      " Wooden railing. "
    }


  }
  return _railingPlusThreeData
end


MoreBuildPlus.onBuildrailingPlusThree = function(ignoreThisArgument, sprite, player, name)
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

