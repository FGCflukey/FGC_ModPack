if not getMoreBuildPlusInstance then
  require('MoreBuildPlusings/MoreBuildPluss_Main')
end

local MoreBuildPlus = getMoreBuildPlusInstance()

MoreBuildPlus.largeWindowFramePlusMenuBuilder = function(subMenu, player)
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
      Amount = 4
    }
  }

  MoreBuildPlus.neededTools = {'Hammer'}

  local needSkills = {
    Woodwork = 4
  }

  local _largeWindowFramePlusData = MoreBuildPlus.getlargeWindowFramePlusData()

  for _, _currentList in pairs(_largeWindowFramePlusData) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, MoreBuildPlus.onBuildlargeWindowFramePlus, _sprite, player, _name)

    _tooltip = MoreBuildPlus.canBuildObject(needSkills, _option, player)
    _tooltip.description = _currentList[6] .. _tooltip.description
    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end

--pillars didnt work need to make another type

MoreBuildPlus.getlargeWindowFramePlusData = function()
  local _largeWindowFramePlusData = {

        {
      'walls_exterior_house_03_18',
      'walls_exterior_house_03_19',
      'walls_exterior_house_03_18',
      'walls_exterior_house_03_19',
      "White Exterior",
      "Bugged! cannot be used as doorways. Still work as window frames for large windows."
    },
	{
      'walls_exterior_house_03_26',
      'walls_exterior_house_03_27',
      'walls_exterior_house_03_26',
      'walls_exterior_house_03_27',
      "Brown Exterior",
      "Bugged! cannot be used as doorways. Still work as window frames for large windows."
    },
	{
      'walls_exterior_house_03_16',
      'walls_exterior_house_03_17',
      'walls_exterior_house_03_16',
      'walls_exterior_house_03_17',
      "Beige Exterior",
      "Bugged! cannot be used as doorways. Still work as window frames for large windows."
    },
	{
      'walls_exterior_house_03_36',
      'walls_exterior_house_03_37',
      'walls_exterior_house_03_36',
      'walls_exterior_house_03_37',
      "Pink Exterior",
      "Bugged! cannot be used as doorways. Still work as window frames for large windows."
    },
	{
      'walls_exterior_house_03_32',
      'walls_exterior_house_03_33',
      'walls_exterior_house_03_32',
      'walls_exterior_house_03_33',
      "Green Exterior",
      "Bugged! cannot be used as doorways. Still work as window frames for large windows."
    },
	{
      'walls_exterior_house_03_8',
      'walls_exterior_house_03_9',
      'walls_exterior_house_03_8',
      'walls_exterior_house_03_9',
      "Gray Stone Exterior",
      "Bugged! cannot be used as doorways. Still work as window frames for large windows."
    },
	{
      'walls_exterior_house_03_4',
      'walls_exterior_house_03_5',
      'walls_exterior_house_03_4',
      'walls_exterior_house_03_5',
      "Beige Stone Exterior",
      "Bugged! cannot be used as doorways. Still work as window frames for large windows."
    },
	{
      'walls_exterior_house_03_10',
      'walls_exterior_house_03_11',
      'walls_exterior_house_03_10',
      'walls_exterior_house_03_11',
      "Brick Exterior",
      "Bugged! cannot be used as doorways. Still work as window frames for large windows."
    },
	{
      'walls_exterior_house_03_30',
      'walls_exterior_house_03_31',
      'walls_exterior_house_03_30',
      'walls_exterior_house_03_31',
      "Dark Brick Exterior",
      "Bugged! cannot be used as doorways. Still work as window frames for large windows."
    },
	{
      'walls_interior_house_05_10',
      'walls_interior_house_05_11',
      'walls_interior_house_05_10',
      'walls_interior_house_05_11',
      "White & Gray Interior",
      "Bugged! cannot be used as doorways. Still work as window frames for large windows."
    },
	{
      'walls_interior_house_05_46',
      'walls_interior_house_05_47',
      'walls_interior_house_05_46',
      'walls_interior_house_05_47',
      "Yellow Interior",
      "Bugged! cannot be used as doorways. Still work as window frames for large windows."
    },
	{
      'walls_interior_house_05_18',
      'walls_interior_house_05_19',
      'walls_interior_house_05_18',
      'walls_interior_house_05_19',
      "Plaid Interior",
      "Bugged! cannot be used as doorways. Still work as window frames for large windows."
    },
	{
      'walls_interior_house_05_50',
      'walls_interior_house_05_51',
      'walls_interior_house_05_50',
      'walls_interior_house_05_51',
      "Lavender Interior",
      "Bugged! cannot be used as doorways. Still work as window frames for large windows."
    },
	{
      'walls_interior_house_05_54',
      'walls_interior_house_05_55',
      'walls_interior_house_05_54',
      'walls_interior_house_05_55',
      "Black & White Interior",
      "Bugged! cannot be used as doorways. Still work as window frames for large windows."
    },
	{
      'walls_interior_house_05_52',
      'walls_interior_house_05_53',
      'walls_interior_house_05_52',
      'walls_interior_house_05_53',
      "Pink Interior",
      "Bugged! cannot be used as doorways. Still work as window frames for large windows."
    },
	{
      'walls_interior_house_05_74',
      'walls_interior_house_05_75',
      'walls_interior_house_05_74',
      'walls_interior_house_05_75',
      "Flower Interior",
      "Bugged! cannot be used as doorways. Still work as window frames for large windows."
    },
	{
      'walls_interior_house_05_80',
      'walls_interior_house_05_81',
      'walls_interior_house_05_80',
      'walls_interior_house_05_81',
      "Wooden Interior",
      "Bugged! cannot be used as doorways. Still work as window frames for large windows."
    },
	{
      'walls_interior_house_05_22',
      'walls_interior_house_05_23',
      'walls_interior_house_05_22',
      'walls_interior_house_05_23',
      "White Interior",
      "Bugged! cannot be used as doorways. Still work as window frames for large windows."
    },
	{
      'walls_interior_house_05_44',
      'walls_interior_house_05_45',
      'walls_interior_house_05_44',
      'walls_interior_house_05_45',
      "Brown Interior",
      "Bugged! cannot be used as doorways. Still work as window frames for large windows."
    },
	{
      'walls_interior_house_05_40',
      'walls_interior_house_05_41',
      'walls_interior_house_05_40',
      'walls_interior_house_05_41',
      "Blue Interior",
      "Bugged! cannot be used as doorways. Still work as window frames for large windows."
    },
	{
      'walls_interior_house_05_38',
      'walls_interior_house_05_39',
      'walls_interior_house_05_38',
      'walls_interior_house_05_39',
      "Black Interior",
      "Bugged! cannot be used as doorways. Still work as window frames for large windows."
    }
	
	
	
  }
  return _largeWindowFramePlusData
end


MoreBuildPlus.onBuildlargeWindowFramePlus = function(ignoreThisArgument, sprite, player, name)
  local _sign = ISWindowWallObj:new(sprite.sprite, sprite.northSprite, getSpecificPlayer(player))

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
  _sign.modData['need:Base.Nails'] = 4
  _sign.modData['xp:Woodwork'] = 7.5

  getCell():setDrag(_sign, player)
end

