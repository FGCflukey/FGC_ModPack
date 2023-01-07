if not getMoreBuildPlusInstance then
  require('MoreBuildPlusings/MoreBuildPluss_Main')
end

local MoreBuildPlus = getMoreBuildPlusInstance()

MoreBuildPlus.doubleDoorMetalPlusMenuBuilder = function(subMenu, player)
  local _sprite
  local _option
  local _tooltip
  local _name = ''

  MoreBuildPlus.neededMaterials = {
    {
      Material = 'Base.Hinge',
      Amount = 4
    },
    {
      Material = 'Base.MetalBar',
      Amount = 4
    },
	{
      Material = 'Base.SmallSheetMetal',
      Amount = 4
    },
    {
      Material = 'Base.WeldingRods',
      Amount = 1
    },
    {
      Material = 'Base.BlowTorch',
      Amount = 1
    }
	
  }

  MoreBuildPlus.neededTools = {'BlowTorch'}

  local needSkills = {
    MetalWelding = 6
  }

  local _doubleDoorMetalPlusData = MoreBuildPlus.getdoubleDoorMetalPlusData()

  for _, _currentList in pairs(_doubleDoorMetalPlusData) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]
	_sprite.spriteIndex = _currentList[5]

    _name = _currentList[6]

    _option = subMenu:addOption(_name, nil, MoreBuildPlus.onBuilddoubleDoorMetalPlus, _sprite, player, _name)

    _tooltip = MoreBuildPlus.canBuildObject(needSkills, _option, player)
    _tooltip.description = _currentList[6] .. _tooltip.description
    _tooltip:setName(_name)
    _tooltip:setTexture('fixtures_doors_fences_01_34')
  end
end


MoreBuildPlus.getdoubleDoorMetalPlusData = function()
  local _doubleDoorMetalPlusData = {

        {
      'fixtures_doors_fences_01_40',
      'fixtures_doors_fences_01_34',
      'fixtures_doors_fences_01_40',
      'fixtures_doors_fences_01_40',
	  "72",
      "Large Metal Gate",
      "Slight bug when placing north facing wall but still works fine."
    }
	
  }
  return _doubleDoorMetalPlusData
end


MoreBuildPlus.onBuilddoubleDoorMetalPlus = function(ignoreThisArgument, sprite, player, name)
  local _sign = ISDoubleDoorPlus:new(sprite.sprite, sprite.spriteIndex)

  _sign.player = player
  _sign.name = name
  _sign.eastSprite = sprite.eastSprite
  _sign.southSprite = sprite.southSprite
  _sign.northSprite = sprite.northSprite
  _sign.sprite = sprite.sprite

  _sign.canPassThrough = false
  _sign.blockAllTheSquare = false
  _sign.renderFloorHelper = true

  _sign.modData['need:Base.Hinge'] = 4
  _sign.modData['need:Base.MetalBar'] = 4
  _sign.modData['need:Base.SmallSheetMetal'] = 4
  _sign.modData['use:Base.WeldingRods'] = 4
  _sign.modData['use:Base.BlowTorch'] = 5
  _sign.modData['xp:MetalWelding'] = 20

  getCell():setDrag(_sign, player)
end

