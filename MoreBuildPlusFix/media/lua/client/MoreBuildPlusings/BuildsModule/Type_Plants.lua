if not getMoreBuildPlusInstance then
  require('MoreBuildPlusings/MoreBuildPluss_Main')
end

local MoreBuildPlus = getMoreBuildPlusInstance()

MoreBuildPlus.plantsPlusPlusMenuBuilder = function(subMenu, player)
  local _sprite
  local _option
  local _tooltip
  local _name = ''

  MoreBuildPlus.neededMaterials = {
    {
      Material = 'Base.TreeBranch',
      Amount = 2
    }
  }

  MoreBuildPlus.neededTools = {'Hammer'}

  local needSkills = {
    Woodwork = 1
  }

  local _plantsPlusPlusData = MoreBuildPlus.getplantsPlusPlusData()

  for _, _currentList in pairs(_plantsPlusPlusData) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, MoreBuildPlus.onBuildplantsPlusPlus, _sprite, player, _name)

    _tooltip = MoreBuildPlus.canBuildObject(needSkills, _option, player)
    _tooltip.description = _currentList[6] .. _tooltip.description
    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end


MoreBuildPlus.getplantsPlusPlusData = function()
  local _plantsPlusPlusData = {

        {
      'f_wallvines_1_25',
      'f_wallvines_1_26',
      'f_wallvines_1_25',
      'f_wallvines_1_26',
      "Vines 1",
      ""
    },
	{
      'f_wallvines_1_30',
      'f_wallvines_1_33',
      'f_wallvines_1_30',
      'f_wallvines_1_33',
      "Vines 2",
      ""
    },
	{
      'f_wallvines_1_37',
      'f_wallvines_1_38',
      'f_wallvines_1_37',
      'f_wallvines_1_38',
      "Vines 3",
      ""
    },
	{
      'f_wallvines_1_43',
      'f_wallvines_1_44',
      'f_wallvines_1_43',
      'f_wallvines_1_44',
      "Vines 4",
      ""
    }
	
  }
  return _plantsPlusPlusData
end


MoreBuildPlus.onBuildplantsPlusPlus = function(ignoreThisArgument, sprite, player, name)
  local _sign = ISSimpleFurniture:new(name, sprite.sprite, sprite.northSprite)

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
  _sign.modData['xp:Woodwork'] = 1

  getCell():setDrag(_sign, player)
end

