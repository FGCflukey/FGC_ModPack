if not getMoreBuildPlusInstance then
  require('MoreBuildPlusings/MoreBuildPluss_Main')
end

local MoreBuildPlus = getMoreBuildPlusInstance()

MoreBuildPlus.MilitaryTentCurtainMenuBuilder = function(subMenu, player)
  local _sprite
  local _option
  local _tooltip
  local _name = ''

  MoreBuildPlus.neededMaterials = {
    {
      Material = 'Base.Tarp',
      Amount = 1
    }
  }

  MoreBuildPlus.neededTools = {'Hammer'}

  local needSkills = {
    Woodwork = 1
  }

  local _MilitaryTentCurtainData = MoreBuildPlus.getMilitaryTentCurtainData()

  for _, _currentList in pairs(_MilitaryTentCurtainData) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, MoreBuildPlus.onBuildMilitaryTentCurtain, _sprite, player, _name)

    _tooltip = MoreBuildPlus.canBuildObject(needSkills, _option, player)
    _tooltip.description = _currentList[6] .. _tooltip.description
    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end

MoreBuildPlus.getMilitaryTentCurtainData = function()
  local _MilitaryTentCurtainData = {

    {
      'location_military_tent_01_60',
      'location_military_tent_01_62',
      'location_military_tent_01_60',
      'location_military_tent_01_62',
      "Curtain",
      "Military Tent Curtain"
    }
	
  }
  return _MilitaryTentCurtainData
end


MoreBuildPlus.onBuildMilitaryTentCurtain = function(ignoreThisArgument, sprite, player, name)
  local _sign = ISCurtain:new(sprite.sprite, sprite.northSprite, player)

  _sign.player = player
  _sign.name = name
  _sign.sprite = sprite.sprite
  _sign.eastSprite = sprite.eastSprite
  _sign.southSprite = sprite.southSprite
  _sign.northSprite = sprite.northSprite
  _sign.modData['need:Base.Tarp'] = 1
  _sign.modData['xp:Woodwork'] = 2

  getCell():setDrag(_sign, player)
end

