if not getMoreBuildPlusInstance then
  require('MoreBuildPlusings/MoreBuildPluss_Main')
end

local MoreBuildPlus = getMoreBuildPlusInstance()

MoreBuildPlus.ShowerPlusMenuBuilder = function(subMenu, player)
  local _sprite
  local _option
  local _tooltip
  local _name = ''

  MoreBuildPlus.neededMaterials = {
    {
      Material = 'Base.MetalPipe',
      Amount = 1
    }
  }

  MoreBuildPlus.neededTools = {'BlowTorch'}

  local needSkills = {
    MetalWelding = 2
  }

  local _ShowerPlusData = MoreBuildPlus.getShowerPlusData()

  for _, _currentList in pairs(_ShowerPlusData) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, MoreBuildPlus.onBuildShowerPlus, _sprite, player, _name)

    _tooltip = MoreBuildPlus.canBuildObject(needSkills, _option, player)
    _tooltip.description = _currentList[6] .. _tooltip.description
    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end


MoreBuildPlus.getShowerPlusData = function()
  local _ShowerPlusData = {

    {
      'fixtures_bathroom_01_34',
      'fixtures_bathroom_01_35',
      'fixtures_bathroom_01_34',
      'fixtures_bathroom_01_35',
      "Shower Doors",
      "Not actually doors"
    }
	
  }
  return _ShowerPlusData
end


MoreBuildPlus.onBuildShowerPlus = function(ignoreThisArgument, sprite, player, name)
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

  _sign.modData['need:Base.MetalPipe'] = 1
  _sign.modData['xp:MetalWelding'] = 5

  getCell():setDrag(_sign, player)
end

