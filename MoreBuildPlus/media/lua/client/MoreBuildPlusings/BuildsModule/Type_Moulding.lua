if not getMoreBuildPlusInstance then
  require('MoreBuildPlusings/MoreBuildPluss_Main')
end

local MoreBuildPlus = getMoreBuildPlusInstance()

MoreBuildPlus.mouldingMenuBuilder = function(subMenu, player)
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

  local _mouldingData = MoreBuildPlus.getMouldingData()

  for _, _currentList in pairs(_mouldingData) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, MoreBuildPlus.onBuildMoulding, _sprite, player, _name)

    _tooltip = MoreBuildPlus.canBuildObject(needSkills, _option, player)
    _tooltip.description = _currentList[6] .. _tooltip.description
    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end

MoreBuildPlus.getMouldingData = function()
  local _mouldingData = {

        {
      'walls_detailing_01_5',
      'walls_detailing_01_6',
      'walls_detailing_01_5',
      'walls_detailing_01_6',
      "Small Ornate ",
      "Elegant baseboard. Place after walls. "
    },
    {
      'walls_detailing_01_7',
      'walls_detailing_01_7',
      'walls_detailing_01_7',
      'walls_detailing_01_7',
      "Small Ornate Corner",
      "Elegant baseboard. Place after walls."
    },
    {
      'walls_detailing_01_20',
      'walls_detailing_01_20',
      'walls_detailing_01_20',
      'walls_detailing_01_20',
      "Small Ornate Edge",
      "Elegant baseboard. Place after walls."
    },
    {
      'walls_detailing_01_16',
      'walls_detailing_01_17',
      'walls_detailing_01_16',
      'walls_detailing_01_17',
      "Large Ornate ",
      "Elegant baseboard. Place after walls."
    },
    {
      'walls_detailing_01_18',
      'walls_detailing_01_18',
      'walls_detailing_01_18',
      'walls_detailing_01_18',
      "Large Ornate Corner",
      "Elegant baseboard. Place after walls."
    },
    {
      'walls_detailing_01_19',
      'walls_detailing_01_19',
      'walls_detailing_01_19',
      'walls_detailing_01_19',
      "Large Ornate Edge",
      "Elegant baseboard. Place after walls."
    },
    {
      'walls_detailing_01_80',
      'walls_detailing_01_81',
      'walls_detailing_01_80',
      'walls_detailing_01_81',
      "Large Ornate Brown",
      "Elegant baseboard. Place after walls."
    },
    {
      'walls_detailing_01_82',
      'walls_detailing_01_82',
      'walls_detailing_01_82',
      'walls_detailing_01_82',
      "Large Ornate Corner Brown",
      "Elegant baseboard. Place after walls."
    },
    {
      'walls_detailing_01_83',
      'walls_detailing_01_83',
      'walls_detailing_01_83',
      'walls_detailing_01_83',
      "Large Ornate Edge Brown",
      "Elegant baseboard. Place after walls."
    },
    {
      'walls_detailing_01_21',
      'walls_detailing_01_22',
      'walls_detailing_01_21',
      'walls_detailing_01_22',
      "Small ",
      "Elegant baseboard. Place after walls."
    },
    {
      'walls_detailing_01_23',
      'walls_detailing_01_23',
      'walls_detailing_01_23',
      'walls_detailing_01_23',
      "Small Corner",
      "Elegant baseboard. Place after walls."
    },
    {
      'walls_detailing_01_20',
      'walls_detailing_01_20',
      'walls_detailing_01_20',
      'walls_detailing_01_20',
      "Small Edge",
      "Elegant baseboard. Place after walls."
    },
	{
      'walls_detailing_01_45',
      'walls_detailing_01_46',
      'walls_detailing_01_45',
      'walls_detailing_01_46',
      "Small Brown Trim",
      "Elegant baseboard. Place after walls."
    },
	{
      'walls_detailing_01_47',
      'walls_detailing_01_47',
      'walls_detailing_01_47',
      'walls_detailing_01_47',
      "Small Brown Corner",
      "Elegant baseboard. Place after walls."
    },
	{
      'walls_detailing_01_55',
      'walls_detailing_01_55',
      'walls_detailing_01_55',
      'walls_detailing_01_55',
      "Small Brown Edge",
      "Elegant baseboard. Place after walls."
    },
    {
      'walls_detailing_01_29',
      'walls_detailing_01_30',
      'walls_detailing_01_29',
      'walls_detailing_01_30',
      "Small Crown ",
      "Elegant baseboard. Place after walls."
    },
    {
      'walls_detailing_01_31',
      'walls_detailing_01_31',
      'walls_detailing_01_31',
      'walls_detailing_01_31',
      "Small Crown Croner",
      "Elegant baseboard. Place after walls."
    },
    {
      'walls_detailing_01_31',
      'walls_detailing_01_31',
      'walls_detailing_01_31',
      'walls_detailing_01_31',
      "Small Crown Edge",
      "Elegant baseboard. Place after walls."
    },
    {
      'walls_detailing_01_56',
      'walls_detailing_01_57',
      'walls_detailing_01_56',
      'walls_detailing_01_57',
      "Large Ornate Crown ",
      "Elegant baseboard. Place after walls."
    },
    {
      'walls_detailing_01_58',
      'walls_detailing_01_58',
      'walls_detailing_01_58',
      'walls_detailing_01_58',
      "Large Ornate Crown Corner",
      "Elegant baseboard. Place after walls."
    },
    {
      'walls_detailing_01_59',
      'walls_detailing_01_59',
      'walls_detailing_01_59',
      'walls_detailing_01_59',
      "Large Ornate Crown Edge",
      "Elegant baseboard. Place after walls."
    },
	{
      'walls_detailing_01_84',
      'walls_detailing_01_85',
      'walls_detailing_01_84',
      'walls_detailing_01_85',
      "Large Brown Crown ",
      "Elegant baseboard. Place after walls."
    },
	{
      'walls_detailing_01_86',
      'walls_detailing_01_86',
      'walls_detailing_01_86',
      'walls_detailing_01_86',
      "Large Brown Crown Corner",
      "Elegant baseboard. Place after walls."
    },
	{
      'walls_detailing_01_87',
      'walls_detailing_01_87',
      'walls_detailing_01_87',
      'walls_detailing_01_87',
      "Large Brown Crown edge",
      "Elegant baseboard. Place after walls."
    },
	{
      'walls_detailing_01_36',
      'walls_detailing_01_37',
      'walls_detailing_01_36',
      'walls_detailing_01_37',
      "Small Brown Crown Trim",
      "Elegant baseboard. Place after walls."
    },
	{
      'walls_detailing_01_38',
      'walls_detailing_01_38',
      'walls_detailing_01_38',
      'walls_detailing_01_38',
      "Small Brown Crown Corner",
      "Elegant baseboard. Place after walls."
    },
	{
      'walls_detailing_01_39',
      'walls_detailing_01_39',
      'walls_detailing_01_39',
      'walls_detailing_01_39',
      "Small Brown Crown edge",
      "Elegant baseboard. Place after walls."
    },
    {
      'walls_detailing_01_61',
      'walls_detailing_01_62',
      'walls_detailing_01_61',
      'walls_detailing_01_62',
      "Small Ornate Crown",
      "Elegant baseboard. Place after walls."
    },
    {
      'walls_detailing_01_63',
      'walls_detailing_01_63',
      'walls_detailing_01_63',
      'walls_detailing_01_63',
      "Small Ornate Crown Corner",
      "Elegant baseboard. Place after walls."
    },
    {
      'walls_detailing_01_31',
      'walls_detailing_01_31',
      'walls_detailing_01_31',
      'walls_detailing_01_31',
      "Small Ornate Crown Edge",
      "Elegant baseboard. Place after walls."
    },
    {
      'walls_interior_detailing_01_46',
      'walls_interior_detailing_01_47',
      'walls_interior_detailing_01_46',
      'walls_interior_detailing_01_47',
      "Small Brown Door Frame",
      "Elegant baseboard. Place after walls."
    },
    {
      'walls_interior_detailing_01_14',
      'walls_interior_detailing_01_15',
      'walls_interior_detailing_01_14',
      'walls_interior_detailing_01_15',
      "Small Door Frame",
      "Elegant baseboard. Place after walls."
    },
    {
      'walls_interior_detailing_01_26',
      'walls_interior_detailing_01_27',
      'walls_interior_detailing_01_26',
      'walls_interior_detailing_01_27',
      "Small/Small White Door Frame",
      "Elegant baseboard. Place after walls."
    },
    {
      'walls_interior_detailing_01_10',
      'walls_detailing_01_11',
      'walls_detailing_01_10',
      'walls_detailing_01_11',
      "Small/Large Door Frame",
      "Elegant baseboard. Place after walls."
    },
    {
      'walls_interior_detailing_01_42',
      'walls_interior_detailing_01_43',
      'walls_interior_detailing_01_42',
      'walls_interior_detailing_01_43',
      "Small/large Brown Door Frame",
      "Elegant baseboard. Place after walls."
    },
	{
      'walls_detailing_01_48',
      'walls_detailing_01_50',
      'walls_detailing_01_48',
      'walls_detailing_01_50',
      "Exterior Wood Right",
      "Elegant baseboard. Place after walls."
    },
	{
      'walls_detailing_01_49',
      'walls_detailing_01_51',
      'walls_detailing_01_49',
      'walls_detailing_01_51',
      "Exterior Wood Left",
      "Elegant baseboard. Place after walls."
    },
	{
      'walls_detailing_01_52',
      'walls_detailing_01_52',
      'walls_detailing_01_52',
      'walls_detailing_01_52',
      "Exterior Wood Edge",
      "Elegant baseboard. Place after walls."
    }
	
  }
  return _mouldingData
end


MoreBuildPlus.onBuildMoulding = function(ignoreThisArgument, sprite, player, name)
  local _sign = ISSimpleFurniture:new(name, sprite.sprite, sprite.northSprite)

  _sign.player = player
  _sign.name = name
  _sign.eastSprite = sprite.eastSprite
  _sign.southSprite = sprite.southSprite
  _sign.northSprite = sprite.northSprite
  _sign.canPassThrough = false
  _sign.blockAllTheSquare = false
  _sign.isCorner = true

  _sign.modData['need:Base.Plank'] = 2
  _sign.modData['need:Base.Nails'] = 2
  _sign.modData['xp:Woodwork'] = 7.5

  getCell():setDrag(_sign, player)
end

