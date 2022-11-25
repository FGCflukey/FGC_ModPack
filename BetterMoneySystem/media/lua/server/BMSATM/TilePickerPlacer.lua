
TilePickerPlacer = ISBuildingObject:derive("TilePickerPlacer")

function TilePickerPlacer:create(x, y, z, north, sprite)
	local square = getWorld():getCell():getGridSquare(x, y, z)

	local objectss = square:getObjects()
	if objectss:size()==0 then
		local props = ISMoveableSpriteProps.new(IsoObject.new(square, sprite):getSprite())
		props.rawWeight = 10
		props:placeMoveableInternal(square, InventoryItemFactory.CreateItem("Base.Plank"), sprite)
		return
	end

	for i=0, objectss:size() - 1 do
		if objectss:get(i):getSprite() == nil then
			break
		end
		local objectname = objectss:get(i):getSprite():getName()
		if objectname==sprite then
			break
		elseif i==objectss:size() - 1 then	
			local props = ISMoveableSpriteProps.new(IsoObject.new(square, sprite):getSprite())
			props.rawWeight = 10
			props:placeMoveableInternal(square, InventoryItemFactory.CreateItem("Base.Plank"), sprite)
			return
		end
	end
end

function TilePickerPlacer:render(x, y, z, square)
	ISBuildingObject.render(self, x, y, z, square)
end

function TilePickerPlacer:new(sprite, northSprite, character)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o:init()
	o:setSprite(sprite)
	o:setNorthSprite(northSprite)
	o.character = character
	o.player = character:getPlayerNum()
	o.noNeedHammer = true
	o.skipBuildAction = true
	o.skipWalk2 = true
	o.canBeAlwaysPlaced = true
	return o
end








