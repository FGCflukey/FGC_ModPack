if not getMoreBuildPlusInstance then
  require('MoreBuildPlusings/MoreBuildPluss_Main')
end

local MoreBuildPlus = getMoreBuildPlusInstance()

MoreBuildPlus.wallsPlusMenuBuilder = function(subMenu, player)
  local _sprite
  local _option
  local _tooltip
  local _name = ''

  MoreBuildPlus.neededMaterials = {
    {
      Material = 'Base.Plank',
      Amount = 4
    },
    {
      Material = 'Base.Nails',
      Amount = 4
    }
  }

  MoreBuildPlus.neededTools = {'Hammer'}

  local needSkills = {
    Woodwork = 4
  }

  local _wallsPlusData = MoreBuildPlus.getwallsPlusData()

  for _, _currentList in pairs(_wallsPlusData) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, MoreBuildPlus.onBuildwallsPlus, _sprite, player, _name)

    _tooltip = MoreBuildPlus.canBuildObject(needSkills, _option, player)
    _tooltip.description = _currentList[6] .. _tooltip.description
    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end


MoreBuildPlus.getwallsPlusData = function()
  local _wallsPlusData = {

        {
      'walls_interior_house_01_0',
      'walls_interior_house_01_1',
      'walls_interior_house_01_0',
      'walls_interior_house_01_1',
      "White & Gray Wall",
      "Elegant wall with white and gray accents."
    },
    {
      'walls_interior_house_01_2',
      'walls_interior_house_01_2',
      'walls_interior_house_01_2',
      'walls_interior_house_01_2',
      "White & Gray Corner ",
      "Elegant wall with white and gray accents."
    },
    {
      'walls_interior_house_01_36',
      'walls_interior_house_01_37',
      'walls_interior_house_01_36',
      'walls_interior_house_01_37',
      "Yellow Wall",
      "Elegant wall with yellow stripes."
    },
    {
      'walls_interior_house_01_38',
      'walls_interior_house_01_38',
      'walls_interior_house_01_38',
      'walls_interior_house_01_38',
      "Yellow Corner ",
      "Elegant wall with yellow stripes."
    },
    {
      'walls_interior_house_03_16',
      'walls_interior_house_03_17',
      'walls_interior_house_03_16',
      'walls_interior_house_03_17',
      "Plaid Wall",
      "Elegant wall with plaid stripes."
    },
	{
      'walls_interior_house_03_18',
      'walls_interior_house_03_18',
      'walls_interior_house_03_18',
      'walls_interior_house_03_18',
      "Plaid Corner",
      "Elegant wall with plaid stripes."
    },
	{
      'walls_interior_house_03_48',
      'walls_interior_house_03_49',
      'walls_interior_house_03_48',
      'walls_interior_house_03_49',
      "Lavender Wall",
      "Elegant lavendar wall."
    },
	{
      'walls_interior_house_03_50',
      'walls_interior_house_03_50',
      'walls_interior_house_03_50',
      'walls_interior_house_03_50',
      "Lavender Corner",
      "Elegant lavendar wall. "
    },
	{
      'walls_interior_house_03_52',
      'walls_interior_house_03_53',
      'walls_interior_house_03_52',
      'walls_interior_house_03_53',
      "Black & White Wall",
      "Elegant black & white wall."
    },
	{
      'walls_interior_house_03_54',
      'walls_interior_house_03_54',
      'walls_interior_house_03_54',
      'walls_interior_house_03_54',
      "Black & White Corner",
      "Elegant black & white wall."
    },
	{
      'walls_interior_house_04_52',
      'walls_interior_house_04_53',
      'walls_interior_house_04_52',
      'walls_interior_house_04_53',
      "Pink Wall",
      "Elegant pink wall. "
    },
	{
      'walls_interior_house_04_54',
      'walls_interior_house_04_54',
      'walls_interior_house_04_54',
      'walls_interior_house_04_54',
      "Pink Corner",
      "Elegant pink wall."
    },
	{
      'location_hospitality_sunstarmotel_01_4',
      'location_hospitality_sunstarmotel_01_5',
      'location_hospitality_sunstarmotel_01_4',
      'location_hospitality_sunstarmotel_01_5',
      "Flower Wall",
      "Elegant flower wall."
    },
	{
      'location_hospitality_sunstarmotel_01_6',
      'location_hospitality_sunstarmotel_01_6',
      'location_hospitality_sunstarmotel_01_6',
      'location_hospitality_sunstarmotel_01_6',
      "Flower Corner",
      "Elegant flower wall."
    },
	{
      'location_restaurant_bar_01_44',
      'location_restaurant_bar_01_45',
      'location_restaurant_bar_01_44',
      'location_restaurant_bar_01_45',
      "Wood Wall",
      "Elegant wood wall."
    },
	{
      'location_restaurant_bar_01_46',
      'location_restaurant_bar_01_46',
      'location_restaurant_bar_01_46',
      'location_restaurant_bar_01_46',
      "Wood Corner",
      "Elegant wood wall."
    },
	{
      'walls_interior_bathroom_01_0',
      'walls_interior_bathroom_01_1',
      'walls_interior_bathroom_01_0',
      'walls_interior_bathroom_01_1',
      "Tiled Bathroom Wall",
      "Tiled bathroom wall."
    },
	{
      'walls_interior_bathroom_01_2',
      'walls_interior_bathroom_01_2',
      'walls_interior_bathroom_01_2',
      'walls_interior_bathroom_01_2',
      "Tiled Bathroom Corner",
      "Tiled bathroom wall."
    },
	{
      'walls_interior_bathroom_01_4',
      'walls_interior_bathroom_01_5',
      'walls_interior_bathroom_01_4',
      'walls_interior_bathroom_01_5',
      "Beige Wall",
      "Beige wall with trim."
    },
	{
      'walls_interior_bathroom_01_6',
      'walls_interior_bathroom_01_6',
      'walls_interior_bathroom_01_6',
      'walls_interior_bathroom_01_6',
      "Beige Corner ",
      "Beige wall with trim."
    },
	{
      'walls_interior_bathroom_01_16',
      'walls_interior_bathroom_01_17',
      'walls_interior_bathroom_01_16',
      'walls_interior_bathroom_01_17',
      "Gray Wall",
      "Gray wall with gray trim."
    },
	{
      'walls_interior_bathroom_01_18',
      'walls_interior_bathroom_01_18',
      'walls_interior_bathroom_01_18',
      'walls_interior_bathroom_01_18',
      "Gray Corner",
      "Gray wall with gray trim."
    }
	
	
	
  }
  return _wallsPlusData
end


MoreBuildPlus.onBuildwallsPlus = function(ignoreThisArgument, sprite, player, name)
  local _sign = ISWoodenWall:new(sprite.sprite, sprite.northSprite, nil)

  _sign.player = player
  _sign.name = name
  _sign.canBePlastered = false
  _sign.canBarricade = false
  _sign.modData['wallType'] = 'wall'
  _sign.player = player
  _sign.name = name
  _sign.renderFloorHelper = true

  _sign.modData['need:Base.Plank'] = 4
  _sign.modData['need:Base.Nails'] = 4
  _sign.modData['xp:Woodwork'] = 10

  getCell():setDrag(_sign, player)
end

