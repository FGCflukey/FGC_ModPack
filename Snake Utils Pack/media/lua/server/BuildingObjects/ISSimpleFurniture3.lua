
ISSimpleFurniture3 = ISBuildingObject:derive("ISSimpleFurniture3");

--************************************************************************--
--** ISSimpleFurniture3:new
--**
--************************************************************************--
function ISSimpleFurniture3:create(x, y, z, north, sprite)
	local cell = getWorld():getCell();
	self.sq = cell:getGridSquare(x, y, z);
	self.javaObject = IsoThumpable.new(cell, self.sq, sprite, north, self);
	buildUtil.setInfo(self.javaObject, self);
	buildUtil.consumeMaterial(self);
	-- the wooden wall have 100 base health + 100 per carpentry lvl
	self.javaObject:setMaxHealth(self:getHealth());
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

function ISSimpleFurniture3:removeFromGround(square)
	for i = 0, square:getSpecialObjects():size() do
		local thump = square:getSpecialObjects():get(i);
		if instanceof(thump, "IsoThumpable") then
			square:transmitRemoveItemFromSquare(thump);
		end
	end
end

function ISSimpleFurniture3:new(name, sprite, northSprite)
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
	o.buildLow = true;
	return o;
end

-- return the health of the new container, it's 100 + 100 per carpentry lvl
function ISSimpleFurniture3:getHealth()
	return 100 + buildUtil.getWoodHealth(self);
end

function ISSimpleFurniture3:isValid(square)
	if not ISBuildingObject.isValid(self, square) then return false; end
	if not buildUtil.canBePlace(self, square) then return false end
	if self.needToBeAgainstWall then
        for i=0,square:getObjects():size()-1 do
           local obj = square:getObjects():get(i);
           if (self.north and obj:getProperties():Is("WallN")) or (not self.north and obj:getProperties():Is("WallW")) then
               return true;
           end
        end
        return false;
    else
        if buildUtil.stairIsBlockingPlacement( square, true ) then return false; end
    end
    return true;
end

function ISSimpleFurniture3:render(x, y, z, square)
	ISBuildingObject.render(self, x, y, z, square)
end

-- local function IsActivatedMod(mod_Name)
    -- local mods = getActivatedMods();
    -- for i=0, mods:size()-1, 1 do
        -- if mods:get(i) == mod_Name then
            -- return true;
        -- end
    -- end
    -- return false;
-- end