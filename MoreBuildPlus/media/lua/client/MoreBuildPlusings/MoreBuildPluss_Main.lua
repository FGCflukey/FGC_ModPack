--
-- Created by IntelliJ IDEA.
-- User: ProjectSky
-- Date: 2017/7/11
-- Time: 13:10
-- Project Zomboid More Builds Mod
--

-- pull global functions to local
local getSpecificPlayer = getSpecificPlayer
local pairs = pairs
local split = string.split
local getItemNameFromFullType = getItemNameFromFullType
local PerkFactory = PerkFactory
local getMoveableDisplayName = Translator.getMoveableDisplayName
local getSprite = getSprite
local getFirstTypeEval = getFirstTypeEval
local getItemCountFromTypeRecurse = getItemCountFromTypeRecurse
local getText = getText

local MoreBuildPlus = {}
MoreBuildPlus.NAME = 'More Builds Plus'
MoreBuildPlus.AUTHOR = 'ProjectSky, SiderisAnon'
MoreBuildPlus.VERSION = '1.1.8a'

print('Mod Loaded: ' .. MoreBuildPlus.NAME .. ' by ' .. MoreBuildPlus.AUTHOR .. ' (v' .. MoreBuildPlus.VERSION .. ')')

MoreBuildPlus.neededMaterials = {}
MoreBuildPlus.neededTools = {}
MoreBuildPlus.toolsList = {}
MoreBuildPlus.playerSkills = {}
MoreBuildPlus.textSkillsRed = {}
MoreBuildPlus.textSkillsGreen = {}
MoreBuildPlus.playerCanPlaster = false
MoreBuildPlus.textTooltipHeader = ' <RGB:2,2,2> <LINE> <LINE>' .. getText('Tooltip_craft_Needs') .. ' : <LINE> '
MoreBuildPlus.textCanRotate = '<LINE> <RGB:1,1,1>' .. getText('Tooltip_craft_pressToRotate', Keyboard.getKeyName(getCore():getKey('Rotate building')))
MoreBuildPlus.textPlasterRed = '<RGB:1,0,0> <LINE> <LINE>' .. getText('Tooltip_PlasterRed_Description')
MoreBuildPlus.textPlasterGreen = '<RGB:1,1,1> <LINE> <LINE>' .. getText('Tooltip_PlasterGreen_Description')
MoreBuildPlus.textPlasterNever = '<RGB:1,0,0> <LINE> <LINE>' .. getText('Tooltip_PlasterNever_Description')

MoreBuildPlus.textWallDescription = getText('Tooltip_Wall_Description')
MoreBuildPlus.textPillarDescription = getText('Tooltip_Pillar_Description')
MoreBuildPlus.textDoorFrameDescription = getText('Tooltip_DoorFrame_Description')
MoreBuildPlus.textWindowFrameDescription = getText('Tooltip_WindowFrame_Description')
MoreBuildPlus.textFenceDescription = getText('Tooltip_Fence_Description')
MoreBuildPlus.textFencePostDescription = getText('Tooltip_FencePost_Description')
MoreBuildPlus.textDoorGenericDescription = getText('Tooltip_craft_woodenDoorDesc')
MoreBuildPlus.textDoorIndustrial = getText('Tooltip_DoorIndustrial_Description')
MoreBuildPlus.textDoorExterior = getText('Tooltip_DoorExterior_Description')
MoreBuildPlus.textStairsDescription = getText('Tooltip_craft_stairsDesc')
MoreBuildPlus.textFloorDescription = getText('Tooltip_Floor_Description')
MoreBuildPlus.textBarElementDescription = getText('Tooltip_BarElement_Description')
MoreBuildPlus.textBarCornerDescription = getText('Tooltip_BarCorner_Description')
MoreBuildPlus.textTrashCanDescription = getText('Tooltip_TrashCan_Description')
MoreBuildPlus.textLightPoleDescription = getText('Tooltip_LightPole_Description')
MoreBuildPlus.textSmallTableDescription = getText('Tooltip_SmallTable_Description')
MoreBuildPlus.textLargeTableDescription = getText('Tooltip_LargeTable_Description')
MoreBuildPlus.textCouchFrontDescription = getText('Tooltip_CouchFront_Description')
MoreBuildPlus.textCouchRearDescription = getText('Tooltip_CouchRear_Description')
MoreBuildPlus.textDresserDescription = getText('Tooltip_Dresser_Description')
MoreBuildPlus.textBedDescription = getText('Tooltip_Bed_Description')
MoreBuildPlus.textFlowerBedDescription = getText('Tooltip_FlowerBed_Description')

--- 工具列表定义
--- 多个工具在表内添加即可 [类型] {工具1, 工具2, ...}
MoreBuildPlus.toolsList['Hammer'] = {'Base.Hammer', 'Base.HammerStone', 'Base.BallPeenHammer', 'Base.WoodenMallet', 'Base.ClubHammer'}
MoreBuildPlus.toolsList['Screwdriver'] = {'Base.Screwdriver'}
MoreBuildPlus.toolsList['HandShovel'] = {'farming.HandShovel'}
MoreBuildPlus.toolsList['Saw'] = {'Base.Saw'}
MoreBuildPlus.toolsList['Shovel'] = {'Base.Shovel', 'Base.Shovel2'}
MoreBuildPlus.toolsList['BlowTorch'] = {'Base.BlowTorch'}

--- 建筑技能需求定义
--- @todo: 优化结构
MoreBuildPlus.skillLevel = {
  simpleObject = 1,
  waterwellObject = 7,
  simpleDecoration = 1,
  landscaping = 1,
  lighting = 4,
  simpleContainer = 3,
  complexContainer = 5,
  advancedContainer = 7,
  simpleFurniture = 3,
  basicContainer = 1,
  basicFurniture = 1,
  moderateFurniture = 2,
  counterFurniture = 3,
  complexFurniture = 4,
  logObject = 0,
  floorObject = 1,
  wallObject = 2,
  doorObject = 3,
  garageDoorObject = 6,
  stairsObject = 6,
  stoneArchitecture = 5,
  metalArchitecture = 5,
  architecture = 5,
  complexArchitecture = 5,
  nearlyimpossible = 5,
  barbecueObject = 4,
  fridgeObject = 3,
  lightingObject = 2,
  generatorObject = 3,
  windowsObject = 2,
}

--- 建筑耐久定义
--- @todo: 优化结构
MoreBuildPlus.healthLevel = {
  stoneWall = 300,
  metalWall = 700,
  metalStairs = 400,
  woodContainer = 200,
  stoneContainer = 250,
  metalContainer = 350,
  wallDecoration = 50,
  woodenFence = 100,
  metalDoor = 700
}

--- 权限等级定义
MoreBuildPlus.AccessLevel = {
  None = 1,
  Observer = 2,
  GM = 3,
  Overseer = 4,
  Moderator = 5,
  Admin = 6
}

--- OnFillWorldObjectContextMenu回调
--- @param player number: IsoPlayer索引
--- @param context ISContextMenu: 上下文菜单实例
--- @param worldobjects table: 世界对象表
--- @param test boolean: 如果是测试附近对象则返回true, 否则返回false
--- @todo 优化性能, ISContextMenu性能过差, 经测试, 注册300+ISContextMenu实例会导致游戏主线程冻结0.24秒左右, 这是非常严重的性能问题, 需要官方解决
MoreBuildPlus.OnFillWorldObjectContextMenu = function(player, context, worldobjects, test)
  if getCore():getGameMode() == 'LastStand' then
    return
  end

  if test and ISWorldObjectContextMenu.Test then
    return true
  end

  local playerObj = getSpecificPlayer(player)
  if playerObj:getVehicle() then
    return
  end

  if MoreBuildPlus.checkPermission(playerObj) then return end

  local inv = playerObj:getInventory()

  if MoreBuildPlus.haveAToolToBuild(inv) then

    MoreBuildPlus.buildSkillsList(playerObj)

    if MoreBuildPlus.playerSkills["Woodwork"] > 6 or ISBuildMenu.cheat then
      MoreBuildPlus.playerCanPlaster = true
    else
      MoreBuildPlus.playerCanPlaster = false
    end
	-----------------------------------------------------------------------------------------------------------------
	local _firstTierMenu = context:addOption(getText('More Buildings+'))
    local _secondTierMenu = ISContextMenu:getNew(context)
    context:addSubMenu(_firstTierMenu, _secondTierMenu)
	
	local _architectureOption = _secondTierMenu:addOption(getText("Fancy Walls"))
    local _architectureThirdTierMenu = _secondTierMenu:getNew(_secondTierMenu)
    context:addSubMenu(_architectureOption, _architectureThirdTierMenu)
	
	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Interior"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.wallsPlusMenuBuilder(_wallsSubMenu, player, context)
	
	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Windows & DoorFrames"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.windowsPlusMenuBuilder(_wallsSubMenu, player, context)
	
	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Pillars"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.pillarsPlusMenuBuilder(_wallsSubMenu, player, context)
	
	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Exterior"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.wallsPlusExteriorMenuBuilder(_wallsSubMenu, player, context)
	
	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Windows & DoorFrames"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.WindowsPlusExteriorMenuBuilder(_wallsSubMenu, player, context)
	
	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Pillars"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.pillarsPlusExteriorMenuBuilder(_wallsSubMenu, player, context)
	
	local _architectureOption = _secondTierMenu:addOption(getText("Garage Walls"))
    local _architectureThirdTierMenu = _secondTierMenu:getNew(_secondTierMenu)
    context:addSubMenu(_architectureOption, _architectureThirdTierMenu)
	
	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Walls"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.wallsGaragePlusMenuBuilder(_wallsSubMenu, player, context)
	
	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Windows & DoorFrames"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.windowsGaragePlusMenuBuilder(_wallsSubMenu, player, context)
	
	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Pillars"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.pillarsGaragePlusMenuBuilder(_wallsSubMenu, player, context)
	
	local _architectureOption = _secondTierMenu:addOption(getText("Roofs"))
    local _architectureThirdTierMenu = _secondTierMenu:getNew(_secondTierMenu)
    context:addSubMenu(_architectureOption, _architectureThirdTierMenu)
	
	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Brown Shingles"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.roofThreePlusMenuBuilder(_wallsSubMenu, player, context)
	
	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Blue Shingles"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.roofOnePlusMenuBuilder(_wallsSubMenu, player, context)
	
	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Gray Shingles"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.roofFivePlusMenuBuilder(_wallsSubMenu, player, context)
	
	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Wooden"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.roofTwoPlusMenuBuilder(_wallsSubMenu, player, context)
	
	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Corrugated Steel"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.roofFourPlusMenuBuilder(_wallsSubMenu, player, context)
	
	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Glass"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.roofGlassPlusMenuBuilder(_wallsSubMenu, player, context)
	
	local _architectureOption = _secondTierMenu:addOption(getText("Roof Walls"))
    local _architectureThirdTierMenu = _secondTierMenu:getNew(_secondTierMenu)
    context:addSubMenu(_architectureOption, _architectureThirdTierMenu)
	
	
	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Wood"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.wallsRoofMenuBuilder(_wallsSubMenu, player, context)
	
	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Brown Panels"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.wallsRoof5MenuBuilder(_wallsSubMenu, player, context)
	
	local _wallsOption = _architectureThirdTierMenu:addOption(getText("White Panels"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.wallsRoof2MenuBuilder(_wallsSubMenu, player, context)
	
	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Beige Panels"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.wallsRoof32MenuBuilder(_wallsSubMenu, player, context)
	
	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Blue Panels"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.wallsRoof4MenuBuilder(_wallsSubMenu, player, context)
	
	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Gray Stone"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.wallsRoof6MenuBuilder(_wallsSubMenu, player, context)
	
	
	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Brick"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.wallRoofBrickMenuBuilder(_wallsSubMenu, player, context)
	
	local _architectureOption = _secondTierMenu:addOption(getText("Moulding"))
    local _architectureThirdTierMenu = _secondTierMenu:getNew(_secondTierMenu)
    context:addSubMenu(_architectureOption, _architectureThirdTierMenu)
	
	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Wood Moulding"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.mouldingMenuBuilder(_wallsSubMenu, player, context)
	
	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Stone Moulding"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.mouldingMetalMenuBuilder(_wallsSubMenu, player, context)
	
	local _architectureOption = _secondTierMenu:addOption(getText("Fencing / Railing"))
    local _architectureThirdTierMenu = _secondTierMenu:getNew(_secondTierMenu)
    context:addSubMenu(_architectureOption, _architectureThirdTierMenu)
	
	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Railing 1"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.railingPlusMenuBuilder(_wallsSubMenu, player, context)
	
	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Railing 2"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.railingPlusTwoMenuBuilder(_wallsSubMenu, player, context)
	
	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Railing 3"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.railingPlusThreeMenuBuilder(_wallsSubMenu, player, context)
	
	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Railing 4"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.railingPlusFourMenuBuilder(_wallsSubMenu, player, context)
	
	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Exterior Railing"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)
	
	context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.railingPlus5MenuBuilder(_wallsSubMenu, player, context)
	
	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Fence"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.metalFenceMenuBuilder(_wallsSubMenu, player, context)
	
	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Large Iron Gate"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.doubleDoorMetalPlusMenuBuilder(_wallsSubMenu, player, context)
	
	local _architectureOption = _secondTierMenu:addOption(getText("Other"))
    local _architectureThirdTierMenu = _secondTierMenu:getNew(_secondTierMenu)
    context:addSubMenu(_architectureOption, _architectureThirdTierMenu)
	
	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Shower"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.ShowerPlusMenuBuilder(_wallsSubMenu, player, context)
	
		local _wallsOption = _architectureThirdTierMenu:addOption(getText("Door Frames "))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.decorativeDoorFrameMenuBuilder(_wallsSubMenu, player, context)
	
	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Double Doors"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.doubleDoorMenuBuilder(_wallsSubMenu, player, context)
	
	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Large Windows "))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.otherTwoPlusMenuBuilder(_wallsSubMenu, player, context)

	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Large Window Frames"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.largeWindowFramePlusMenuBuilder(_wallsSubMenu, player, context)
	
	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Exterior Window Trim"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.mouldingWindowMenuBuilder(_wallsSubMenu, player, context)
	
	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Exterior Detailing"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.otherPlusMenuBuilder(_wallsSubMenu, player, context)
	
	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Detailed Pillars"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.detailedPillarsMenuBuilder(_wallsSubMenu, player, context)
	
	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Vines"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.plantsPlusPlusMenuBuilder(_wallsSubMenu, player, context)
	
	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Trees"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.TreePlusMenuBuilder(_wallsSubMenu, player, context)
	
	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Military Tent Walls"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.militaryTentWallsMenuBuilder(_wallsSubMenu, player, context)
	
	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Military Tent Roofs"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.militaryTentRoofsMenuBuilder(_wallsSubMenu, player, context)
	
	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Military Tent Detailing"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.militaryTentFlapsMenuBuilder(_wallsSubMenu, player, context)
	
	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Military Tent Curtain"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.MilitaryTentCurtainMenuBuilder(_wallsSubMenu, player, context)
	
	local _wallsOption = _architectureThirdTierMenu:addOption(getText("SandBag"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.SandbagPLusMenuBuilder(_wallsSubMenu, player, context)
	
	local _wallsOption = _architectureThirdTierMenu:addOption(getText("Second Floor Roof Test"))
    local _wallsSubMenu = _architectureThirdTierMenu:getNew(_architectureThirdTierMenu)

    context:addSubMenu(_wallsOption, _wallsSubMenu)
    MoreBuildPlus.roofTestMenuBuilder(_wallsSubMenu, player, context)
	
	
	
	

	
	
	
  end
end

--- 检查物品是否损坏
--- @param item string: 需检查的物品名称
--- @return boolean: 如果物品未损坏返回true, 否则返回false
local function predicateNotBroken(item)
  return not item:isBroken()
end

--- 获取可移动家具本地化字符串
--- @param sprite string: Sprite名称
--- @return string: 获取的本地化字符串
MoreBuildPlus.getMoveableDisplayName = function(sprite)
  local props = getSprite(sprite):getProperties()
  if props:Is('CustomName') then
    local name = props:Val('CustomName')
    if props:Is('GroupName') then
      name = props:Val('GroupName') .. ' ' .. name
    end
    return getMoveableDisplayName(name)
  end
end

--- 检查玩家是否拥有某些工具
--- @param inv ItemContainer: 玩家ItemContainer实例
--- @return boolean: 如果满足工具条件需求则返回true否则返回false
MoreBuildPlus.haveAToolToBuild = function(inv)
  local havaTools = nil

  havaTools = MoreBuildPlus.getAvailableTools(inv, 'Hammer')

  return havaTools or ISBuildMenu.cheat
end

--- 检查玩家建筑权限, 仅在多人模式中使用
--- @param player IsoPlayer: IsoPlayer实例
--- @return boolean: 如果权限符合返回true否则返回false
MoreBuildPlus.checkPermission = function(player)
  local level = player:getAccessLevel()
  local permission = SandboxVars.MoreBuildPluss.BuildingPermission
  return isClient() and not ISBuildMenu.cheat and MoreBuildPlus.AccessLevel[level] < permission
end

--- 获取玩家库存内的可用工具
--- @param inv ItemContainer: 玩家ItemContainer实例
--- @param tool string: 工具类型
--- @return InventoryItem: 获取的工具实例, 如空或已损坏返回nil
MoreBuildPlus.getAvailableTools = function(inv, tool)
  local tools = nil
  local toolList = MoreBuildPlus.toolsList[tool]
  for _, type in pairs (toolList) do
    tools = inv:getFirstTypeEval(type, predicateNotBroken)
    if tools then
      return tools
    end
  end
end

--- 装备主要工具
--- @param object IsoObject: IsoObject实例
--- @param player number: IsoPlayer索引
--- @param tool string: 工具类型
MoreBuildPlus.equipToolPrimary = function(object, player, tool)
  local tools = nil
  local inv = getSpecificPlayer(player):getInventory()
  tools = MoreBuildPlus.getAvailableTools(inv, tool)
  if tools then
    ISInventoryPaneContextMenu.equipWeapon(tools, true, false, player)
    object.noNeedHammer = true
  end
end

--- 装备次要工具
--- @param object Isoobject: Isoobject实例
--- @param player number: IsoPlayer索引
--- @param tool string: 工具类型
--- @info 未使用
MoreBuildPlus.equipToolSecondary = function(object, player, tool)
  local tools = nil
  local inv = getSpecificPlayer(player):getInventory()
  tools = MoreBuildPlus.getAvailableTools(inv, tool)
  if tools then
    ISInventoryPaneContextMenu.equipWeapon(tools, false, false, player)
  end
end

--- 构造技能文本
--- @param player IsoPlayer: IsoPlayer实例
MoreBuildPlus.buildSkillsList = function(player)
  local perks = PerkFactory.PerkList
  local perkID = nil
  local perkType = nil
  for i = 0, perks:size() - 1 do
    perkID = perks:get(i):getId()
    perkType = perks:get(i):getType()
    MoreBuildPlus.playerSkills[perkID] = player:getPerkLevel(perks:get(i))
    MoreBuildPlus.textSkillsRed[perkID] = ' <RGB:1,0,0>' .. PerkFactory.getPerkName(perkType) .. ' ' .. MoreBuildPlus.playerSkills[perkID] .. '/'
    MoreBuildPlus.textSkillsGreen[perkID] = ' <RGB:1,1,1>' .. PerkFactory.getPerkName(perkType) .. ' '
  end
end

--- 检查&构造材料提示文本
--- @param inv ItemContainer: 玩家ItemContainer实例
--- @param material string: 材料类型
--- @param amount number: 需要的材料数量
--- @param tooltip ISToolTip: 工具提示实例
--- @return boolean: 如果满足检查条件则返回true否则返回false
--- @info ISBuildMenu.countMaterial性能过低, 如果玩家库存中物品过多会卡游戏主线程, 不建议使用
MoreBuildPlus.tooltipCheckForMaterial = function(inv, material, amount, tooltip)
  local type = split(material, '\\.')[2]
  local invItemCount = 0
  local groundItem = ISBuildMenu.materialOnGround
  if amount > 0 then
    invItemCount = inv:getItemCountFromTypeRecurse(material)

    if material == "Base.Nails" then
      invItemCount = invItemCount + inv:getItemCountFromTypeRecurse("Base.NailsBox") * 100
      if groundItem["Base.NailsBox"] then
        invItemCount = invItemCount + groundItem["Base.NailsBox"] * 100
      end
    end

    -- ISBuildUtil not support boxed screws, later solve it
    --[[
    if material == "Base.Screws" then
      invItemCount = invItemCount + inv:getItemCountFromTypeRecurse("Base.ScrewsBox") * 100
      if groundItem["Base.ScrewsBox"] then
        invItemCount = invItemCount + groundItem["Base.ScrewsBox"] * 100
      end
    end
    --]]

    -- why #groundItem 0?
    for groundItemType, groundItemCount in pairs(groundItem) do
      if groundItemType == type then
        invItemCount = invItemCount + groundItemCount
      end
    end

    if invItemCount < amount then
      tooltip.description = tooltip.description .. ' <RGB:1,0,0>' .. getItemNameFromFullType(material) .. ' ' .. invItemCount .. '/' .. amount .. ' <LINE>'
      return false
    else
      tooltip.description = tooltip.description .. ' <RGB:1,1,1>' .. getItemNameFromFullType(material) .. ' ' .. invItemCount .. '/' .. amount .. ' <LINE>'
      return true
    end
  end
end

--- 检查&构造工具提示文本
--- @param inv ItemContainer: 玩家ItemContainer实例
--- @param tool string: 工具类型
--- @param tooltip ISToolTip: 工具提示实例
--- @return boolean: 如果满足检查条件则返回true否则返回false
MoreBuildPlus.tooltipCheckForTool = function(inv, tool, tooltip)
  local tools = MoreBuildPlus.getAvailableTools(inv, tool)
  if tools then
    tooltip.description = tooltip.description .. ' <RGB:1,1,1>' .. tools:getName() .. ' <LINE>'
    return true
  else
    for _, type in pairs (MoreBuildPlus.toolsList[tool]) do
      tooltip.description = tooltip.description .. ' <RGB:1,0,0>' .. getItemNameFromFullType(type) .. ' <LINE>'
      return false
    end
  end
end

--- 检查是否满足建造条件
--- @param skills table: 技能等级需求表, 支持被动技能 {Woodwork = 1, Strength = 2, ...}
--- @param option ISContextMenu: 上下文菜单实例
--- @return ISToolTip: 返回工具提示实例
MoreBuildPlus.canBuildObject = function(skills, option, player)
  local _tooltip = ISToolTip:new()
  _tooltip:initialise()
  _tooltip:setVisible(false)
  option.toolTip = _tooltip

  local inv = getSpecificPlayer(player):getInventory()

  local _canBuildResult = true

  _tooltip.description = MoreBuildPlus.textTooltipHeader

  local _currentResult = true

  for _, _currentMaterial in pairs(MoreBuildPlus.neededMaterials) do
    if _currentMaterial['Material'] and _currentMaterial['Amount'] then
      _currentResult = MoreBuildPlus.tooltipCheckForMaterial(inv, _currentMaterial['Material'], _currentMaterial['Amount'], _tooltip)
    else
      _tooltip.description = _tooltip.description .. ' <RGB:1,0,0> Error in required material definition. <LINE>'
      _canBuildResult = false
    end

    if not _currentResult then
      _canBuildResult = false
    end
  end

  for _, _currentTool in pairs(MoreBuildPlus.neededTools) do
    _currentResult = MoreBuildPlus.tooltipCheckForTool(inv, _currentTool, _tooltip)

    if not _currentResult then
      _canBuildResult = false
    end
  end

  for skill, level in pairs (skills) do
    if (MoreBuildPlus.playerSkills[skill] < level) then
      _tooltip.description = _tooltip.description .. MoreBuildPlus.textSkillsRed[skill]
      _canBuildResult = false
    else
      _tooltip.description = _tooltip.description .. MoreBuildPlus.textSkillsGreen[skill]
    end
    _tooltip.description = _tooltip.description .. level .. ' <LINE>'
  end

  if not _canBuildResult and not ISBuildMenu.cheat then
    option.onSelect = nil
    option.notAvailable = true
  end
  return _tooltip
end

--- 获取MoreBuildPlus实例
--- @return table: MoreBuildPlus table
function getMoreBuildPlusInstance()
  return MoreBuildPlus
end

--- 注册OnFillWorldObjectContextMenu事件
-- @callback1 player number: 调用的IsoPlayer索引
-- @callback2 context ISContextMenu: 上下文菜单实例
-- @callback3 worldobjects table: 世界对象表
-- @callback4 test Boolean: 如果是测试附近对象则返回true, 否则返回false
Events.OnFillWorldObjectContextMenu.Add(MoreBuildPlus.OnFillWorldObjectContextMenu)