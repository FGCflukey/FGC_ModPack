require "TimedActions/ISBaseTimedAction"

ISDissectCorpseAction = ISBaseTimedAction:derive("ISDissectCorpseAction");

function ISDissectCorpseAction:isValid()
    if self.corpseBody:getStaticMovingObjectIndex() < 0 then
        return false
    end
	if not self.Knife then
        self.Knife = self.character:getPrimaryHandItem();
    end
    return self.character:getInventory():contains(self.Knife);
end

function ISDissectCorpseAction:update()
--	self.character:setIgnoreMovementForDirection(false)
	self.character:faceThisObject(self.corpseBody)
--	self.character:setIgnoreMovementForDirection(true)
	
	local AttackDelayUse = self.hitmoment* self.numFrames
	if self.spriteFrame <= AttackDelayUse and self.character:getSpriteDef():getFrame() >= AttackDelayUse then
		self:useEndurance()
		
		print(self.knife:getType());
		
--		if self.knife:getType() == "Axe" or self.knife:getType() == "HandAxe" then
		if self.knife:getTags():contains("ChopTree") then
			if not self.character:getEmitter():isPlaying(self.sound) then
				self.sound = self.character:getEmitter():playSound("DissectCorpseAxe", true);
			end
--		elseif self.knife:getType() == "KitchenKnife" or self.knife:getType() == "HuntingKnife" then
		elseif self.knife:getTags():contains("SharpKnife") then
			if not self.character:getEmitter():isPlaying(self.sound) then
				self.sound = self.character:getEmitter():playSound("DissectCorpseKnives", true);
			end
		else
			self.character:getSpriteDef():setFrameSpeedPerFrame(0.0001);
		end
	end	
	self.spriteFrame = self.character:getSpriteDef():getFrame()
    self.corpse:setJobDelta(self:getJobDelta());
end

function ISDissectCorpseAction:start()
--	self.character:SetAnimFrame(0, false)
--    self.spriteFrame = self.character:getSpriteDef():getFrame();
--	self.character:PlayAnim(self.animation);
--	self.numFrames = self.character:getSpriteDef():getFrameCount();
--	self.perFrame = self.numFrames / 60 / 1.8;
--	self.character:getSpriteDef():setFrameSpeedPerFrame(self.perFrame * 2);

--    self.corpse:setJobType(getText("ContextMenu_Grab"));
	self:setActionAnim("Loot");
	self:setAnimVariable("LootPosition", "Low");
	self.character:reportEvent("EventLootItem");
end

function ISDissectCorpseAction:stop()
--	if self.character:getPrimaryHandItem() and self.character:getPrimaryHandItem() == self.axe then
--		self.character:PlayAnimUnlooped("Attack_" .. self.axe:getSwingAnim())
--	else
		self.character:PlayAnim("Idle")
--	end
	self.character:setIgnoreMovementForDirection(false)
    ISBaseTimedAction.stop(self);
end

function ISDissectCorpseAction:perform()
	local CorpseBodyItem = self.corpseBody:getContainer():getItems();
	for i=0,CorpseBodyItem:size()-1 do
--		self.corpseBody:getSquare():AddWorldInventoryItem( CorpseBodyItem:get(i) ,0,0,0);
	end

-- nope sorry, no free xp here
--	if self.knife:getType() == "Axe" or self.knife:getType() == "HandAxe" then
--	if self.knife:getTags():contains("ChopTree") then
--		self.character:getXp():AddXP(Perks.BladeMaintenance, 1)
--	else
--		self.character:getXp():AddXP(Perks.Doctor, 2);
--	end

	local CompostHours = SandboxOptions.getInstance():getCompostHours();
	local ZombieMeat = nil;
	for i=1,10 do
		ZombieMeat = instanceItem("Base.ZombieMeat");
--		ZombieMeat:setAge(ZombieMeat:getOffAgeMax());
		ZombieMeat:setAge( 0.0);
		ZombieMeat:setHungChange(-0.5001);
--		ZombieMeat:setCompostTime(40000);
		ZombieMeat:setCompostTime(0.8 * CompostHours);
		if self.character:getInventory():getCapacityWeight()+ZombieMeat:getActualWeight() > 50 then
			self.character:getSquare():AddWorldInventoryItem( ZombieMeat ,0.5,0.5,0);
		else
			self.character:getInventory():AddItem(ZombieMeat);
		end
	end
	
	self.corpseBody:getSquare():removeCorpse(self.corpseBody, false);

    local pdata = getPlayerData(self.character:getPlayerNum());
    if pdata ~= nil then
--        pdata.playerInventory:refreshBackpacks();
--        pdata.lootInventory:refreshBackpacks();
    end
	
		self.character:getSpriteDef():setFrameSpeedPerFrame(self.perFrame * 2)
		self.character:PlayAnimUnlooped(self.animation);

    -- needed to remove from queue / start next.
    ISBaseTimedAction.perform(self);
end

function ISDissectCorpseAction:useEndurance()
--	if self.knife:isUseEndurance() then

--	end
end

function ISDissectCorpseAction:new (character, corpse, knife)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.character = character;
    o.corpse = corpse:getItem();
    o.corpseBody = corpse;
    o.stopOnWalk = true;
    o.stopOnRun = true;
	o.stopOnAim = true;
	o.knife = knife;
	o.numFrames = 0;
	o.perFrame = 0;
--	o.sound = "DissectCorpseAxe";
--	o.spriteFrame = 0;
--	if knife:getType() == "Axe" or knife:getType() == "HandAxe" or knife:getType() == "WoodAxe" then
--	if knife:getType() == "Axe" or knife:getType() == "HandAxe" then
	if knife:getTags():contains("ChopTree") then
		o.sound = "DissectCorpseAxe";
		o.spriteFrame = 0;
		o.maxTime = 150;
--		o.animation = "Attack_Floor_Bat";
		o.animation = "Bob_AttackFloorBat";
		o.hitmoment = 0.2;
	else
		o.sound = "DissectCorpseKnives";
		o.spriteFrame = 0;
		o.maxTime = 200;
--		o.animation = "AttackFloor_Stab";
		o.animation = "Bob_AttackFloorStab";
		o.hitmoment = 0.5;
	end
    if character:getAccessLevel() ~= "None" then
        o.maxTime = 1;
    end
    return o
end
