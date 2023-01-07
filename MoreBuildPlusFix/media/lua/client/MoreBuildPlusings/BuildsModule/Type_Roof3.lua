if not getMoreBuildPlusInstance then
  require('MoreBuildPlusings/MoreBuildPluss_Main')
end

local MoreBuildPlus = getMoreBuildPlusInstance()

MoreBuildPlus.roofThreePlusMenuBuilder = function(subMenu, player)
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

  local _roofThreePlusData = MoreBuildPlus.getroofThreePlusData()

  for _, _currentList in pairs(_roofThreePlusData) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, MoreBuildPlus.onBuildroofThreePlus, _sprite, player, _name)

    _tooltip = MoreBuildPlus.canBuildObject(needSkills, _option, player)
    _tooltip.description = _currentList[6] .. _tooltip.description
    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end


MoreBuildPlus.getroofThreePlusData = function()
  local _roofThreePlusData = {

        {
      'roofs_02_0',
      'roofs_02_5',
      'roofs_02_0',
      'roofs_02_5',
      "Roof 1",
      "Roof piece with a height of one."
    },
	{
      'roofs_02_1',
      'roofs_02_4',
      'roofs_02_1',
      'roofs_02_4',
      "Roof 2",
      "Roof piece with a height of two."
    },
	{
      'roofs_02_2',
      'roofs_02_3',
      'roofs_02_2',
      'roofs_02_3',
      "Roof 3",
      "Roof piece with a height of three."
    },
	{
      'roofs_02_8',
      'roofs_02_8',
      'roofs_02_8',
      'roofs_02_8',
      "Corner 1",
      "Corner with a height of one."
    },
	{
      'roofs_02_9',
      'roofs_02_9',
      'roofs_02_9',
      'roofs_02_9',
      "Corner 2",
      "Corner with a height of two."
    },
	{
      'roofs_02_10',
      'roofs_02_10',
      'roofs_02_10',
      'roofs_02_10',
      "Corner 3",
      "Corner with a height of three."
    },
	{
      'roofs_02_11',
      'roofs_02_11',
      'roofs_02_11',
      'roofs_02_11',
      "Inverted Corner 1",
      "Corner with a height of one."
    },
	{
      'roofs_02_12',
      'roofs_02_12',
      'roofs_02_12',
      'roofs_02_12',
      "Inverted Corner 2",
      "Corner with a height of two."
    },
	{
      'roofs_02_13',
      'roofs_02_13',
      'roofs_02_13',
      'roofs_02_13',
      "Inverted Corner 3",
      "Corner with a height of three."
    },
	{
      'roofs_02_24',
      'roofs_02_29',
      'roofs_02_29',
      'roofs_02_29',
      "Edge 1",
      "Roof edge with a height of one."
    },
	{
      'roofs_02_25',
      'roofs_02_28',
      'roofs_02_25',
      'roofs_02_28',
      "Edge 2",
      "Roof edge with a height of two."
    },
	{
      'roofs_02_26',
      'roofs_02_27',
      'roofs_02_26',
      'roofs_02_27',
      "Edge 3",
      "Roof edge with a height of three,"
    },
	{
      'roofs_02_6',
      'roofs_02_7',
      'roofs_02_6',
      'roofs_02_7',
      "Trimming",
      "To be used on the bottom edge of roofs."
    },
	{
      'roofs_02_21',
      'roofs_02_21',
      'roofs_02_21',
      'roofs_02_21',
      "Trimming Corner",
      "To be used on the bottom edge of roofs."
    },
	{
      'roofs_02_20',
      'roofs_02_20',
      'roofs_02_20',
      'roofs_02_20',
      "Trimming Inverted Corner",
      "To be used on the bottom edge of roofs."
    },
	{
      'roofs_02_30',
      'roofs_02_31',
      'roofs_02_30',
      'roofs_02_31',
      "Trimming edge",
      "To be used on the bottom edge of roofs."
    },
	{
      'roofs_02_22',
      'roofs_02_23',
      'roofs_02_22',
      'roofs_02_23',
      "Flat Roof ",
      "Flat roof."
    },
	{
      'roofs_02_80',
      'roofs_02_87',
      'roofs_02_80',
      'roofs_02_87',
      "Patio Roof ",
      "Patio roof."
    },
	{
      'roofs_02_116',
      'roofs_02_116',
      'roofs_02_116',
      'roofs_02_116',
      "Patio Roof Corner",
      "Patio Roof Corner."
    },
	{
      'roofs_02_14',
      'roofs_02_15',
      'roofs_02_14',
      'roofs_02_15',
      "Half Roof ",
      "Half roof."
    }
	
  }
  return _roofThreePlusData
end


MoreBuildPlus.onBuildroofThreePlus = function(ignoreThisArgument, sprite, player, name)
  local _sign = ISSimpleFurniture:new(name, sprite.sprite, sprite.northSprite)

  _sign.player = player
  _sign.name = name
  _sign.eastSprite = sprite.eastSprite
  _sign.southSprite = sprite.southSprite
  _sign.northSprite = sprite.northSprite
  _sign.canPassThrough = true
  _sign.blockAllTheSquare = false
  _sign.renderFloorHelper = true
  _sign.isCorner = true

  _sign.modData['need:Base.Plank'] = 1
  _sign.modData['need:Base.Nails'] = 2
  _sign.modData['xp:Woodwork'] = 5

  getCell():setDrag(_sign, player)
end

