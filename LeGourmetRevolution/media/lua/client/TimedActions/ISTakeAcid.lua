--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISTakeAcid = ISBaseTimedAction:derive("ISTakeAcid");
ISTakeAcid.SoundTimer = 0;
function ISTakeAcid:isValid()
	local pumpCurrent = tonumber(self.hclbarreldata.AcidContent)
	return pumpCurrent > 0
end

function ISTakeAcid:update()
	self.AcidC:setJobDelta(self:getJobDelta())
	self.character:faceLocation(self.hclbarrel:getSquare():getX(), self.hclbarrel:getSquare():getY())
	local actionCurrent = math.floor(self.itemStart + (self.itemTarget - self.itemStart) * self:getJobDelta() + 0.001)
	local itemCurrent = math.floor(self.AcidC:getUsedDelta() / self.AcidC:getUseDelta() + 0.001)
	if actionCurrent > itemCurrent then
		local pumpCurrent = tonumber(self.hclbarreldata.AcidContent)
		self.hclbarreldata.AcidContent = tonumber(pumpCurrent - (actionCurrent - itemCurrent));
		self.hclbarrel:transmitModData();

		self.AcidC:setUsedDelta(actionCurrent * self.AcidC:getUseDelta())
	end
	if ISTakeAcid.SoundTimer > 0 then
		ISTakeAcid.SoundTimer = ISTakeAcid.SoundTimer -1;
	end
	if ISTakeAcid.TalkTimer  > 0 then
		ISTakeAcid.TalkTimer  = ISTakeAcid.TalkTimer -1;
	end
	if ISTakeAcid.SoundTimer == 35 then
		self.character:playSound("FillAcidC");
	end
	if not self.hazmatsuit then
		self.character:getBodyDamage():ReduceGeneralHealth(self.character:getBodyDamage():getHealth() * 0.002);
		if ISTakeAcid.SoundTimer <= 0 then
			ISTakeAcid.SoundTimer = 75;
			self.character:playSound("AcidCl")
			if ISTakeAcid.TalkTimer == 0 then
				if ZombRand(2)== 1 then
					self.character:Say("Cough!!!")
				else
					self.character:Say("AAAAHHHGGGG!!!")
				end
				ISTakeAcid.TalkTimer = 150;
			end
			if self.gloves then
				local glove = self.character:getWornItem("Hands");
				if glove and glove:getClothingItem() then
					local cond = glove:getCondition()-1;
					glove:setCondition(cond);
					if ZombRand(2) == 0 then
						self.character:addHole(BloodBodyPartType.Hand_L);
						self.gloves = false;
					else
						self.character:addHole(BloodBodyPartType.Hand_R);
						self.gloves = false;
					end
					if cond <= 0 then
						self.gloves = false;
					end
				end
			else
				if self.rightHand and self.leftHand then
					if ZombRand(2) == 0 then
						self.rightHand:setBurned()
						self.rightHand:setBurnTime(100);
					else
						self.leftHand:setBurned()
						self.leftHand:setBurnTime(100);
					end
				end	
			end
		end
	else
		if ISTakeAcid.SoundTimer <= 0 then
			ISTakeAcid.SoundTimer = 75;
			self.character:playSound("FillAcidC");
		end
	end
	
	self.character:setMetabolicTarget(Metabolics.UsingTools);
end

function ISTakeAcid:start()
	self.AcidC:setJobType(getText("ContextMenu_RechargeAcid"))
	self.AcidC:setJobDelta(0.0)
	self:setActionAnim(CharacterActionAnims.Craft);
	self.character:playSound("FillAcidC");
	ISTakeAcid.SoundTimer = 75;
	ISTakeAcid.TalkTimer = 150;
	local pumpCurrent = tonumber(self.hclbarreldata.AcidContent);
	local itemCurrent = math.floor(self.AcidC:getUsedDelta() / self.AcidC:getUseDelta() + 0.001)
	local itemMax = math.floor(1 / self.AcidC:getUseDelta() + 0.001)
	local take = math.min(pumpCurrent, itemMax - itemCurrent)
	self.action:setTime(take * 50)
	self.itemStart = itemCurrent
	self.itemTarget = itemCurrent + take
	self.hclbarrel:transmitModData();
	local suit = self.character:getWornItem("FullSuitHead");
	local gloves = self.character:getWornItem("Hands");
	self.hazmatsuit = false;
	self.gloves = false;
	if suit and suit:getClothingItem() then
		if suit:getClothingItemName() == "HazmatSuit" then
			self.hazmatsuit = true;
		end
	end
	if gloves and gloves:getClothingItem() then
		self.gloves = true;
	end
end

function ISTakeAcid:stop()
	--self.character:playSound("RefillPropaneTankFinish")
	self.AcidC:setJobDelta(0.0)
    ISBaseTimedAction.stop(self);
end

function ISTakeAcid:perform()
	self.AcidC:setJobDelta(0.0)
	--self.character:playSound("RefillPropaneTankFinish")
	local itemCurrent = math.floor(self.AcidC:getUsedDelta() / self.AcidC:getUseDelta() + 0.001)
	if self.itemTarget > itemCurrent then
		self.AcidC:setUsedDelta(self.itemTarget * self.AcidC:getUseDelta())
		local pumpCurrent = tonumber(self.hclbarreldata.AcidContent)
		self.hclbarreldata.AcidContent = tonumber(pumpCurrent + (self.itemTarget - itemCurrent));
		
		self.hclbarrel:transmitModData();
	end
    -- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function ISTakeAcid:new(character, hclbarrel, AcidC, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
    o.hclbarrel = hclbarrel;
	o.hclbarreldata = hclbarrel:getModData();
	o.AcidC = AcidC;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time;
	o.rightHand = character:getBodyDamage():getBodyPart(BodyPartType.FromIndex(BodyPartType.ToIndex(BodyPartType.Hand_R)));
	o.leftHand = character:getBodyDamage():getBodyPart(BodyPartType.FromIndex(BodyPartType.ToIndex(BodyPartType.Hand_L)));
	return o;
end
