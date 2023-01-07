ISTree = ISBuildingObject:derive('ISTree')

function ISTree:create(x, y, z, north, sprite, overlaySprite)
  local cell = getWorld():getCell()
  self.sq = cell:getGridSquare(x, y, z)
  
  self.javaObject = IsoTree.new(self.sq, sprite)
  
  if (sprite == 'e_dogwood_1_2')
  then
  self.javaObject:setOverlaySprite('e_dogwood_1_10')
  end
  
  if (sprite == 'e_cockspurhawthorn_1_2')
  then 
  self.javaObject:setOverlaySprite('e_cockspurhawthorn_1_10')
  end
  
  
  self.sq:AddSpecialObject(self.javaObject)
  
  --if (sprite == 'e_dogwood_1_2')
  --then
  --self.javaObject = IsoTree.new(self.sq, 'e_dogwood_1_10')
 -- self.sq:AddSpecialObject(self.javaObject)
  --end
  
  
  
  
  buildUtil.consumeMaterial(self)
  self.javaObject:transmitCompleteItemToServer()

	

return overlayMap
end


function ISTree:isValid(square)
  if not ISBuildingObject.isValid(self, square) then
    return false
  end
  return true
end

function ISTree:render(x, y, z, square)
  ISBuildingObject.render(self, x, y, z, square)
end

function ISTree:new(sprite, northSprite, player)
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
  o.maxTime = 500
  o.overlaySprite = 'e_dogwood_1_10'

  

  return o
end

