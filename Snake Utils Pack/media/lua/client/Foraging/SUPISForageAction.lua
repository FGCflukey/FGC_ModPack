require "forageSystem";
require "TimedActions/ISBaseTimedAction";
require "Foraging/ISForageAction";
local function predicateNotBroken(_item)
	return not _item:isBroken()
end
	
function ISForageAction:start()
	self.action:setUseProgressBar(false);
	if self.discardItems then
		self:perform();
	else
		local mining = ISForageAction.CheckMining(self.itemDef);
		if mining then
			if self.itemDef.weaponHands then
				--local HavePickaxe = ISForageAction.FindPickAxe(self.character, self.itemDef);
				local PickAxeInHand = ISForageAction.CheckPickAxe(self.character, self.itemDef);
				if PickAxeInHand then
					self.pickaxe = self.character:getPrimaryHandItem()
					self:setActionAnim(CharacterActionAnims.BuildLow)
					self:setOverrideHandModels(self.pickaxe, nil)
					self.character:playSound("Mining")
				else
					self.character:Say(getText("IGUI_NeedPickaxe"));
					self:forceStop();
				end
			end
		else
			self:setActionAnim("Forage");
			self:setOverrideHandModels(nil, nil);
		end
	end;
end

function ISForageAction:forage()
	forageSystem.doFatiguePenalty(self.character);
	forageSystem.doEndurancePenalty(self.character);
	forageSystem.giveItemXP(self.character, self.itemDef, 0.75);
	--
	-- add the items to player inventory
	-- these items are generated when the icon is first spotted in self.forageIcon.itemList
	local itemsAdded = forageSystem.addOrDropItems(self.character, self.targetContainer, self.forageIcon.itemList, self.discardItems);
	local itemsTable = {};
	for i = 0, itemsAdded:size() - 1 do
		local item = itemsAdded:get(i);
		if not itemsTable[item:getFullType()] then itemsTable[item:getFullType()] = {item = item, count = 0}; end;
		itemsTable[item:getFullType()].count = itemsTable[item:getFullType()].count + 1;
	end;
	---
	local itemTexture;
	for _, itemData in pairs(itemsTable) do
		local item = itemData.item;
		local count = itemData.count;
		itemTexture = "[img="..tostring(item:getTexture():getName()).."]"
		-- if getTexture(item:getTexture():getName()) then
			-- itemTexture = "[img=media/textures/"..tostring(item:getTexture():getName()).."]";
		-- else
			-- itemTexture = "[img="..tostring(item:getTexture():getName()).."]";
		-- end;
		local counttext = "";
		if count > 1 then
			counttext = " x" ..tostring(count);
		end
		--table.insert(self.manager.haloNotes, itemTexture..item:getDisplayName() .. counttext);
		--table.insert(self.manager.haloNotes,itemTexture.."    "..count .. " " .. item:getDisplayName());
		if not self.discardItems then
			table.insert(self.manager.haloNotes, itemTexture..item:getDisplayName() .. counttext);
		end;
	end;
end

-------------------------------------------------
-------------------------------------------------
function ISForageAction:new(_forageIcon, _targetContainer, _discardItems)
	local o = {}
	setmetatable(o, self)
	self.__index = self;
	---
	o.forageIcon = _forageIcon;
	o.zoneData = _forageIcon.zoneData;
	o.manager = _forageIcon.manager;
	o.character = _forageIcon.character;
	o.itemDef = _forageIcon.itemDef;
	o.targetContainer = _targetContainer;
	o.discardItems = _discardItems;
	---
	o.miningitem = ISForageAction.CheckMining(o.itemDef)
	---
	if _discardItems then
		o.stopOnWalk = true;
		o.stopOnRun = true;
		o.maxTime = 10;
	else
		o.stopOnWalk = false;
		o.stopOnRun = true;
		if o.miningitem then
			o.maxTime = 150;
		else
			o.maxTime = 50;
		end
	end
	o.currentTime = 0;
	o.started = false;
--    if character:isTimedActionInstant() then
--        o.maxTime = 5;
--    end
	return o;
end


-------------------------------------------------
-------------------------------------------------

function ISForageAction.CheckPickAxe(chr, Def)
	local hi = chr:getPrimaryHandItem();
	if hi ~= nil then
		for i=1, #Def.weaponHands do
			if hi:getType() == Def.weaponHands[i] then
				return true;	
			end
		end
	end
	return false;
end

function ISForageAction.CheckMining(Def)
	for i=1, #Def.categories do
		if Def.categories[i] == "Mining" then
			return true;	
		end
	end
	return false;
end