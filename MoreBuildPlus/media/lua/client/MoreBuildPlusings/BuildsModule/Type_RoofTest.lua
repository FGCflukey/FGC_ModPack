if not getMoreBuildPlusInstance then
  require('MoreBuildPlusings/MoreBuildPluss_Main')
end

local MoreBuildPlus = getMoreBuildPlusInstance()

MoreBuildPlus.roofTestMenuBuilder = function(subMenu, player)
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

  local _roofTestData = MoreBuildPlus.getroofTestData()

  for _, _currentList in pairs(_roofTestData) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, MoreBuildPlus.onBuildroofTest, _sprite, player, _name)

    _tooltip = MoreBuildPlus.canBuildObject(needSkills, _option, player)
    _tooltip.description = _currentList[6] .. _tooltip.description
    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end


MoreBuildPlus.getroofTestData = function()
  local _roofTestData = {
  
	{
      'carpentry_02_56',
      'carpentry_02_56',
      'carpentry_02_56',
      'carpentry_02_56',
      "Flat Roof ",
      "Test! Currently bugged. Do not place if you dont want to risk crashing."
    }
	
  }
  return _roofTestData
end


MoreBuildPlus.onBuildroofTest = function(ignoreThisArgument, sprite, player, name)
  local _sign = ISWoodenRoof:new(sprite.sprite, sprite.northSprite)

  _sign.player = player
  _sign.name = name
  _sign.eastSprite = sprite.eastSprite
  _sign.southSprite = sprite.southSprite
  _sign.northSprite = sprite.northSprite
  _sign.canPassThrough = true
  _sign.blockAllTheSquare = false
  _sign.isCorner = true
  _sign.renderFloorHelper = true

  _sign.modData['need:Base.Plank'] = 2
  _sign.modData['need:Base.Nails'] = 2
  _sign.modData['xp:Woodwork'] = 2

  getCell():setDrag(_sign, player)
end

