if not getMoreBuildPlusInstance then
  require('MoreBuildPlusings/MoreBuildPluss_Main')
end

local MoreBuildPlus = getMoreBuildPlusInstance()

MoreBuildPlus.windowsPlusMenuBuilder = function(subMenu, player)
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

  local _windowsPLusData = MoreBuildPlus.getwindowsPLusData()

  for _, _currentList in pairs(_windowsPLusData) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, MoreBuildPlus.onBuildwindowsPLus, _sprite, player, _name)

    _tooltip = MoreBuildPlus.canBuildObject(needSkills, _option, player)
    _tooltip.description = _currentList[6] .. _tooltip.description
    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end

MoreBuildPlus.getwindowsPLusData = function()
  local _windowsPLusData = {

        {
      'walls_interior_house_01_8',
      'walls_interior_house_01_9',
      'walls_interior_house_01_8',
      'walls_interior_house_01_9',
      "White & Gray Window ",
      "Elegant wall with white and gray accents."
    },
	{
      'walls_interior_house_01_10',
      'walls_interior_house_01_11',
      'walls_interior_house_01_10',
      'walls_interior_house_01_11',
      "White & Gray Wall DoorFrame ",
      "Elegant wall with white and gray accents."
    },
    {
      'walls_interior_house_01_44',
      'walls_interior_house_01_45',
      'walls_interior_house_01_44',
      'walls_interior_house_01_45',
      "Yellow Window",
      "Elegant wall with yellow stripes."
    },
	{
      'walls_interior_house_01_46',
      'walls_interior_house_01_47',
      'walls_interior_house_01_46',
      'walls_interior_house_01_47',
      "Yellow Door Frame",
      "Elegant wall with yellow stripes."
    },
    {
      'walls_interior_house_03_24',
      'walls_interior_house_03_25',
      'walls_interior_house_03_24',
      'walls_interior_house_03_25',
      "Plaid Window",
      "Elegant wall with plaid stripes."
    },
	{
      'walls_interior_house_03_26',
      'walls_interior_house_03_27',
      'walls_interior_house_03_26',
      'walls_interior_house_03_27',
      "Plaid Door Frame",
      "Elegant wall with plaid stripes."
    },
	{
      'walls_interior_house_03_56',
      'walls_interior_house_03_57',
      'walls_interior_house_03_56',
      'walls_interior_house_03_57',
      "Lavender Window ",
      "Elegant lavendar wall."
    },
	{
      'walls_interior_house_03_58',
      'walls_interior_house_03_59',
      'walls_interior_house_03_58',
      'walls_interior_house_03_59',
      "Lavender Door Frame",
      "Elegant lavendar wall."
    },
	{
      'walls_interior_house_03_60',
      'walls_interior_house_03_61',
      'walls_interior_house_03_60',
      'walls_interior_house_03_61',
      "Black & White Window ",
      "Elegant black & white wall."
    },
	{
      'walls_interior_house_03_62',
      'walls_interior_house_03_63',
      'walls_interior_house_03_62',
      'walls_interior_house_03_63',
      "Black & White DoorF rame ",
      "Elegant black & white wall."
    },
	{
      'walls_interior_house_04_60',
      'walls_interior_house_04_61',
      'walls_interior_house_04_60',
      'walls_interior_house_04_61',
      "Pink Window ",
      "Elegant pink wall."
    },
	{
      'walls_interior_house_04_62',
      'walls_interior_house_04_63',
      'walls_interior_house_04_62',
      'walls_interior_house_04_63',
      "Pink Door Frame ",
      "Elegant pink wall."
    },
	{
      'location_hospitality_sunstarmotel_01_12',
      'location_hospitality_sunstarmotel_01_13',
      'location_hospitality_sunstarmotel_01_12',
      'location_hospitality_sunstarmotel_01_13',
      "Flower Window ",
      "Elegant flower wall."
    },
	{
      'location_hospitality_sunstarmotel_01_14',
      'location_hospitality_sunstarmotel_01_15',
      'location_hospitality_sunstarmotel_01_14',
      'location_hospitality_sunstarmotel_01_15',
      "Flower Door Frame ",
      "Elegant flower wall."
    },
	{
      'location_restaurant_bar_01_52',
      'location_restaurant_bar_01_53',
      'location_restaurant_bar_01_52',
      'location_restaurant_bar_01_53',
      "Wood Window ",
      "Elegant wood wall."
    },
	{
      'location_restaurant_bar_01_54',
      'location_restaurant_bar_01_55',
      'location_restaurant_bar_01_54',
      'location_restaurant_bar_01_55',
      "Wood Door Frame ",
      "Elegant wood wall."
    },
	{
      'walls_interior_bathroom_01_8',
      'walls_interior_bathroom_01_9',
      'walls_interior_bathroom_01_8',
      'walls_interior_bathroom_01_9',
      "Tiled Bathroom Window ",
      "Tiled bathroom wall."
    },
	{
      'walls_interior_bathroom_01_10',
      'walls_interior_bathroom_01_11',
      'walls_interior_bathroom_01_10',
      'walls_interior_bathroom_01_11',
      "Tiled Door Frame ",
      "Tiled bathroom wall."
    },
	{
      'walls_interior_bathroom_01_12',
      'walls_interior_bathroom_01_13',
      'walls_interior_bathroom_01_12',
      'walls_interior_bathroom_01_13',
      "Beige Window ",
      "Beige wall with trim."
    },
	{
      'walls_interior_bathroom_01_14',
      'walls_interior_bathroom_01_15',
      'walls_interior_bathroom_01_14',
      'walls_interior_bathroom_01_15',
      "Beige Door Frame ",
      "Beige wall with trim."
    },
	{
      'walls_interior_bathroom_01_24',
      'walls_interior_bathroom_01_25',
      'walls_interior_bathroom_01_24',
      'walls_interior_bathroom_01_25',
      "Gray Window ",
      "Gray wall with gray trim."
    },
	{
      'walls_interior_bathroom_01_26',
      'walls_interior_bathroom_01_27',
      'walls_interior_bathroom_01_26',
      'walls_interior_bathroom_01_27',
      "Gray Door Frame ",
      "Gray wall with gray trim."
    }
	
	
	
	
  }
  return _windowsPLusData
end


MoreBuildPlus.onBuildwindowsPLus = function(ignoreThisArgument, sprite, player, name)
  local _sign = ISWoodenDoorFrame:new(sprite.sprite, sprite.northSprite, sprite.corner)

  _sign.player = player
  _sign.name = name
  _sign.eastSprite = sprite.eastSprite
  _sign.southSprite = sprite.southSprite
  _sign.northSprite = sprite.northSprite
  _sign.renderFloorHelper = true

  _sign.modData['need:Base.Plank'] = 4
  _sign.modData['need:Base.Nails'] = 4
  _sign.modData['xp:Woodwork'] = 10

  getCell():setDrag(_sign, player)
end

