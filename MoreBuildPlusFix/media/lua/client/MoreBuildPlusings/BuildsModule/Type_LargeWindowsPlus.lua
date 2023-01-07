if not getMoreBuildPlusInstance then
  require('MoreBuildPlusings/MoreBuildPluss_Main')
end

local MoreBuildPlus = getMoreBuildPlusInstance()

MoreBuildPlus.otherTwoPlusMenuBuilder = function(subMenu, player)
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

  local _otherTwoPlusData = MoreBuildPlus.getotherTwoPlusData()

  for _, _currentList in pairs(_otherTwoPlusData) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, MoreBuildPlus.onBuildotherTwoPlus, _sprite, player, _name)

    _tooltip = MoreBuildPlus.canBuildObject(needSkills, _option, player)
    _tooltip.description = _currentList[6] .. _tooltip.description
    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end

MoreBuildPlus.getotherTwoPlusData = function()
  local _otherTwoPlusData = {

	{
      'walls_commercial_02_55',
      'walls_commercial_02_54',
      'walls_commercial_02_55',
      'walls_commercial_02_55',
      "Large Window 1 ",
      " Large Window  "
    },
	{
      'fixtures_windows_01_72',
      'fixtures_windows_01_73',
      'fixtures_windows_01_72',
      'fixtures_windows_01_72',
      "Large Window 2 ",
      " Place after you place the frame! Need to be infront of the frame"
    }

	
  }
  return _otherTwoPlusData
end


MoreBuildPlus.onBuildotherTwoPlus = function(ignoreThisArgument, sprite, player, name)
  local _sign = ISWindowWallObj:new(sprite.sprite, sprite.northSprite, getSpecificPlayer(player))

  _sign.player = player
  _sign.name = name
  _sign.eastSprite = sprite.eastSprite
  _sign.southSprite = sprite.southSprite
  _sign.northSprite = sprite.northSprite
  _sign.canPassThrough = false
  _sign.blockAllTheSquare = false
  _sign.canBeAlwaysPlaced = true

  _sign.modData['need:Base.Plank'] = 2
  _sign.modData['need:Base.Nails'] = 4
  _sign.modData['xp:Woodwork'] = 5

  getCell():setDrag(_sign, player)
end

