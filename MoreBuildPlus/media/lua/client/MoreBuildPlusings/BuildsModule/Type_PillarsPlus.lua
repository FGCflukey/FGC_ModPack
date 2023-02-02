if not getMoreBuildPlusInstance then
  require('MoreBuildPlusings/MoreBuildPluss_Main')
end

local MoreBuildPlus = getMoreBuildPlusInstance()

MoreBuildPlus.pillarsPlusMenuBuilder = function(subMenu, player)
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
    Woodwork = 4
  }

  local _pillarsPlusData = MoreBuildPlus.getpillarsPlusData()

  for _, _currentList in pairs(_pillarsPlusData) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, MoreBuildPlus.onBuildpillarsPlus, _sprite, player, _name)

    _tooltip = MoreBuildPlus.canBuildObject(needSkills, _option, player)
    _tooltip.description = _currentList[6] .. _tooltip.description
    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end


MoreBuildPlus.getpillarsPlusData = function()
  local _pillarsPlusData = {

        {
      'walls_interior_house_01_3',
      'walls_interior_house_01_3',
      'walls_interior_house_01_3',
      'walls_interior_house_01_3',
      "White & Gray Pillar",
      "Can be used as a wall edge or as individual pillar."
    },
    {
      'walls_interior_house_01_39',
      'walls_interior_house_01_39',
      'walls_interior_house_01_39',
      'walls_interior_house_01_39',
      "Yellow Pillar ",
      "Can be used as a wall edge or as individual pillar."
    },
    {
      'walls_interior_house_03_19',
      'walls_interior_house_03_19',
      'walls_interior_house_03_19',
      'walls_interior_house_03_19',
      "Plaid Pillar ",
      "Can be used as a wall edge or as individual pillar."
    },
	{
      'walls_interior_house_03_51',
      'walls_interior_house_03_51',
      'walls_interior_house_03_51',
      'walls_interior_house_03_51',
      "Lavender Pillar ",
      "Can be used as a wall edge or as individual pillar."
    },
	{
      'walls_interior_house_03_55',
      'walls_interior_house_03_55',
      'walls_interior_house_03_55',
      'walls_interior_house_03_55',
      "Black & White Pillar ",
      "Can be used as a wall edge or as individual pillar."
    },
	{
      'walls_interior_house_04_55',
      'walls_interior_house_04_55',
      'walls_interior_house_04_55',
      'walls_interior_house_04_55',
      "Pink Pillar ",
      "Can be used as a wall edge or as individual pillar."
    },
	{
      'location_hospitality_sunstarmotel_01_7',
      'location_hospitality_sunstarmotel_01_7',
      'location_hospitality_sunstarmotel_01_7',
      'location_hospitality_sunstarmotel_01_7',
      "Flower Pillar ",
      "Can be used as a wall edge or as individual pillar."
    },
	{
      'location_restaurant_bar_01_47',
      'location_restaurant_bar_01_47',
      'location_restaurant_bar_01_47',
      'location_restaurant_bar_01_47',
      "Wood Pillar ",
      "Can be used as a wall edge or as individual pillar."
    },
	{
      'walls_interior_bathroom_01_3',
      'walls_interior_bathroom_01_3',
      'walls_interior_bathroom_01_3',
      'walls_interior_bathroom_01_3',
      "Tiled Bathroom Pillar ",
      "Can be used as a wall edge or as individual pillar."
    },
	{
      'walls_interior_bathroom_01_7',
      'walls_interior_bathroom_01_7',
      'walls_interior_bathroom_01_7',
      'walls_interior_bathroom_01_7',
      "Beige Pillar ",
      "Can be used as a wall edge or as individual pillar."
    },
	{
      'walls_interior_bathroom_01_19',
      'walls_interior_bathroom_01_19',
      'walls_interior_bathroom_01_19',
      'walls_interior_bathroom_01_19',
      "Gray Pillar ",
      "Can be used as a wall edge or as individual pillar."
    }
	
	
	
  }
  return _pillarsPlusData
end


MoreBuildPlus.onBuildpillarsPlus = function(ignoreThisArgument, sprite, player, name)
  local _sign = ISWoodenWall:new(sprite.sprite, sprite.northSprite, nil)

  _sign.canPassThrough = true
  _sign.canBarricade = false
  _sign.isCorner = true
  _sign.player = player
  _sign.name = name

  _sign.modData['need:Base.Plank'] = 2
  _sign.modData['need:Base.Nails'] = 2
  _sign.modData['xp:Woodwork'] = 2

  getCell():setDrag(_sign, player)
end

