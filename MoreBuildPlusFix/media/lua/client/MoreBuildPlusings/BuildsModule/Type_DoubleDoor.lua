if not getMoreBuildPlusInstance then
  require('MoreBuildPlusings/MoreBuildPluss_Main')
end

local MoreBuildPlus = getMoreBuildPlusInstance()

MoreBuildPlus.doubleDoorMenuBuilder = function(subMenu, player)
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
    },
    {
      Material = 'Base.Doorknob',
      Amount = 1
    },
    {
      Material = 'Base.Hinge',
      Amount = 2
    }
  }

  MoreBuildPlus.neededTools = {'Hammer'}

  local needSkills = {
    Woodwork = 2
  }

  local _doubleDoorData = MoreBuildPlus.getdoubleDoorData()

  for _, _currentList in pairs(_doubleDoorData) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
    _sprite.openSprite = _currentList[3]
    _sprite.openNorthSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, MoreBuildPlus.onBuilddoubleDoor, _sprite, player, _name)

    _tooltip = MoreBuildPlus.canBuildObject(needSkills, _option, player)
    _tooltip.description = _currentList[6] .. _tooltip.description
    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end


MoreBuildPlus.getdoubleDoorData = function()
  local _doubleDoorData = {

    {
      'fixtures_doors_02_40',
      'fixtures_doors_02_41',
      'fixtures_doors_02_42',
      'fixtures_doors_02_43',
      "Glass Door 1",
      "Double Door"
    },
	{
      'fixtures_doors_02_44',
      'fixtures_doors_02_45',
      'fixtures_doors_02_46',
      'fixtures_doors_02_47',
      "Glass Door 2",
      "Double Door"
    },
	{
      'fixtures_doors_02_48',
      'fixtures_doors_02_49',
      'fixtures_doors_02_50',
      'fixtures_doors_02_51',
      "Metal Door 1",
      "Double Door"
    },
	{
      'fixtures_doors_02_52',
      'fixtures_doors_02_53',
      'fixtures_doors_02_54',
      'fixtures_doors_02_55',
      "Metal Door 2",
      "Double Door"
    },
	{
      'fixtures_doors_02_56',
      'fixtures_doors_02_57',
      'fixtures_doors_02_58',
      'fixtures_doors_02_59',
      "Yellow Door 1",
      "Double Door"
    },
	{
      'fixtures_doors_02_60',
      'fixtures_doors_02_61',
      'fixtures_doors_02_62',
      'fixtures_doors_02_63',
      "Yellow Door 2",
      "Double Door"
    }
	
  }
  return _doubleDoorData
end


MoreBuildPlus.onBuilddoubleDoor = function(ignoreThisArgument, sprite, player, name)
  local _sign = ISWoodenDoor:new(sprite.sprite, sprite.northSprite, sprite.openSprite, sprite.openNorthSprite)

  _sign.player = player
  _sign.name = name
  _sign.eastSprite = sprite.eastSprite
  _sign.openSprite = sprite.openSprite
  _sign.openNorthSprite = sprite.openNorthSprite
  _sign.renderFloorHelper = true

  _sign.modData['need:Base.Plank'] = 4
  _sign.modData['need:Base.Nails'] = 4
  _sign.modData['need:Base.Hinge'] = 2
  _sign.modData['need:Base.Doorknob'] = 1
  _sign.modData['xp:Woodwork'] = 5

  getCell():setDrag(_sign, player)
end

