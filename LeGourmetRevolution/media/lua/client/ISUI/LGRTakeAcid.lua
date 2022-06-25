LGRTakeAcidMenu = {};

LGRTakeAcidMenu.initContextMenu = function(player, context, worldobjects)

	local playerObj = getSpecificPlayer(player)
	local item = nil;
	local hclbarrel = nil;
	local hclTank = nil;
	for _, object in ipairs(worldobjects) do
		if instanceof(object, "IsoObject") and object:getSprite() and object:getSprite():getProperties() and (object:getSprite():getProperties():Val("GroupName") == "HCL" and object:getSprite():getProperties():Val("CustomName") == "Barrel") then
			hclbarrel = object;
			break;
		end
		if instanceof(object, "IsoObject") and object:getSprite() and object:getSprite():getProperties() and (object:getSprite():getProperties():Val("GroupName") == "HCL" and object:getSprite():getProperties():Val("CustomName") == "Tank") then
			hclTank = object;
			break;
		end
	end

	if not hclbarrel and not hclTank then return end;
	local TankMultiplier = 1;
	if not hclbarrel then
		hclbarrel = hclTank
		TankMultiplier = 10;
	end
    local objectData = hclbarrel:getModData();
	
	if hclbarrel ~= nil then
		local img = "<IMAGECENTRE:media/ui/NBQImage.png>";
		if hclTank then
			img =	"<IMAGECENTRE:media/ui/NBQImage2.png>"
		end
		if not objectData.AcidContent then
			objectData.AcidContent = ZombRand(45,101) *25 * TankMultiplier;
			hclbarrel:transmitModData();
		end

		local ChargeOption = context:addOption(getText("ContextMenu_RechargeAcid"), hclbarrel, LGRTakeAcidMenu.Recharge_OnCreate, getSpecificPlayer(player), img);
		local ChargeTooltip = ISWorldObjectContextMenu.addToolTip();
		ChargeTooltip:setName(getText("ContextMenu_RechargeAcid"));
		local color = " <RGB:0,0.8,0> ";
		local inventory = getSpecificPlayer(player):getInventory();
	    if objectData.AcidContent > 0 and (inventory:contains("AcidCEmpty") or inventory:contains("AcidC")) then
			if inventory:contains("AcidCEmpty") and getSpecificPlayer(player):getInventory():getItemsFromType("AcidCEmpty") then
				color = " <RGB:0,0.8,0> ";
				ChargeOption.notAvailable = false;
			elseif inventory:contains("AcidC") then
				local tanks = getSpecificPlayer(player):getInventory():getItemsFromType("AcidC");
				for i=0, tanks:size() -1 do
					local item = tanks:get(i);
					if item:getUsedDelta() < 1 then
						ChargeOption.notAvailable = false;
						color = " <RGB:0,0.8,0> ";
						break;
					else
						ChargeOption.notAvailable = true;
						color = " <RGB:1,0,0> ";
					end
				end
			else
				ChargeOption.notAvailable = true;
				color = " <RGB:1,0,0> ";
			end
		else
			ChargeOption.notAvailable = true;
			color = " <RGB:1,0,0> ";
		end
		local text1 = " <RGB:1,1,1> " .. getText("ContextMenu_RechargeAcidTT") .. " <LINE>  <LINE> <RGB:1,1,1>" .. getText("ContextMenu_BarrelContains") .. LGRTakeAcidMenu.getAmountColor(objectData, TankMultiplier) .. tostring(objectData.AcidContent/(25*TankMultiplier)) .. "%" .. " <LINE>";
		local text2 = " <RGB:1,1,1> " .. getText("Tooltip_craft_Needs") .. ": ";
		local text3 = color .. getItemNameFromFullType("AdvancedFishing.AcidC") .. " " .. getText("ContextMenu_AcidNonFull") .. " <LINE>";
		ChargeTooltip.description = text1 .. text2 .. text3;
		if hclTank then
			ChargeTooltip:setTexture("media/ui/HCLTank.png");
		else
			ChargeTooltip:setTexture("fixtures_barco_abandonado_01_10");
		end
        ChargeOption.toolTip = ChargeTooltip;
	end
end

LGRTakeAcidMenu.Recharge_OnCreate = function(hclbarrel, player, img)
	local AcidC = nil
	local inv = player:getInventory();
	if inv:contains("AcidCEmpty") then
		local oldbottles = inv:getItemsFromType("AcidCEmpty");
		for i=0, oldbottles:size() -1 do
			local obottle = oldbottles:get(i);
			if obottle then
				inv:Remove(obottle);
				local newbottle = InventoryItemFactory.CreateItem("AdvancedFishing.AcidC");
				newbottle:setUsedDelta(0)
				inv:AddItem(newbottle);
			end
		end
	end
	local equipped = player:getPrimaryHandItem();
	if equipped and equipped:getType() == "AcidC" and equipped:getUsedDelta() < 1 then
		AcidC = equipped
	end
	if not AcidC then
		local tanks = inv:getItemsFromType("AcidC")
		local usedDelta = -1
		for i=1,tanks:size() do
			local AcidC2 = tanks:get(i-1)
			if AcidC2:getUsedDelta() < 1 and AcidC2:getUsedDelta() > usedDelta then
				AcidC = AcidC2
				usedDelta = AcidC:getUsedDelta()
			end
		end
	end
	if not AcidC then
		return
	end
	if AcidC and luautils.walkAdj(player, hclbarrel:getSquare()) then
		--ISInventoryPaneContextMenu.equipWeapon(AcidC, true, false, player:getPlayerNum())
		--ISTimedActionQueue.add(ISTakePropane:new(player, hclbarrel, AcidC, 200))
		local centered = true;
		local posX;
		local posY;
		local width = 400;
		local height = 350;
		local core = getCore();
		if centered ~= nil then
			posX = core:getScreenWidth() * 0.5 - width * 0.5;
			posY = core:getScreenHeight() * 0.5 - height * 0.5;
		end
		local image = "<H1> " .. img .. " <LINE>" .. " <TEXT> <RGB:0.98,0.55,0>" .. getText("ContextMenu_RechargeAcidWarning") .. " <LINE> <LINE> <H1>" .. getText("ContextMenu_ExtractAcid");
		player:faceLocation(hclbarrel:getX(), hclbarrel:getY());
		local modal = ISModalRichText2:new(posX, posY, width, height, image, true, nil, LGRTakeAcidMenu.onYesButtonClick2, player:getPlayerNum(), hclbarrel, AcidC);
		modal:initialise();
		modal:addToUIManager();
	end
end

function LGRTakeAcidMenu:onYesButtonClick2(button, hclbarrel, AcidC)
    if button.internal == "YES" then
		local playerObj = getSpecificPlayer(0);
		local _AcidC = AcidC;
		ISInventoryPaneContextMenu.equipWeapon(_AcidC, true, false, playerObj:getPlayerNum())
		ISTimedActionQueue.add(ISTakeAcid:new(playerObj, hclbarrel, _AcidC, 200))
    end
end

LGRTakeAcidMenu.getAmountColor = function(itemdata, TankMultiplier)
	local color = " <RGB:1,1,1> "
	if itemdata.AcidContent then
		local Content = itemdata.AcidContent/(25*TankMultiplier);
		if Content > 75 then
			color = " <RGB:0,0.8,0> "
		elseif Content > 50 then
			color = " <RGB:0.15,0.3,0.63> "
		elseif Content > 25 then
			color = " <RGB:0.8,0.8,0> "
		elseif Content > 0 then
			color = " <RGB:0.98,0.55,0> "
		elseif Content == 0 then
			color = " <RGB:1,0,0> "
		end
		return color;
	end
end
Events.OnFillWorldObjectContextMenu.Add(LGRTakeAcidMenu.initContextMenu);