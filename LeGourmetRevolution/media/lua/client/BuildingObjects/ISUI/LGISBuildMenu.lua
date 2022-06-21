--***********************************************************
--**                    ROBERT JOHNSON                     **
--**       Contextual menu for building when clicking somewhere on the ground       **
--***********************************************************

LGISBuildMenu = {};
LGISBuildMenu.planks = 0;
LGISBuildMenu.nails = 0;
LGISBuildMenu.deerhead = 0;
LGISBuildMenu.cowhead = 0;
LGISBuildMenu.bearhead = 0;
LGISBuildMenu.boarhead = 0;
LGISBuildMenu.bisonhead = 0;
LGISBuildMenu.moosehead = 0;
LGISBuildMenu.logs = 0;
LGISBuildMenu.tbranch = 0;
LGISBuildMenu.sheetrope = 0;
LGISBuildMenu.rope = 0;
LGISBuildMenu.cane = 0;
LGISBuildMenu.doorknob = 0;
LGISBuildMenu.hinge = 0;
LGISBuildMenu.sheetmetal = 0;
LGISBuildMenu.smallsheetmetal = 0;
LGISBuildMenu.screws = 0;
LGISBuildMenu.metalpipe = 0;
LGISBuildMenu.wire = 0;
LGISBuildMenu.diana = 0;
LGISBuildMenu.alfalfa = 0;
LGISBuildMenu.woodWorkXp = 0;
LGISBuildMenu.recipetext = "";

LGISBuildMenu.healthLevel =
{
	wallDecoration 	= 40,
	furframe 	= 150,
	drylog 	= 500,
};

local function predicateNotBroken(item)
	return not item:isBroken()
end

local function predicateDrainableUsesInt(item, count)
	return item:getDrainableUsesInt() >= count
end

LGISBuildMenu.doBuildMenu = function(player, context, worldobjects, test, square, subMenu)

	local BbuildOption = subMenu:addOption(getText("ContextMenu_Construction"), worldobjects, nil);
	local BsubMenu = subMenu:getNew(subMenu);
	context:addSubMenu(BbuildOption, BsubMenu);
	
	local ResbuildOption = subMenu:addOption(getText("ContextMenu_Resources"), worldobjects, nil);
	local RessubMenu = subMenu:getNew(subMenu);
	context:addSubMenu(ResbuildOption, RessubMenu);
	if AMISBuildMenu then
		AMISBuildMenu.doBuildMenu(player, context, worldobjects, test, square, RessubMenu)
	end
	
	if TableSawBuildMenu then
		TableSawBuildMenu.doBuildMenu(player, context, worldobjects, test, square, RessubMenu)
	end
	
	if FuelTankBuildMenu then
		FuelTankBuildMenu.doBuildMenu(player, context, worldobjects, test, square, RessubMenu)
	end

	local DecoOption = BsubMenu:addOption(getText("ContextMenu_Decorative"), worldobjects, nil);
	local DecosubMenu = BsubMenu:getNew(BsubMenu);
	context:addSubMenu(DecoOption, DecosubMenu);

	local DbuildOption = DecosubMenu:addOption(getText("ContextMenu_Trophys"), worldobjects, nil);
	local DsubMenu = DecosubMenu:getNew(BsubMenu);
	context:addSubMenu(DbuildOption, DsubMenu);
	
	local FramebuildOption = BsubMenu:addOption(getText("ContextMenu_Advanced_Frames"), worldobjects, nil);
	local FramesubMenu = BsubMenu:getNew(BsubMenu);
	context:addSubMenu(FramebuildOption, FramesubMenu);
	
	local DoorOption = BsubMenu:addOption(getText("ContextMenu_Doors"), worldobjects, nil);
	local DoorsubMenu = BsubMenu:getNew(BsubMenu);
	context:addSubMenu(DoorOption, DoorsubMenu);
	
	local ROption = BsubMenu:addOption(getText("ContextMenu_Reinforcements"), worldobjects, nil);
	local RsubMenu = BsubMenu:getNew(BsubMenu);
	context:addSubMenu(ROption, RsubMenu);
	
	if ZAWISBuildMenu then
		ZAWISBuildMenu.filldata(player);
		ZAWISBuildMenu.cratesMenuBuilder(RessubMenu, player);
	
		local WallOption = BsubMenu:addOption(getText("ContextMenu_Walls"), worldobjects, nil);
		local WallsubMenu = BsubMenu:getNew(BsubMenu);
		context:addSubMenu(WallOption, WallsubMenu);
		ZAWISBuildMenu.wallStylesMenuBuilder(WallsubMenu, player, context, worldobjects);
		
		local _moreFencesOption = BsubMenu:addOption(getText("ContextMenu_MoreFences"), worldobjects, nil);
		local _moreFencesSubMenu = BsubMenu:getNew(BsubMenu);

		context:addSubMenu(_moreFencesOption, _moreFencesSubMenu);
		ZAWISBuildMenu.moreFencesMenuBuilder(_moreFencesSubMenu, player);
	
		local _moreFencePostsOption = BsubMenu:addOption(getText("ContextMenu_FencesPost"), worldobjects, nil);
		local _moreFencePostsSubMenu = BsubMenu:getNew(BsubMenu);

		context:addSubMenu(_moreFencePostsOption, _moreFencePostsSubMenu);
		ZAWISBuildMenu.moreFencePostsMenuBuilder(_moreFencePostsSubMenu, player);
	end
	
	local _name = nil;
	local TrophySprite = nil;
	local TrophyOption = nil;
	local FurFrameSprite = nil;
	local FurFrameOption = nil;
	local DianaSprite = nil;
	local DianaOption = nil;
	local NewWoodenFrameSprite = nil;
	local NewWoodenFrameOption = nil;
	local NewDoorFrameSprite = nil;
	local NewDoorFrameOption = nil;
	local NewWindowFrameSprite = nil;
	local NewWindowFrameOption = nil;
	local NewFenceFrameSprite = nil;
	local NewFenceFrameOption = nil;
	local NewDoorSprite = nil;
	local NewDoorOption = nil;
	local NewFenceDoorFrameSprite = nil;
	local FenceDoorFrameOption = nil;
	local CaneFenceDoorSprite = nil;
	local CaneFenceDoorOption = nil;
	local CanePillarOption = nil;
	local NewMetalFrameSprite = nil;
	local NewMetalFrameOption = nil;
	local NewMetalWindowFrameSprite = nil;
	local NewMetalWindowFrameOption = nil;
	local NewMetalDoorFrameSprite = nil;
	local NewMetalDoorFrameOption = nil;
	local LogDoorFrameSprite = nil;
	local LogDoorFrameOption = nil;
	local SRSprite = nil;
	local SROption = nil;
	local CRSprite = nil;
	local CROption = nil;
	local tooltip = nil;

	_name = getText("ContextMenu_Deer");
	TrophySprite = LGISBuildMenu.getDeerTrophySprites(player);
	TrophyOption = DsubMenu:addOption(_name, worldobjects, LGISBuildMenu.onBuildDeerTrophy, square, TrophySprite, player);
	tooltip = LGISBuildMenu.canBuild("Make Animal Trophys",3,20,1,0,0,0,0,0,3, TrophyOption, player);
	tooltip:setName(_name);
	tooltip.description = "<RGB:1,1,0>" .. getText("Tooltip_craft_DeerHeadDesc") .. tooltip.description;
	tooltip:setTexture(TrophySprite.sprite);
	LGISBuildMenu.requireHammer(TrophyOption);
	-------------------------------------------------------------------------------------------------------------------------------
	_name = getText("ContextMenu_Cow");
	TrophySprite = LGISBuildMenu.getCowTrophySprites(player);
	TrophyOption = DsubMenu:addOption(_name, worldobjects, LGISBuildMenu.onBuildCowTrophy, square, TrophySprite, player);
	tooltip = LGISBuildMenu.canBuild("Make Animal Trophys",3,20,0,1,0,0,0,0,3, TrophyOption, player);
	tooltip:setName(_name);
	tooltip.description = "<RGB:1,1,0>" .. getText("Tooltip_craft_CowHeadDesc") .. tooltip.description;
	tooltip:setTexture(TrophySprite.sprite);
	LGISBuildMenu.requireHammer(TrophyOption);
	-------------------------------------------------------------------------------------------------------------------------------
	_name = getText("ContextMenu_Bear");
	TrophySprite = LGISBuildMenu.getBearTrophySprites(player);
	TrophyOption = DsubMenu:addOption(_name, worldobjects, LGISBuildMenu.onBuildBearTrophy, square, TrophySprite, player);
	tooltip = LGISBuildMenu.canBuild("Make Animal Trophys",3,20,0,0,1,0,0,0,3, TrophyOption, player);
	tooltip:setName(_name);
	tooltip.description = "<RGB:1,1,0>" .. getText("Tooltip_craft_BearHeadDesc") .. tooltip.description;
	tooltip:setTexture(TrophySprite.sprite);
	LGISBuildMenu.requireHammer(TrophyOption);
	-------------------------------------------------------------------------------------------------------------------------------
	_name = getText("ContextMenu_Boar");
	TrophySprite = LGISBuildMenu.getBoarTrophySprites(player);
	TrophyOption = DsubMenu:addOption(_name, worldobjects, LGISBuildMenu.onBuildBoarTrophy, square, TrophySprite, player);
	tooltip = LGISBuildMenu.canBuild("Make Animal Trophys",3,20,0,0,0,1,0,0,3, TrophyOption, player);
	tooltip:setName(_name);
	tooltip.description = "<RGB:1,1,0>" .. getText("Tooltip_craft_BoarHeadDesc") .. tooltip.description;
	tooltip:setTexture(TrophySprite.sprite);
	LGISBuildMenu.requireHammer(TrophyOption);
	-------------------------------------------------------------------------------------------------------------------------------
	_name = getText("ContextMenu_Bison");
	TrophySprite = LGISBuildMenu.getBisonTrophySprites(player);
	TrophyOption = DsubMenu:addOption(_name, worldobjects, LGISBuildMenu.onBuildBisonTrophy, square, TrophySprite, player);
	tooltip = LGISBuildMenu.canBuild("Make Animal Trophys",3,20,0,0,0,0,1,0,3, TrophyOption, player);
	tooltip:setName(_name);
	tooltip.description = "<RGB:1,1,0>" .. getText("Tooltip_craft_BisonHeadDesc") .. tooltip.description;
	tooltip:setTexture(TrophySprite.sprite);
	LGISBuildMenu.requireHammer(TrophyOption);
	-------------------------------------------------------------------------------------------------------------------------------
	_name = getText("ContextMenu_Moose");
	TrophySprite = LGISBuildMenu.getMooseTrophySprites(player);
	TrophyOption = DsubMenu:addOption(_name, worldobjects, LGISBuildMenu.onBuildMooseTrophy, square, TrophySprite, player);
	tooltip = LGISBuildMenu.canBuild("Make Animal Trophys",3,20,0,0,0,0,0,1,3, TrophyOption, player);
	tooltip:setName(_name);
	tooltip.description = "<RGB:1,1,0>" .. getText("Tooltip_craft_MooseHeadDesc") .. tooltip.description;
	tooltip:setTexture(TrophySprite.sprite);
	LGISBuildMenu.requireHammer(TrophyOption);

	-------------------------------------------------------------------------------------------------------------------------------
	--Cheese Table
	_name = getText("ContextMenu_CheeseTable");
	ChTableSprite = LGISBuildMenu.getCheeseTableSprites(player);
	ChTableOption = RessubMenu:addOption(_name, worldobjects, LGISBuildMenu.onBuildCheeseTable, square, ChTableSprite, player);
	tooltip = LGISBuildMenu.canBuild("Cheese table",14,25,0,0,0,0,0,0,3, ChTableOption, player);
	tooltip:setName(_name);
	tooltip.description = "<RGB:1,1,0>" .. getText("Tooltip_craft_CheeseTableDesc") .. tooltip.description;
	tooltip:setTexture(ChTableSprite.sprite);
	LGISBuildMenu.requireHammer(ChTableOption);

	-------------------------------------------------------------------------------------------------------------------------------
	--Fur Frame
	
	_name = getText("ContextMenu_Furframe");
	FurFrameSprite = LGISBuildMenu.getFurFrameSprites(player);
	FurFrameOption = RessubMenu:addOption(_name, worldobjects, LGISBuildMenu.onBuildFurFrame, square, FurFrameSprite, player);
	tooltip = LGISBuildMenu.canBuildFurFrame(0,9,8,8,"Make fur frame",3,2, FurFrameOption, player);
	tooltip:setName(_name);
	tooltip.description = "<RGB:1,1,0>" .. getText("Tooltip_craft_FurFramedesc") .. tooltip.description;
	tooltip:setTexture(FurFrameSprite.sprite);
	LGISBuildMenu.requireHammer(FurFrameOption);
	
	-------------------------------------------------------------------------------------------------------------------------------
	--Dry Cane Support
	
	_name = getText("ContextMenu_DryCaneSupport");
	DryCaneSupSprite = LGISBuildMenu.getDryCaneSupportSprites(player);
	DryCaneSupOption = RessubMenu:addOption(_name, worldobjects, LGISBuildMenu.onBuildDryCaneSupport, square, DryCaneSupSprite, player);
	tooltip = LGISBuildMenu.canBuildFurFrame(1,0,8,0,"NONE",3,0, DryCaneSupOption, player);
	tooltip:setName(_name);
	tooltip.description = "<RGB:1,1,0>" .. getText("Tooltip_craft_DryCaneSupportdesc") .. tooltip.description;
	tooltip:setTexture(DryCaneSupSprite.sprite);
	LGISBuildMenu.requireHammer(DryCaneSupOption);

	-------------------------------------------------------------------------------------------------------------------------------
	--Hunting Diana
	--if isDebugEnabled() then
		_name = getText("ContextMenu_HuntingDiana");
		DianaSprite = LGISBuildMenu.getDianaSprites(player);
		DianaOption = RessubMenu:addOption(_name, worldobjects, LGISBuildMenu.onBuildHuntingDiana, square, DianaSprite, player);
		tooltip = LGISBuildMenu.canBuildDiana("Make diana",6,10,1,1,4, DianaOption, player);
		tooltip:setName(_name);
		tooltip.description = "<RGB:1,1,0>" .. getText("Tooltip_craft_HuntingDianaDesc") .. tooltip.description;
		tooltip:setTexture(DianaSprite.sprite);
		LGISBuildMenu.requireHammer(DianaOption);
	--end
	
	-------------------------------------------------------------------------------------------------------------------------------
	--New Wooden Frame

	_name = getText("ContextMenu_NewWoodenFrame");
	NewWoodenFrameSprite = LGISBuildMenu.getNewWoodenFrameSprites(player);
	NewWoodenFrameOption = FramesubMenu:addOption(_name, worldobjects, LGISBuildMenu.onBuildNewWoodenFrame, square, NewWoodenFrameSprite, player);
	tooltip = LGISBuildMenu.canBuild("Advanced frames",4,4,0,0,0,0,0,0,3, NewWoodenFrameOption, player);
	tooltip:setName(_name);
	tooltip.description = "<RGB:1,1,0>" .. getText("Tooltip_craft_NewWoodenFramedesc") .. tooltip.description;
	tooltip:setTexture(NewWoodenFrameSprite.sprite);
	LGISBuildMenu.requireHammer(NewWoodenFrameOption);
	
	-------------------------------------------------------------------------------------------------------------------------------
	--New Door Frame
	_name = getText("ContextMenu_AdvancedDoorFrame");
	NewDoorFrameSprite = LGISBuildMenu.getAdvancedDoorFrameSprites(player);
	NewDoorFrameOption = FramesubMenu:addOption(_name, worldobjects, LGISBuildMenu.onBuildNewDoorFrame, square, NewDoorFrameSprite, player);
	tooltip = LGISBuildMenu.canBuild("Advanced frames",4,4,0,0,0,0,0,0,3, NewDoorFrameOption, player);
	tooltip:setName(_name);
	tooltip.description = "<RGB:1,1,0>" .. getText("Tooltip_craft_AdvancedDoorFramedesc") .. tooltip.description;
	tooltip:setTexture(NewDoorFrameSprite.sprite);
	LGISBuildMenu.requireHammer(NewDoorFrameOption);
	
	-------------------------------------------------------------------------------------------------------------------------------
	--New Window Frame
	_name = getText("ContextMenu_AdvancedWindowFrame");
	NewWindowFrameSprite = LGISBuildMenu.getAdvancedWindowFrameSprites(player);
	NewWindowFrameOption = FramesubMenu:addOption(_name, worldobjects, LGISBuildMenu.onBuildNewWindowFrame, square, NewWindowFrameSprite, player);
	tooltip = LGISBuildMenu.canBuild("Advanced frames",4,4,0,0,0,0,0,0,3, NewWindowFrameOption, player);
	tooltip:setName(_name);
	tooltip.description = "<RGB:1,1,0>" .. getText("Tooltip_craft_AdvancedWindowFramedesc") .. tooltip.description;
	tooltip:setTexture(NewWindowFrameSprite.sprite);
	LGISBuildMenu.requireHammer(NewWindowFrameOption);
	
	-------------------------------------------------------------------------------------------------------------------------------
	--New Fence Frame
	_name = getText("ContextMenu_AdvancedFenceFrame");
	NewFenceFrameSprite = LGISBuildMenu.getAdvancedFenceFrameSprites(player);
	NewFenceFrameOption = FramesubMenu:addOption(_name, worldobjects, LGISBuildMenu.onBuildNewFenceFrame, square, NewFenceFrameSprite, player);
	tooltip = LGISBuildMenu.canBuild("Advanced frames",4,4,0,0,0,0,0,0,3, NewFenceFrameOption, player);
	tooltip:setName(_name);
	tooltip.description = "<RGB:1,1,0>" .. getText("Tooltip_craft_AdvancedFenceFramedesc") .. tooltip.description;
	tooltip:setTexture(NewFenceFrameSprite.sprite);
	LGISBuildMenu.requireHammer(NewFenceFrameOption);

	-------------------------------------------------------------------------------------------------------------------------------
	--New Fence Door Frame
	_name = getText("ContextMenu_FenceDoorFrame");
	NewFenceDoorFrameSprite = LGISBuildMenu.getFenceDoorFrameSprites(player);
	FenceDoorFrameOption = DoorsubMenu:addOption(_name, worldobjects, LGISBuildMenu.onBuildFenceDoorFrame, square, NewFenceDoorFrameSprite, player);
	tooltip = LGISBuildMenu.canBuild("NONE",2,4,0,0,0,0,0,0,3, FenceDoorFrameOption, player);
	tooltip:setName(_name);
	tooltip.description = "<RGB:1,1,0>" .. getText("Tooltip_craft_FenceDoorFramedesc") .. tooltip.description;
	tooltip:setTexture(NewFenceDoorFrameSprite.sprite);
	LGISBuildMenu.requireHammer(FenceDoorFrameOption);

	-------------------------------------------------------------------------------------------------------------------------------
	--Cane Pillar
	
	_name = getText("ContextMenu_Canepillar");
	CanePillarOption = BsubMenu:addOption(_name, worldobjects, LGISBuildMenu.onBuildCanePillar, player);
	tooltip = LGISBuildMenu.canBuildDoor(1,4,0,0,"NONE",2, CanePillarOption, player);
	tooltip:setName(_name);
	tooltip.description = "<RGB:1,1,0>" .. getText("Tooltip_craft_CanePillardesc") .. tooltip.description;
	tooltip:setTexture("walls_exterior_legourmet_01_2");
	LGISBuildMenu.requireHammer(CanePillarOption);

	-------------------------------------------------------------------------------------------------------------------------------
	--Cane fence Door
	
	_name = getText("ContextMenu_CaneFenceDoor");
	CaneFenceDoorSprite = LGISBuildMenu.getCaneFenceDoorSprites(player);
	CaneFenceDoorOption = DoorsubMenu:addOption(_name, worldobjects, LGISBuildMenu.onBuildCaneFenceDoor, square, CaneFenceDoorSprite, player);
	tooltip = LGISBuildMenu.canBuildDoor(3,4,1,2,"NONE",3, CaneFenceDoorOption, player);
	tooltip:setName(_name);
	tooltip.description = "<RGB:1,1,0>" .. getText("Tooltip_craft_CaneFenceDoordesc") .. tooltip.description;
	tooltip:setTexture(CaneFenceDoorSprite.sprite);
	LGISBuildMenu.requireHammer(CaneFenceDoorOption);

	-------------------------------------------------------------------------------------------------------------------------------
	--New Wooden Door
	
	_name = getText("ContextMenu_NewDoor");
	NewDoorSprite = LGISBuildMenu.getNewDoorSprites(player);
	NewDoorOption = DoorsubMenu:addOption(_name, worldobjects, LGISBuildMenu.onBuildNewDoor, square, NewDoorSprite, player);
	tooltip = LGISBuildMenu.canBuildDoor(5,10,1,2,"NONE",3, NewDoorOption, player);
	tooltip:setName(_name);
	tooltip.description = "<RGB:1,1,0>" .. getText("Tooltip_craft_NewDoordesc") .. tooltip.description;
	tooltip:setTexture(NewDoorSprite.sprite);
	LGISBuildMenu.requireHammer(NewDoorOption);

	-------------------------------------------------------------------------------------------------------------------------------
	--Log Door Frame
	LogDoorFrameSprite = LGISBuildMenu.getLogDoorFrameSprites(player);
	LogDoorFrameOption = DoorsubMenu:addOption(getText("ContextMenu_Log_DoorFrame"), worldobjects, LGISBuildMenu.onBuildLogDoorFrame, square, LogDoorFrameSprite, player);
	tooltip = LGISBuildMenu.canBuildDoor(0,0,0,0,nil,0, LogDoorFrameOption, player);
	tooltip:setName(getText("ContextMenu_Log_DoorFrame"));
	--if not doorsOption2.notAvailable then
	local recipes = getSpecificPlayer(player):getKnownRecipes();
	if recipes:contains("Make log door frame") then
		if not ISBuildMenu.cheat then
			tooltip.description = "<RGB:0.596078431372549,0.9843137254901961,0.596078431372549> <LINE> <LINE>" .. getText("Tooltip_craft_Needs") .. " : <LINE>";
			local numLog = LGISBuildMenu.countMaterial(player, "Base.Log")
			if numLog < 4 then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.Log") .. " " .. numLog .. "/4 <LINE> ";
				if not ISBuildMenu.cheat then
					LogDoorFrameOption.onSelect = nil;
					LogDoorFrameOption.notAvailable = true;
				end
			else
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.Log") .. " 4 <LINE> ";
			end

			-- log wall require either 4 ripped sheet, 4 twine or 2 ropes
			local numRippedSheets = ISBuildMenu.countMaterial(player, "Base.RippedSheets") + ISBuildMenu.countMaterial(player, "Base.RippedSheetsDirty")
			local numTwine = ISBuildMenu.countMaterial(player, "Base.Twine")
			local numRope = ISBuildMenu.countMaterial(player, "Base.Rope")
			if numRippedSheets >= 6 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.RippedSheets") .. " 6 ";
			elseif numTwine >= 4 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.Twine") .. " 4 ";
			elseif numRope >= 2 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.Rope") .. " 2 ";
			else
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.RippedSheets") .. " " .. numRippedSheets .. "/6 <LINE> " .. getText("ContextMenu_or") .. " " .. getItemNameFromFullType("Base.Twine") .. " " .. numTwine .. "/4 <LINE> " .. getText("ContextMenu_or") .. " " .. getItemNameFromFullType("Base.Rope") .. " " .. numRope .. "/2 ";
				if not ISBuildMenu.cheat then
					LogDoorFrameOption.onSelect = nil;
					LogDoorFrameOption.notAvailable = true;
				end
			end
			if getSpecificPlayer(player):getPerkLevel(Perks.Woodwork) < 2 then
				tooltip.description = tooltip.description .. " <LINE> <RGB:1,0,0>" .. getText("IGUI_perks_Carpentry") .. " " .. getSpecificPlayer(player):getPerkLevel(Perks.Woodwork) .. "/2 <LINE>";
				LogDoorFrameOption.onSelect = nil;
				LogDoorFrameOption.notAvailable = true;
			else
				tooltip.description = tooltip.description .. " <LINE> <RGB:1,1,1>" .. getText("IGUI_perks_Carpentry") .. " " .. getSpecificPlayer(player):getPerkLevel(Perks.Woodwork) .. " <LINE>";
			end
			tooltip.description = tooltip.description .. " <LINE>" .. " <RGB:1,1,1>" .. getText("Tooltip_needknownrecipe") .. " " .. " <RGB:0,1,0>" .. getText("Tooltip_Make log door frame") .. getText("Tooltip_alreadyknownrecipe");
		end
	else
		if not ISBuildMenu.cheat then
			tooltip.description = tooltip.description .. " <LINE> <LINE>" .. " <RGB:1,1,1>" .. getText("Tooltip_needknownrecipe") .. " " .. " <RGB:1,0,0>" .. getText("Tooltip_Make log door frame");
			LogDoorFrameOption.onSelect = nil;
			LogDoorFrameOption.notAvailable = true;
		end
	end
	tooltip:setTexture(LogDoorFrameSprite.sprite);
    tooltip.description = " <RGB:1,1,0> " .. getText("Tooltip_craft_LogDoorFrameDesc") .. tooltip.description;
	LGISBuildMenu.requireHammer(LogDoorFrameOption)
	-------------------------------------------------------------------------------------------------------------------------------
	--Double Log Door

	local sprite = {};
	sprite.sprite = "fixtures_doors_lg_01_";

	local doorsOption2 = DoorsubMenu:addOption(getText("ContextMenu_Double_Log_Door"), worldobjects, LGISBuildMenu.onDoubleWoodenDoor, square, sprite, 24, player);
	local tooltip = LGISBuildMenu.canBuildDoor(0,0,0,0,nil,0, doorsOption2, player);
	tooltip:setName(getText("ContextMenu_Double_Log_Door"));
	--if not doorsOption2.notAvailable then
	local recipes = getSpecificPlayer(player):getKnownRecipes();
	if recipes:contains("Make double log door") then
		if not ISBuildMenu.cheat then
			tooltip.description = "<RGB:0.596078431372549,0.9843137254901961,0.596078431372549> <LINE> <LINE>" .. getText("Tooltip_craft_Needs") .. " : <LINE>";
			
			local numLog = LGISBuildMenu.countMaterial(player, "Base.Log")
			if numLog < 10 then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.Log") .. " " .. numLog .. "/10 <LINE> ";
				if not ISBuildMenu.cheat then
					doorsOption2.onSelect = nil;
					doorsOption2.notAvailable = true;
				end
			else
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.Log") .. " 10 <LINE> ";
			end
			local numHinge = LGISBuildMenu.countMaterial(player, "Base.Hinge")
			if numHinge < 8 then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.Hinge") .. " " .. numHinge .. "/8 <LINE> ";
				if not ISBuildMenu.cheat then
					doorsOption2.onSelect = nil;
					doorsOption2.notAvailable = true;
				end
			else
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.Hinge") .. " 8 <LINE> ";
			end

			-- log wall require either 4 ripped sheet, 4 twine or 2 ropes
			local numRippedSheets = ISBuildMenu.countMaterial(player, "Base.RippedSheets") + ISBuildMenu.countMaterial(player, "Base.RippedSheetsDirty")
			local numTwine = ISBuildMenu.countMaterial(player, "Base.Twine")
			local numRope = ISBuildMenu.countMaterial(player, "Base.Rope")
			if numRippedSheets >= 12 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.RippedSheets") .. " 12 ";
			elseif numTwine >= 8 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.Twine") .. " 8 ";
			elseif numRope >= 6 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.Rope") .. " 6 ";
			else
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.RippedSheets") .. " " .. numRippedSheets .. "/12 <LINE> " .. getText("ContextMenu_or") .. " " .. getItemNameFromFullType("Base.Twine") .. " " .. numTwine .. "/8 <LINE> " .. getText("ContextMenu_or") .. " " .. getItemNameFromFullType("Base.Rope") .. " " .. numRope .. "/6 ";
				if not ISBuildMenu.cheat then
					doorsOption2.onSelect = nil;
					doorsOption2.notAvailable = true;
				end
			end
			if getSpecificPlayer(player):getPerkLevel(Perks.Woodwork) < 6 then
				tooltip.description = tooltip.description .. " <LINE> <RGB:1,0,0>" .. getText("IGUI_perks_Carpentry") .. " " .. getSpecificPlayer(player):getPerkLevel(Perks.Woodwork) .. "/6 <LINE>";
				doorsOption2.onSelect = nil;
				doorsOption2.notAvailable = true;
			else
				tooltip.description = tooltip.description .. " <LINE> <RGB:1,1,1>" .. getText("IGUI_perks_Carpentry") .. " " .. getSpecificPlayer(player):getPerkLevel(Perks.Woodwork) .. " <LINE>";
			end
			tooltip.description = tooltip.description .. " <LINE>" .. " <RGB:1,1,1>" .. getText("Tooltip_needknownrecipe") .. " " .. " <RGB:0,1,0>" .. getText("Tooltip_Make double log door") .. getText("Tooltip_alreadyknownrecipe");
		end
	else
		if not ISBuildMenu.cheat then
			tooltip.description = tooltip.description .. " <LINE> <LINE>" .. " <RGB:1,1,1>" .. getText("Tooltip_needknownrecipe") .. " " .. " <RGB:1,0,0>" .. getText("Tooltip_Make double log door");
			doorsOption2.onSelect = nil;
			doorsOption2.notAvailable = true;
		end
	end
	tooltip:setTexture(sprite.sprite .. "19");
    tooltip.description = " <RGB:1,1,0> " .. getText("Tooltip_craft_DDoorLogDesc") .. tooltip.description;
	LGISBuildMenu.requireHammer(doorsOption2)
	
	----------------------------------------------Reinforcement--------------------------------------------------------------------
	
	--Simple Log Reinforcement
	SRSprite = LGISBuildMenu.getReinforcementSprites(player);
	SROption = RsubMenu:addOption(getText("ContextMenu_SLog_Reinforcement"), worldobjects, LGISBuildMenu.onReinforcementSimple, square, SRSprite, player);
	tooltip = LGISBuildMenu.canBuildDoor(0,0,0,0,nil,0, SROption, player);
	tooltip:setName(getText("ContextMenu_SLog_Reinforcement"));
	--if not doorsOption2.notAvailable then
	--local recipes = getSpecificPlayer(player):getKnownRecipes();
	if recipes:contains("Make log reinforcements") then
		if not ISBuildMenu.cheat then
			tooltip.description = "<RGB:0.596078431372549,0.9843137254901961,0.596078431372549> <LINE> <LINE>" .. getText("Tooltip_craft_Needs") .. " : <LINE>";
			local numLog = LGISBuildMenu.countMaterial(player, "Base.Log")
			if numLog < 3 then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.Log") .. " " .. numLog .. "/3 <LINE> ";
				if not ISBuildMenu.cheat then
					SROption.onSelect = nil;
					SROption.notAvailable = true;
				end
			else
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.Log") .. " 3 <LINE> ";
			end
			local numMScrap = LGISBuildMenu.countMaterial(player, "Base.ScrapMetal")
			if numMScrap < 3 then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.ScrapMetal") .. " " .. numMScrap .. "/3 <LINE> ";
				if not ISBuildMenu.cheat then
					SROption.onSelect = nil;
					SROption.notAvailable = true;
				end
			else
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.ScrapMetal") .. " 3 <LINE> ";
			end

			-- log wall require either 4 ripped sheet, 4 twine or 2 ropes
			local numRippedSheets = ISBuildMenu.countMaterial(player, "Base.RippedSheets") + ISBuildMenu.countMaterial(player, "Base.RippedSheetsDirty")
			local numTwine = ISBuildMenu.countMaterial(player, "Base.Twine")
			local numRope = ISBuildMenu.countMaterial(player, "Base.Rope")
			if numRippedSheets >= 10 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.RippedSheets") .. " 10 ";
			elseif numTwine >= 6 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.Twine") .. " 6 ";
			elseif numRope >= 4 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.Rope") .. " 4 ";
			else
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.RippedSheets") .. " " .. numRippedSheets .. "/10 <LINE> " .. getText("ContextMenu_or") .. " " .. getItemNameFromFullType("Base.Twine") .. " " .. numTwine .. "/6 <LINE> " .. getText("ContextMenu_or") .. " " .. getItemNameFromFullType("Base.Rope") .. " " .. numRope .. "/4 ";
				if not ISBuildMenu.cheat then
					SROption.onSelect = nil;
					SROption.notAvailable = true;
				end
			end
			if getSpecificPlayer(player):getPerkLevel(Perks.Woodwork) < 4 then
				tooltip.description = tooltip.description .. " <LINE> <RGB:1,0,0>" .. getText("IGUI_perks_Carpentry") .. " " .. getSpecificPlayer(player):getPerkLevel(Perks.Woodwork) .. "/4 <LINE>";
				SROption.onSelect = nil;
				SROption.notAvailable = true;
			else
				tooltip.description = tooltip.description .. " <LINE> <RGB:1,1,1>" .. getText("IGUI_perks_Carpentry") .. " " .. getSpecificPlayer(player):getPerkLevel(Perks.Woodwork) .. " <LINE>";
			end
			tooltip.description = tooltip.description .. " <LINE>" .. " <RGB:1,1,1>" .. getText("Tooltip_needknownrecipe") .. " " .. " <RGB:0,1,0>" .. getText("Tooltip_Make log door frame") .. getText("Tooltip_alreadyknownrecipe");
		end
	else
		if not ISBuildMenu.cheat then
			tooltip.description = tooltip.description .. " <LINE> <LINE>" .. " <RGB:1,1,1>" .. getText("Tooltip_needknownrecipe") .. " " .. " <RGB:1,0,0>" .. getText("Tooltip_Make log reinforcements");
			SROption.onSelect = nil;
			SROption.notAvailable = true;
		end
	end
	tooltip:setTexture(SRSprite.sprite);
    tooltip.description = " <RGB:1,1,0> " .. getText("Tooltip_craft_SReinforcementDesc") .. tooltip.description;
	LGISBuildMenu.requireHammer(SROption)

	--Corner Log Reinforcement
	CRSprite = LGISBuildMenu.getCReinforcementSprites(player);
	CROption = RsubMenu:addOption(getText("ContextMenu_CLog_Reinforcement"), worldobjects, LGISBuildMenu.onReinforcementCorners, square, CRSprite, player);
	tooltip = LGISBuildMenu.canBuildDoor(0,0,0,0,nil,0, CROption, player);
	tooltip:setName(getText("ContextMenu_CLog_Reinforcement"));
	--if not doorsOption2.notAvailable then
	--local recipes = getSpecificPlayer(player):getKnownRecipes();
	if recipes:contains("Make log reinforcements") then
		if not ISBuildMenu.cheat then
			tooltip.description = "<RGB:0.596078431372549,0.9843137254901961,0.596078431372549> <LINE> <LINE>" .. getText("Tooltip_craft_Needs") .. " : <LINE>";
			local numLog = LGISBuildMenu.countMaterial(player, "Base.Log")
			if numLog < 6 then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.Log") .. " " .. numLog .. "/6 <LINE> ";
				if not ISBuildMenu.cheat then
					CROption.onSelect = nil;
					CROption.notAvailable = true;
				end
			else
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.Log") .. " 6 <LINE> ";
			end
			local numMScrap = LGISBuildMenu.countMaterial(player, "Base.ScrapMetal")
			if numMScrap < 6 then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.ScrapMetal") .. " " .. numMScrap .. "/6 <LINE> ";
				if not ISBuildMenu.cheat then
					CROption.onSelect = nil;
					CROption.notAvailable = true;
				end
			else
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.ScrapMetal") .. " 6 <LINE> ";
			end

			-- log wall require either 4 ripped sheet, 4 twine or 2 ropes
			local numRippedSheets = ISBuildMenu.countMaterial(player, "Base.RippedSheets") + ISBuildMenu.countMaterial(player, "Base.RippedSheetsDirty")
			local numTwine = ISBuildMenu.countMaterial(player, "Base.Twine")
			local numRope = ISBuildMenu.countMaterial(player, "Base.Rope")
			if numRippedSheets >= 20 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.RippedSheets") .. " 20 ";
			elseif numTwine >= 12 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.Twine") .. " 12 ";
			elseif numRope >= 8 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.Rope") .. " 8 ";
			else
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.RippedSheets") .. " " .. numRippedSheets .. "/20 <LINE> " .. getText("ContextMenu_or") .. " " .. getItemNameFromFullType("Base.Twine") .. " " .. numTwine .. "/12 <LINE> " .. getText("ContextMenu_or") .. " " .. getItemNameFromFullType("Base.Rope") .. " " .. numRope .. "/8 ";
				if not ISBuildMenu.cheat then
					CROption.onSelect = nil;
					CROption.notAvailable = true;
				end
			end
			if getSpecificPlayer(player):getPerkLevel(Perks.Woodwork) < 4 then
				tooltip.description = tooltip.description .. " <LINE> <RGB:1,0,0>" .. getText("IGUI_perks_Carpentry") .. " " .. getSpecificPlayer(player):getPerkLevel(Perks.Woodwork) .. "/4 <LINE>";
				CROption.onSelect = nil;
				CROption.notAvailable = true;
			else
				tooltip.description = tooltip.description .. " <LINE> <RGB:1,1,1>" .. getText("IGUI_perks_Carpentry") .. " " .. getSpecificPlayer(player):getPerkLevel(Perks.Woodwork) .. " <LINE>";
			end
			tooltip.description = tooltip.description .. " <LINE>" .. " <RGB:1,1,1>" .. getText("Tooltip_needknownrecipe") .. " " .. " <RGB:0,1,0>" .. getText("Tooltip_Make log door frame") .. getText("Tooltip_alreadyknownrecipe");
		end
	else
		if not ISBuildMenu.cheat then
			tooltip.description = tooltip.description .. " <LINE> <LINE>" .. " <RGB:1,1,1>" .. getText("Tooltip_needknownrecipe") .. " " .. " <RGB:1,0,0>" .. getText("Tooltip_Make log reinforcements");
			CROption.onSelect = nil;
			CROption.notAvailable = true;
		end
	end
	tooltip:setTexture(CRSprite.sprite);
    tooltip.description = " <RGB:1,1,0> " .. getText("Tooltip_craft_CReinforcementDesc") .. tooltip.description;
	LGISBuildMenu.requireHammer(CROption)
	
	if ZAWISBuildMenu then
		ZAWISBuildMenu.doorsMenuBuilder(DoorsubMenu, player, context, worldobjects);
		-------------------------------------------------------------------------------------------------------------------------------
		--New Metal Frame
		_name = getText("ContextMenu_AdvancedMetalWallFrame");
		NewMetalFrameSprite = LGISBuildMenu.getNewMetalFrameSprites(player);
		NewMetalFrameOption = FramesubMenu:addOption(_name, worldobjects, LGISBuildMenu.onBuildNewMetalFrame, square, NewMetalFrameSprite, player);
		tooltip = LGISBuildMenu.canBuildMetalWallFrame("Advanced metal frames",0,0,0,0,10,4,1,8,2, NewMetalFrameOption, player);
		tooltip:setName(_name);
		tooltip.description = "<RGB:1,1,0>" .. getText("Tooltip_craft_AdvancedMetalWallFramedesc") .. tooltip.description;
		tooltip:setTexture(NewMetalFrameSprite.sprite);
		LGISBuildMenu.requireHammer(NewMetalFrameOption);
		
		-------------------------------------------------------------------------------------------------------------------------------
		--New Metal Window Frame
		_name = getText("ContextMenu_AdvancedMetalWindowFrame");
		NewMetalWindowFrameSprite = LGISBuildMenu.getNewMetalWindowFrameSprites(player);
		NewMetalWindowFrameOption = FramesubMenu:addOption(_name, worldobjects, LGISBuildMenu.onBuildNewMetalWindowFrame, square, NewMetalWindowFrameSprite, player);
		tooltip = LGISBuildMenu.canBuildMetalWallFrame("Advanced metal frames",0,0,0,0,10,8,0,8,2, NewMetalWindowFrameOption, player);
		tooltip:setName(_name);
		tooltip.description = "<RGB:1,1,0>" .. getText("Tooltip_craft_AdvancedMetalWindowFramedesc") .. tooltip.description;
		tooltip:setTexture(NewMetalWindowFrameSprite.sprite);
		LGISBuildMenu.requireHammer(NewMetalWindowFrameOption);
		
		-------------------------------------------------------------------------------------------------------------------------------
		--New Metal Door Frame
		_name = getText("ContextMenu_AdvancedMetalDoorFrame");
		NewMetalDoorFrameSprite = LGISBuildMenu.getNewMetalDoorFrameSprites(player);
		NewMetalDoorFrameOption = FramesubMenu:addOption(_name, worldobjects, LGISBuildMenu.onBuildNewMetalDoorFrame, square, NewMetalDoorFrameSprite, player);
		tooltip = LGISBuildMenu.canBuildMetalWallFrame("Advanced metal frames",0,0,0,0,10,5,0,8,2, NewMetalDoorFrameOption, player);
		tooltip:setName(_name);
		tooltip.description = "<RGB:1,1,0>" .. getText("Tooltip_craft_AdvancedMetalDoorFramedesc") .. tooltip.description;
		tooltip:setTexture(NewMetalDoorFrameSprite.sprite);
		LGISBuildMenu.requireHammer(NewMetalDoorFrameOption);
	end

end

function LGISBuildMenu.haveSomethingtoBuild(player)
--~ 	return true;
	return haveSomethingtoBuildTrophy(player);
end

function haveSomethingtoBuildTrophy(player)
	LGISBuildMenu.materialOnGround = buildUtil.checkMaterialOnGround(getSpecificPlayer(player):getCurrentSquare())
	if ISBuildMenu.cheat then
		return true;
	end
	local playerObj = getSpecificPlayer(player)
	local playerInv = playerObj:getInventory()
	LGISBuildMenu.planks = 0;
	LGISBuildMenu.nails = 0;
	LGISBuildMenu.deerhead = 0;
	LGISBuildMenu.cowhead = 0;
	LGISBuildMenu.bearhead = 0;
	LGISBuildMenu.boarhead = 0;
	LGISBuildMenu.bisonhead = 0;
	LGISBuildMenu.moosehead = 0;
	LGISBuildMenu.logs = 0;
	LGISBuildMenu.tbranch = 0;
	LGISBuildMenu.sheetrope = 0;
	LGISBuildMenu.rope = 0;
	LGISBuildMenu.cane = 0;
	LGISBuildMenu.doorknob = 0;
	LGISBuildMenu.hinge = 0;
	LGISBuildMenu.sheetmetal = 0;
	LGISBuildMenu.smallsheetmetal = 0;
	LGISBuildMenu.screws = 0;
	LGISBuildMenu.metalpipe = 0;
	LGISBuildMenu.wire = 0;
	LGISBuildMenu.diana = 0;
	LGISBuildMenu.alfalfa = 0;
	LGISBuildMenu.hasHammer = playerInv:containsTypeEvalRecurse("BallPeenHammer", predicateNotBroken) or playerInv:containsTypeEvalRecurse("Hammer", predicateNotBroken) or playerInv:containsTypeEvalRecurse("HammerStone", predicateNotBroken)
	if LGISBuildMenu.hasHammer then
		-- most objects require a hammer
	else
		return false
	end
	LGISBuildMenu.planks = LGISBuildMenu.countMaterial(player, "Base.Plank")
	LGISBuildMenu.nails = LGISBuildMenu.countMaterial(player, "Base.Nails")
	LGISBuildMenu.deerhead = LGISBuildMenu.countMaterial(player, "Base.DeerHead")
	LGISBuildMenu.cowhead = LGISBuildMenu.countMaterial(player, "Base.CowHead")
	LGISBuildMenu.bearhead = LGISBuildMenu.countMaterial(player, "Base.BearHead")
	LGISBuildMenu.boarhead = LGISBuildMenu.countMaterial(player, "Base.BoarHead")
	LGISBuildMenu.bisonhead = LGISBuildMenu.countMaterial(player, "Base.BisonHead")
	LGISBuildMenu.moosehead = LGISBuildMenu.countMaterial(player, "Base.MooseHead")
	LGISBuildMenu.logs = LGISBuildMenu.countMaterial(player, "Base.Log")
	LGISBuildMenu.tbranch = LGISBuildMenu.countMaterial(player, "Base.TreeBranch")
	LGISBuildMenu.sheetrope = LGISBuildMenu.countMaterial(player, "Base.SheetRope")
	LGISBuildMenu.rope = LGISBuildMenu.countMaterial(player, "Base.Rope")
	LGISBuildMenu.cane = LGISBuildMenu.countMaterial(player, "Base.SugarcaneDry")
	LGISBuildMenu.doorknob = LGISBuildMenu.countMaterial(player, "Base.Doorknob")
	LGISBuildMenu.hinge = LGISBuildMenu.countMaterial(player, "Base.Hinge")
	LGISBuildMenu.sheetmetal = LGISBuildMenu.countMaterial(player, "Base.SheetMetal")
	LGISBuildMenu.smallsheetmetal = LGISBuildMenu.countMaterial(player, "Base.SmallSheetMetal")
	LGISBuildMenu.screws = LGISBuildMenu.countMaterial(player, "Base.Screws")
	LGISBuildMenu.metalpipe = LGISBuildMenu.countMaterial(player, "Base.MetalPipe")
	LGISBuildMenu.wire = LGISBuildMenu.countMaterial(player, "Base.Wire")
	LGISBuildMenu.diana = LGISBuildMenu.countMaterial(player, "Base.Mov_WallDiana")
	LGISBuildMenu.alfalfa = LGISBuildMenu.countMaterial(player, "Base.Alfalfa")
	return true;
end

-- **********************************************
-- **              *FURNITURE*                 **
-- **********************************************

LGISBuildMenu.onBuildDeerTrophy = function(worldobjects, square, sprite, player)
	local _deerhead = ISSimpleFurniture:new("Deer Trophy", sprite.sprite, sprite.northSprite);

	_deerhead.needToBeAgainstWall = true;
    _deerhead.blockAllTheSquare = false;
    --_deerhead.renderFloorHelper = true;
	_deerhead.canPassThrough = true;
	--_deerhead.canBarricade = false;
	--_deerhead.canBeAlwaysPlaced = false;
	_deerhead.player = player;
	_deerhead.name = "Deer Trophy";

	-- Snake: Materials required to build the object.  These might get returned on destruction.
	_deerhead.modData["xp:Woodwork"] = 3;
	_deerhead.modData["need:Base.Plank"] = "3";
	_deerhead.modData["need:Base.Nails"] = "20";
    _deerhead.modData["need:Base.DeerHead"] = "1";

	function _deerhead:getHealth()
		return LGISBuildMenu.healthLevel.wallDecoration;
	end

	getCell():setDrag(_deerhead, player);
end

LGISBuildMenu.onBuildCowTrophy = function(worldobjects, square, sprite, player)
	local _cowhead = ISSimpleFurniture:new("Cow Trophy", sprite.sprite, sprite.northSprite);

	_cowhead.needToBeAgainstWall = true;
    _cowhead.blockAllTheSquare = false;
    --_cowhead.renderFloorHelper = true;
	_cowhead.canPassThrough = true;
	--_cowhead.canBarricade = false;
	--_cowhead.canBeAlwaysPlaced = false;
	_cowhead.player = player;
	_cowhead.name = "Cow Trophy";

	-- Snake: Materials required to build the object.  These might get returned on destruction.
	_cowhead.modData["xp:Woodwork"] = 3;
	_cowhead.modData["need:Base.Plank"] = "3";
	_cowhead.modData["need:Base.Nails"] = "20";
    _cowhead.modData["need:Base.CowHead"] = "1";

	function _cowhead:getHealth()
		return LGISBuildMenu.healthLevel.wallDecoration;
	end

	getCell():setDrag(_cowhead, player);
end

LGISBuildMenu.onBuildBearTrophy = function(worldobjects, square, sprite, player)
	local _bearhead = ISSimpleFurniture:new("Bear Trophy", sprite.sprite, sprite.northSprite);

	_bearhead.needToBeAgainstWall = true;
    _bearhead.blockAllTheSquare = false;
    --_bearhead.renderFloorHelper = true;
	_bearhead.canPassThrough = true;
	--_bearhead.canBarricade = false;
	--_bearhead.canBeAlwaysPlaced = false;
	_bearhead.player = player;
	_bearhead.name = "Bear Trophy";

	-- Snake: Materials required to build the object.  These might get returned on destruction.
	_bearhead.modData["xp:Woodwork"] = 3;
	_bearhead.modData["need:Base.Plank"] = "3";
	_bearhead.modData["need:Base.Nails"] = "20";
    _bearhead.modData["need:Base.BearHead"] = "1";

	function _bearhead:getHealth()
		return LGISBuildMenu.healthLevel.wallDecoration;
	end

	getCell():setDrag(_bearhead, player);
end

LGISBuildMenu.onBuildBoarTrophy = function(worldobjects, square, sprite, player)
	local _boarhead = ISSimpleFurniture:new("Boar Trophy", sprite.sprite, sprite.northSprite);

	_boarhead.needToBeAgainstWall = true;
    _boarhead.blockAllTheSquare = false;
    --_boarhead.renderFloorHelper = true;
	_boarhead.canPassThrough = true;
	--_boarhead.canBarricade = false;
	--_boarhead.canBeAlwaysPlaced = false;
	_boarhead.player = player;
	_boarhead.name = "Boar Trophy";

	-- Snake: Materials required to build the object.  These might get returned on destruction.
	_boarhead.modData["xp:Woodwork"] = 3;
	_boarhead.modData["need:Base.Plank"] = "3";
	_boarhead.modData["need:Base.Nails"] = "20";
    _boarhead.modData["need:Base.BoarHead"] = "1";

	function _boarhead:getHealth()
		return LGISBuildMenu.healthLevel.wallDecoration;
	end

	getCell():setDrag(_boarhead, player);
end

LGISBuildMenu.onBuildBisonTrophy = function(worldobjects, square, sprite, player)
	local _bisonhead = ISSimpleFurniture:new("Bison Trophy", sprite.sprite, sprite.northSprite);

	_bisonhead.needToBeAgainstWall = true;
    _bisonhead.blockAllTheSquare = false;
    --_bisonhead.renderFloorHelper = true;
	_bisonhead.canPassThrough = true;
	--_bisonhead.canBarricade = false;
	--_bisonhead.canBeAlwaysPlaced = false;
	_bisonhead.player = player;
	_bisonhead.name = "Bison Trophy";

	-- Snake: Materials required to build the object.  These might get returned on destruction.
	_bisonhead.modData["xp:Woodwork"] = 3;
	_bisonhead.modData["need:Base.Plank"] = "3";
	_bisonhead.modData["need:Base.Nails"] = "20";
    _bisonhead.modData["need:Base.BisonHead"] = "1";

	function _bisonhead:getHealth()
		return LGISBuildMenu.healthLevel.wallDecoration;
	end

	getCell():setDrag(_bisonhead, player);
end

LGISBuildMenu.onBuildMooseTrophy = function(worldobjects, square, sprite, player)
	local _moosehead = ISSimpleFurniture:new("Moose Trophy", sprite.sprite, sprite.northSprite);

    _moosehead.needToBeAgainstWall = true;
    _moosehead.blockAllTheSquare = false;
	_moosehead.canPassThrough = true;
	_moosehead.player = player;
	_moosehead.name = "Moose Trophy";

	-- Snake: Materials required to build the object.  These might get returned on destruction.
	_moosehead.modData["xp:Woodwork"] = 3;
	_moosehead.modData["need:Base.Plank"] = "3";
	_moosehead.modData["need:Base.Nails"] = "20";
    _moosehead.modData["need:Base.MooseHead"] = "1";

	function _moosehead:getHealth()
		return LGISBuildMenu.healthLevel.wallDecoration;
	end

	getCell():setDrag(_moosehead, player);
end

LGISBuildMenu.onBuildCheeseTable = function(worldobjects, square, sprite, player)
	local _cheesetable = ISSimpleFurniture3:new("Cheese Table", sprite.sprite, sprite.northSprite);
	_cheesetable.canBeAlwaysPlaced = false;
	_cheesetable.isContainer = true;
	_cheesetable.containerType = "cheese_table";
	_cheesetable.isThumpable = true;
	_cheesetable:setEastSprite(sprite.eastSprite);
    _cheesetable:setSouthSprite(sprite.southSprite);
	_cheesetable.player = player;

	-- Snake: Materials required to build the object.  These might get returned on destruction.
	_cheesetable.modData["xp:Woodwork"] = 10;
	_cheesetable.modData["need:Base.Plank"] = "14";
	_cheesetable.modData["need:Base.Nails"] = "25";

	getCell():setDrag(_cheesetable, player);
end

LGISBuildMenu.onBuildHuntingDiana = function(worldobjects, square, sprite, player)
	local _walldiana = ISSimpleFurniture3:new("Wall Diana", sprite.sprite, sprite.northSprite);

	_walldiana.canBeAlwaysPlaced = false;
	_walldiana.isThumpable = true;
	_walldiana:setEastSprite(sprite.eastSprite);
    _walldiana:setSouthSprite(sprite.southSprite);
	_walldiana.player = player;
	_walldiana.name = "Wall Diana";

	-- Snake: Materials required to build the object.  These might get returned on destruction.
	_walldiana.modData["xp:Woodwork"] = 3;
	_walldiana.modData["need:Base.Plank"] = "6";
	_walldiana.modData["need:Base.Nails"] = "10";
    _walldiana.modData["need:Base.Mov_WallDiana"] = "1";
	_walldiana.modData["need:Base.Alfalfa"] = "1";

	function _walldiana:getHealth()
		return LGISBuildMenu.healthLevel.wallDecoration;
	end

	getCell():setDrag(_walldiana, player);
end

LGISBuildMenu.onBuildFurFrame = function(worldobjects, square, sprite, player)
	local _furframe = ISSimpleFurniture3:new("Wood Fur Frame", sprite.sprite, sprite.northSprite);

	_furframe.isContainer = true;
	_furframe.canBeAlwaysPlaced = false;
	_furframe.containerType = "furframe";
	_furframe:setEastSprite(sprite.eastSprite);
    _furframe:setSouthSprite(sprite.southSprite);
	_furframe.player = player;

	-- Snake: Materials required to build the object.  These might get returned on destruction.
	_furframe.modData["xp:Woodwork"] = 5;
	_furframe.modData["need:Base.TreeBranch"] = "9";
	_furframe.modData["need:Base.SheetRope"] = "8";
	_furframe.modData["need:Base.Rope"] = "8";

	function _furframe:getHealth()
		return LGISBuildMenu.healthLevel.furframe;
	end

	getCell():setDrag(_furframe, player);
end

LGISBuildMenu.onBuildDryCaneSupport = function(worldobjects, square, sprite, player)
	local _support = ISSimpleFurniture2:new("Wood Cane Support", sprite.sprite, sprite.northSprite);

	_support.isContainer = true;
	_support.isCanesupport = true;
	_support.containerType = "cane_support";
	_support:setEastSprite(sprite.eastSprite);
    _support:setSouthSprite(sprite.southSprite);
	_support.player = player;

	-- Snake: Materials required to build the object.  These might get returned on destruction.
	_support.modData["xp:Woodwork"] = 5;
	_support.modData["need:Base.Log"] = "1";
	_support.modData["need:Base.SheetRope"] = "8";

	function _support:getHealth()
		return LGISBuildMenu.healthLevel.drylog;
	end

	getCell():setDrag(_support, player);
end

LGISBuildMenu.onBuildNewWoodenFrame = function(worldobjects, square, sprite, player)
-- sprite, northSprite, corner
    local wall = ISWoodenWall:new(sprite.sprite, sprite.northSprite, sprite.corner);
    wall.canBarricade = false
    wall.name = "NewWoodenWallFrame";
    -- set up the required material
    wall.modData["xp:Woodwork"] = 5;
    wall.modData["need:Base.Plank"] = "4";
    wall.modData["need:Base.Nails"] = "4";
    wall.health = 70;
    wall.player = player;
    getCell():setDrag(wall, player);
end

LGISBuildMenu.onBuildNewDoor = function(worldobjects, square, sprite, player)
	-- sprite, northsprite, openSprite, openNorthSprite
	local door = ISWoodenDoor:new(sprite.sprite, sprite.northSprite, sprite.openSprite, sprite.openNorthSprite);
    door.modData["xp:Woodwork"] = 3;
	door.modData["need:Base.SugarcaneDry"] = "5";
	door.modData["need:Base.Nails"] = "10";
	door.modData["need:Base.Hinge"] = "2";
	door.modData["need:Base.Doorknob"] = "1";
	door.player = player
	getCell():setDrag(door, player);
end

LGISBuildMenu.onBuildCaneFenceDoor = function(worldobjects, square, sprite, player)
	-- sprite, northsprite, openSprite, openNorthSprite
	local door = ISWoodenDoor:new(sprite.sprite, sprite.northSprite, sprite.openSprite, sprite.openNorthSprite);
    door.modData["xp:Woodwork"] = 3;
	door.modData["need:Base.SugarcaneDry"] = "3";
	door.modData["need:Base.Nails"] = "4";
	door.modData["need:Base.Hinge"] = "2";
	door.modData["need:Base.Doorknob"] = "1";
	door.player = player
	getCell():setDrag(door, player);
end

LGISBuildMenu.onBuildNewDoorFrame = function(worldobjects, square, sprite, player)
	-- sprite, northSprite, corner
	local doorFrame = ISWoodenDoorFrame:new(sprite.sprite, sprite.northSprite, sprite.corner)
    doorFrame.modData["xp:Woodwork"] = 5;
    doorFrame.modData["wallType"] = "doorframe";
	doorFrame.modData["need:Base.Plank"] = "4";
	doorFrame.modData["need:Base.Nails"] = "4";
	doorFrame.player = player
	doorFrame.name = "AdvancedDoorFrame";
	getCell():setDrag(doorFrame, player);
end

LGISBuildMenu.onBuildNewMetalDoorFrame = function(worldobjects, square, sprite, player)
	-- sprite, northSprite, corner
	local doorFrame = ISWoodenDoorFrame:new(sprite.sprite, sprite.northSprite, sprite.corner)
    doorFrame.modData["xp:Woodwork"] = 5;
    doorFrame.modData["wallType"] = "doorframe";
	doorFrame.modData["need:Base.Screws"] = "10";
	doorFrame.modData["need:Base.MetalPipe"] = "5";
	doorFrame.player = player
	doorFrame.name = "AdvancedMetalDoorFrame";
	getCell():setDrag(doorFrame, player);
end

LGISBuildMenu.onBuildFenceDoorFrame = function(worldobjects, square, sprite, player)
	-- sprite, northSprite, corner
	local doorFrame = ISWoodenDoorFrame:new(sprite.sprite, sprite.northSprite, sprite.corner)
    doorFrame.modData["xp:Woodwork"] = 5;
    doorFrame.modData["wallType"] = "doorframe";
	doorFrame.modData["need:Base.Plank"] = "2";
	doorFrame.modData["need:Base.Nails"] = "4";
	doorFrame.player = player
	doorFrame.name = "FenceDoorFrame";
	getCell():setDrag(doorFrame, player);
end

LGISBuildMenu.onBuildLogDoorFrame = function(worldobjects, square, sprite, player)
	-- sprite, northSprite, corner
	local doorFrame = ISWoodenDoorFrame:new(sprite.sprite, sprite.northSprite, sprite.corner)
    doorFrame.modData["xp:Woodwork"] = 5;
    doorFrame.modData["wallType"] = "doorframe";
    doorFrame.modData["need:Base.Log"] = "4";
	local sheets = LGISBuildMenu.countMaterial(player, "Base.RippedSheets");
	local sheetsDirty = LGISBuildMenu.countMaterial(player, "Base.RippedSheetsDirty");
	if sheets > 6 then sheets = 6; sheetsDirty = 0 end
	if sheetsDirty > 6 then sheetsDirty = 6; sheets = 0 end
	if sheets < 6 and sheetsDirty > 0 then sheetsDirty = 6 - sheets; end
    if sheets + sheetsDirty >= 6 then
		if sheets > 0 then doorFrame.modData["need:Base.RippedSheets"] = tostring(sheets); end
		if sheetsDirty > 0 then doorFrame.modData["need:Base.RippedSheetsDirty"] = tostring(sheetsDirty); end
    elseif LGISBuildMenu.countMaterial(player, "Base.Twine") >= 4 then
        doorFrame.modData["need:Base.Twine"] = "4";
    elseif LGISBuildMenu.countMaterial(player, "Base.Rope") >= 2 then
        doorFrame.modData["need:Base.Rope"] = "2";
    end
	doorFrame.player = player
	doorFrame.name = "LogDoorFrame";
	getCell():setDrag(doorFrame, player);
end

LGISBuildMenu.onBuildNewWindowFrame = function(worldobjects, square, sprite, player)
	-- sprite, northSprite, corner
	local frame = ISWoodenWall:new(sprite.sprite, sprite.northSprite, sprite.corner);
	frame.hoppable = true;
	frame.isThumpable = false;
	frame.canBarricade = false;
	-- set up the required material
    frame.modData["xp:Woodwork"] = 5;
    frame.modData["wallType"] = "windowsframe";
	frame.modData["need:Base.Plank"] = "4";
	frame.modData["need:Base.Nails"] = "4";
	frame.player = player
	frame.name = "AdvancedWindowFrame"
	getCell():setDrag(frame, player);
end

LGISBuildMenu.onBuildNewFenceFrame = function(worldobjects, square, sprite, player)
	-- sprite, northSprite, corner
	local fence = ISWoodenWall:new(sprite.sprite, sprite.northSprite, sprite.corner);
	-- you can hopp a fence
	fence.hoppable = true;
	fence.isThumpable = false;
    fence.canBarricade = false
    fence.modData["xp:Woodwork"] = 5;
	fence.modData["need:Base.Plank"] = "4";
	fence.modData["need:Base.Nails"] = "4";
	fence.player = player
	fence.name = "AdvancedFenceFrame"
	getCell():setDrag(fence, player);
end

LGISBuildMenu.onBuildCanePillar = function(worldobjects, player)
	local wall = ISWoodenWall:new("walls_exterior_legourmet_01_2", "walls_exterior_legourmet_01_2", nil);
	wall.modData["need:Base.SugarcaneDry"] = "1";
	wall.modData["need:Base.Nails"] = "4";
    wall.modData["xp:Woodwork"] = 3;
	wall.modData["wallType"] = "pillar";
	wall.canBePlastered = false;
	wall.canPassThrough = true;
	wall.canBarricade = false
    wall.player = player;
    wall.name = "Cane Pillar"
	getCell():setDrag(wall, player);
end

LGISBuildMenu.onBuildNewMetalFrame = function(worldobjects, square, sprite, player)
-- sprite, northSprite, corner
    local wall = ISWoodenWall:new(sprite.sprite, sprite.northSprite, sprite.corner);
    wall.canBarricade = false
    wall.name = "NewMetalWallFrame";
    -- set up the required material
    wall.modData["xp:Woodwork"] = 8;
    wall.modData["need:Base.Screws"] = "10";
    wall.modData["need:Base.MetalPipe"] = "4";
	wall.modData["use:Base.Wire"] = "1";
    wall.health = 200;
    wall.player = player;
    getCell():setDrag(wall, player);
end

LGISBuildMenu.onBuildNewMetalWindowFrame = function(worldobjects, square, sprite, player)
	-- sprite, northSprite, corner
	local frame = ISWoodenWall:new(sprite.sprite, sprite.northSprite, sprite.corner);
	frame.hoppable = true;
	frame.isThumpable = false;
	frame.canBarricade = false;
	-- set up the required material
    frame.modData["xp:Woodwork"] = 5;
    frame.modData["wallType"] = "windowsframe";
	frame.modData["need:Base.Screws"] = "10";
	frame.modData["need:Base.MetalPipe"] = "8";
	frame.player = player
	frame.name = "AdvancedMetalWindowFrame"
	getCell():setDrag(frame, player);
end

LGISBuildMenu.onDoubleWoodenDoor = function(worldobjects, square, sprite, spriteIndex, player)
	local door = ISDoubleDoor:new(sprite.sprite, spriteIndex);
    door.modData["need:Base.Log"] = "10";
	door.modData["need:Base.Hinge"] = "8";
	local sheets = LGISBuildMenu.countMaterial(player, "Base.RippedSheets");
	local sheetsDirty = LGISBuildMenu.countMaterial(player, "Base.RippedSheetsDirty");
	if sheets > 12 then sheets = 12; sheetsDirty = 0 end
	if sheetsDirty > 12 then sheetsDirty = 12; sheets = 0 end
	if sheets < 12 and sheetsDirty > 0 then sheetsDirty = 12 - sheets; end
    if sheets + sheetsDirty >= 12 then
		if sheets > 0 then door.modData["need:Base.RippedSheets"] = tostring(sheets); end
		if sheetsDirty > 0 then door.modData["need:Base.RippedSheetsDirty"] = tostring(sheetsDirty); end
    elseif LGISBuildMenu.countMaterial(player, "Base.Twine") >= 8 then
        door.modData["need:Base.Twine"] = "8";
    elseif LGISBuildMenu.countMaterial(player, "Base.Rope") >= 6 then
        door.modData["need:Base.Rope"] = "6";
    end
	door.modData["xp:Woodwork"] = 6;
	door.player = player
	getCell():setDrag(door, player);
end

LGISBuildMenu.onReinforcementSimple = function(worldobjects, square, sprite, player)
-- name, sprite, northSprite
    local furniture = ISSimpleFurniture2:new("Reinforcement Logs", sprite.sprite, sprite.northSprite);
    furniture.isContainer = true;
	furniture.needToBeAgainstWall = true;
	furniture.blockAllTheSquare = true;
	furniture.isWallLike = true;
    furniture.containerType = "reinforcement_logs";
    furniture.modData["need:Base.Log"] = "3";
	furniture.modData["need:Base.ScrapMetal"] = "3";
	local sheets = LGISBuildMenu.countMaterial(player, "Base.RippedSheets");
	local sheetsDirty = LGISBuildMenu.countMaterial(player, "Base.RippedSheetsDirty");
	if sheets > 10 then sheets = 10; sheetsDirty = 0 end
	if sheetsDirty > 10 then sheetsDirty = 10; sheets = 0 end
	if sheets < 10 and sheetsDirty > 0 then sheetsDirty = 10 - sheets; end
    if sheets + sheetsDirty >= 10 then
		if sheets > 0 then furniture.modData["need:Base.RippedSheets"] = tostring(sheets); end
		if sheetsDirty > 0 then furniture.modData["need:Base.RippedSheetsDirty"] = tostring(sheetsDirty); end
    elseif LGISBuildMenu.countMaterial(player, "Base.Twine") >= 6 then
        furniture.modData["need:Base.Twine"] = "6";
    elseif LGISBuildMenu.countMaterial(player, "Base.Rope") >= 4 then
        furniture.modData["need:Base.Rope"] = "4";
    end
    furniture.modData["xp:Woodwork"] = 5;
    -- our chair have 4 tiles (north, east, south and west)
    -- then we define our east and south sprite
    furniture:setEastSprite(sprite.eastSprite);
    furniture:setSouthSprite(sprite.southSprite);
	furniture.health = 800;
    furniture.player = player
    getCell():setDrag(furniture, player);
end

LGISBuildMenu.onReinforcementCorners = function(worldobjects, square, sprite, player)
-- name, sprite, northSprite
    local furniture = ISSimpleFurniture2:new("Reinforcement Logs", sprite.sprite, sprite.northSprite);
    furniture.isContainer = true;
	furniture.needToBeAgainstWall = false;
	furniture.needToBeAgainstWallCorner = true;
	furniture.blockAllTheSquare = true;
	furniture.isWallLike = true;
    furniture.containerType = "reinforcement_logs";
    furniture.modData["need:Base.Log"] = "6";
	furniture.modData["need:Base.ScrapMetal"] = "6";
	local sheets = LGISBuildMenu.countMaterial(player, "Base.RippedSheets");
	local sheetsDirty = LGISBuildMenu.countMaterial(player, "Base.RippedSheetsDirty");
	if sheets > 20 then sheets = 20; sheetsDirty = 0 end
	if sheetsDirty > 20 then sheetsDirty = 20; sheets = 0 end
	if sheets < 20 and sheetsDirty > 0 then sheetsDirty = 10 - sheets; end
    if sheets + sheetsDirty >= 20 then
		if sheets > 0 then furniture.modData["need:Base.RippedSheets"] = tostring(sheets); end
		if sheetsDirty > 0 then furniture.modData["need:Base.RippedSheetsDirty"] = tostring(sheetsDirty); end
    elseif LGISBuildMenu.countMaterial(player, "Base.Twine") >= 12 then
        furniture.modData["need:Base.Twine"] = "12";
    elseif LGISBuildMenu.countMaterial(player, "Base.Rope") >= 8 then
        furniture.modData["need:Base.Rope"] = "8";
    end
    furniture.modData["xp:Woodwork"] = 10;
    -- our chair have 4 tiles (north, east, south and west)
    -- then we define our east and south sprite
    furniture:setEastSprite(sprite.eastSprite);
    furniture:setSouthSprite(sprite.southSprite);
	furniture.health = 800;
    furniture.player = player
    getCell():setDrag(furniture, player);
end

-- **********************************************
-- **            SPRITE FUNCTIONS              **
-- **********************************************
LGISBuildMenu.getReinforcementSprites = function(player)
	local sprite = {};
	sprite.southSprite = "carpentry_04_43";
	sprite.sprite = "carpentry_04_40";
	sprite.northSprite = "carpentry_04_41";
	sprite.eastSprite = "carpentry_04_42";
	return sprite;
end

LGISBuildMenu.getCReinforcementSprites = function(player)
	local sprite = {};
	sprite.southSprite = "carpentry_04_47";
	sprite.sprite = "carpentry_04_45";
	sprite.northSprite = "carpentry_04_44";
	sprite.eastSprite = "carpentry_04_46";
	return sprite;
end

LGISBuildMenu.getDeerTrophySprites = function(player)
	local sprite = {};

	sprite.sprite = "camping_01_17";
	sprite.northSprite = "camping_01_18";
	
	return sprite;
end

LGISBuildMenu.getCowTrophySprites = function(player)
	local sprite = {};

	sprite.sprite = "camping_02_1";
	sprite.northSprite = "camping_02_0";
	
	return sprite;
end

LGISBuildMenu.getBearTrophySprites = function(player)
	local sprite = {};

	sprite.sprite = "camping_02_2";
	sprite.northSprite = "camping_02_3";
	
	return sprite;
end

LGISBuildMenu.getBoarTrophySprites = function(player)
	local sprite = {};

	sprite.sprite = "camping_02_4";
	sprite.northSprite = "camping_02_5";
	
	return sprite;
end

LGISBuildMenu.getBisonTrophySprites = function(player)
	local sprite = {};

	sprite.sprite = "camping_02_6";
	sprite.northSprite = "camping_02_7";
	
	return sprite;
end

LGISBuildMenu.getMooseTrophySprites = function(player)
	local sprite = {};

	sprite.sprite = "camping_02_8";
	sprite.northSprite = "camping_02_9";
	
	return sprite;
end

LGISBuildMenu.getFurFrameSprites = function(player)
	local sprite = {};

	sprite.sprite = "camping_02_26";
	sprite.northSprite = "camping_02_24";
	sprite.southSprite = "camping_02_22";
	sprite.eastSprite = "camping_02_20";

	return sprite;
end

LGISBuildMenu.getCheeseTableSprites = function(player)
	local sprite = {};

	sprite.sprite = "carpentry_03_13";
	sprite.northSprite = "carpentry_03_16";
	sprite.southSprite = "carpentry_03_14";
	sprite.eastSprite = "carpentry_03_15";

	return sprite;
end

LGISBuildMenu.getDianaSprites = function(player)
	local sprite = {};

	sprite.sprite = "carpentry_03_31";
	sprite.northSprite = "carpentry_03_32";
	sprite.southSprite = "carpentry_03_33";
	sprite.eastSprite = "carpentry_03_34";

	return sprite;
end

LGISBuildMenu.getDryCaneSupportSprites = function(player)
	local sprite = {};

	sprite.sprite = "camping_02_42";
	sprite.northSprite = "camping_02_43";
	sprite.southSprite = "camping_02_43";
	sprite.eastSprite = "camping_02_42";

	return sprite;
end

LGISBuildMenu.getNewWoodenFrameSprites = function(player)
    local sprite = {};
    sprite.sprite = "walls_exterior_legourmet_01_24";
    sprite.northSprite = "walls_exterior_legourmet_01_25";
    return sprite;
end

LGISBuildMenu.getNewMetalFrameSprites = function(player)
    local sprite = {};
    sprite.sprite = "walls_exterior_zaw_01_0";
    sprite.northSprite = "walls_exterior_zaw_01_1";
    return sprite;
end

LGISBuildMenu.getNewDoorSprites = function(player)
	local sprite = {};
	sprite.sprite = "fixtures_doors_lg_01_0";
	sprite.northSprite = "fixtures_doors_lg_01_1";
	sprite.openSprite = "fixtures_doors_lg_01_2";
	sprite.openNorthSprite = "fixtures_doors_lg_01_3";
	return sprite;
end

LGISBuildMenu.getCaneFenceDoorSprites = function(player)
	local sprite = {};
	sprite.sprite = "fixtures_doors_lg_01_10";
	sprite.northSprite = "fixtures_doors_lg_01_11";
	sprite.openSprite = "fixtures_doors_lg_01_12";
	sprite.openNorthSprite = "fixtures_doors_lg_01_13";
	return sprite;
end

LGISBuildMenu.getAdvancedDoorFrameSprites = function(player)
	local sprite = {};
	sprite.sprite = "walls_exterior_legourmet_01_35";
	sprite.northSprite = "walls_exterior_legourmet_01_36";
	return sprite;
end

LGISBuildMenu.getFenceDoorFrameSprites = function(player)
	local sprite = {};
	sprite.sprite = "fixtures_doors_lg_01_14";
	sprite.northSprite = "fixtures_doors_lg_01_15";
	return sprite;
end

LGISBuildMenu.getLogDoorFrameSprites = function(player)
	local sprite = {};
	sprite.sprite = "walls_exterior_legourmet_01_72";
	sprite.northSprite = "walls_exterior_legourmet_01_73";
	return sprite;
end

LGISBuildMenu.getAdvancedWindowFrameSprites = function(player)
	local sprite = {};
	sprite.sprite = "walls_exterior_legourmet_01_39";
	sprite.northSprite = "walls_exterior_legourmet_01_40";
	return sprite;
end

LGISBuildMenu.getNewMetalDoorFrameSprites = function(player)
	local sprite = {};
	sprite.sprite = "walls_exterior_zaw_01_55";
	sprite.northSprite = "walls_exterior_zaw_01_56";
	return sprite;
end

LGISBuildMenu.getAdvancedFenceFrameSprites = function(player)
	local sprite = {};
	sprite.sprite = "walls_exterior_legourmet_01_45";
	sprite.northSprite = "walls_exterior_legourmet_01_46";
	sprite.corner = "walls_exterior_legourmet_01_47";
	return sprite;
end

LGISBuildMenu.getNewMetalWindowFrameSprites = function(player)
	local sprite = {};
	sprite.sprite = "walls_exterior_zaw_01_32";
	sprite.northSprite = "walls_exterior_zaw_01_33";
	return sprite;
end

-- **********************************************
-- **                  OTHER                   **
-- **********************************************

-- Create our toolTip, depending on the required material
LGISBuildMenu.canBuild = function(recipeknown, plankNb, nailsNb, deerheadNb, cowheadNb, bearheadNb, boarheadNb, bisonheadNb, mooseheadNb, carpentrySkill, option, player)
	-- create a new tooltip
	local tooltip = LGISBuildMenu.addToolTip();
	-- add it to our current option
	option.toolTip = tooltip;
	local result = true;
	if ISBuildMenu.cheat then
		return tooltip;
	end	
	if recipeknown ~= nil then
		local recipes = getSpecificPlayer(player):getKnownRecipes();
		if recipeknown ~= "NONE" then
			if not recipes:contains(recipeknown) then
				result = false;
			else
				-- Snake:  This will be changed to false if we cannot build.
				result = true;
			end
		else
			result = true;
		end

		if recipes:contains(recipeknown) or recipeknown == "NONE" then
			tooltip.description = "<RGB:0.596078431372549,0.9843137254901961,0.596078431372549> <LINE> <LINE>" .. getText("Tooltip_craft_Needs") .. " : <LINE>";
			-- now we gonna test all the needed material, if we don't have it, they'll be in red into our toolip
			if LGISBuildMenu.planks < plankNb then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.Plank") .. " " .. LGISBuildMenu.planks .. "/" .. plankNb .. " <LINE>";
				result = false;
			elseif plankNb > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.Plank") .. " " .. plankNb .. " <LINE>";
			end
			if LGISBuildMenu.nails < nailsNb then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.Nails") .. " " .. LGISBuildMenu.nails .. "/" .. nailsNb .. " <LINE>";
				result = false;
			elseif nailsNb > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.Nails") .. " " .. nailsNb .. " <LINE>";
			end
			if LGISBuildMenu.deerhead < deerheadNb then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemText("Deer_Head") .. " " .. LGISBuildMenu.deerhead .. "/" .. deerheadNb .. " <LINE>";
				result = false;
			elseif deerheadNb > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemText("Deer_Head") .. " " .. deerheadNb .. " <LINE>";
			end
			if LGISBuildMenu.cowhead < cowheadNb then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemText("Cow_Head") .. " " .. LGISBuildMenu.cowhead .. "/" .. cowheadNb .. " <LINE>";
				result = false;
			elseif cowheadNb > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemText("Cow_Head") .. " " .. cowheadNb .. " <LINE>";
			end
			if LGISBuildMenu.bearhead < bearheadNb then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemText("Bear_Head") .. " " .. LGISBuildMenu.bearhead .. "/" .. bearheadNb .. " <LINE>";
				result = false;
			elseif bearheadNb > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemText("Bear_Head") .. " " .. bearheadNb .. " <LINE>";
			end
			if LGISBuildMenu.boarhead < boarheadNb then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemText("Boar_Head") .. " " .. LGISBuildMenu.boarhead .. "/" .. boarheadNb .. " <LINE>";
				result = false;
			elseif boarheadNb > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemText("Boar_Head") .. " " .. boarheadNb .. " <LINE>";
			end
			if LGISBuildMenu.bisonhead < bisonheadNb then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemText("Bison_Head") .. " " .. LGISBuildMenu.bisonhead .. "/" .. bisonheadNb .. " <LINE>";
				result = false;
			elseif bisonheadNb > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemText("Bison_Head") .. " " .. bisonheadNb .. " <LINE>";
			end
			if LGISBuildMenu.moosehead < mooseheadNb then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemText("Moose_Head") .. " " .. LGISBuildMenu.moosehead .. "/" .. mooseheadNb .. " <LINE>";
				result = false;
			elseif mooseheadNb > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemText("Moose_Head") .. " " .. mooseheadNb .. " <LINE>";
			end
			if getSpecificPlayer(player):getPerkLevel(Perks.Woodwork) < carpentrySkill then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getText("IGUI_perks_Carpentry") .. " " .. getSpecificPlayer(player):getPerkLevel(Perks.Woodwork) .. "/" .. carpentrySkill .. " <LINE>";
				result = false;
			elseif carpentrySkill > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getText("IGUI_perks_Carpentry") .. " " .. carpentrySkill .. " <LINE>";
			end
		end
		if recipeknown ~= "NONE" then
			LGISBuildMenu.recipetext = getText("Tooltip_" .. recipeknown)
			if not recipes:contains(recipeknown) then
				tooltip.description = tooltip.description .. " <LINE> <LINE>" .. " <RGB:1,1,1>" .. getText("Tooltip_needknownrecipe") .. " " .. " <RGB:1,0,0>" .. LGISBuildMenu.recipetext;
				result = false;
			else
				tooltip.description = tooltip.description .. " <LINE>" .. " <RGB:1,1,1>" .. getText("Tooltip_needknownrecipe") .. " " .. " <RGB:0,1,0>" .. LGISBuildMenu.recipetext .. getText("Tooltip_alreadyknownrecipe");
			end
		end
	end
	if not result then
		option.onSelect = nil;
		option.notAvailable = true;
	end
	tooltip.description = " " .. tooltip.description .. " "
	return tooltip;
end

-- Create our toolTip, depending on the required material
LGISBuildMenu.canBuildDiana = function(recipeknown, plankNb, nailsNb, dianaNb, alfalfaNb, carpentrySkill, option, player)
	-- create a new tooltip
	local tooltip = LGISBuildMenu.addToolTip();
	-- add it to our current option
	option.toolTip = tooltip;
	local result = true;
	if ISBuildMenu.cheat then
		return tooltip;
	end	
	if recipeknown ~= nil then
		local recipes = getSpecificPlayer(player):getKnownRecipes();
		if recipeknown ~= "NONE" then
			if not recipes:contains(recipeknown) then
				result = false;
			else
				-- Snake:  This will be changed to false if we cannot build.
				result = true;
			end
		else
			result = true;
		end

		if recipes:contains(recipeknown) or recipeknown == "NONE" then
			tooltip.description = "<RGB:0.596078431372549,0.9843137254901961,0.596078431372549> <LINE> <LINE>" .. getText("Tooltip_craft_Needs") .. " : <LINE>";
			-- now we gonna test all the needed material, if we don't have it, they'll be in red into our toolip
			if LGISBuildMenu.planks < plankNb then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.Plank") .. " " .. LGISBuildMenu.planks .. "/" .. plankNb .. " <LINE>";
				result = false;
			elseif plankNb > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.Plank") .. " " .. plankNb .. " <LINE>";
			end
			if LGISBuildMenu.nails < nailsNb then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.Nails") .. " " .. LGISBuildMenu.nails .. "/" .. nailsNb .. " <LINE>";
				result = false;
			elseif nailsNb > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.Nails") .. " " .. nailsNb .. " <LINE>";
			end
			if LGISBuildMenu.diana < dianaNb then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemText("Mov_WallDiana") .. " " .. LGISBuildMenu.diana .. "/" .. dianaNb .. " <LINE>";
				result = false;
			elseif dianaNb > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemText("Mov_WallDiana") .. " " .. dianaNb .. " <LINE>";
			end
			if LGISBuildMenu.alfalfa < alfalfaNb then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemText("Alfalfa") .. " " .. LGISBuildMenu.alfalfa .. "/" .. alfalfaNb .. " <LINE>";
				result = false;
			elseif alfalfaNb > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemText("Alfalfa") .. " " .. alfalfaNb .. " <LINE>";
			end
			if getSpecificPlayer(player):getPerkLevel(Perks.Woodwork) < carpentrySkill then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getText("IGUI_perks_Carpentry") .. " " .. getSpecificPlayer(player):getPerkLevel(Perks.Woodwork) .. "/" .. carpentrySkill .. " <LINE>";
				result = false;
			elseif carpentrySkill > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getText("IGUI_perks_Carpentry") .. " " .. carpentrySkill .. " <LINE>";
			end
		end
		if recipeknown ~= "NONE" then
			LGISBuildMenu.recipetext = getText("Tooltip_" .. recipeknown)
			if not recipes:contains(recipeknown) then
				tooltip.description = tooltip.description .. " <LINE> <LINE>" .. " <RGB:1,1,1>" .. getText("Tooltip_needknownrecipe") .. " " .. " <RGB:1,0,0>" .. LGISBuildMenu.recipetext;
				result = false;
			else
				tooltip.description = tooltip.description .. " <LINE>" .. " <RGB:1,1,1>" .. getText("Tooltip_needknownrecipe") .. " " .. " <RGB:0,1,0>" .. LGISBuildMenu.recipetext .. getText("Tooltip_alreadyknownrecipe");
			end
		end
	end
	if not result then
		option.onSelect = nil;
		option.notAvailable = true;
	end
	tooltip.description = " " .. tooltip.description .. " "
	return tooltip;
end

LGISBuildMenu.canBuildFurFrame = function(logsNb, tbranchNb, sheetropeNb, ropeNb, recipeknown, carpentrySkill, TrappingSkill, option, player)
	-- create a new tooltip
	local tooltip = LGISBuildMenu.addToolTip();
	-- add it to our current option
	option.toolTip = tooltip;
	local result = true;
	if ISBuildMenu.cheat then
		return tooltip;
	end
	if recipeknown ~= nil then
		local recipes = getSpecificPlayer(player):getKnownRecipes();
		if recipeknown ~= "NONE" then
			if not recipes:contains(recipeknown) then
				result = false;
			else
				-- Snake:  This will be changed to false if we cannot build.
				result = true;
			end
		else
			result = true;
		end

		if recipes:contains(recipeknown) or recipeknown == "NONE" then
			tooltip.description = "<RGB:0.596078431372549,0.9843137254901961,0.596078431372549> <LINE> <LINE>" .. getText("Tooltip_craft_Needs") .. " : <LINE>";
			-- now we gonna test all the needed material, if we don't have it, they'll be in red into our toolip
			if LGISBuildMenu.logs < logsNb then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.Log") .. " " .. LGISBuildMenu.logs .. "/" .. logsNb .. " <LINE>";
				result = false;
			elseif logsNb > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.Log") .. " " .. logsNb .. " <LINE>";
			end
			if LGISBuildMenu.tbranch < tbranchNb then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.TreeBranch") .. " " .. LGISBuildMenu.tbranch .. "/" .. tbranchNb .. " <LINE>";
				result = false;
			elseif tbranchNb > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.TreeBranch") .. " " .. tbranchNb .. " <LINE>";
			end
			if LGISBuildMenu.sheetrope < sheetropeNb then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.SheetRope") .. " " .. LGISBuildMenu.sheetrope .. "/" .. sheetropeNb .. " <LINE>";
				result = false;
			elseif sheetropeNb > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.SheetRope") .. " " .. sheetropeNb .. " <LINE>";
			end
			if LGISBuildMenu.rope < ropeNb then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.Rope") .. " " .. LGISBuildMenu.rope .. "/" .. ropeNb .. " <LINE>";
				result = false;
			elseif ropeNb > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.Rope") .. " " .. ropeNb .. " <LINE>";
			end
			if getSpecificPlayer(player):getPerkLevel(Perks.Woodwork) < carpentrySkill then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getText("IGUI_perks_Carpentry") .. " " .. getSpecificPlayer(player):getPerkLevel(Perks.Woodwork) .. "/" .. carpentrySkill .. " <LINE>";
				result = false;
			elseif carpentrySkill > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getText("IGUI_perks_Carpentry") .. " " .. carpentrySkill .. " <LINE>";
			end
			if getSpecificPlayer(player):getPerkLevel(Perks.Trapping) < TrappingSkill then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getText("IGUI_perks_Trapping") .. " " .. getSpecificPlayer(player):getPerkLevel(Perks.Trapping) .. "/" .. TrappingSkill .. " <LINE>";
				result = false;
			elseif TrappingSkill > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getText("IGUI_perks_Trapping") .. " " .. TrappingSkill .. " <LINE>";
			end
		end
		if recipeknown ~= "NONE" then
			LGISBuildMenu.recipetext = getText("Tooltip_" .. recipeknown)
			if not recipes:contains(recipeknown) then
				tooltip.description = tooltip.description .. " <LINE> <LINE>" .. " <RGB:1,1,1>" .. getText("Tooltip_needknownrecipe") .. " " .. " <RGB:1,0,0>" .. LGISBuildMenu.recipetext;
				result = false;
			else
				tooltip.description = tooltip.description .. " <LINE>" .. " <RGB:1,1,1>" .. getText("Tooltip_needknownrecipe") .. " " .. " <RGB:0,1,0>" .. LGISBuildMenu.recipetext .. getText("Tooltip_alreadyknownrecipe");
			end
		end
	end
	if not result then
		option.onSelect = nil;
		option.notAvailable = true;
	end
	tooltip.description = " " .. tooltip.description .. " "
	return tooltip;
end

LGISBuildMenu.canBuildDoor = function(CaneNb, nailsNb, doorknobNb, hingeNb, recipeknown, carpentrySkill, option, player)
	-- create a new tooltip
	local tooltip = LGISBuildMenu.addToolTip();
	-- add it to our current option
	option.toolTip = tooltip;
	local result = true;
	if ISBuildMenu.cheat then
		return tooltip;
	end
	if recipeknown ~= nil then
		local recipes = getSpecificPlayer(player):getKnownRecipes();
		if recipeknown ~= "NONE" then
			if not recipes:contains(recipeknown) then
				result = false;
			else
				-- Snake:  This will be changed to false if we cannot build.
				result = true;
			end
		else
			result = true;
		end

		if recipes:contains(recipeknown) or recipeknown == "NONE" then
			tooltip.description = "<RGB:0.596078431372549,0.9843137254901961,0.596078431372549> <LINE> <LINE>" .. getText("Tooltip_craft_Needs") .. " : <LINE>";
			-- now we gonna test all the needed material, if we don't have it, they'll be in red into our toolip
			if LGISBuildMenu.cane < CaneNb then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemText("Dry_Sugarcane") .. " " .. LGISBuildMenu.cane .. "/" .. CaneNb .. " <LINE>";
				result = false;
			elseif CaneNb > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemText("Dry_Sugarcane") .. " " .. CaneNb .. " <LINE>";
			end
			if LGISBuildMenu.nails < nailsNb then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.Nails") .. " " .. LGISBuildMenu.nails .. "/" .. nailsNb .. " <LINE>";
				result = false;
			elseif nailsNb > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.Nails") .. " " .. nailsNb .. " <LINE>";
			end
			if LGISBuildMenu.doorknob < doorknobNb then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.Doorknob") .. " " .. LGISBuildMenu.doorknob .. "/" .. doorknobNb .. " <LINE>";
				result = false;
			elseif doorknobNb > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.Doorknob") .. " " .. doorknobNb .. " <LINE>";
			end
			if LGISBuildMenu.hinge < hingeNb then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.Hinge") .. " " .. LGISBuildMenu.hinge .. "/" .. hingeNb .. " <LINE>";
				result = false;
			elseif hingeNb > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.Hinge") .. " " .. hingeNb .. " <LINE>";
			end
			if getSpecificPlayer(player):getPerkLevel(Perks.Woodwork) < carpentrySkill then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getText("IGUI_perks_Carpentry") .. " " .. getSpecificPlayer(player):getPerkLevel(Perks.Woodwork) .. "/" .. carpentrySkill .. " <LINE>";
				result = false;
			elseif carpentrySkill > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getText("IGUI_perks_Carpentry") .. " " .. carpentrySkill .. " <LINE>";
			end
		end
		if recipeknown ~= "NONE" then
			LGISBuildMenu.recipetext = getText("Tooltip_" .. recipeknown)
			if not recipes:contains(recipeknown) then
				tooltip.description = tooltip.description .. " <LINE> <LINE>" .. " <RGB:1,1,1>" .. getText("Tooltip_needknownrecipe") .. " " .. " <RGB:1,0,0>" .. LGISBuildMenu.recipetext;
				result = false;
			else
				tooltip.description = tooltip.description .. " <LINE>" .. " <RGB:1,1,1>" .. getText("Tooltip_needknownrecipe") .. " " .. " <RGB:0,1,0>" .. LGISBuildMenu.recipetext .. getText("Tooltip_alreadyknownrecipe");
			end
		end
	end
	if not result then
		option.onSelect = nil;
		option.notAvailable = true;
	end
	tooltip.description = " " .. tooltip.description .. " "
	return tooltip;
end

LGISBuildMenu.canBuildDoubleLogDoor = function(player)
    local logs = LGISBuildMenu.countMaterial(player, "Base.Log")
	local hinge = LGISBuildMenu.countMaterial(player, "Base.Hinge")
    local sheets = LGISBuildMenu.countMaterial(player, "Base.RippedSheets") + LGISBuildMenu.countMaterial(player, "Base.RippedSheetsDirty")
    local twine = LGISBuildMenu.countMaterial(player, "Base.Twine")
    local rope = LGISBuildMenu.countMaterial(player, "Base.Rope")
    return logs >= 4 and hinge >=8 and (sheets >= 4 or twine >= 4 or rope >= 2)
end

-- Create our toolTip, depending on the required material
LGISBuildMenu.canBuildMetalWallFrame = function(recipeknown, plankNb, nailsNb, sheetmetalNb, smallsheetmetalNb, screwsNb, metalpipeNb, wireNb, carpentrySkill, metalweldingSkill, option, player)
	-- create a new tooltip
	local tooltip = LGISBuildMenu.addToolTip();
	-- add it to our current option
	option.toolTip = tooltip;
	local result = true;
	if ISBuildMenu.cheat then
		return tooltip;
	end	
	if recipeknown ~= nil then
		local recipes = getSpecificPlayer(player):getKnownRecipes();
		if recipeknown ~= "NONE" then
			if not recipes:contains(recipeknown) then
				result = false;
			else
				-- Snake:  This will be changed to false if we cannot build.
				result = true;
			end
		else
			result = true;
		end

		if recipes:contains(recipeknown) or recipeknown == "NONE" then
			tooltip.description = "<RGB:0.596078431372549,0.9843137254901961,0.596078431372549> <LINE> <LINE>" .. getText("Tooltip_craft_Needs") .. " : <LINE>";
			-- now we gonna test all the needed material, if we don't have it, they'll be in red into our toolip
			if LGISBuildMenu.planks < plankNb then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.Plank") .. " " .. LGISBuildMenu.planks .. "/" .. plankNb .. " <LINE>";
				result = false;
			elseif plankNb > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.Plank") .. " " .. plankNb .. " <LINE>";
			end
			if LGISBuildMenu.nails < nailsNb then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.Nails") .. " " .. LGISBuildMenu.nails .. "/" .. nailsNb .. " <LINE>";
				result = false;
			elseif nailsNb > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.Nails") .. " " .. nailsNb .. " <LINE>";
			end
			if LGISBuildMenu.sheetmetal < sheetmetalNb then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.SheetMetal") .. " " .. LGISBuildMenu.sheetmetal .. "/" .. sheetmetalNb .. " <LINE>";
				result = false;
			elseif sheetmetalNb > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.SheetMetal") .. " " .. sheetmetalNb .. " <LINE>";
			end
			if LGISBuildMenu.smallsheetmetal < smallsheetmetalNb then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.SmallSheetMetal") .. " " .. LGISBuildMenu.smallsheetmetal .. "/" .. smallsheetmetalNb .. " <LINE>";
				result = false;
			elseif smallsheetmetalNb > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.SmallSheetMetal") .. " " .. smallsheetmetalNb .. " <LINE>";
			end
			if LGISBuildMenu.screws < screwsNb then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.Screws") .. " " .. LGISBuildMenu.screws .. "/" .. screwsNb .. " <LINE>";
				result = false;
			elseif screwsNb > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.Screws") .. " " .. screwsNb .. " <LINE>";
			end
			if LGISBuildMenu.metalpipe < metalpipeNb then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.MetalPipe") .. " " .. LGISBuildMenu.metalpipe .. "/" .. metalpipeNb .. " <LINE>";
				result = false;
			elseif metalpipeNb > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.MetalPipe") .. " " .. metalpipeNb .. " <LINE>";
			end
			if LGISBuildMenu.wire < wireNb then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.Wire") .. " " .. LGISBuildMenu.wire .. "/" .. wireNb .. " <LINE>";
				result = false;
			elseif wireNb > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.Wire") .. " " .. wireNb .. " <LINE>";
			end
			if getSpecificPlayer(player):getPerkLevel(Perks.Woodwork) < carpentrySkill then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getText("IGUI_perks_Carpentry") .. " " .. getSpecificPlayer(player):getPerkLevel(Perks.Woodwork) .. "/" .. carpentrySkill .. " <LINE>";
				result = false;
			elseif carpentrySkill > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getText("IGUI_perks_Carpentry") .. " " .. carpentrySkill .. " <LINE>";
			end
			if getSpecificPlayer(player):getPerkLevel(Perks.MetalWelding) < metalweldingSkill then
				tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getText("IGUI_perks_MetalWelding") .. " " .. getSpecificPlayer(player):getPerkLevel(Perks.MetalWelding) .. "/" .. metalweldingSkill .. " <LINE>";
				result = false;
			elseif metalweldingSkill > 0 then
				tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getText("IGUI_perks_MetalWelding") .. " " .. metalweldingSkill .. " <LINE>";
			end
		end
		if recipeknown ~= "NONE" then
			LGISBuildMenu.recipetext = getText("Tooltip_" .. recipeknown)
			if not recipes:contains(recipeknown) then
				tooltip.description = tooltip.description .. " <LINE> <LINE>" .. " <RGB:1,1,1>" .. getText("Tooltip_needknownrecipe") .. " " .. " <RGB:1,0,0>" .. LGISBuildMenu.recipetext;
				result = false;
			else
				tooltip.description = tooltip.description .. " <LINE>" .. " <RGB:1,1,1>" .. getText("Tooltip_needknownrecipe") .. " " .. " <RGB:0,1,0>" .. LGISBuildMenu.recipetext .. getText("Tooltip_alreadyknownrecipe");
			end
		end
	end
	if not result then
		option.onSelect = nil;
		option.notAvailable = true;
	end
	tooltip.description = " " .. tooltip.description .. " "
	return tooltip;
end

LGISBuildMenu.addToolTip = function()
	local toolTip = ISToolTip:new();
	toolTip:initialise();
	toolTip:setVisible(false);
	return toolTip;
end

LGISBuildMenu.countMaterial = function(player, fullType)
    local inv = getSpecificPlayer(player):getInventory()
    local count = 0
    local items = inv:getItemsFromFullType(fullType, true)
    for i=1,items:size() do
        local item = items:get(i-1)
        if not instanceof(item, "InventoryContainer") or item:getInventory():getItems():isEmpty() then
            count = count + 1
        end
    end
    local type = string.split(fullType, "\\.")[2]
    for k,v in pairs(LGISBuildMenu.materialOnGround) do
        if k == type then count = count + v end
    end
    return count
end

LGISBuildMenu.requireHammer = function(option)
	if not LGISBuildMenu.hasHammer and not ISBuildMenu.cheat then
		option.notAvailable = true
		option.onSelect = nil
	end
end