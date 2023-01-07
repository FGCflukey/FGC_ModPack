if not getMoreBuildPlusInstance then
  require('MoreBuildPlusings/MoreBuildPluss_Main')
end

local MoreBuildPlus = getMoreBuildPlusInstance()

MoreBuildPlus.railingPlusMenuBuilder = function(subMenu, player)
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

  local _railingPlusData = MoreBuildPlus.getrailingPlusData()

  for _, _currentList in pairs(_railingPlusData) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, MoreBuildPlus.onBuildrailingPlus, _sprite, player, _name)

    _tooltip = MoreBuildPlus.canBuildObject(needSkills, _option, player)
    _tooltip.description = _currentList[6] .. _tooltip.description
    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end

MoreBuildPlus.getrailingPlusData = function()
  local _railingPlusData = {

        {
      'fixtures_railings_01_7',
      'fixtures_railings_01_0',
      'fixtures_railings_01_7',
      'fixtures_railings_01_0',
      "Wood Railing 1",
      " Place before you place stairs! "
    },
    {
      'fixtures_railings_01_6',
      'fixtures_railings_01_1',
      'fixtures_railings_01_6',
      'fixtures_railings_01_1',
      "Wood Railing 2",
      " Place before you place stairs! "
    },
    {
      'fixtures_railings_01_5',
      'fixtures_railings_01_2',
      'fixtures_railings_01_5',
      'fixtures_railings_01_2',
      "Wood Railing 3",
      " Place before you place stairs! "
    },
    {
      'fixtures_railings_01_4',
      'fixtures_railings_01_3',
      'fixtures_railings_01_4',
      'fixtures_railings_01_3',
      "Wood Railing 4",
      " Place before you place stairs! "
    },
    {
      'fixtures_railings_01_15',
      'fixtures_railings_01_14',
      'fixtures_railings_01_15',
      'fixtures_railings_01_14',
      "Wood Railing 5",
      " Place before you place stairs! "
    },
    {
      'fixtures_railings_01_28',
      'fixtures_railings_01_29',
      'fixtures_railings_01_28',
      'fixtures_railings_01_29',
      "Wood Railing Main",
      " Wooden railing. "
    },
    {
      'fixtures_railings_01_30',
      'fixtures_railings_01_30',
      'fixtures_railings_01_30',
      'fixtures_railings_01_30',
      "Wood Railing Corner",
      " Wooden railing. "
    }
  }
  return _railingPlusData
end


MoreBuildPlus.onBuildrailingPlus = function(ignoreThisArgument, sprite, player, name)
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

