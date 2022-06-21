ISLootGraveCursor = ISBuildingObject:derive("ISLootGraveCursor")

local function predicateDigGrave(item)
    return not item:isBroken() and item:hasTag("DigGrave")
end

function ISLootGraveCursor:create(x, y, z, north, sprite)
	local square = getWorld():getCell():getGridSquare(x, y, z)
	if self.removeType == "grave" then
		self.grave = self:getRemovableObject(square);
		if self.grave ~= nil then
			AFDigRWormMenu.doModData(self.grave)
			AFDigRWormMenu.doLootGrave(self.character, square, self.grave)
		end
	end
end

function ISLootGraveCursor:isValid(square)
	if self.removeType == "grave" then
		local playerInv = self.character:getInventory()
		local hasCuttingTool = playerInv:containsEvalRecurse(predicateDigGrave)
		if self.character:getVehicle() then
			return false
		end
		if not hasCuttingTool then
			return false
		end
	end
	return self:getRemovableObject(square) ~= nil
end

function ISLootGraveCursor:render(x, y, z, square)
	if not ISLootGraveCursor.floorSprite then
		ISLootGraveCursor.floorSprite = IsoSprite.new()
		ISLootGraveCursor.floorSprite:LoadFramesNoDirPageSimple('media/ui/FloorTileCursor.png')
	end
	local r,g,b,a = 0.0,1.0,0.0,0.8
	if self:isValid(square) then
		self:getRemovableObject(square):setHighlighted(true)
		self:getRemovableObject(square):setHighlightColor(0.0, 1.0, 0.0, 1.0)
	else
		r = 1.0
		g = 0.0
	end
	ISLootGraveCursor.floorSprite:RenderGhostTileColor(x, y, z, r, g, b, a)
end

function ISLootGraveCursor:getRemovableObject(square)
	for i=1,square:getObjects():size() do
		local o = square:getObjects():get(i-1)
		if self.removeType == "grave" then
			if o:getSprite() and o:getSprite():getProperties() and o:getSprite():getProperties():Val("CustomName") == "Gravestone" then
				return o
			end
		end
	end
	return nil
end

function ISLootGraveCursor:getAPrompt()
	if self.removeType == "grave" then return getText("ContextMenu_RemoveGrass") end
	return nil
end

function ISLootGraveCursor:getLBPrompt()
	return nil
end

function ISLootGraveCursor:getRBPrompt()
	return nil
end

function ISLootGraveCursor:new(character, removeType)
	local o = ISBuildingObject.new(self)
	o:init()
	o.character = character
	o.player = character:getPlayerNum()
	o.noNeedHammer = true
	o.skipBuildAction = true
	o.isYButtonResetCursor = true
	o.removeType = removeType
	o.grave = nil;
	return o
end


