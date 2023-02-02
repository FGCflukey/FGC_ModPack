if not getMoreBuildPlusInstance then
  require('MoreBuildPlusings/MoreBuildPluss_Main')
end

local MoreBuildPlus = getMoreBuildPlusInstance()

MoreBuildPlus.roofFourPlusMenuBuilder = function(subMenu, player)
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
      Amount = 2
    }
  }

  MoreBuildPlus.neededTools = {'Hammer'}

  local needSkills = {
    MetalWelding = 2
  }

  local _roofFourPlusData = MoreBuildPlus.getroofFourPlusData()

  for _, _currentList in pairs(_roofFourPlusData) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, MoreBuildPlus.onBuildroofFourPlus, _sprite, player, _name)

    _tooltip = MoreBuildPlus.canBuildObject(needSkills, _option, player)
    _tooltip.description = _currentList[6] .. _tooltip.description
    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end


MoreBuildPlus.getroofFourPlusData = function()
  local _roofFourPlusData = {

        {
      'roofs_03_32',
      'roofs_03_37',
      'roofs_03_32',
      'roofs_03_37',
      "Roof 1",
      "Roof piece with a height of one."
    },
	{
      'roofs_03_33',
      'roofs_03_36',
      'roofs_03_33',
      'roofs_03_36',
      "Roof 2",
      "Roof piece with a height of two."
    },
	{
      'roofs_03_34',
      'roofs_03_35',
      'roofs_03_34',
      'roofs_03_35',
      "Roof 3",
      "Roof piece with a height of three."
    },
	{
      'roofs_03_40',
      'roofs_03_40',
      'roofs_03_40',
      'roofs_03_40',
      "Corner 1",
      "Corner with a height of one."
    },
	{
      'roofs_03_41',
      'roofs_03_41',
      'roofs_03_41',
      'roofs_03_41',
      "Corner 2",
      "Corner with a height of two."
    },
	{
      'roofs_03_42',
      'roofs_03_42',
      'roofs_03_42',
      'roofs_03_42',
      "Corner 3",
      "Corner with a height of three."
    },
	{
      'roofs_03_43',
      'roofs_03_43',
      'roofs_03_43',
      'roofs_03_43',
      "Inverted Corner 1",
      "Corner with a height of one."
    },
	{
      'roofs_03_44',
      'roofs_03_44',
      'roofs_03_44',
      'roofs_03_44',
      "Inverted Corner 2",
      "Corner with a height of two."
    },
	{
      'roofs_03_45',
      'roofs_03_45',
      'roofs_03_45',
      'roofs_03_45',
      "Inverted Corner 3",
      "Corner with a height of three."
    },
	{
      'roofs_03_56',
      'roofs_03_61',
      'roofs_03_56',
      'roofs_03_61',
      "Edge 1",
      "Roof edge with a height of one."
    },
	{
      'roofs_03_57',
      'roofs_03_60',
      'roofs_03_57',
      'roofs_03_60',
      "Edge 2",
      "Roof edge with a height of two."
    },
	{
      'roofs_03_58',
      'roofs_03_59',
      'roofs_03_58',
      'roofs_03_59',
      "Edge 3",
      "Roof edge with a height of three,"
    },{
      'roofs_03_38',
      'roofs_03_39',
      'roofs_03_38',
      'roofs_03_39',
      "Trimming",
      "To be used on the bottom edge of roofs."
    },
	{
      'roofs_03_53',
      'roofs_03_53',
      'roofs_03_53',
      'roofs_03_53',
      "Trimming Corner",
      "To be used on the bottom edge of roofs."
    },
	{
      'roofs_03_52',
      'roofs_03_52',
      'roofs_03_52',
      'roofs_03_52',
      "Trimming Inverted Corner",
      "To be used on the bottom edge of roofs."
    },
	{
      'roofs_03_62',
      'roofs_03_63',
      'roofs_03_62',
      'roofs_03_63',
      "Trimming edge",
      "To be used on the bottom edge of roofs."
    },
	{
      'roofs_03_54',
      'roofs_03_54',
      'roofs_03_54',
      'roofs_03_54',
      "Flat Roof ",
      "Flat roof."
    },
	{
      'roofs_03_47',
      'roofs_03_46',
      'roofs_03_47',
      'roofs_03_46',
      "Half Roof ",
      "Half roof."
    }

	
  }
  return _roofFourPlusData
end


MoreBuildPlus.onBuildroofFourPlus = function(ignoreThisArgument, sprite, player, name)
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

  _sign.modData['need:Base.SmallSheetMetal'] = 1
  _sign.modData['use:Base.BlowTorch'] = 2
  _sign.modData['xp:MetalWelding'] = 5

  getCell():setDrag(_sign, player)
end

