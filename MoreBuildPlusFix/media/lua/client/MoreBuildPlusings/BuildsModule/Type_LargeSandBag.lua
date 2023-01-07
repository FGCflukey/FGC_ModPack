if not getMoreBuildPlusInstance then
  require('MoreBuildPlusings/MoreBuildPluss_Main')
end

local MoreBuildPlus = getMoreBuildPlusInstance()

MoreBuildPlus.SandbagPLusMenuBuilder = function(subMenu, player)
  local _sprite
  local _option
  local _tooltip
  local _name = ''

  MoreBuildPlus.neededMaterials = {
    {
      Material = 'Base.Sandbag',
      Amount = 4
    }
  }

  MoreBuildPlus.neededTools = {'Hammer'}

  local needSkills = {
    Woodwork = 2
  }

  local _SandbagPLusData = MoreBuildPlus.getSandbagPLusData()

  for _, _currentList in pairs(_SandbagPLusData) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, MoreBuildPlus.onBuildSandbagPLus, _sprite, player, _name)

    _tooltip = MoreBuildPlus.canBuildObject(needSkills, _option, player)
    _tooltip.description = _currentList[6] .. _tooltip.description
    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end


MoreBuildPlus.getSandbagPLusData = function()
  local _SandbagPLusData = {

    {
      'fencing_01_96',
      'fencing_01_96',
      'fencing_01_96',
      'fencing_01_96',
      "Large Sandbag",
      "Large Sandbag."
    }
	
  }
  return _SandbagPLusData
end


MoreBuildPlus.onBuildSandbagPLus = function(ignoreThisArgument, sprite, player, name)
  local _sign = ISSimpleFurniture:new(name, sprite.sprite, sprite.northSprite)

  _sign.player = player
  _sign.name = name
  _sign.eastSprite = sprite.eastSprite
  _sign.southSprite = sprite.southSprite
  _sign.northSprite = sprite.northSprite
  _sign.canPassThrough = false
  _sign.blockAllTheSquare = false
  _sign.renderFloorHelper = true

  _sign.modData['need:Base.Sandbag'] = 1
  _sign.modData['xp:Woodwork'] = 5

  getCell():setDrag(_sign, player)
end

