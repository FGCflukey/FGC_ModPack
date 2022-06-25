ISHuntPracticeCursor = ISBuildingObject:derive("ISHuntPracticeCursor")
local huntTime = 1;
function ISHuntPracticeCursor:create(x, y, z, north, sprite)
	self:hideTooltip();
	local square = getWorld():getCell():getGridSquare(x, y, z)
	if huntTime == 0 then
		self:getCapture(square);
	end
	if self.mode and self.mode == 1 then
		LGHuntingRocksMenu.EquipB(square, self.character, self.capture)
		huntTime = 0;
	end
end

function ISHuntPracticeCursor:getCapture(square)
	if self.mode == 1 then
		self.capture = "Diana";
	end
end

function ISHuntPracticeCursor:isValid(square)
	local slingshot = getSpecificPlayer(self.character):getInventory():containsTypeRecurse("Slingshot") or getSpecificPlayer(self.character):getInventory():containsTypeRecurse("Slingshot2");
	local rock = getSpecificPlayer(self.character):getInventory():containsTypeRecurse("SmallStone");
	self.tooltipTxt = false;
	for i=0, square:getObjects():size()-1 do
		local object = square:getObjects():get(i);
		if instanceof(object, "IsoObject") and
		  object:getSprite() and
		  object:getSprite():getProperties() and
		  ( object:getSprite():getProperties():Val("GroupName") == "Shooting" and object:getSprite():getProperties():Val("CustomName") == "Target") and square:DistToProper(getSpecificPlayer(self.character):getSquare()) > 5 and square:isCanSee(self.character) then
			self.tooltipTxt = true;
			if slingshot and rock then
				return true
			end
		end
	end
	return false;
end

function ISHuntPracticeCursor:render(x, y, z, square)
	if not ISHuntPracticeCursor.floorSprite then
		ISHuntPracticeCursor.floorSprite = IsoSprite.new()
		ISHuntPracticeCursor.floorSprite:LoadFramesNoDirPageSimple('media/ui/FloorTileCursor.png')
	end
	local r,g,b,a = 0.0,1.0,0.0,0.8
	if self:isValid(square) then
		--square:getTree():setHighlighted(true)
		if self.mode == 1 then
			if not ISHuntPracticeCursor.floorSprite2 then
				ISHuntPracticeCursor.floorSprite2 = IsoSprite.new()
			end
			ISHuntPracticeCursor.floorSprite2:LoadFramesNoDirPageSimple('media/ui/FloorTileHuntGreen2.png')
			ISHuntPracticeCursor.floorSprite2:RenderGhostTile(x, y, z)		
		end
	else
		if self.mode == 1 then
			if not ISHuntPracticeCursor.floorSprite2 then
				ISHuntPracticeCursor.floorSprite2 = IsoSprite.new()
			end
			ISHuntPracticeCursor.floorSprite2:LoadFramesNoDirPageSimple('media/ui/FloorTileHuntRed2.png')
			ISHuntPracticeCursor.floorSprite2:RenderGhostTile(x, y, z)
		end
		r = 1.0
		g = 0.0
	end
	ISHuntPracticeCursor.floorSprite:RenderGhostTileColor(x, y, z, r, g, b, a)
	
	self:renderTooltip();
	--IsoTree.setChopTreeCursorLocation(self.player, x, y, z)
end

-- Called by IsoCell.setDrag()
function ISHuntPracticeCursor:deactivate()
	self:hideTooltip();
end

function ISHuntPracticeCursor:hideTooltip()
	if self.tooltip then
		self.tooltip:removeFromUIManager()
		self.tooltip:setVisible(false)
		self.tooltip = nil
	end
end

function ISHuntPracticeCursor:renderTooltip()
	if not self.tooltipTxt or getSpecificPlayer(self.character):getXp():getPerkBoost(Perks.LGRHunting) >= 3 then
		self:hideTooltip();
		return;
	end
	
	if not self.tooltip then
		self.tooltip = ISWorldObjectContextMenu.addToolTip();
		self.tooltip:setVisible(true)
		self.tooltip:addToUIManager()
		self.tooltip.followMouse = not self.joyfocus
		self.tooltip.maxLineWidth = 1000
	else
		self.tooltip.description = self:doTooltipDesc();
	end
end
function ISHuntPracticeCursor:doTooltipDesc()
    local xpBoost = getSpecificPlayer(self.character):getXp():getPerkBoost(Perks.LGRHunting);
    local percentage = nil;
    if xpBoost == 1 then
        percentage = "75%";
    elseif xpBoost == 2 then
        percentage = "100%";
    elseif xpBoost == 3 then
        percentage = "125%";
    end
	return getText("Tooltip_ActualBoostLevel") .. getText("IGUI_XP_tooltipxpboost", percentage) .. " <LINE> " .. getText("Tooltip_HitsForNextLevel") .. tostring(getSpecificPlayer(self.character):getModData().Practice);
end
-- Override this to change the position the player walks to.
function ISHuntPracticeCursor:walkTo(x, y, z)
	return true
end

function ISHuntPracticeCursor:new(sprite, northSprite, character, capture, diana, mode, handitem)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o:init()
	o:setSprite(sprite)
	o:setNorthSprite(northSprite)
	o.character = character;
	o.player = getSpecificPlayer(character):getPlayerNum();
	o.capture = capture;
	o.diana = diana;
	o.mode = mode;
	o.tooltipTxt = false;
	--o.inventory = character:getInventory();
	o.handitem = handitem;
	o.noNeedHammer = true
	o.skipBuildAction = true
	return o
end

