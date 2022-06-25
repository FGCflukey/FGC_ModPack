require ("TimedActions/ISBaseTimedAction");

LGLearnRecipeAction = ISBaseTimedAction:derive("LGLearnRecipeAction");

function LGLearnRecipeAction:isValid()
	return ((self.character:getPrimaryHandItem() ~= nil and self.character:getPrimaryHandItem():getType() == (self.item:getType())) or (self.character:getSecondaryHandItem() ~= nil and self.character:getSecondaryHandItem():getType() == (self.item:getType())) and not self.character:getKnownRecipes():contains(self.recipe));
end

function LGLearnRecipeAction:update()
    self.item:setJobDelta(self:getJobDelta());
end

function LGLearnRecipeAction:start()
    self.item:setJobDelta(0.0);

	self:setAnimVariable("ReadType", "book")
	self:setActionAnim(CharacterActionAnims.Read);
	self:setOverrideHandModels(nil, self.item);
	self.character:setReading(true)
end


function LGLearnRecipeAction:stop()
	ISBaseTimedAction.stop(self);
	self.character:setReading(false);
	self.item:setJobDelta(0.0);
end

function LGLearnRecipeAction:perform()
	self.character:setReading(false);
    ISBaseTimedAction.perform(self);
	self.item:setJobDelta(0.0);

	local plrecipe = self.character:getKnownRecipes();
	if not plrecipe:contains(self.recipe) then
		plrecipe:add(self.recipe);
		self.character:setHaloNote(getText("ContextMenu_Learned") .. getText(self.Recipetranslation), 0,255,0,300);
		--luautils.okModal(getText("ContextMenu_Learned") .. getText(self.Recipetranslation), true);
	end

end

function LGLearnRecipeAction:new(character, item, time)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o.character = character;
	o.item = item;
	o.recipe = LGRSeedPacketDef[item:getType()].recipetolearn;
	o.Recipetranslation = LGRSeedPacketDef[item:getType()].translation;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time;
	return o;
end