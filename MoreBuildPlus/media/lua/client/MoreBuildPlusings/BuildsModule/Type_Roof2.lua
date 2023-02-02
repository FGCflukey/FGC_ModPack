if not getMoreBuildPlusInstance then
  require('MoreBuildPlusings/MoreBuildPluss_Main')
end

local MoreBuildPlus = getMoreBuildPlusInstance()

MoreBuildPlus.roofTwoPlusMenuBuilder = function(subMenu, player)
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

  local _roofTwoPlusData = MoreBuildPlus.getroofTwoPlusData()

  for _, _currentList in pairs(_roofTwoPlusData) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, MoreBuildPlus.onBuildroofTwoPlus, _sprite, player, _name)

    _tooltip = MoreBuildPlus.canBuildObject(needSkills, _option, player)
    _tooltip.description = _currentList[6] .. _tooltip.description
    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end

MoreBuildPlus.getroofTwoPlusData = function()
  local _roofTwoPlusData = {

        {
      'roofs_01_32',
      'roofs_01_37',
      'roofs_01_32',
      'roofs_01_37',
      "Roof 1",
      "Roof piece with a height of one."
    },
	{
      'roofs_01_33',
      'roofs_01_36',
      'roofs_01_33',
      'roofs_01_36',
      "Roof 2",
      "Roof piece with a height of two."
    },
	{
      'roofs_01_34',
      'roofs_01_35',
      'roofs_01_34',
      'roofs_01_35',
      "Roof 3",
      "Roof piece with a height of three."
    },
	{
      'roofs_01_40',
      'roofs_01_40',
      'roofs_01_40',
      'roofs_01_40',
      "Corner 1",
      "Corner with a height of one."
    },
	{
      'roofs_01_41',
      'roofs_01_41',
      'roofs_01_41',
      'roofs_01_41',
      "Corner 2",
      "Corner with a height of two."
    },
	{
      'roofs_01_42',
      'roofs_01_42',
      'roofs_01_42',
      'roofs_01_42',
      "Corner 3",
      "Corner with a height of three."
    },
	{
      'roofs_01_43',
      'roofs_01_43',
      'roofs_01_43',
      'roofs_01_43',
      "Inverted Corner 1",
      "Corner with a height of one."
    },
	{
      'roofs_01_44',
      'roofs_01_44',
      'roofs_01_44',
      'roofs_01_44',
      "Inverted Corner 2",
      "Corner with a height of two."
    },
	{
      'roofs_01_45',
      'roofs_01_45',
      'roofs_01_45',
      'roofs_01_45',
      "Inverted Corner 3",
      "Corner with a height of three."
    },
	{
      'roofs_01_56',
      'roofs_01_61',
      'roofs_01_56',
      'roofs_01_61',
      "Edge 1",
      "Roof edge with a height of one."
    },
	{
      'roofs_01_57',
      'roofs_01_60',
      'roofs_01_57',
      'roofs_01_60',
      "Edge 2",
      "Roof edge with a height of two."
    },
	{
      'roofs_01_58',
      'roofs_01_59',
      'roofs_01_58',
      'roofs_01_59',
      "Edge 3",
      "Roof edge with a height of three,"
    },
	{
      'roofs_01_38',
      'roofs_01_39',
      'roofs_01_38',
      'roofs_01_39',
      "Trimming",
      "To be used on the bottom edge of roofs."
    },
	{
      'roofs_01_53',
      'roofs_01_53',
      'roofs_01_53',
      'roofs_01_53',
      "Trimming Corner",
      "To be used on the bottom edge of roofs."
    },
	{
      'roofs_01_52',
      'roofs_01_52',
      'roofs_01_52',
      'roofs_01_52',
      "Trimming Inverted Corner",
      "To be used on the bottom edge of roofs."
    },
	{
      'roofs_01_62',
      'roofs_01_63',
      'roofs_01_62',
      'roofs_01_63',
      "Trimming edge",
      "To be used on the bottom edge of roofs."
    },
	{
      'roofs_01_54',
      'roofs_01_54',
      'roofs_01_54',
      'roofs_01_54',
      "Flat Roof ",
      "Flat roof."
    },
	{
      'roofs_01_47',
      'roofs_01_46',
      'roofs_01_47',
      'roofs_01_46',
      "Half Roof ",
      "Half roof."
    }
	
  }
  return _roofTwoPlusData
end


MoreBuildPlus.onBuildroofTwoPlus = function(ignoreThisArgument, sprite, player, name)
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

