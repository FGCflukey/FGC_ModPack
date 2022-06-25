require ("TimedActions/ISBaseTimedAction");

LGIdentifySeedAction = ISBaseTimedAction:derive("LGIdentifySeedAction");

function LGIdentifySeedAction:isValid()
	return ((self.character:getInventory():contains("UnknownSeed")) or (self.character:getInventory():contains("UnknownSeed") and self.character:getInventory():contains("SeedBook")));
end

function LGIdentifySeedAction:update()
    self.item:setJobDelta(self:getJobDelta());
end

function LGIdentifySeedAction:start()
	self.item:setJobType(getText("ContextMenu_Identifying"));
    self.item:setJobDelta(0.0);
	if self.character:getPrimaryHandItem() ~= nil and self.character:getPrimaryHandItem():getType() == "SeedBook" and self.character:getDescriptor():getProfession() ~= "farmer" then
		local sbook = self.character:getInventory():getItemFromType("SeedBook")
		self:setAnimVariable("ReadType", "book")
		self:setActionAnim(CharacterActionAnims.Read);
		self:setOverrideHandModels(nil, sbook);
		self.character:setReading(true)
	end
end


function LGIdentifySeedAction:stop()
	ISBaseTimedAction.stop(self);
	if self.character:getPrimaryHandItem() ~= nil and self.character:getPrimaryHandItem():getType() == "SeedBook" and self.character:getDescriptor():getProfession() ~= "farmer" then
		self.character:setReading(false);
	end
	self.item:setJobDelta(0.0);
end

function LGIdentifySeedAction:perform()
	if self.character:getPrimaryHandItem() ~= nil and self.character:getPrimaryHandItem():getType() == "SeedBook" and self.character:getDescriptor():getProfession() ~= "farmer" then
		self.character:setReading(false);
	end
    ISBaseTimedAction.perform(self);
	self.item:setJobDelta(0.0);
	if self.character:getInventory():contains("UnknownSeed") then
		for i=1, 1 do
			if self.character:getSecondaryHandItem() ~= nil and self.character:getSecondaryHandItem():getType() == self.item:getType() then
				self.character:setSecondaryHandItem(nil);
				self.character:getInventory():Remove("UnknownSeed");
			end
		end
		local seed = nil;
		local luckyseedchance = ZombRand(11);
		if luckyseedchance == 10 then
			local seednumber = ZombRand(11);
			if seednumber == 0 then
				seed = "legourmetfarming.LemonSeed";
			elseif seednumber == 1 then
				seed = "legourmetfarming.OrangeSeed";
			elseif seednumber == 2 then
				seed = "legourmetfarming.AppleSeed";
			elseif seednumber == 3 then
				seed = "legourmetfarming.PeachSeed";
			elseif seednumber == 4 then
				seed = "legourmetfarming.BananaSeed";
			elseif seednumber == 5 then
				seed = "legourmetfarming.CherrySeed";
			elseif seednumber == 6 then
				seed = "legourmetfarming.LimeSeed";
			elseif seednumber == 7 then
				seed = "legourmetfarming.AvocadoSeed";
			elseif seednumber == 8 then
				seed = "legourmetfarming.PearSeed";
			elseif seednumber == 9 then
				seed = "legourmetfarming.MangoSeed";
			elseif seednumber == 10 then
				seed = "legourmetfarming.GrapeFruitSeed";
			end
		else
			local seednumber = ZombRand(37);
			if seednumber == 0 then
				seed = "legourmetfarming.RiceSeed";
			elseif seednumber == 1 then
				seed = "legourmetfarming.BeanSeed";
			elseif seednumber == 2 then
				seed = "legourmetfarming.CornSeed";
			elseif seednumber == 3 then
				seed = "legourmetfarming.BellPepperSeed";
			elseif seednumber == 4 then
				seed = "legourmetfarming.EggplantSeed";
			elseif seednumber == 5 then
				seed = "legourmetfarming.GrapeSeed";
			elseif seednumber == 6 then
				seed = "legourmetfarming.LeekSeed";
			elseif seednumber == 7 then
				seed = "legourmetfarming.LettuceSeed";
			elseif seednumber == 8 then
				seed = "legourmetfarming.OnionSeed";
			elseif seednumber == 9 then
				seed = "legourmetfarming.PeanutSeed";
			elseif seednumber == 10 then
				seed = "legourmetfarming.PumpkinSeed";
			elseif seednumber == 11 then
				seed = "legourmetfarming.WatermelonSeed";
			elseif seednumber == 12 then
				seed = "legourmetfarming.ZucchiniSeed";
			elseif seednumber == 13 then
				seed = "farming.CarrotSeed";
			elseif seednumber == 14 then
				seed = "farming.BroccoliSeed";
			elseif seednumber == 15 then
				seed = "farming.RedRadishSeed";
			elseif seednumber == 16 then
				seed = "farming.StrewberrieSeed";
			elseif seednumber == 17 then
				seed = "farming.TomatoSeed";
			elseif seednumber == 18 then
				seed = "farming.PotatoSeed";
			elseif seednumber == 19 then
				seed = "farming.CabbageSeed";
			elseif seednumber == 20 then
				seed = "legourmetfarming.LemonSeed";
			elseif seednumber == 21 then
				seed = "legourmetfarming.OrangeSeed";
			elseif seednumber == 22 then
				seed = "legourmetfarming.AppleSeed";
			elseif seednumber == 23 then
				seed = "legourmetfarming.PeachSeed";
			elseif seednumber == 24 then
				seed = "legourmetfarming.BananaSeed";
			elseif seednumber == 25 then
				seed = "legourmetfarming.CherrySeed";
			elseif seednumber == 26 then
				seed = "legourmetfarming.PineappleSeed";
			elseif seednumber == 27 then
				seed = "legourmetfarming.LimeSeed";
			elseif seednumber == 28 then
				seed = "legourmetfarming.AvocadoSeed";
			elseif seednumber == 29 then
				seed = "legourmetfarming.CafeSeed";
			elseif seednumber == 30 then
				seed = "legourmetfarming.ChiliSeed";
			elseif seednumber == 31 then
				seed = "legourmetfarming.WheatSeed";
			elseif seednumber == 32 then
				seed = "legourmetfarming.SugarcaneSeed";
			elseif seednumber == 33 then
				seed = "legourmetfarming.SunFlowerSeed";
			elseif seednumber == 34 then
				seed = "legourmetfarming.TobaccoSeed";
			elseif seednumber == 35 then
				seed = "legourmetfarming.JalapenoSeed";
			elseif seednumber == 36 then
				seed = "legourmetfarming.HabaneroSeed";
			end
		end
		if seed ~= nil then
			self.character:setHaloNote("**** " .. getText("ContextMenu_identifyComplete") .. " ****", 160,160,160,300);
			self.character:getInventory():AddItem(seed);
		end
	end

end

function LGIdentifySeedAction:new(character, item, time)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o.character = character;
	o.item = item;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time;
	return o;
end