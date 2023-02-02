if not getMoreBuildPlusInstance then
  require('MoreBuildPlusings/MoreBuildPluss_Main')
end

local MoreBuildPlus = getMoreBuildPlusInstance()

MoreBuildPlus.militaryTentRoofsMenuBuilder = function(subMenu, player)
  local _sprite
  local _option
  local _tooltip
  local _name = ''

  MoreBuildPlus.neededMaterials = {
    {
      Material = 'Base.Tarp',
      Amount = 1
    }
  }

  MoreBuildPlus.neededTools = {'Hammer'}

  local needSkills = {
    Woodwork = 1
  }

  local _militaryTentRoofsData = MoreBuildPlus.getmilitaryTentRoofsData()

  for _, _currentList in pairs(_militaryTentRoofsData) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, MoreBuildPlus.onBuildmilitaryTentRoofs, _sprite, player, _name)

    _tooltip = MoreBuildPlus.canBuildObject(needSkills, _option, player)
    _tooltip.description = _currentList[6] .. _tooltip.description
    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end


MoreBuildPlus.getmilitaryTentRoofsData = function()
  local _militaryTentRoofsData = {

        {
      'location_military_tent_01_16',
      'location_military_tent_01_21',
      'location_military_tent_01_16',
      'location_military_tent_01_21',
      "Left Facing 1",
      "Left facing 1"
    },
	{
      'location_military_tent_01_17',
      'location_military_tent_01_20',
      'location_military_tent_01_17',
      'location_military_tent_01_20',
      "Left Facing 2",
      "Left facing 2"
    },
	{
      'location_military_tent_01_18',
      'location_military_tent_01_19',
      'location_military_tent_01_18',
      'location_military_tent_01_19',
      "Left Facing 3",
      "Left facing 3"
    },
	{
      'location_military_tent_01_48',
      'location_military_tent_01_53',
      'location_military_tent_01_48',
      'location_military_tent_01_53',
      "Left Facing small",
      "Left facing small"
    },
	{
      'location_military_tent_01_49',
      'location_military_tent_01_52',
      'location_military_tent_01_49',
      'location_military_tent_01_52',
      "Left Facing Medium",
      "Left facing medium"
    },
	{
      'location_military_tent_01_50',
      'location_military_tent_01_51',
      'location_military_tent_01_50',
      'location_military_tent_01_51',
      "Left Facing Large",
      "Left facing large"
    }
	,
	{
      'location_military_tent_01_24',
      'location_military_tent_01_29',
      'location_military_tent_01_24',
      'location_military_tent_01_29',
      "Right Facing 1",
      "right facing 1"
    },
	{
      'location_military_tent_01_25',
      'location_military_tent_01_28',
      'location_military_tent_01_25',
      'location_military_tent_01_28',
      "Right Facing 2",
      "right facing 2"
    },
	{
      'location_military_tent_01_26',
      'location_military_tent_01_27',
      'location_military_tent_01_26',
      'location_military_tent_01_27',
      "Right Facing 3",
      "right facing 3"
    },
	{
      'location_military_tent_01_40',
      'location_military_tent_01_45',
      'location_military_tent_01_40',
      'location_military_tent_01_45',
      "Right Facing small",
      "right facing small"
    },
	{
      'location_military_tent_01_41',
      'location_military_tent_01_44',
      'location_military_tent_01_41',
      'location_military_tent_01_44',
      "Right Facing Medium",
      "right facing medium"
    },
	{
      'location_military_tent_01_42',
      'location_military_tent_01_43',
      'location_military_tent_01_42',
      'location_military_tent_01_43',
      "Right Facing Large",
      "right facing large"
    },
	{
      'location_military_tent_01_80',
      'location_military_tent_01_85',
      'location_military_tent_01_80',
      'location_military_tent_01_85',
      "Left Facing 1",
      "Left facing 1"
    },
	{
      'location_military_tent_01_81',
      'location_military_tent_01_84',
      'location_military_tent_01_81',
      'location_military_tent_01_84',
      "Left Facing 2",
      "Left facing 2"
    },
	{
      'location_military_tent_01_82',
      'location_military_tent_01_83',
      'location_military_tent_01_82',
      'location_military_tent_01_83',
      "Left Facing 3",
      "Left facing 3"
    },
	{
      'location_military_tent_01_112',
      'location_military_tent_01_117',
      'location_military_tent_01_112',
      'location_military_tent_01_117',
      "Left Facing small",
      "Left facing small"
    },
	{
      'location_military_tent_01_113',
      'location_military_tent_01_116',
      'location_military_tent_01_113',
      'location_military_tent_01_116',
      "Left Facing Medium",
      "Left facing medium"
    },
	{
      'location_military_tent_01_114',
      'location_military_tent_01_115',
      'location_military_tent_01_114',
      'location_military_tent_01_115',
      "Left Facing Large",
      "Left facing large"
    }
	,
	{
      'location_military_tent_01_88',
      'location_military_tent_01_93',
      'location_military_tent_01_88',
      'location_military_tent_01_93',
      "Right Facing 1",
      "right facing 1"
    },
	{
      'location_military_tent_01_89',
      'location_military_tent_01_92',
      'location_military_tent_01_89',
      'location_military_tent_01_92',
      "Right Facing 2",
      "right facing 2"
    },
	{
      'location_military_tent_01_90',
      'location_military_tent_01_91',
      'location_military_tent_01_90',
      'location_military_tent_01_91',
      "Right Facing 3",
      "right facing 3"
    },
	{
      'location_military_tent_01_104',
      'location_military_tent_01_109',
      'location_military_tent_01_104',
      'location_military_tent_01_109',
      "Right Facing small",
      "right facing small"
    },
	{
      'location_military_tent_01_105',
      'location_military_tent_01_108',
      'location_military_tent_01_105',
      'location_military_tent_01_108',
      "Right Facing Medium",
      "right facing medium"
    },
	{
      'location_military_tent_01_106',
      'location_military_tent_01_107',
      'location_military_tent_01_106',
      'location_military_tent_01_107',
      "Right Facing Large",
      "right facing large"
    }
	
	
  }
  return _militaryTentRoofsData
end


MoreBuildPlus.onBuildmilitaryTentRoofs = function(ignoreThisArgument, sprite, player, name)
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
  _sign.modData['xp:Woodwork'] = 2

  getCell():setDrag(_sign, player)
end

