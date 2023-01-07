if not getMoreBuildPlusInstance then
  require('MoreBuildPlusings/MoreBuildPluss_Main')
end

local MoreBuildPlus = getMoreBuildPlusInstance()

MoreBuildPlus.mouldingWindowMenuBuilder = function(subMenu, player)
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

  local _mouldingWindowData = MoreBuildPlus.getmouldingWindowData()

  for _, _currentList in pairs(_mouldingWindowData) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, MoreBuildPlus.onBuildmouldingWindow, _sprite, player, _name)

    _tooltip = MoreBuildPlus.canBuildObject(needSkills, _option, player)
    _tooltip.description = _currentList[6] .. _tooltip.description
    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end

MoreBuildPlus.getmouldingWindowData = function()
  local _mouldingWindowData = {

        {
      'walls_detailing_02_16',
      'walls_detailing_02_17',
      'walls_detailing_02_16',
      'walls_detailing_02_17',
      "Large Window Trim",
      "For large Windows. "
    },
	{
      'walls_detailing_02_23',
      'walls_detailing_02_22',
      'walls_detailing_02_22',
      'walls_detailing_02_23',
      "Small Window Trim 1",
      "For small windows. "
    },
	{
      'walls_detailing_02_19',
      'walls_detailing_02_18',
      'walls_detailing_02_19',
      'walls_detailing_02_18',
      "Small Window Trim 2",
      "For small windows. "
    },
	{
      'walls_detailing_02_21',
      'walls_detailing_02_20',
      'walls_detailing_02_21',
      'walls_detailing_02_20',
      "Small Window Trim 3",
      "For small windows. "
    }
	
  }
  return _mouldingWindowData
end


MoreBuildPlus.onBuildmouldingWindow = function(ignoreThisArgument, sprite, player, name)
  local _sign = ISSimpleFurniture:new(name, sprite.sprite, sprite.northSprite)

  _sign.player = player
  _sign.name = name
  _sign.eastSprite = sprite.eastSprite
  _sign.southSprite = sprite.southSprite
  _sign.northSprite = sprite.northSprite
  _sign.canPassThrough = false
  _sign.blockAllTheSquare = false
  _sign.isCorner = true

  _sign.modData['need:Base.Plank'] = 2
  _sign.modData['need:Base.Nails'] = 2
  _sign.modData['xp:Woodwork'] = 5

  getCell():setDrag(_sign, player)
end

