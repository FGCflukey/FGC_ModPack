if not getMoreBuildPlusInstance then
  require('MoreBuildPlusings/MoreBuildPluss_Main')
end

local MoreBuildPlus = getMoreBuildPlusInstance()

MoreBuildPlus.metalFenceMenuBuilder = function(subMenu, player)
  local _sprite
  local _option
  local _tooltip
  local _name = ''

  MoreBuildPlus.neededMaterials = {
    {
      Material = 'Base.MetalBar',
      Amount = 1
    }
  }

  MoreBuildPlus.neededTools = {'BlowTorch'}

  local needSkills = {
    MetalWelding = 2
  }

  local _metalFenceData = MoreBuildPlus.getmetalFenceData()

  for _, _currentList in pairs(_metalFenceData) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, MoreBuildPlus.onBuildmetalFence, _sprite, player, _name)

    _tooltip = MoreBuildPlus.canBuildObject(needSkills, _option, player)
    _tooltip.description = _currentList[6] .. _tooltip.description
    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end

MoreBuildPlus.getmetalFenceData = function()
  local _metalFenceData = {

    {
      'fencing_01_2',
      'fencing_01_1',
      'fencing_01_2',
      'fencing_01_1',
      "Iron Fence",
      " Small Iron Fence "
    },
	{
      'fencing_01_3',
      'fencing_01_3',
      'fencing_01_3',
      'fencing_01_3',
      "Iron Fence Corner",
      " Small Iron Corner "
    },
	{
      'fencing_01_0',
      'fencing_01_0',
      'fencing_01_0',
      'fencing_01_0',
      "Iron Fence Pillar",
      " Small Iron Pillar "
    },
	{
      'fencing_01_69',
      'fencing_01_69',
      'fencing_01_69',
      'fencing_01_69',
      "Large Iron Fence Pillar",
      " Large Iron Pillar "
    },
	{
      'fencing_01_105',
      'fencing_01_104',
      'fencing_01_105',
      'fencing_01_104',
      "Fancy Fence",
      " Fancy Fence Pillar "
    },
	{
      'fencing_01_106',
      'fencing_01_106',
      'fencing_01_106',
      'fencing_01_106',
      "Fancy Fence Corner",
      " Fancy Fence Corner "
    },
	{
      'fencing_01_107',
      'fencing_01_107',
      'fencing_01_107',
      'fencing_01_107',
      "Fancy Fence Pillar",
      " Fancy Fence Pillar "
    }
	
  }
	
  return _metalFenceData
end


MoreBuildPlus.onBuildmetalFence = function(ignoreThisArgument, sprite, player, name)
  local _sign = ISSimpleFurniture:new(name, sprite.sprite, sprite.northSprite)

  _sign.player = player
  _sign.name = name
  _sign.eastSprite = sprite.eastSprite
  _sign.southSprite = sprite.southSprite
  _sign.northSprite = sprite.northSprite
  _sign.canPassThrough = false
  _sign.blockAllTheSquare = false
  _sign.renderFloorHelper = true
  _sign.isCorner = true

  _sign.modData['need:Base.MetalBar'] = 1
  _sign.modData['xp:MetalWelding'] = 5

  getCell():setDrag(_sign, player)
end

