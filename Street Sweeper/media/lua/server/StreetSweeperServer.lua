if isClient() then return end

local Commands = {}
Commands.StreetSweeper = {}

local function cleanItemCatagory( item)

	--quick sanity check for the sandbox variable
	if item == nil or SandboxVars.UG_StreetSweeper.CleanCatagories == nil or SandboxVars.UG_StreetSweeper.CleanCatagories == "" then return false end

	if string.match( SandboxVars.UG_StreetSweeper.CleanCatagories, item:getDisplayCategory()) then
		return true
	else
		return false
	end
end

local function cleanItemType( item)

	--quick sanity check for the sandbox variable
	if item == nil or SandboxVars.UG_StreetSweeper.CleanTypes == nil or SandboxVars.UG_StreetSweeper.CleanTypes == "" then return false end

	if string.match( SandboxVars.UG_StreetSweeper.CleanTypes, item:getType()) then
		return true
	else
		return false
	end
end


Commands.StreetSweeper.Cleanup = function( player , args)

	if isClient() then return end
	
	--print("Keyword: Cleanup script called")
	local checksize = SandboxVars.UG_StreetSweeper.CheckSize
	local playerssquare = player:getSquare()
	local cell = player:getCell()
	
	for dy = -checksize,checksize do
		for dx = -checksize,checksize do
		
			local dsquare = cell:getGridSquare( playerssquare:getX() + dx, playerssquare:getY() + dy, playerssquare:getZ())
			
			if dsquare and not SafeHouse.getSafeHouse( dsquare) then
				
				local objectList = dsquare:getWorldObjects()
				
				if objectList ~= nil then
				
					local removelist = {}
				
					for i=0, objectList:size()-1 do
					
						local wobj = objectList:get(i)
						if wobj then
						
							local worldage = GameTime.instance:getWorldAgeHours()
							local gitem = wobj:getItem()
							
							--print("item category/type is: " .. tostring( gitem:getDisplayCategory()) .. "/" .. tostring( gitem:getType()))
							
							if gitem and (cleanItemCatagory( gitem) or cleanItemType( gitem)) then
						
								if gitem:getModData().dropTime == nil then
								
									--print("adding dropTime to object: " .. worldage)
									gitem:getModData().dropTime = worldage
									--gitem:transmitModData()  --does not need to be transmitted, this is only required on the server side
								end
								
								local itemage = worldage - gitem:getModData().dropTime
								
								--print("itemage: " .. itemage)
								--print("cleanupage: " .. SandboxVars.UG_StreetSweeper.CleanTime)

								if itemage >= SandboxVars.UG_StreetSweeper.CleanTime then
								
									--print("adding overaged item from the remove list")
									table.insert( removelist, wobj)
								end
							end
						end
					end

					for _,v in ipairs( removelist) do
					
						--print("removing overaged item from the world")
						dsquare:transmitRemoveItemFromSquare( v);
						v:removeFromWorld()
						v:removeFromSquare()
						v:setSquare(nil)
					end
					
					--just to make sure it's all cleaned up
					removelist = nil
				end
			end
		end
	end
end



local onClientCommand = function( module, command, player, args)
	
	if Commands[module] and Commands[module][command] then		
		Commands[module][command]( player, args)
	end
end

Events.OnClientCommand.Add(onClientCommand)