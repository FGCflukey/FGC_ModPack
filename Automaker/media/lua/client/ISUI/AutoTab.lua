AutoTab = ISPanelJoypad:derive("AutoTab");
AutoTab.SMALL_FONT_HGT = getTextManager():getFontFromEnum(UIFont.Small):getLineHeight()
AutoTab.MEDIUM_FONT_HGT = getTextManager():getFontFromEnum(UIFont.Medium):getLineHeight()
AutoTab.addButtonX = 380
AutoTab.previewButtonX = AutoTab.addButtonX + 25
AutoTab.favoriteButtonX = AutoTab.addButtonX - 20


function AutoTab:initialise()
    ISPanelJoypad.initialise(self);
    self:create();
end

function AutoTab:setAutoList(instance)
    self.AutoList = instance
end

function AutoTab:setCategoryType(tabType)
    self.tabType = tabType
end

function AutoTab:onMouseDownShopItem(x, y)

    ISScrollingListBox.onMouseDown(self,x, y)
	self.parent.previewPanel.javaObject:fromLua2("setVehicleScript", "previewVeh", self.items[ self.selected].vID)
end

function AutoTab:onMouseMoveShopItem(dx, dy)
    local list = self.parent.shopItems
    if not list then return end
    list.selectedRow = nil
    list.previewBtn = nil
    list.favoriteBtn = nil
    list.addBtn = nil
	if list:isMouseOverScrollBar() or not list:isMouseOver() then self.parent.AutoList:toggleTooltip(false) return end
	local rowIndex = list:rowAt(list:getMouseX(), list:getMouseY())
    if not rowIndex then self.parent.AutoList:toggleTooltip(false) return end
    local selectedRow = list.items[rowIndex]
    if not selectedRow then self.parent.AutoList:toggleTooltip(false) return end
    list.selectedRow = rowIndex
    local mouseX = self:getMouseX()
    if mouseX > self.parent.favoriteButtonX and mouseX < (self.parent.favoriteButtonX+20) then
        list.favoriteBtn = true
    end
    -- if mouseX > self.parent.addButtonX then
        -- list.addBtn = true
    -- end
    -- if mouseX > self.parent.previewButtonX then
        -- list.previewBtn = true
    -- end
    if not selectedRow.item then self.parent.AutoList:toggleTooltip(false) return end
    self.parent.AutoList:toggleTooltip(true,selectedRow.item)
end

function AutoTab:prerender()
	--self.shopItems.onMouseMove = AutoTab.onMouseMoveShopItem;
	self.shopItems.onMouseDown = AutoTab.onMouseDownShopItem;
end

VPreview = ISUI3DScene:derive("VPreview")
 
function VPreview:new( x, y, width, height)
	local o = ISUI3DScene.new( self, x, y, width, height)
	return o
end

function AutoTab:create()
    local x = 30
    local y = 30

    self.shopItems = ISScrollingListBox:new(x, y, (self.width / 3) + 110, self.height - 100)
    self.shopItems:initialise()
    self.shopItems:instantiate()
    self.shopItems.font = UIFont.NewSmall
    self.shopItems.itemheight = 2 + self.MEDIUM_FONT_HGT  + 4
    self.shopItems.selected = 0
    self.shopItems.joypadParent = self
    self.shopItems.drawBorder = false
    self.shopItems.SMALL_FONT_HGT = self.SMALL_FONT_HGT
    self.shopItems.MEDIUM_FONT_HGT = self.MEDIUM_FONT_HGT
    self:addChild( self.shopItems)
	
    self.BuildVehicle = ISButton:new( x + 400, self.height - 34, 120, 24, "Build Vehicle", self, AutoTab.onBuildClick)
    self.BuildVehicle.internal = "BUILDVEHICLE"
    self.BuildVehicle:initialise()
    self.BuildVehicle.borderColor.a = 0.0
    self.BuildVehicle.backgroundColor.a = 1
    self.BuildVehicle:instantiate()
    self:addChild(self.BuildVehicle)
	self.BuildVehicle:setVisible(true)
	
	self.descriptionPanel = ISRichTextPanel:new( x + 400, y + 310, 300, 300)
	self.descriptionPanel.marginLeft = 0
	self.descriptionPanel.marginRight = 0
	self.descriptionPanel:initialise()
	self.descriptionPanel:instantiate()
	self.descriptionPanel.backgroundColor = {r=0, g=0, b=0, a=0.5}
	self.descriptionPanel.borderColor = {r=1, g=1, b=1, a=1}
	self.descriptionPanel:setMargins( 5, 5, 5, 5)
	self.descriptionPanel:paginate()
	self:addChild( self.descriptionPanel)	
	
	self.previewPanel = VPreview:new( x + 400, y, 300, 300)
    self.previewPanel:initialise()
    self.previewPanel:instantiate()
    self.previewPanel:setAnchorTop(false)
    self.previewPanel:setAnchorRight(false)
    self.previewPanel:setAnchorBottom(true)
	self.previewPanel:setView("Right")
    self.previewPanel.javaObject:fromLua1("setZoom", 4)
    self.previewPanel.javaObject:fromLua1("setDrawGrid", false)
    self.previewPanel.javaObject:fromLua1("createVehicle", "previewVeh")
    self:addChild( self.previewPanel)

end

function AutoTab:onBuildClick()

	local mechanictype = 0
	
	if self.tabType == "Standard Models" then
		mechanictype = 1
	elseif self.tabType == "Heavy Duty Models" then
		mechanictype = 2
	elseif self.tabType == "Sport Models" then
		mechanictype = 3
	end
	
	local vehicleid = self.shopItems.items[ self.shopItems.selected].vID
	local player = getPlayer()
	
	if UG_Automaker.canBuild( player, mechanictype) then

		sendClientCommand( player, "Automaker", "CreateVehicle", { VehicleID = vehicleid, MechanicType = mechanictype})
	else
	
		player:Say( "I can't make that vehicle!")
	end
	
	self.parent:close()
end

function AutoTab:FillList()
	
	if self.tabType == nil then return end
	
	local AllScripts = getScriptManager():getAllVehicleScripts()
	local v
	
	for i=1, AllScripts:size() do
		
		v = AllScripts:get( i-1)
		
		if UG_Automaker.VehicleBlackList( v:getName()) == false and string.find( v:getName(), "Smashed") == nil and string.find( v:getName(), "Burnt") == nil and string.find( v:getName(), "shipwreck") == nil then
			
			local mt = v:getMechanicType()  -- Script:getMechanicType()    1=standard 2=heavy duty 3=sports	
			local Vehicle
			if mt == 1 and self.tabType == "Standard Models" then
			
				Vehicle = self.shopItems:addItem( v:getName())
				Vehicle.vID = v:getFullName()
			elseif mt == 2 and self.tabType == "Heavy Duty Models" then
			
				Vehicle = self.shopItems:addItem( v:getName())
				Vehicle.vID = v:getFullName()
			elseif mt == 3 and self.tabType == "Sport Models" then
			
				Vehicle = self.shopItems:addItem( v:getName())
				Vehicle.vID = v:getFullName()
			end		
		end
	end
	
	self.shopItems.selected = 1
	self.previewPanel.javaObject:fromLua2("setVehicleScript", "previewVeh", self.shopItems.items[ self.shopItems.selected].vID)
end

function AutoTab:FillDescription( mechanictype)

	local player = getPlayer()
	local PlayerInv = player:getInventory()
	local requirements = UG_Automaker.getMaterialReq( mechanictype)
	local mechanicReq, metalworkReq, electricalReq = UG_Automaker.getSkillReq( player, mechanictype)
	local materialOnGround = buildUtil.checkMaterialOnGround( player:getSquare())
	local description = ""
	
	local totalMetalSheets = materialOnGround["SheetMetal"]
	if totalMetalSheets == nil then totalMetalSheets = 0 end
	totalMetalSheets = totalMetalSheets + PlayerInv:getCountTypeRecurse("SheetMetal")
	
	if totalMetalSheets < requirements["SheetMetal"] then
		description = description .. " <RGB:1,0,0> Metal Sheets " .. tostring( totalMetalSheets) .. "/" .. tostring( requirements["SheetMetal"])
	else
		description = description .. " <RGB:0,1,0> Metal Sheets " .. tostring( totalMetalSheets) .. "/" .. tostring( requirements["SheetMetal"])
	end

	
	local totalMetalBars = materialOnGround["MetalBar"]
	if totalMetalBars == nil then totalMetalBars = 0 end
	totalMetalBars = totalMetalBars + PlayerInv:getCountTypeRecurse("MetalBar")
	
	if totalMetalBars < requirements["MetalBar"] then
		description = description .. " <LINE> <RGB:1,0,0> Metal Bars " .. tostring( totalMetalBars) .. "/" .. tostring( requirements["MetalBar"])
	else
		description = description .. " <LINE> <RGB:0,1,0> Metal Bars " .. tostring( totalMetalBars) .. "/" .. tostring( requirements["MetalBar"])
	end

	
	local totalScrapElectronics = materialOnGround["ElectronicsScrap"]
	if totalScrapElectronics == nil then totalScrapElectronics = 0 end
	totalScrapElectronics = totalScrapElectronics + PlayerInv:getCountTypeRecurse("ElectronicsScrap")
	
	if totalScrapElectronics < requirements["ElectronicsScrap"] then
		description = description .. " <LINE> <RGB:1,0,0> Scrap Electronics " .. tostring( totalScrapElectronics) .. "/" .. tostring( requirements["ElectronicsScrap"])
	else
		description = description .. " <LINE> <RGB:0,1,0> Scrap Electronics " .. tostring( totalScrapElectronics) .. "/" .. tostring( requirements["ElectronicsScrap"])
	end	

	
	local totalElectricalWire = materialOnGround["ElectricWire"]
	if totalElectricalWire == nil then totalElectricalWire = 0 end
	totalElectricalWire = totalElectricalWire + PlayerInv:getCountTypeRecurse("ElectricWire")
	
	if totalElectricalWire < requirements["ElectricWire"] then
		description = description .. " <LINE> <RGB:1,0,0> Electrical Wire " .. tostring( totalElectricalWire) .. "/" .. tostring( requirements["ElectricWire"])
	else
		description = description .. " <LINE> <RGB:0,1,0> Electrical Wire " .. tostring( totalElectricalWire) .. "/" .. tostring( requirements["ElectricWire"])
	end

	
	local totalEngineParts = materialOnGround["EngineParts"]
	if totalEngineParts == nil then totalEngineParts = 0 end
	totalEngineParts = totalEngineParts + PlayerInv:getCountTypeRecurse("EngineParts")

	if totalEngineParts < requirements["EngineParts"] then
		description = description .. " <LINE> <RGB:1,0,0> Engine Parts " .. tostring( totalEngineParts) .. "/" .. tostring( requirements["EngineParts"])
	else
		description = description .. " <LINE> <RGB:0,1,0> Engine Parts " .. tostring( totalEngineParts) .. "/" .. tostring( requirements["EngineParts"])
	end
	
	--skills requirements
	--, metalworkReq, electricalReq
	if player:getPerkLevel( Perks.Mechanics) < mechanicReq then
		description = description .. " <LINE> <RGB:1,0,0> Mechanics " .. tostring( player:getPerkLevel( Perks.Mechanics)) .. "/" .. tostring( mechanicReq)
	else
		description = description .. " <LINE> <RGB:0,1,0> Mechanics " .. tostring( player:getPerkLevel( Perks.Mechanics)) .. "/" .. tostring( mechanicReq)
	end
	
	if player:getPerkLevel( Perks.MetalWelding) < metalworkReq then
		description = description .. " <RGB:1,0,0>  Metalworking " .. tostring( player:getPerkLevel( Perks.MetalWelding)) .. "/" .. tostring( metalworkReq)
	else
		description = description .. " <RGB:0,1,0>  Metalworking " .. tostring( player:getPerkLevel( Perks.MetalWelding)) .. "/" .. tostring( metalworkReq)
	end

	if player:getPerkLevel( Perks.Electricity) < electricalReq  then
		description = description .. " <RGB:1,0,0>  Electrical " .. tostring( player:getPerkLevel( Perks.Electricity)) .. "/" .. tostring( electricalReq)
	else
		description = description .. " <RGB:0,1,0>  Electrical " .. tostring( player:getPerkLevel( Perks.Electricity)) .. "/" .. tostring( electricalReq)
	end
	
	--Recipe knowledge
	if mechanictype == 1 then
		
		if player:getKnownRecipes():contains("Automaker Basics") == false then
			description = description .. " <LINE> <RGB:1,0,0> Recipe: Automaker Basics"
		else
			description = description .. " <LINE> <RGB:0,1,0> Recipe: Automaker Basics"
		end
	elseif mechanictype == 2 then

		if player:getKnownRecipes():contains("Automaker Intermediate") == false then
			description = description .. " <LINE> <RGB:1,0,0> Recipe: Automaker Intermediate"
		else
			description = description .. " <LINE> <RGB:0,1,0> Recipe: Automaker Intermediate"
		end
	elseif mechanictype == 3 then

		if player:getKnownRecipes():contains("Automaker Expert") == false then
			description = description .. " <LINE> <RGB:1,0,0> Recipe: Automaker Expert"
		else
			description = description .. " <LINE> <RGB:0,1,0> Recipe: Automaker Expert"
		end
	end
	
	-- if not UG_Automaker.canBuild( player, mechanictype) then
		-- description = description .. " <LINE> <RGC:1,0,0> Status"
	-- else
		-- description = description .. " <LINE> <RGC:0,1,0> Status"
	-- end

	self.descriptionPanel:setText( description)
	
end

function AutoTab:new (x, y, width, height)
    local o = {};
    o = ISPanelJoypad:new(x, y, width, height);
    setmetatable(o, self);
    self.__index = self;
    o:noBackground();
    self.parent = o;
    return o;
end