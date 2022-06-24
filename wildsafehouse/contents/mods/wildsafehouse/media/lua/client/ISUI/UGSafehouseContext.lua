UGSafehouse = {}

--make these options editable through the sandbox menu
UGSafehouse.diameter = 15
UGSafehouse.buffer = 5
UGSafehouse.maxhouses = 2

UGSafehouse.OnContextMenu = function( player, context, worldobjects)

	UGSafehouse.diameter = SandboxVars.UGSafehouse.diameter
	UGSafehouse.buffer = SandboxVars.UGSafehouse.buffer
	UGSafehouse.maxhouses = SandboxVars.UGSafehouse.maxhouses
	
	--print( "keyword: UGSafehouse.OnContextMenu called")
	local playerObj = getSpecificPlayer( player)
	if playerObj:getVehicle() then return end
	
	local procede, reason, limit = UGSafehouse.CanSafehouse( player)
	if limit then return end
	
	if not playerObj:getSquare():getBuilding() then
	
		local option = context:addOptionOnTop( "Create Safehouse", player, UGSafehouse.SetupSafehouse, procede)
		
		if not procede then

			local _tooltip = ISToolTip:new()
			_tooltip:initialise()
			_tooltip:setVisible(false)
			_tooltip.description = " <RGB:1,0,0>" .. reason
			
			option.notAvailable = true
			option.toolTip = _tooltip
		end	
	else
	
		if ( not SafeHouse.getSafeHouse( playerObj:getSquare()) and not limit and SafeHouse.hasSafehouse( playerObj:getUsername()) and playerObj:getSquare():getBuilding():getDef()) then

			--print( "keyword: replacement claim")
			local shoption = context:addOptionOnTop( getText("ContextMenu_SafehouseClaim"), player, UGSafehouse.addSafeHouse)
			-- if reason ~= "" and reason = getText("IGUI_Safehouse_AlreadyHaveSafehouse") then
				-- local toolTip = ISWorldObjectContextMenu.addToolTip();
				-- toolTip:setVisible(false);
				-- toolTip.description = reason;
				-- shoption.notAvailable = true;
				-- shoption.toolTip = toolTip;
			-- end
		end	
	end
end


UGSafehouse.addSafeHouse = function( player)  --claim an existing building

	local playerObj = getSpecificPlayer( player)
	local square = playerObj:getSquare()
	local building = square:getBuilding()
	local buildingDef = building:getDef()
	
	local diffError = 2  --this is static in the SafeHouse.class java file acts the same way as my buffer for wild safe houses

	if buildingDef ~= nil then
		SafeHouse.addSafeHouse( buildingDef:getX() - diffError, buildingDef:getY() - diffError, buildingDef:getW() + diffError * 2, buildingDef:getH() + diffError * 2, playerObj:getUsername(), false);
	else
		print( "ERROR: no definition for building: ", playerObj:getUsername())
	end
end

UGSafehouse.SetupSafehouse = function( player, procede)  --claim a wild safehouse

	print( "keyword: UGSafehouse.SetupSafehouse called")
	
	if not procede then return end
	
	local playerObj = getSpecificPlayer( player)
	local square = playerObj:getSquare()

	local sX = square:getX()
	local sY = square:getY()
	SafeHouse.addSafeHouse( sX - UGSafehouse.diameter, sY - UGSafehouse.diameter, 2 * UGSafehouse.diameter + 1, 2 * UGSafehouse.diameter + 1, playerObj:getUsername(), false);
end

UGSafehouse.CanSafehouse = function( player)
	
	print( "keyword: UGSafehouse.CanSafeHouse called")
	local cansafehouse = true
	local playerObj = getSpecificPlayer( player)
	local safehouselist = SafeHouse.getSafehouseList()
	local howmany = 0
	
	print( "keyword: Checking safe house list") 
	if safehouselist:size() > 0 then
	
		--print( "List is good: ")
		for i=0, safehouselist:size()-1 do
			local safe = safehouselist:get(i)
			
			if safe:getOwner() == playerObj:getUsername() then
			
				howmany = howmany + 1
			end
		end
	end
	
	print( "Found ", howmany, " houses")
	if howmany >= UGSafehouse.maxhouses then
		return false, getText("IGUI_Safehouse_AlreadyHaveSafehouse"), true
	end
	
	local daystoclaim = getServerOptions():getInteger( "SafehouseDaySurvivedToClaim")
	if daystoclaim > 0 and playerObj:getHoursSurvived() < (daystoclaim * 24) then
	
		return false, Translator.getText( "IGUI_Safehouse_DaysSurvivedToClaim", daystoclaim), false
	end
	
	--cycle through the tiles to check restrictions   -no roads -no buildings and -no other safehouses.
	local square = playerObj:getSquare()
	local sX = square:getX()
	local sY = square:getY()
	
	for i = sX - UGSafehouse.diameter - UGSafehouse.buffer, sX + UGSafehouse.diameter + UGSafehouse.buffer, 1 do
		for j = sY - UGSafehouse.diameter - UGSafehouse.buffer, sY + UGSafehouse.diameter + UGSafehouse.buffer, 1 do
		
			local square = getCell():getGridSquare( i, j, 0)

			if square and square:getBuilding() then
			
				--print(" keyword: can not create safe house, too close to another building")
				return false, "You are too close to another building to setup a safe house", false
			end

			if square and SafeHouse.getSafeHouse( square) then
			
				--print( " keyword: can not create safe house, can not overlap another safehouse")
				return false, "There is another safe house nearby", false
			end
			
			for i=1,square:getObjects():size() do
			
				local obj = square:getObjects():get(i-1)
				local oTN = obj:getTextureName()
				
				if oTN ~= nil and luautils.stringStarts( oTN, "blends_street") then
				
					--print( " keyword: can not create safe house, can not overlap a road")
					return false, "You are too close to a road to setup a safe house", false
				end
			end
		end
	end
	
	return true, "You're good to go!", false
end

UGSafehouse.Init = function()

	this.diameter = SandboxVars.UGSafehouse.diameter
	this.buffer = SandboxVars.UGSafehouse.buffer
end

-- UGSafehouse.ViewSafehouse = function( worldobjects, safehouse, player)

    -- local safehouseUI = ISSafehouseUI:new( getCore():getScreenWidth() / 2 - 250, getCore():getScreenHeight() / 2 - 225, 500, 450, safehouse, player);
    -- safehouseUI:initialise()
    -- safehouseUI:addToUIManager()
-- end

--add a menu to the safe house UI to select between multiple safe houses
-- oldinitialise = ISSafehouseUI.initialise
-- function ISSafehouseUI:initialise()

	-- oldinitialise( self)
	-- --print( "keyword: new initialise")

    -- local btnWid = 100
    -- local btnHgt = 20
	-- local FONT_HGT_SMALL = getTextManager():getFontHeight(UIFont.Small)
	
	-- self.chooseHouse1Btn = ISButton:new( 0,  self.changeTitle.y, btnWid, btnHgt, "Select safe house 1", self.chooseHouse1Btn, ISSafehouseUI.onSelectHouse)
	-- self.chooseHouse1Btn.internal = "SAFEHOUSE1"
    -- self.chooseHouse1Btn.anchorTop = false
    -- self.chooseHouse1Btn.anchorBottom = true
    -- self.chooseHouse1Btn:initialise()
    -- self.chooseHouse1Btn:instantiate()
    -- self:addChild( self.chooseHouse1Btn)
	-- self.chooseHouse1Btn:setVisible( true)

	-- self.chooseHouse2Btn = ISButton:new( 0,  self.changeTitle.y, btnWid, btnHgt, "Select safe house 1", self.chooseHouse2Btn, ISSafehouseUI.onSelectHouse)
	-- self.chooseHouse2Btn.internal = "SAFEHOUSE2"
    -- self.chooseHouse2Btn.anchorTop = false
    -- self.chooseHouse2Btn.anchorBottom = true	
    -- self.chooseHouse2Btn:initialise()
    -- self.chooseHouse2Btn:instantiate()
    -- self:addChild( self.chooseHouse2Btn)	
	-- self.chooseHouse2Btn:setVisible( true)
-- end


-- function ISSafehouseUI.onSelectHouse( button)

	-- print( "onSelectHouse called")
	
	-- local safehouselist = SafeHouse.getSafehouseList()
	-- local playerhouses = {}
	
	-- for i=0,SafeHouse.getSafehouseList():size()-1 do
	
		-- local safe = SafeHouse.getSafehouseList():get(i)
		
		-- if safe:getOwner() == UGSafehouse.playerObj:getUsername() then
			-- playerhouses.add( safe)
		-- end
	-- end
	
	-- if button.internal == "SAFEHOUSE1" then
	
		-- ISSafehouseUI.safehouse = playerhouses:get(0)
	-- elseif button.internal == "SAFEHOUSE2" then
	
		-- ISSafehouseUI.safehouse = playerhouses:get(1)
	-- end	
	
	-- self:initialise()
-- end

-- oldprerender = ISSafehouseUI.prerender
-- function ISSafehouseUI:prerender()

	-- oldprerender( self)
	-- --print( "keyword: new prerender")
	
	-- self.chooseHouse1Btn:setX( self.changeTitle:getRight() + 10)
	-- self.chooseHouse2Btn:setX( self.chooseHouse1Btn:getRight() + 10)
-- end

-- oldupdatebuttons = ISSafehouseUI:updateButtons()
-- function ISSafehouseUI:updateButtons()

	-- oldupdatebuttons( self)
	
	-- self.chooseHouse1Btn:setVisible( true)
	-- self.chooseHouse2Btn:setVisible( true)
-- end


Events.OnFillWorldObjectContextMenu.Add( UGSafehouse.OnContextMenu)