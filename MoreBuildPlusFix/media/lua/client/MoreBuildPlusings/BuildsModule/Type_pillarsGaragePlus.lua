if not getMoreBuildPlusInstance then
  require('MoreBuildPlusings/MoreBuildPluss_Main')
end

local MoreBuildPlus = getMoreBuildPlusInstance()

MoreBuildPlus.pillarsGaragePlusMenuBuilder = function(subMenu, player)
  local _sprite
  local _option
  local _tooltip
  local _name = ''

  MoreBuildPlus.neededMaterials = {
    {
      Material = 'Base.SmallSheetMetal',
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

  local _pillarsGaragePlusData = MoreBuildPlus.getpillarsGaragePlusData()

  for _, _currentList in pairs(_pillarsGaragePlusData) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, MoreBuildPlus.onBuildpillarsGaragePlus, _sprite, player, _name)

    _tooltip = MoreBuildPlus.canBuildObject(needSkills, _option, player)
    _tooltip.description = _currentList[6] .. _tooltip.description
    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end


MoreBuildPlus.getpillarsGaragePlusData = function()
  local _pillarsGaragePlusData = {

        {
      'industry_trucks_01_3',
      'industry_trucks_01_3',
      'industry_trucks_01_3',
      'industry_trucks_01_3',
      "White Pillar",
      "Garage Wall."
    },
	{
      'industry_trucks_01_7',
      'industry_trucks_01_7',
      'industry_trucks_01_7',
      'industry_trucks_01_7',
      "Gray Pillar 1",
      "Garage Wall."
    },
	{
      'walls_garage_01_39',
      'walls_garage_01_39',
      'walls_garage_01_39',
      'walls_garage_01_39',
      "Gray Pillar 2",
      "Garage Wall."
    },
	{
      'walls_garage_02_19',
      'walls_garage_02_19',
      'walls_garage_02_19',
      'walls_garage_02_19',
      "Gray Pillar 3",
      "Garage Wall."
    },
	
	
	
  }
  return _pillarsGaragePlusData
end


MoreBuildPlus.onBuildpillarsGaragePlus = function(ignoreThisArgument, sprite, player, name)
  local _sign = ISWoodenWall:new(sprite.sprite, sprite.northSprite, nil)

  _sign.canPassThrough = true
  _sign.canBarricade = false
  _sign.isCorner = true
  _sign.player = player
  _sign.name = name

  _sign.modData['need:Base.SmallSheetMetal'] = 1
  _sign.modData['use:Base.BlowTorch'] = 10
  _sign.modData['xp:MetalWelding'] = 5

  getCell():setDrag(_sign, player)
end

