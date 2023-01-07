if not getMoreBuildPlusInstance then
  require('MoreBuildPlusings/MoreBuildPluss_Main')
end

local MoreBuildPlus = getMoreBuildPlusInstance()

MoreBuildPlus.militaryTentWallsMenuBuilder = function(subMenu, player)
  local _sprite
  local _option
  local _tooltip
  local _name = ''

  MoreBuildPlus.neededMaterials = {
    {
      Material = 'Base.Tarp',
      Amount = 1
    },
    {
      Material = 'camping.TentPeg',
      Amount = 2
    }
  }

  MoreBuildPlus.neededTools = {'Hammer'}

  local needSkills = {
    Woodwork = 1
  }

  local _militaryTentWallsData = MoreBuildPlus.getmilitaryTentWallsData()

  for _, _currentList in pairs(_militaryTentWallsData) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, MoreBuildPlus.onBuildmilitaryTentWalls, _sprite, player, _name)

    _tooltip = MoreBuildPlus.canBuildObject(needSkills, _option, player)
    _tooltip.description = _currentList[6] .. _tooltip.description
    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end


MoreBuildPlus.getmilitaryTentWallsData = function()
  local _militaryTentWallsData = {

        {
      'location_military_tent_01_0',
      'location_military_tent_01_1',
      'location_military_tent_01_0',
      'location_military_tent_01_1',
      "Military Tent Wall",
      "Military tent wall."
    },
	{
      'location_military_tent_01_2',
      'location_military_tent_01_2',
      'location_military_tent_01_2',
      'location_military_tent_01_2',
      "Military Tent Corner",
      "Military tent corner."
    },
	{
      'location_military_tent_01_8',
      'location_military_tent_01_9',
      'location_military_tent_01_8',
      'location_military_tent_01_9',
      "Military Tent Window",
      "Military tent window."
    },
	{
      'location_military_tent_01_10',
      'location_military_tent_01_11',
      'location_military_tent_01_10',
      'location_military_tent_01_11',
      "Military Tent Door Frame",
      "Military tent door frame."
    },
	{
      'location_military_tent_01_64',
      'location_military_tent_01_65',
      'location_military_tent_01_64',
      'location_military_tent_01_65',
      "Military Tent Wall",
      "Military tent wall."
    },
	{
      'location_military_tent_01_66',
      'location_military_tent_01_66',
      'location_military_tent_01_66',
      'location_military_tent_01_66',
      "Military Tent Corner",
      "Military tent Corner."
    },
	{
      'location_military_tent_01_72',
      'location_military_tent_01_73',
      'location_military_tent_01_72',
      'location_military_tent_01_73',
      "Military Tent Window",
      "Military tent window."
    },
	{
      'location_military_tent_01_74',
      'location_military_tent_01_75',
      'location_military_tent_01_74',
      'location_military_tent_01_75',
      "Military Tent Window",
      "Military tent window."
    }
	
	
  }
  return _militaryTentWallsData
end


MoreBuildPlus.onBuildmilitaryTentWalls = function(ignoreThisArgument, sprite, player, name)
  local _sign = ISSimpleFurniture:new(name, sprite.sprite, sprite.northSprite)

  _sign.player = player
  _sign.name = name
  _sign.eastSprite = sprite.eastSprite
  _sign.southSprite = sprite.southSprite
  _sign.northSprite = sprite.northSprite
  _sign.canPassThrough = false
  _sign.blockAllTheSquare = false
  _sign.isCorner = true
  _sign.renderFloorHelper = true

  _sign.modData['need:Base.Tarp'] = 1
  _sign.modData['need:camping.TentPeg'] = 2
  _sign.modData['xp:Woodwork'] = 2

  getCell():setDrag(_sign, player)
end

