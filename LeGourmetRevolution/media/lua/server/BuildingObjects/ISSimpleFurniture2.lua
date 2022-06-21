--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

ISSimpleFurniture2 = ISBuildingObject:derive("ISSimpleFurniture2");

--************************************************************************--
--** ISSimpleFurniture2:new
--**
--************************************************************************--
function ISSimpleFurniture2:create(x, y, z, north, sprite)
	local cell = getWorld():getCell();
	self.sq = cell:getGridSquare(x, y, z);
	self.javaObject = IsoThumpable.new(cell, self.sq, sprite, north, self);
	buildUtil.setInfo(self.javaObject, self);
	buildUtil.consumeMaterial(self);
	-- the wooden wall have 100 base health + 100 per carpentry lvl
	if not self.health then
        self.javaObject:setMaxHealth(self:getHealth());
    else
        self.javaObject:setMaxHealth(self.health + self:getHealth());
    end
	self.javaObject:setHealth(self.javaObject:getMaxHealth());
	-- the sound that will be played when our door frame will be broken
	self.javaObject:setBreakSound("BreakObject");
	-- add the item to the ground
    self.sq:AddSpecialObject(self.javaObject);
	-- if IsActivatedMod("Worse Searching") then
		-- local mData = self.javaObject:getModData()
		-- mData.searched = true
	-- end
	
	self.javaObject:transmitCompleteItemToServer();
end

function ISSimpleFurniture2:removeFromGround(square)
	for i = 0, square:getSpecialObjects():size() do
		local thump = square:getSpecialObjects():get(i);
		if instanceof(thump, "IsoThumpable") then
			square:transmitRemoveItemFromSquare(thump);
		end
	end
end

function ISSimpleFurniture2:new(name, sprite, northSprite)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o:init();
	o:setSprite(sprite);
	o:setNorthSprite(northSprite);
	o.name = name;
	o.canBarricade = false;
	o.dismantable = true;
	o.blockAllTheSquare = true;
	o.canBeAlwaysPlaced = true;
	o.isCanesupport = false;
	o.buildLow = true;
	return o;
end

-- return the health of the new container, it's 100 + 100 per carpentry lvl
function ISSimpleFurniture2:getHealth()
	return 100 + buildUtil.getWoodHealth(self);
end

function ISSimpleFurniture2:isValid(square)
	if not ISBuildingObject.isValid(self, square) then return false; end
	if not buildUtil.canBePlace(self, square) then return false end
	if not square:isFreeOrMidair(true, true) then return false end
	if self.isCanesupport then
		for i = 0, square:getObjects():size() - 1 do
			local item = square:getObjects():get(i);
			-- IsoRaindrop and IsoRainSplash have no sprite/texture
			if item:getTextureName() and (luautils.stringStarts(item:getTextureName(), "floors_exterior_natural") or
					luautils.stringStarts(item:getTextureName(), "blends_natural_01")) then
				return true;
			else
				return false;
			end
		end
	end
	if self.needToBeAgainstWall then
        for i=0,square:getObjects():size()-1 do
           local obj = square:getObjects():get(i);
           if (self.north and (obj:getProperties():Is("WallN") or obj:getProperties():Is("WallNW"))) or (not self.north and (obj:getProperties():Is("WallW") or obj:getProperties():Is("WallNW"))) then
               return true;
           end
        end
		if self.south then
			if square and square:getTileInDirection(IsoDirections.S) then
				local southT = square:getTileInDirection(IsoDirections.S);
				for i=0,southT:getObjects():size()-1 do
					local obj = southT:getObjects():get(i);
					if (self.south and (obj:getProperties():Is("WallN") or obj:getProperties():Is("WallNW"))) then return true; end
				end
			end
		end
		if self.east then
			if square and square:getTileInDirection(IsoDirections.E) then
				local eastT = square:getTileInDirection(IsoDirections.E);
				for i=0,eastT:getObjects():size()-1 do
					local obj = eastT:getObjects():get(i);
					if (self.east and (obj:getProperties():Is("WallW") or obj:getProperties():Is("WallNW"))) then return true; end
				end
			end
		end
        return false;
	elseif self.needToBeAgainstWallCorner then
		local N = false;
		local S = false;
		local W = false;
		local E = false;
		local sqe = false;
		local sqs = false;
		for i=0,square:getObjects():size()-1 do
			local obj = square:getObjects():get(i);
			if obj:getProperties():Is("WallN") then
				N = true;
			end
			if obj:getProperties():Is("WallW") then
				W = true;
			end
			if self.north and ((N and W) or obj:getProperties():Is("WallNW")) then
				return true;
			end
		end
		if square and square:getTileInDirection(IsoDirections.E) then
			sqe = square:getTileInDirection(IsoDirections.E)
			for i=0,sqe:getObjects():size()-1 do
				local obj = sqe:getObjects():get(i);
				if obj:getProperties():Is("WallW") or obj:getProperties():Is("WallNW") then
					E = true;
					if self.east and N and E then
						return true;
					end
				end
			end
		end
		if square and square:getTileInDirection(IsoDirections.S) then
			sqs = square:getTileInDirection(IsoDirections.S)
			for i=0,sqs:getObjects():size()-1 do
				local obj = sqs:getObjects():get(i);
				if obj:getProperties():Is("WallN") or obj:getProperties():Is("WallNW") then
					S = true;
					if self.south and E and S then
						return true;
					end
				end
			end
		end
		if self.west and W and S then
			return true;
		end
		

		return false;
    else
        if buildUtil.stairIsBlockingPlacement( square, true ) then return false; end
    end
    return true;
end

function ISSimpleFurniture2:render(x, y, z, square)
	ISBuildingObject.render(self, x, y, z, square)
end

-- function IsActivatedMod(mod_Name)
    -- local mods = getActivatedMods();
    -- for i=0, mods:size()-1, 1 do
        -- if mods:get(i) == mod_Name then
            -- return true;
        -- end
    -- end
    -- return false;
-- end