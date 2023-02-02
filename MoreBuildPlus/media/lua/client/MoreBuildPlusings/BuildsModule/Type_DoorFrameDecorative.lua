if not getMoreBuildPlusInstance then
  require('MoreBuildPlusings/MoreBuildPluss_Main')
end

local MoreBuildPlus = getMoreBuildPlusInstance()

MoreBuildPlus.decorativeDoorFrameMenuBuilder = function(subMenu, player)
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

  local _decorativeDoorFrameData = MoreBuildPlus.getdecorativeDoorFrameData()

  for _, _currentList in pairs(_decorativeDoorFrameData) do
    _sprite = {}
    _sprite.sprite = _currentList[1]
    _sprite.northSprite = _currentList[2]
    _sprite.eastSprite = _currentList[3]
    _sprite.southSprite = _currentList[4]

    _name = _currentList[5]

    _option = subMenu:addOption(_name, nil, MoreBuildPlus.onBuilddecorativeDoorFrame, _sprite, player, _name)

    _tooltip = MoreBuildPlus.canBuildObject(needSkills, _option, player)
    _tooltip.description = _currentList[6] .. _tooltip.description
    _tooltip:setName(_name)
    _tooltip:setTexture(_sprite.sprite)
  end
end


MoreBuildPlus.getdecorativeDoorFrameData = function()
  local _decorativeDoorFrameData = {

    {
      'fixtures_doors_frames_01_0',
      'fixtures_doors_frames_01_1',
      'fixtures_doors_frames_01_0',
      'fixtures_doors_frames_01_1',
      "White Door Frame",
      "Just decotrative door frame. "
    },
	{
      'fixtures_doors_frames_01_2',
      'fixtures_doors_frames_01_3',
      'fixtures_doors_frames_01_2',
      'fixtures_doors_frames_01_3',
      "Brown Door Frame",
      "Just decotrative door frame. "
    },
	{
      'fixtures_doors_frames_01_4',
      'fixtures_doors_frames_01_5',
      'fixtures_doors_frames_01_4',
      'fixtures_doors_frames_01_5',
      "Black Door Frame",
      "Just decotrative door frame. "
    },
	{
      'fixtures_doors_frames_01_24',
      'fixtures_doors_frames_01_25',
      'fixtures_doors_frames_01_24',
      'fixtures_doors_frames_01_25',
      "Black Double Door Frame Right",
      "Just decotrative door frame. "
    },
	{
      'fixtures_doors_frames_01_26',
      'fixtures_doors_frames_01_27',
      'fixtures_doors_frames_01_26',
      'fixtures_doors_frames_01_27',
      "Black Double Door Frame Left",
      "Just decotrative door frame. "
    },
	{
      'fixtures_doors_frames_01_28',
      'fixtures_doors_frames_01_29',
      'fixtures_doors_frames_01_28',
      'fixtures_doors_frames_01_29',
      "White Double Door Frame Right",
      "Just decotrative door frame. "
    },
	{
      'fixtures_doors_frames_01_30',
      'fixtures_doors_frames_01_31',
      'fixtures_doors_frames_01_30',
      'fixtures_doors_frames_01_31',
      "White Double Door Frame Left",
      "Just decotrative door frame. "
    },
	{
      'fixtures_doors_frames_01_32',
      'fixtures_doors_frames_01_33',
      'fixtures_doors_frames_01_32',
      'fixtures_doors_frames_01_33',
      "Brown Double Door Frame Right",
      "Just decotrative door frame. "
    },
	{
      'fixtures_doors_frames_01_34',
      'fixtures_doors_frames_01_35',
      'fixtures_doors_frames_01_34',
      'fixtures_doors_frames_01_35',
      "Brown Double Door Frame Left",
      "Just decotrative door frame. "
    },
	{
      'fixtures_doors_frames_01_36',
      'fixtures_doors_frames_01_37',
      'fixtures_doors_frames_01_36',
      'fixtures_doors_frames_01_37',
      "Gray Double Door Frame Right",
      "Just decotrative door frame. "
    },
	{
      'fixtures_doors_frames_01_38',
      'fixtures_doors_frames_01_39',
      'fixtures_doors_frames_01_38',
      'fixtures_doors_frames_01_39',
      "Gray Double Door Frame Left",
      "Just decotrative door frame. "
    }
	
  }
  return _decorativeDoorFrameData
end


MoreBuildPlus.onBuilddecorativeDoorFrame = function(ignoreThisArgument, sprite, player, name)
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

  _sign.modData['need:Base.Plank'] = 1
  _sign.modData['need:Base.Nails'] = 2
  _sign.modData['xp:Woodwork'] = 5

  getCell():setDrag(_sign, player)
end

