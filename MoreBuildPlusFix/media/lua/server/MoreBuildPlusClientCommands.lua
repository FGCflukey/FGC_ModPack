MoreBuildPlusClientCommands = {}
local BuildCommands = {}
MoreBuildPlusClientCommands.Lightpoles = {}
BuildCommands.object = {}

MoreBuildPlusClientCommands.wantNoise = getDebug()
local noise = function(msg)
  if (MoreBuildPlusClientCommands.wantNoise) then
    print('ClientCommand: ' .. msg)
  end
end

local getThumpableElectricLight = function(x, y, z)
  local gs = getCell():getGridSquare(x, y, z)
  if not gs then
    return nil
  end
  for i = 0, gs:getSpecialObjects():size() - 1 do
    local o = gs:getSpecialObjects():get(i)
    if o and instanceof(o, 'IsoThumpable') then
      if not o:haveFuel() then
        if o:getModData()['IsLighting'] then
          return o
        end
      end
    end
  end
  return nil
end

BuildCommands.object.toggleElectricLight = function(player, args)
  local o = getThumpableElectricLight(args.x, args.y, args.z)
  if o then
    if o:getSquare():haveElectricity() or (SandboxVars.ElecShutModifier > -1 and GameTime:getInstance():getNightsSurvived() < SandboxVars.ElecShutModifier) then
      o:toggleLightSource(not o:isLightSourceOn())
      o:sendObjectChange('lightSource')
    else
      o:toggleLightSource(false)
      o:sendObjectChange('lightSource')
    end
    if o:isLightSourceOn() then
      MoreBuildPlusClientCommands.addPole(o:getSquare())
    else
      MoreBuildPlusClientCommands.removePole(o:getSquare())
    end
  end
end

function MoreBuildPlusClientCommands.removePole(square)
  for i, v in ipairs(MoreBuildPlusClientCommands.Lightpoles) do
    if v.x == square:getX() and v.y == square:getY() and v.z == square:getZ() then
      table.remove(MoreBuildPlusClientCommands.Lightpoles, i)
      break
    end
  end
end

function MoreBuildPlusClientCommands.addPole(square)
  local Lightpole = {}
  Lightpole.x = square:getX()
  Lightpole.y = square:getY()
  Lightpole.z = square:getZ()
  table.insert(MoreBuildPlusClientCommands.Lightpoles, Lightpole)
end

MoreBuildPlusClientCommands.OnClientCommand = function(module, command, player, args)
  if BuildCommands[module] and BuildCommands[module][command] then
    local argStr = ''
    for k, v in pairs(args) do
      argStr = argStr .. ' ' .. k .. '=' .. tostring(v)
    end
    noise('received ' .. module .. ' ' .. command .. ' ' .. tostring(player) .. argStr)
    BuildCommands[module][command](player, args)
  end
end

function MoreBuildPlusClientCommands.findObject(square)
  if not square then
    return nil
  end
  for i = 0, square:getSpecialObjects():size() - 1 do
    local o = square:getSpecialObjects():get(i)
    if o and instanceof(o, 'IsoThumpable') then
      if not o:haveFuel() then
        if o:getModData()['IsLighting'] then
          return o
        end
      end
    end
  end
  return nil
end

function MoreBuildPlusClientCommands.checkPower()
  if isClient() then
    return
  end
  local temptable = MoreBuildPlusClientCommands.Lightpoles
  for i, v in ipairs(temptable) do
    local square = getCell():getGridSquare(v.x, v.y, v.z)
    if square then
      if not (square:haveElectricity() or (SandboxVars.ElecShutModifier > -1 and GameTime:getInstance():getNightsSurvived() < SandboxVars.ElecShutModifier)) then
        local obj = MoreBuildPlusClientCommands.findObject(square)
        if obj then
          obj:toggleLightSource(false)
          obj:sendObjectChange('lightSource')
          MoreBuildPlusClientCommands.removePole(square)
        else
          MoreBuildPlusClientCommands.removePole(square)
        end
      end
    end
  end
end

MoreBuildPlusClientCommands.OnObjectAdded = function(o)
  if isClient() then
    return
  end

  if o and instanceof(o, 'IsoThumpable') then
    if not o:haveFuel() then
      if o:getModData()['IsLighting'] then
        if o:isLightSourceOn() then
          MoreBuildPlusClientCommands.addPole(o:getSquare())
        end
      end
    end
  end
end

function MoreBuildPlusClientCommands.OnDestroyIsoThumpable(o, player)
  if isClient() then
    return
  end
  if not o:getSquare() or not (o:getModData()['IsLighting']) then
    return
  end
  local sq = o:getSquare()
  MoreBuildPlusClientCommands.removePole(sq)
end

Events.EveryTenMinutes.Add(MoreBuildPlusClientCommands.checkPower)
Events.OnObjectAdded.Add(MoreBuildPlusClientCommands.OnObjectAdded)
Events.OnDestroyIsoThumpable.Add(MoreBuildPlusClientCommands.OnDestroyIsoThumpable)
Events.OnClientCommand.Add(MoreBuildPlusClientCommands.OnClientCommand)