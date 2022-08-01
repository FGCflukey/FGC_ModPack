function ISPlugGenerator:isValid()
    if not (self.generator:getModData()["owner"] == nil or
        self.generator:getModData()["owner"] == self.character:getUsername()) then
        sendClientCommand("GenShame", "Shame", {
            self.character:getOnlineID()
        })
    end
    return (self.generator:getModData()["owner"] == nil or
               self.generator:getModData()["owner"] ==
               self.character:getUsername()) and self.generator:getObjectIndex() ~=
               -1 and self.generator:isConnected() ~= self.plug
end

function FindNearbyPump(target)

    local square = getCell():getGridSquare(target:getX(), target:getY(),
                                           target:getZ())

    if not square then return nil end
    for dy = -5, 5 do
        for dx = -5, 5 do
            local square2 = getCell():getGridSquare(square:getX() + dx,
                                                    square:getY() + dy,
                                                    square:getZ())
            for i = 0, square2:getObjects():size() - 1 do
                local obj = square2:getObjects():get(i);
                if obj:getPipedFuelAmount() > 0 and obj:getName() ~=
                    "FuelBarrel" then return obj end
            end
        end
    end
end

function ISPlugGenerator:perform()
    self.character:stopOrTriggerSound(self.sound)
    self.generator:setConnected(self.plug);

    local pump = FindNearbyPump(self.generator)
    if pump then
        if self.plug then
            self.generator:getModData()["owner"] = self.character:getUsername()
        else
            self.generator:getModData()["owner"] = nil
        end
        self.generator:transmitModData()
    end
    ISBaseTimedAction.perform(self);
end
