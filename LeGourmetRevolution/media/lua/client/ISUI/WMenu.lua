WMenu = {};
WMenu.initContextMenu = function(player, context, worldobjects)

	local playerObj = getSpecificPlayer(player)

	local Wilson = nil;
	for i,v in ipairs(worldobjects) do
		for i=0,v:getSquare():getObjects():size()-1 do
			local object = v:getSquare():getObjects():get(i);
			if instanceof(object, "IsoObject") and
			  object:getSprite() and
			  object:getSprite():getProperties() and
			  object:getSprite():getProperties():Val("CustomName") == "Wilson" then
				Wilson = object;
				break;
			end
		end
	end

	if not Wilson then return end;
	--local stats = playerObj:getStats();
	if Wilson then--and (playerObj:getStats():getBoredom() > 25 or playerObj:getStats():getStress() > 25) then
		--local object = alfalfa;
		local bodyDamage = playerObj:getBodyDamage();
		if bodyDamage:getBoredomLevel() > 25 or bodyDamage:getUnhappynessLevel() > 25 then
			local woption = context:addOption(getText("ContextMenu_TalkW"), Wilson, WMenu.onTalkWilson, player);
		--local tooltipalf = ISWorldObjectContextMenu.addToolTip();
		--tooltipalf:setName(getText("ContextMenu_TakeAlfalfa"));
        --tooltipalf.description = tooltipalf.description .. " <RGB:1,1,1> " .. getText("ContextMenu_TakeAlfalfaTT") .. " <LINE> ";
	    --tooltipalf:setTexture("media/textures/Item_Alfalfa.png");
        --alfoption.toolTip = tooltipalf;
		end
	end
end

WMenu.onTalkWilson = function(Wilson, player)
	local playerObj = getSpecificPlayer(player)
	if Wilson and luautils.walkAdj(playerObj, Wilson:getSquare()) then
		ISTimedActionQueue.add(WTalkAction:new(playerObj, Wilson, 2500));
	end
end

Events.OnPreFillWorldObjectContextMenu.Add(WMenu.initContextMenu);