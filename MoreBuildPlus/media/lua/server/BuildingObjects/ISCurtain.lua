ISCurtain = ISBuildingObject:derive('ISCurtain')

function ISCurtain:create(x, y, z, north, sprite)
  local cell = getWorld():getCell()
  self.sq = cell:getGridSquare(x, y, z)
  self.javaObject = IsoCurtain.new(getCell(), self.sq, sprite, north)
  --self.javaObject:setMovedThumpable(true)
  self.sq:AddSpecialObject(self.javaObject)
  buildUtil.consumeMaterial(self)
  self.javaObject:transmitCompleteItemToServer()
end

function ISCurtain:isValid(square)
  if not ISBuildingObject.isValid(self, square) then
    return false
  end
  return true
end

function ISCurtain:render(x, y, z, square)
  ISBuildingObject.render(self, x, y, z, square)
end

function ISCurtain:new(sprite, northSprite, player)
  local o = {}
  setmetatable(o, self)
  self.__index = self
  o:init()
  o:setSprite(sprite)
  o:setNorthSprite(northSprite)
  o.player = player
  o.dismantable = true
  o.canBeAlwaysPlaced = true
  o.name = name
  o.stopOnWalk = true
  o.stopOnRun = true
  o.needToBeAgainstWall = true
  o.maxTime = 500
  return o
end