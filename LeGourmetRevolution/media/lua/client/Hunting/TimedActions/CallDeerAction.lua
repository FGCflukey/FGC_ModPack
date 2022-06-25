require ("TimedActions/ISBaseTimedAction");

CallDeerAction = ISBaseTimedAction:derive("CallDeerAction");

function CallDeerAction:isValid()
	return (self.character:getPrimaryHandItem() ~= nil and self.character:getPrimaryHandItem():getType() == (self.item:getType()));
end

function CallDeerAction:update()
    self.item:setJobDelta(self:getJobDelta());
end

function CallDeerAction:start()
	self.item:setJobType(getText("ContextMenu_CallingDeer"));
    self.item:setJobDelta(0.0);
	self:setAnimVariable("FoodType", "Bourbon");
	self:setActionAnim(CharacterActionAnims.Drink);
	self:setOverrideHandModels(nil, self.item);
	local sndtype = {'DeerCall1','DeerCall2','DeerCall3'}
	local snd = sndtype[ZombRand(1, #sndtype+1)]
	addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), 10, 10);

	self.character:playSound(snd);
end

function CallDeerAction:stop()
	ISBaseTimedAction.stop(self);
	self.item:setJobDelta(0.0);
end

function CallDeerAction:perform()
    self.item:setJobDelta(0.0);
	if LGHuntingRocksMenu.DeerCaller.v == 1 then
		local chance = 15 - self.character:getPerkLevel(Perks.LGRHunting);
		if ZombRand(chance) == 0 then
			getSoundManager():PlayWorldSound("SpottedDeer", self.square, 0, 10, 1, true);
			local value = self.character:getPerkLevel(Perks.LGRHunting)
			if value < 2 then
				value = 2;
			end
			if LGHuntingRocksMenu.DeerCaller.t == 0 then
				LGHuntingRocksMenu.DeerCaller.t = 2;
			end
			if LGHuntingRocksMenu.DeerCaller.v == 1 then
				LGHuntingRocksMenu.DeerCaller.v = value;
			end
			addSound(self.clsquare, self.square:getX(), self.square:getY(), self.square:getZ(), 50, 10);
			self.character:getXp():AddXP(Perks.LGRHunting, 1);
			--self.character:setHaloNote(getText("Tooltip_SpottedDeer"), 0,255,0,300);
			self.character:Say(getText("ContextMenu_SpottedDeer"))
		end
	end
	ISBaseTimedAction.perform(self);
end

function CallDeerAction:new(character, item, square, time)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o.character = character;
	o.item = item;
	o.clsquare = square;
	o.square = o.clsquare:getSquare();
	o.stopOnWalk = false;
	o.stopOnRun = true;
	o.useProgressBar = false;
	o.maxTime = 150;
	return o;
end