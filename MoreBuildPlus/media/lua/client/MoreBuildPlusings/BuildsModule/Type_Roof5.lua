if not getMoreBuildPlusInstance then
  require('MoreBuildPlusings/MoreBuildPluss_Main')
end

local MoreBuildPlus = getMoreBuildPlusInstance()

MoreBuildPlus.roofFivePlusMenuBuilder = function(subMenu, player)
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

  local _roofFivePlusData = MoreBuildPlus.getroofFivePlusData()

  for _, _currentList in pairs(_roofFivePlusData) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, MoreBuildPlus.onBuildroofFivePlus, _sprite, player, _name)

    _tooltip = MoreBuildPlus.canBuildObject(needSkills, _option, player)
    _tooltip.description = _currentList[6] .. _tooltip.description
    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end


MoreBuildPlus.getroofFivePlusData = function()
  local _roofFivePlusData = {

        {
      'roofs_05_32',
      'roofs_05_37',
      'roofs_05_32',
      'roofs_05_37',
      "Roof 1",
      "Roof piece with a height of one."
    },
	{
      'roofs_05_33',
      'roofs_05_36',
      'roofs_05_33',
      'roofs_05_36',
      "Roof 2",
      "Roof piece with a height of two."
    },
	{
      'roofs_05_34',
      'roofs_05_35',
      'roofs_05_34',
      'roofs_05_35',
      "Roof 3",
      "Roof piece with a height of three."
    },
	{
      'roofs_05_40',
      'roofs_05_40',
      'roofs_05_40',
      'roofs_05_40',
      "Corner 1",
      "Corner with a height of one."
    },
	{
      'roofs_05_41',
      'roofs_05_41',
      'roofs_05_41',
      'roofs_05_41',
      "Corner 2",
      "Corner with a height of two."
    },
	{
      'roofs_05_42',
      'roofs_05_42',
      'roofs_05_42',
      'roofs_05_42',
      "Corner 3",
      "Corner with a height of three."
    },
	{
      'roofs_05_43',
      'roofs_05_43',
      'roofs_05_43',
      'roofs_05_43',
      "Inverted Corner 1",
      "Corner with a height of one."
    },
	{
      'roofs_05_44',
      'roofs_05_44',
      'roofs_05_44',
      'roofs_05_44',
      "Inverted Corner 2",
      "Corner with a height of two."
    },
	{
      'roofs_05_45',
      'roofs_05_45',
      'roofs_05_45',
      'roofs_05_45',
      "Inverted Corner 3",
      "Corner with a height of three."
    },
	{
      'roofs_05_56',
      'roofs_05_61',
      'roofs_05_56',
      'roofs_05_61',
      "Edge 1",
      "Roof edge with a height of one."
    },
	{
      'roofs_05_57',
      'roofs_05_60',
      'roofs_05_57',
      'roofs_05_60',
      "Edge 2",
      "Roof edge with a height of two."
    },
	{
      'roofs_05_58',
      'roofs_05_59',
      'roofs_05_58',
      'roofs_05_59',
      "Edge 3",
      "Roof edge with a height of three,"
    },{
      'roofs_05_38',
      'roofs_05_39',
      'roofs_05_38',
      'roofs_05_39',
      "Trimming",
      "To be used on the bottom edge of roofs."
    },
	{
      'roofs_05_53',
      'roofs_05_53',
      'roofs_05_53',
      'roofs_05_53',
      "Trimming Corner",
      "To be used on the bottom edge of roofs."
    },
	{
      'roofs_05_52',
      'roofs_05_52',
      'roofs_05_52',
      'roofs_05_52',
      "Trimming Inverted Corner",
      "To be used on the bottom edge of roofs."
    },
	{
      'roofs_05_62',
      'roofs_05_63',
      'roofs_05_62',
      'roofs_05_63',
      "Trimming edge",
      "To be used on the bottom edge of roofs."
    },
	{
      'roofs_05_54',
      'roofs_05_54',
      'roofs_05_54',
      'roofs_05_54',
      "Flat Roof ",
      "Flat roof."
    },
	{
      'roofs_05_112',
      'roofs_05_119',
      'roofs_05_112',
      'roofs_05_119',
      "Patio Roof ",
      "Patio roof."
    },
	{
      'roofs_05_165',
      'roofs_05_165',
      'roofs_05_165',
      'roofs_05_165',
      "Patio Roof Corner",
      "Patio Roof Corner."
    },
	{
      'roofs_05_47',
      'roofs_05_46',
      'roofs_05_47',
      'roofs_05_46',
      "Half Roof ",
      "Half roof."
    }
	
  }
  return _roofFivePlusData
end


MoreBuildPlus.onBuildroofFivePlus = function(ignoreThisArgument, sprite, player, name)
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

