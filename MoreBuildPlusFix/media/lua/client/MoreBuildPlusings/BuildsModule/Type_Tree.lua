if not getMoreBuildPlusInstance then
  require('MoreBuildPlusings/MoreBuildPluss_Main')
end

local MoreBuildPlus = getMoreBuildPlusInstance()

MoreBuildPlus.TreePlusMenuBuilder = function(subMenu, player)
  local _sprite
  local _option
  local _tooltip
  local _name = ''

  MoreBuildPlus.neededMaterials = {
    {
      Material = 'Base.Log',
      Amount = 4
    },
	{
	  Material = 'Base.TreeBranch',
	  Amount = 2
	}
  }

  MoreBuildPlus.neededTools = {'Hammer'}

  local needSkills = {
    Woodwork = 1
  }

  local _TreePlusData = MoreBuildPlus.getTreePlusData()

  for _, _currentList in pairs(_TreePlusData) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, MoreBuildPlus.onBuildTreePlus, _sprite, player, _name)

    _tooltip = MoreBuildPlus.canBuildObject(needSkills, _option, player)
    _tooltip.description = _currentList[6] .. _tooltip.description
    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end


MoreBuildPlus.getTreePlusData = function()
  local _TreePlusData = {

    {
      'e_canadianhemlock_1_1',
      'e_canadianhemlock_1_1',
      'e_canadianhemlock_1_1',
      'e_canadianhemlock_1_1',
      "Canadian Hemlock",
      "Also known as eastern hemlock."
    },
	{
      'e_americanholly_1_1',
      'e_americanholly_1_1',
      'e_americanholly_1_1',
      'e_americanholly_1_1',
      "American Holly",
      "Broadleaved evergreen tree."
    },
	{
      'e_virginiapine_1_1',
      'e_virginiapine_1_1',
      'e_virginiapine_1_1',
      'e_virginiapine_1_1',
      "Virginia Pine",
      "A medium-sized tree, often found on poorer soils."
    },
	{
      'e_dogwood_1_2',
      'e_dogwood_1_2',
      'e_dogwood_1_2',
      'e_dogwood_1_2',
      "Dogwood",
      "Can generally be distinguished by their blossoms, berries, and distinctive bark."
    },
	{
	  'e_cockspurhawthorn_1_2',
      'e_cockspurhawthorn_1_2',
      'e_cockspurhawthorn_1_2',
      'e_cockspurhawthorn_1_2',
      "Cockspur hawthorn",
      "Native to eastern North America from Ontario to Texas to Florida."
	}
	
	
	
  }
  return _TreePlusData
end


MoreBuildPlus.onBuildTreePlus = function(ignoreThisArgument, sprite, player, name)
  local _sign = ISTree:new(sprite.sprite, sprite.northSprite, player)

  _sign.player = player
  _sign.name = name
  _sign.eastSprite = sprite.eastSprite
  _sign.southSprite = sprite.southSprite
  _sign.northSprite = sprite.northSprite
  _sign.canPassThrough = true
  _sign.blockAllTheSquare = false
  _sign.isCorner = true
  _sign.renderFloorHelper = true

  _sign.modData['need:Base.TreeBranch'] = 2
  _sign.modData['need:Base.Log'] = 2
  _sign.modData['xp:Woodwork'] = 5

  getCell():setDrag(_sign, player)
end

