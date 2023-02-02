if not getMoreBuildPlusInstance then
  require('MoreBuildPlusings/MoreBuildPluss_Main')
end

local MoreBuildPlus = getMoreBuildPlusInstance()

MoreBuildPlus.detailedPillarsMenuBuilder = function(subMenu, player)
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

  local _detailedPillarsData = MoreBuildPlus.getdetailedPillarsData()

  for _, _currentList in pairs(_detailedPillarsData) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, MoreBuildPlus.onBuilddetailedPillars, _sprite, player, _name)

    _tooltip = MoreBuildPlus.canBuildObject(needSkills, _option, player)
    _tooltip.description = _currentList[6] .. _tooltip.description
    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end


MoreBuildPlus.getdetailedPillarsData = function()
  local _detailedPillarsData = {

    {
      'walls_detailing_02_0',
      'walls_detailing_02_1',
      'walls_detailing_02_2',
      'walls_detailing_02_3',
      "Detailed Pillar 1",
      "Detailed Pillar"
    },
	{
      'walls_detailing_02_4',
      'walls_detailing_02_5',
      'walls_detailing_02_6',
      'walls_detailing_02_7',
      "Detailed Pillar 2",
      "Detailed Pillar"
    },
	{
      'walls_detailing_02_49',
      'walls_detailing_02_41',
      'walls_detailing_02_25',
      'walls_detailing_02_33',
      "Detailed Pillar 3",
      "Detailed Pillar"
    }
	
  }
  return _detailedPillarsData
end


MoreBuildPlus.onBuilddetailedPillars = function(ignoreThisArgument, sprite, player, name)
  local _sign = ISSimpleFurniture:new(name, sprite.sprite, sprite.northSprite)

  _sign.player = player
  _sign.name = name
  _sign.eastSprite = sprite.eastSprite
  _sign.southSprite = sprite.southSprite
  _sign.northSprite = sprite.northSprite
  _sign.canPassThrough = true
  _sign.blockAllTheSquare = false
  _sign.isCorner = true
  _sign.renderFloorHelper = true

  _sign.modData['need:Base.Plank'] = 1
  _sign.modData['need:Base.Nails'] = 2
  _sign.modData['xp:Woodwork'] = 5

  getCell():setDrag(_sign, player)
end

