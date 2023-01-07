if not getMoreBuildPlusInstance then
  require('MoreBuildPlusings/MoreBuildPluss_Main')
end

local MoreBuildPlus = getMoreBuildPlusInstance()

MoreBuildPlus.windowsGaragePlusMenuBuilder = function(subMenu, player)
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

  local _windowsGaragePlusData = MoreBuildPlus.getwindowsGaragePlusData()

  for _, _currentList in pairs(_windowsGaragePlusData) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, MoreBuildPlus.onBuildwindowsGaragePlus, _sprite, player, _name)

    _tooltip = MoreBuildPlus.canBuildObject(needSkills, _option, player)
    _tooltip.description = _currentList[6] .. _tooltip.description
    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end


MoreBuildPlus.getwindowsGaragePlusData = function()
  local _windowsGaragePlusData = {

        {
      'industry_trucks_01_8',
      'industry_trucks_01_9',
      'industry_trucks_01_8',
      'industry_trucks_01_9',
      "White Window",
      "Garage Wall."
    },
	{
      'industry_trucks_01_10',
      'industry_trucks_01_11',
      'industry_trucks_01_10',
      'industry_trucks_01_11',
      "White Door Frame",
      "Garage Wall."
    },
	{
      'industry_trucks_01_12',
      'industry_trucks_01_13',
      'industry_trucks_01_12',
      'industry_trucks_01_13',
      "Gray Window 1",
      "Garage Wall."
    },
	{
      'industry_trucks_01_14',
      'industry_trucks_01_15',
      'industry_trucks_01_14',
      'industry_trucks_01_15',
      "Gray Door Frame 1",
      "Garage Wall."
    },
	{
      'walls_garage_01_44',
      'walls_garage_01_45',
      'walls_garage_01_44',
      'walls_garage_01_45',
      "Gray Window 2",
      "Garage Wall."
    },
	{
      'walls_garage_01_46',
      'walls_garage_01_47',
      'walls_garage_01_46',
      'walls_garage_01_47',
      "Gray Door Frame 2",
      "Garage Wall."
    },
	{
      'walls_garage_02_24',
      'walls_garage_02_25',
      'walls_garage_02_24',
      'walls_garage_02_25',
      "Gray Window 3",
      "Garage Wall."
    },
	{
      'walls_garage_02_26',
      'walls_garage_02_27',
      'walls_garage_02_26',
      'walls_garage_02_27',
      "Gray Door Frame 3",
      "Garage Wall."
    }
	
	
	
  }
  return _windowsGaragePlusData
end


MoreBuildPlus.onBuildwindowsGaragePlus = function(ignoreThisArgument, sprite, player, name)
  local _sign = ISWoodenDoorFrame:new(sprite.sprite, sprite.northSprite, sprite.corner)

  _sign.player = player
  _sign.name = name
  _sign.eastSprite = sprite.eastSprite
  _sign.southSprite = sprite.southSprite
  _sign.northSprite = sprite.northSprite
  _sign.renderFloorHelper = true

  _sign.modData['need:Base.SheetMetal'] = 1
  _sign.modData['use:Base.BlowTorch'] = 7
  _sign.modData['xp:MetalWelding'] = 5

  getCell():setDrag(_sign, player)
end

