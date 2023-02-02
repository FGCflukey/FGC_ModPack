if not getMoreBuildPlusInstance then
  require('MoreBuildPlusings/MoreBuildPluss_Main')
end

local MoreBuildPlus = getMoreBuildPlusInstance()

MoreBuildPlus.otherPlusMenuBuilder = function(subMenu, player)
  local _sprite
  local _option
  local _tooltip
  local _name = ''

  MoreBuildPlus.neededMaterials = {
    {
      Material = 'Base.Plank',
      Amount = 1
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

  local _otherPlusData = MoreBuildPlus.getotherPlusData()

  for _, _currentList in pairs(_otherPlusData) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, MoreBuildPlus.onBuildotherPlus, _sprite, player, _name)

    _tooltip = MoreBuildPlus.canBuildObject(needSkills, _option, player)
    _tooltip.description = _currentList[6] .. _tooltip.description
    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end

MoreBuildPlus.getotherPlusData = function()
  local _otherPlusData = {

    {
      'fixtures_windows_detailing_01_16',
      'fixtures_windows_detailing_01_17',
      'fixtures_windows_detailing_01_16',
      'fixtures_windows_detailing_01_16',
      "White Window Detailing 1",
      "For right facing windows."
    },
    {
      'fixtures_windows_detailing_01_18',
      'fixtures_windows_detailing_01_19',
      'fixtures_windows_detailing_01_18',
      'fixtures_windows_detailing_01_19',
      "White Window Detailing 2",
      "For left facing windows."
    },
    {
      'fixtures_windows_detailing_01_24',
      'fixtures_windows_detailing_01_25',
      'fixtures_windows_detailing_01_24',
      'fixtures_windows_detailing_01_25',
      "Brown Window Detailing 1",
      "For right facing windows."
    },
    {
      'fixtures_windows_detailing_01_26',
      'fixtures_windows_detailing_01_27',
      'fixtures_windows_detailing_01_26',
      'fixtures_windows_detailing_01_27',
      "Brown Window Detailing 2",
      "For left facing windows."
    },
    {
      'fixtures_windows_detailing_01_32',
      'fixtures_windows_detailing_01_33',
      'fixtures_windows_detailing_01_32',
      'fixtures_windows_detailing_01_33',
      "Dark Brown Window Detailing 1",
      "For right facing windows."
    },
    {
      'fixtures_windows_detailing_01_34',
      'fixtures_windows_detailing_01_35',
      'fixtures_windows_detailing_01_34',
      'fixtures_windows_detailing_01_35',
      "Dark Brown Window Detailing 2",
      "For left facing windows."
    },
    {
      'fixtures_windows_detailing_01_20',
      'fixtures_windows_detailing_01_21',
      'fixtures_windows_detailing_01_20',
      'fixtures_windows_detailing_01_21',
      "Blue Window Detailing 1",
      "For right facing windows."
    },
    {
      'fixtures_windows_detailing_01_22',
      'fixtures_windows_detailing_01_23',
      'fixtures_windows_detailing_01_22',
      'fixtures_windows_detailing_01_23',
      "Blue Window Detailing 2",
      "For left facing windows."
    },
    {
      'roofs_accents_01_45',
      'roofs_accents_01_21',
      'roofs_accents_01_45',
      'roofs_accents_01_21',
      "Gutter Main",
      "gutter"
    },
    {
      'roofs_accents_01_28',
      'roofs_accents_01_7',
      'roofs_accents_01_28',
      'roofs_accents_01_7',
      "Gutter 1",
      "gutter"
    },
    {
      'roofs_accents_01_29',
      'roofs_accents_01_6',
      'roofs_accents_01_29',
      'roofs_accents_01_6',
      "Gutter 2",
      "gutter"
    },
    {
      'roofs_accents_01_30',
      'roofs_accents_01_5',
      'roofs_accents_01_30',
      'roofs_accents_01_5',
      "Gutter 3",
      "gutter"
    },
    {
      'roofs_accents_01_46',
      'roofs_accents_01_20',
      'roofs_accents_01_46',
      'roofs_accents_01_20',
      "Gutter Corner",
      "gutter"
    },
    {
      'roofs_accents_01_17',
      'roofs_accents_01_18',
      'roofs_accents_01_17',
      'roofs_accents_01_18',
      "Gutter Patio",
      "gutter"
    },
    {
      'walls_detailing_02_10',
      'walls_detailing_02_9',
      'walls_detailing_02_10',
      'walls_detailing_02_9',
      "Wall Detailing ",
      "Wall Detailing"
    },
    {
      'walls_detailing_02_8',
      'walls_detailing_02_13',
      'walls_detailing_02_8',
      'walls_detailing_02_13',
      "Wall Detailing Corner",
      "Wall Detailing"
    },
    {
      'walls_detailing_02_14',
      'walls_detailing_02_14',
      'walls_detailing_02_14',
      'walls_detailing_02_14',
      "Wall Detailing Edge",
      "Wall Detailing"
    }
	
	
  }
  return _otherPlusData
end


MoreBuildPlus.onBuildotherPlus = function(ignoreThisArgument, sprite, player, name)
  local _sign = ISSimpleFurniture:new(name, sprite.sprite, sprite.northSprite)

  _sign.player = player
  _sign.name = name
  _sign.eastSprite = sprite.eastSprite
  _sign.southSprite = sprite.southSprite
  _sign.northSprite = sprite.northSprite
  _sign.canPassThrough = false
  _sign.blockAllTheSquare = false
  _sign.isCorner = true

  _sign.modData['need:Base.Plank'] = 1
  _sign.modData['need:Base.Nails'] = 2
  _sign.modData['xp:Woodwork'] = 7.5

  getCell():setDrag(_sign, player)
end

