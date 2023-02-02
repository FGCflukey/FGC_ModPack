if not getMoreBuildPlusInstance then
  require('MoreBuildPlusings/MoreBuildPluss_Main')
end

local MoreBuildPlus = getMoreBuildPlusInstance()

MoreBuildPlus.roofOnePlusMenuBuilder = function(subMenu, player)
  local _sprite
  local _option
  local _tooltip
  local _name = ''

  MoreBuildPlus.neededMaterials = {
    {
      Material = 'Base.Plank',
      Amount = 1
    },
    {
      Material = 'Base.Nails',
      Amount = 2
    }
  }

  MoreBuildPlus.neededTools = {'Hammer'}

  local needSkills = {
    Woodwork = 2
  }

  local _roofOnePlusData = MoreBuildPlus.getroofOnePlusData()

  for _, _currentList in pairs(_roofOnePlusData) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, MoreBuildPlus.onBuildroofOnePlus, _sprite, player, _name)

    _tooltip = MoreBuildPlus.canBuildObject(needSkills, _option, player)
    _tooltip.description = _currentList[6] .. _tooltip.description
    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end


MoreBuildPlus.getroofOnePlusData = function()
  local _roofOnePlusData = {

        {
      'roofs_01_0',
      'roofs_01_5',
      'roofs_01_0',
      'roofs_01_5',
      "Roof 1",
      "Roof piece with a height of one."
    },
	{
      'roofs_01_1',
      'roofs_01_4',
      'roofs_01_1',
      'roofs_01_4',
      "Roof 2",
      "Roof piece with a height of two."
    },
	{
      'roofs_01_2',
      'roofs_01_3',
      'roofs_01_2',
      'roofs_01_3',
      "Roof 3",
      "Roof piece with a height of three."
    },
	{
      'roofs_01_8',
      'roofs_01_8',
      'roofs_01_8',
      'roofs_01_8',
      "Corner 1",
      "Corner with a height of one."
    },
	{
      'roofs_01_9',
      'roofs_01_9',
      'roofs_01_9',
      'roofs_01_9',
      "Corner 2",
      "Corner with a height of two."
    },
	{
      'roofs_01_10',
      'roofs_01_10',
      'roofs_01_10',
      'roofs_01_10',
      "Corner 3",
      "Corner with a height of three."
    },
	{
      'roofs_01_11',
      'roofs_01_11',
      'roofs_01_11',
      'roofs_01_11',
      "Inverted Corner 1",
      "Corner with a height of one."
    },
	{
      'roofs_01_12',
      'roofs_01_12',
      'roofs_01_12',
      'roofs_01_12',
      "Inverted Corner 2",
      "Corner with a height of two."
    },
	{
      'roofs_01_13',
      'roofs_01_13',
      'roofs_01_13',
      'roofs_01_13',
      "Inverted Corner 3",
      "Corner with a height of three."
    },
	{
      'roofs_01_24',
      'roofs_01_29',
      'roofs_01_29',
      'roofs_01_29',
      "Edge 1",
      "Roof edge with a height of one."
    },
	{
      'roofs_01_25',
      'roofs_01_28',
      'roofs_01_25',
      'roofs_01_28',
      "Edge 2",
      "Roof edge with a height of two."
    },
	{
      'roofs_01_26',
      'roofs_01_27',
      'roofs_01_26',
      'roofs_01_27',
      "Edge 3",
      "Roof edge with a height of three,"
    },
	{
      'roofs_01_6',
      'roofs_01_7',
      'roofs_01_6',
      'roofs_01_7',
      "Trimming",
      "To be used on the bottom edge of roofs."
    },
	{
      'roofs_01_21',
      'roofs_01_21',
      'roofs_01_21',
      'roofs_01_21',
      "Trimming Corner",
      "To be used on the bottom edge of roofs."
    },
	{
      'roofs_01_20',
      'roofs_01_20',
      'roofs_01_20',
      'roofs_01_20',
      "Trimming Inverted Corner",
      "To be used on the bottom edge of roofs."
    },
	{
      'roofs_01_30',
      'roofs_01_31',
      'roofs_01_30',
      'roofs_01_31',
      "Trimming edge",
      "To be used on the bottom edge of roofs."
    },
	{
      'roofs_01_22',
      'roofs_01_23',
      'roofs_01_22',
      'roofs_01_23',
      "Flat Roof ",
      "Flat roof."
    },
	{
      'roofs_01_80',
      'roofs_01_87',
      'roofs_01_80',
      'roofs_01_87',
      "Patio Roof ",
      "Patio roof."
    },
	{
      'roofs_01_124',
      'roofs_01_124',
      'roofs_01_124',
      'roofs_01_124',
      "Patio Roof Corner",
      "Patio Roof Corner."
    },
	{
      'roofs_01_14',
      'roofs_01_15',
      'roofs_01_14',
      'roofs_01_15',
      "Half Roof ",
      "Half roof."
    }
	
  }
  return _roofOnePlusData
end


MoreBuildPlus.onBuildroofOnePlus = function(ignoreThisArgument, sprite, player, name)
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

  _sign.modData['need:Base.Plank'] = 1
  _sign.modData['need:Base.Nails'] = 2
  _sign.modData['xp:Woodwork'] = 5

  getCell():setDrag(_sign, player)
end

