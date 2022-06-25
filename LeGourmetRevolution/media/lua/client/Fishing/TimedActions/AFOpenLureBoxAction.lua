require ("TimedActions/ISBaseTimedAction");

AFOpenLureBoxAction = ISBaseTimedAction:derive("AFOpenLureBoxAction");

function AFOpenLureBoxAction:isValid()
	return ((self.character:getPrimaryHandItem() ~= nil and self.character:getPrimaryHandItem():getType() == (self.item:getType())) or (self.character:getSecondaryHandItem() ~= nil and self.character:getSecondaryHandItem():getType() == (self.item:getType())));
end

function AFOpenLureBoxAction:update()
    self.item:setJobDelta(self:getJobDelta());
end

function AFOpenLureBoxAction:start()
    self.item:setJobType(getText("ContextMenu_OpenLureBox"));
    self.item:setJobDelta(0.0);
	self.character:playSound("browselurebox");
    --self.character:getEmitter():playSoundImpl("browselurebox", nil);
	self:setActionAnim(CharacterActionAnims.Craft);
end


function AFOpenLureBoxAction:stop()

	ISBaseTimedAction.stop(self);
	self.item:setJobDelta(0.0);
end

function AFOpenLureBoxAction:perform()

    self.item:setJobDelta(0.0);

	self.character:playSound("openlurebox");
    local player = getPlayer()
	local randomscratch = ZombRand(0,50);
	local extra = 0;
	if ZombRand(0,100) >= 95 then
		extra = ZombRand(1,5);
	end
    if player:HasTrait("Lucky") and player:HasTrait("Fishing") then
		randomscratch = randomscratch - 50;
		extra = extra + ZombRand(1,3);
    elseif player:HasTrait("Unlucky") and player:HasTrait("Fishing") then
		extra = extra - ZombRand(1,3);
	elseif player:HasTrait("Lucky") and not player:HasTrait("Fishing")then
		randomscratch = randomscratch - 35;
		extra = extra + ZombRand(1,3);
	elseif player:HasTrait("Fishing") and not player:HasTrait("Lucky")then
		randomscratch = randomscratch - 45;
    elseif player:HasTrait("Unlucky") and not player:HasTrait("Fishing") then
		randomscratch = randomscratch + 15;
		extra = extra - ZombRand(1,3);
    end

	if randomscratch < 0 then
	    randomscratch = 0;
	elseif randomscratch > 100 then
	    randomscratch = 100;
    end

    if randomscratch >= 50 then -- chance of getting hurt
        if ZombRand(2) == 0 then
            self.character:getBodyDamage():getBodyPart(BodyPartType.Hand_L):SetScratchedWeapon(true);
        else
            self.character:getBodyDamage():getBodyPart(BodyPartType.Hand_R):SetScratchedWeapon(true);
        end
		luautils.okModal(getText("Tooltip_HandDamage"), true);
	else
    end
	
	local number = 0;
	local ItemData = self.item:getModData();
	if not ItemData.quantity then
		if SandboxVars.OtherLoot == 1 then -- very poor
			ItemData.quantity = ZombRand(3) + extra;
		elseif SandboxVars.OtherLoot == 2 then -- poor
			ItemData.quantity = ZombRand(4) + extra;
		elseif SandboxVars.OtherLoot == 3 then -- normal
			ItemData.quantity = ZombRand(5) + extra;
		elseif SandboxVars.OtherLoot == 4 then -- abundant
			ItemData.quantity = ZombRand(6) + extra;
		elseif SandboxVars.OtherLoot == 5 then -- very abundant
			ItemData.quantity = ZombRand(7) + extra;
		end
	end
	if ItemData.quantity > 0 then
		local lureitems = {'AdvancedFishing.Crankbait','AdvancedFishing.GTPopper','AdvancedFishing.Alfers','AdvancedFishing.JitterBug','AdvancedFishing.SwimShad','AdvancedFishing.SpoonLure1','AdvancedFishing.SpoonLure3','AdvancedFishing.SpoonLure2','AdvancedFishing.Spinnerbait','AdvancedFishing.RattlinRap','AdvancedFishing.Leader','AdvancedFishing.LeaderPacket'};
		local inv = self.character:getInventory();
		number = ItemData.quantity;
		if number > 0 and number < 5 then
			self.character:Say(getText("IGUI_PlayerText_lurebox1"));
		elseif number >=5 and number < 7 then
			self.character:Say(getText("IGUI_PlayerText_lurebox1a"));
		elseif number >= 7 then
			self.character:Say(getText("IGUI_PlayerText_lurebox1b"));
		end
		if number > 1 then
			for i = 0, math.floor(ZombRandFloat(number * (2/3), number * (3/4))) do --number do
				inv:AddItem(lureitems[ZombRand(#lureitems)+1]);
			end
		else
			inv:AddItem(lureitems[ZombRand(#lureitems)+1]);
		end
	else
		local txtRandom = ZombRand(3);
		if txtRandom == 0 then
			self.character:Say(getText("IGUI_PlayerText_lurebox2"));
		elseif txtRandom == 1 then
			self.character:Say(getText("IGUI_PlayerText_lurebox2a"));
		else
			self.character:Say(getText("IGUI_PlayerText_lurebox2b"));
		end
	end

    self.caja1 = self.character:getPrimaryHandItem();
    self.senuelos = false;
    if self.caja1 ~= nil and self.caja1:getType() == (self.item:getType()) then
        self.senuelos = true;
        end
	if self.senuelos then
        self.character:getPrimaryHandItem():Use();
        self.character:setPrimaryHandItem(nil);
	elseif not self.senuelos then
        self.character:getSecondaryHandItem():Use();
        self.character:setSecondaryHandItem(nil);
	end
	
	ISBaseTimedAction.perform(self);
end

function AFOpenLureBoxAction:new(character, item, time)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o.character = character;
	o.item = item;
	o.stopOnWalk = false;
	o.stopOnRun = true;
	o.maxTime = time;
	return o;
end