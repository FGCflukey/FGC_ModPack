ISHuntTreeCursor = ISBuildingObject:derive("ISHuntTreeCursor")
local huntTime = 1;
function ISHuntTreeCursor:create(x, y, z, north, sprite)
	local square = getWorld():getCell():getGridSquare(x, y, z)
	if huntTime == 0 then
		self:getCapture(square);
	end
	if self.mode and self.mode == 1 then
		LGHuntingRocksMenu.Equip(square:getTree(), self.character, self.capture)
		huntTime = 0;
	elseif self.mode and self.mode == 2 then
		LGHuntingRocksMenu.Exploreandshoot(square:getTree(), self.character, self.capture)
		huntTime = 0;
	end
end

function ISHuntTreeCursor:getCapture(square)
	if self.mode == 1 then
		local zone = ISScavengeAction.getScavengingZone(square:getTree():getX(), square:getTree():getY());
		local zonenumber = 0;
		if not zone then
			zonenumber = 100
		else
			if zone:getName() == "0" then
				zonenumber = 0
			else
				zonenumber = math.floor((tonumber(zone:getName()) / tonumber(zone:getOriginalName())) * 100);
			end
		end
		self.capture = LGHuntingRocksMenu.getcapturedata(zonenumber, getSpecificPlayer(self.character));
	elseif self.mode == 2 then
		self.capture = LGHuntingRocksMenu.getcapturedata2();
	end
end

function ISHuntTreeCursor:isValid(square)
	local scavengeZone = nil;
    if square and square:getZ() == 0 then
        local zone = square:getChunk():getScavengeZone()
        if zone and (zone:getType() == "Forest" or zone:getType() == "DeepForest") then
            scavengeZone = zone;
        end
    end
	if square:HasTree() and square:getTree():getSize() > 2 and square:DistToProper(getSpecificPlayer(self.character):getSquare()) > 5 and scavengeZone ~= nil then--(square:getZone() ~= nil and square:getZone():getType() ~= nil and square:getZone():getType() == "Forest" or square:getZone():getType() == "DeepForest") then
		-- if square:isBlockedTo(getSpecificPlayer(self.character):getCurrentSquare()) then
			-- getSpecificPlayer(self.character):Say(tostring(square:isBlockedTo(getSpecificPlayer(self.character):getCurrentSquare())))
			-- return false
		-- end
		if not square:isCanSee(self.character) then
			--getSpecificPlayer(self.character):Say(tostring(square:isCanSee(self.character)))
			return false
		end
		local zone = ISScavengeAction.getScavengingZone(square:getTree():getX(), square:getTree():getY());
		if not zone then
			zonenumber = 100
		else
			if zone:getName() == "0" then
				zonenumber = 0;
			else
				zonenumber = math.floor((tonumber(zone:getName()) / tonumber(zone:getOriginalName())) * 100);
			end
		end
		if self.mode == 1 then
			local slingshot = getSpecificPlayer(self.character):getInventory():containsTypeRecurse("Slingshot") or getSpecificPlayer(self.character):getInventory():containsTypeRecurse("Slingshot2");
			local rock = getSpecificPlayer(self.character):getInventory():containsTypeRecurse("SmallStone");
			if square:DistToProper(getSpecificPlayer(self.character):getSquare()) > 5 and zonenumber > 0 and slingshot and rock then
				return true;
			else
				return false;
			end
		end
		if self.mode == 2 then
			local rifle = getSpecificPlayer(self.character):getPrimaryHandItem() ~= nil and getSpecificPlayer(self.character):getPrimaryHandItem() == self.handitem;
			if square:DistToProper(getSpecificPlayer(self.character):getSquare()) > 8 and rifle and zonenumber == 100 then
				return true;
			else
				return false;
			end
		end
		return true;
	end
	return false;
end

function ISHuntTreeCursor:render(x, y, z, square)
	if not ISHuntTreeCursor.floorSprite then
		ISHuntTreeCursor.floorSprite = IsoSprite.new()
		ISHuntTreeCursor.floorSprite:LoadFramesNoDirPageSimple('media/ui/FloorTileCursor.png')
	end
	local r,g,b,a = 0.0,1.0,0.0,0.8
	if self:isValid(square) then
		square:getTree():setHighlighted(true)
		if self.mode == 1 then
			if not ISHuntTreeCursor.floorSprite2 then
				ISHuntTreeCursor.floorSprite2 = IsoSprite.new()
			end
			local binocular = getSpecificPlayer(self.character):getInventory():containsTypeRecurse("LgBinoculars");
			if binocular then
				ISHuntTreeCursor.floorSprite2:LoadFramesNoDirPageSimple('media/ui/FloorTileHuntGreen.png')
			else
				ISHuntTreeCursor.floorSprite2:LoadFramesNoDirPageSimple('media/ui/FloorTileHuntGreen2.png')
			end
			ISHuntTreeCursor.floorSprite2:RenderGhostTile(x, y, z)
		elseif self.mode == 2 then
			if not ISHuntTreeCursor.floorSprite2 then
				ISHuntTreeCursor.floorSprite2 = IsoSprite.new()
			end
			ISHuntTreeCursor.floorSprite2:LoadFramesNoDirPageSimple('media/ui/FloorTileHuntRifleGreen.png')
			ISHuntTreeCursor.floorSprite2:RenderGhostTile(x, y, z)		
			ISHuntTreeCursor.floorSprite2:RenderGhostTile(x, y, z)			
		end
	else
		if self.mode == 1 then
			if not ISHuntTreeCursor.floorSprite2 then
				ISHuntTreeCursor.floorSprite2 = IsoSprite.new()
			end
			ISHuntTreeCursor.floorSprite2:LoadFramesNoDirPageSimple('media/ui/FloorTileHuntRed.png')
			ISHuntTreeCursor.floorSprite2:RenderGhostTile(x, y, z)
		elseif self.mode == 2 then
			if not ISHuntTreeCursor.floorSprite2 then
				ISHuntTreeCursor.floorSprite2 = IsoSprite.new()
			end
			ISHuntTreeCursor.floorSprite2:LoadFramesNoDirPageSimple('media/ui/FloorTileHuntRifleRed.png')
			ISHuntTreeCursor.floorSprite2:RenderGhostTile(x, y, z)		
			ISHuntTreeCursor.floorSprite2:RenderGhostTile(x, y, z)	
		end
		r = 1.0
		g = 0.0
	end
	ISHuntTreeCursor.floorSprite:RenderGhostTileColor(x, y, z, r, g, b, a)
	--IsoTree.setChopTreeCursorLocation(self.player, x, y, z)
end

-- Override this to change the position the player walks to.
function ISHuntTreeCursor:walkTo(x, y, z)
	return true
end

function ISHuntTreeCursor:new(sprite, northSprite, character, capture, tree, mode, handitem)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o:init()
	o:setSprite(sprite)
	o:setNorthSprite(northSprite)
	o.character = character
	o.player = getSpecificPlayer(character):getPlayerNum()
	o.capture = capture;
	o.tree = tree;
	o.mode = mode;
	o.handitem = handitem;
	o.noNeedHammer = true
	o.skipBuildAction = true
	return o
end

