if not getMoreBuildPlusInstance then
  require('MoreBuildPlusings/MoreBuildPluss_Main')
end

local MoreBuildPlus = getMoreBuildPlusInstance()

MoreBuildPlus.wallsGaragePlusMenuBuilder = function(subMenu, player)
  local _sprite
  local _option
  local _tooltip
  local _name = ''

  MoreBuildPlus.neededMaterials = {
    {
      Material = 'Base.SheetMetal',
      Amount = 1
    },
    {
      Material = 'Base.BlowTorch',
      Amount = 1
    }
  }

  MoreBuildPlus.neededTools = {'BlowTorch'}

  local needSkills = {
    MetalWelding = 4
  }

  local _wallsGaragePlusData = MoreBuildPlus.getwallsGaragePlusData()

  for _, _currentList in pairs(_wallsGaragePlusData) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, MoreBuildPlus.onBuildwallsGaragePlus, _sprite, player, _name)

    _tooltip = MoreBuildPlus.canBuildObject(needSkills, _option, player)
    _tooltip.description = _currentList[6] .. _tooltip.description
    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end


MoreBuildPlus.getwallsGaragePlusData = function()
  local _wallsGaragePlusData = {

        {
      'industry_trucks_01_0',
      'industry_trucks_01_1',
      'industry_trucks_01_0',
      'industry_trucks_01_1',
      "White Wall",
      "Garage Wall."
    },
	{
      'industry_trucks_01_2',
      'industry_trucks_01_2',
      'industry_trucks_01_2',
      'industry_trucks_01_2',
      "White Corner",
      "Garage Wall."
    },
	{
      'industry_trucks_01_4',
      'industry_trucks_01_5',
      'industry_trucks_01_4',
      'industry_trucks_01_5',
      "Gray Wall 1",
      "Garage Wall."
    },
	{
      'industry_trucks_01_6',
      'industry_trucks_01_6',
      'industry_trucks_01_6',
      'industry_trucks_01_6',
      "Gray Corner 1",
      "Garage Wall."
    },
	{
      'walls_garage_01_36',
      'walls_garage_01_37',
      'walls_garage_01_36',
      'walls_garage_01_37',
      "Gray Wall 2",
      "Garage Wall."
    },
	{
      'walls_garage_01_38',
      'walls_garage_01_38',
      'walls_garage_01_38',
      'walls_garage_01_38',
      "Gray Corner 2",
      "Garage Wall."
    },
	{
      'walls_garage_02_16',
      'walls_garage_02_17',
      'walls_garage_02_16',
      'walls_garage_02_17',
      "Gray Wall 3",
      "Garage Wall."
    },
	{
      'walls_garage_02_18',
      'walls_garage_02_18',
      'walls_garage_02_18',
      'walls_garage_02_18',
      "Gray Corner 3",
      "Garage Wall."
    }
	
	
  }
  return _wallsGaragePlusData
end


MoreBuildPlus.onBuildwallsGaragePlus = function(ignoreThisArgument, sprite, player, name)
  local _sign = ISSimpleFurniture:new(name, sprite.sprite, sprite.northSprite)

  _sign.player = player
  _sign.name = name
  _sign.eastSprite = sprite.eastSprite
  _sign.southSprite = sprite.southSprite
  _sign.northSprite = sprite.northSprite
  _sign.canPassThrough = false
  _sign.blockAllTheSquare = false
  _sign.isCorner = true
  _sign.renderFloorHelper = true

  _sign.modData['need:Base.SheetMetal'] = 1
  _sign.modData['use:Base.BlowTorch'] = 7
  _sign.modData['xp:MetalWelding'] = 5

  getCell():setDrag(_sign, player)
end

