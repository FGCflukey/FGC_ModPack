if not getMoreBuildPlusInstance then
  require('MoreBuildPlusings/MoreBuildPluss_Main')
end

local MoreBuildPlus = getMoreBuildPlusInstance()

MoreBuildPlus.pillarsPlusExteriorMenuBuilder = function(subMenu, player)
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
      Amount = 2
    }
  }

  MoreBuildPlus.neededTools = {'Hammer'}

  local needSkills = {
    Woodwork = 4
  }

  local _pillarsPlusExteriorData = MoreBuildPlus.getpillarsPlusExteriorData()

  for _, _currentList in pairs(_pillarsPlusExteriorData) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, MoreBuildPlus.onBuildpillarsPlusExterior, _sprite, player, _name)

    _tooltip = MoreBuildPlus.canBuildObject(needSkills, _option, player)
    _tooltip.description = _currentList[6] .. _tooltip.description
    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end

--pillars didnt work need to make another type

MoreBuildPlus.getpillarsPlusExteriorData = function()
  local _pillarsPlusExteriorData = {

        {
      'walls_exterior_house_01_35',
      'walls_exterior_house_01_35',
      'walls_exterior_house_01_35',
      'walls_exterior_house_01_35',
      "White Wood ",
      "Can be used as a wall edge or as individual pillar."
    },
    {
      'walls_exterior_house_01_51',
      'walls_exterior_house_01_51',
      'walls_interior_house_01_51',
      'walls_interior_house_01_51',
      "Brown Wood ",
      "Can be used as a wall edge or as individual pillar."
    },
    {
      'walls_exterior_house_02_35',
      'walls_exterior_house_02_35',
      'walls_exterior_house_02_35',
      'walls_exterior_house_02_35',
      "Beige Wood ",
      "Can be used as a wall edge or as individual pillar."
    },
	{
      'walls_exterior_house_02_71',
      'walls_exterior_house_02_71',
      'walls_exterior_house_02_71',
      'walls_exterior_house_02_71',
      "Pink Wood ",
      "Can be used as a wall edge or as individual pillar."
    },
	{
      'walls_exterior_house_02_83',
      'walls_exterior_house_02_83',
      'walls_exterior_house_02_83',
      'walls_exterior_house_02_83',
      "Green Wood ",
      "Can be used as a wall edge or as individual pillar."
    },
	{
      'walls_exterior_house_02_3',
      'walls_exterior_house_02_3',
      'walls_exterior_house_02_3',
      'walls_exterior_house_02_3',
      "Gray Stone ",
      "Can be used as a wall edge or as individual pillar."
    },
	{
      'walls_exterior_house_02_7',
      'walls_exterior_house_02_7',
      'walls_exterior_house_02_7',
      'walls_exterior_house_02_7',
      "Beige Stone",
      "Can be used as a wall edge or as individual pillar."
    }
	
  }
  return _pillarsPlusExteriorData
end


MoreBuildPlus.onBuildpillarsPlusExterior = function(ignoreThisArgument, sprite, player, name)
  local _sign = ISWoodenWall:new(sprite.sprite, sprite.northSprite, nil)

  _sign.canPassThrough = true
  _sign.canBarricade = false
  _sign.isCorner = true
  _sign.player = player
  _sign.name = name

  _sign.modData['need:Base.Plank'] = 2
  _sign.modData['need:Base.Nails'] = 2
  _sign.modData['xp:Woodwork'] = 2

  getCell():setDrag(_sign, player)
end

