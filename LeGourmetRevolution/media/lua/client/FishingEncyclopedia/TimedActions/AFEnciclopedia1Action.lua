require ("TimedActions/ISBaseTimedAction");

AFEnciclopedia1Action = ISBaseTimedAction:derive("AFEnciclopedia1Action");

function AFEnciclopedia1Action:isValid()
	return ((self.character:getPrimaryHandItem() ~= nil and self.character:getPrimaryHandItem():getType() == (self.item:getType())) or (self.character:getSecondaryHandItem() ~= nil and self.character:getSecondaryHandItem():getType() == (self.item:getType())));
end

function AFEnciclopedia1Action:update()
    self.item:setJobDelta(self:getJobDelta());

	if self.ichthyologist or self.fishexpert then
	    self.character:getBodyDamage():setBoredomLevel(self.character:getBodyDamage():getBoredomLevel() - 0.5);
		self.character:getBodyDamage():setUnhappynessLevel(self.character:getBodyDamage():getUnhappynessLevel() - 0.15);
	else 
	    self.character:getBodyDamage():setBoredomLevel(self.character:getBodyDamage():getBoredomLevel() - 0.075);
	end
end

function AFEnciclopedia1Action:start()
    self.character:getEmitter():playSoundImpl("pageflip", nil)
    self.item:setJobType(getText("ContextMenu_searching_info"));
    self.item:setJobDelta(0.0);

    self:setAnimVariable("ReadType", "book")
    self:setActionAnim(CharacterActionAnims.Read);
    self:setOverrideHandModels(nil, self.item);
    self.character:setReading(true)
end


function AFEnciclopedia1Action:stop()
	ISBaseTimedAction.stop(self);
	self.character:setReading(false);
	self.item:setJobDelta(0.0);
end

function AFEnciclopedia1Action:perform()
	self.character:setReading(false);
    ISBaseTimedAction.perform(self);
	self.item:setJobDelta(0.0);
    if ZombRand(51) == 0 then
        self.enc1 = self.character:getPrimaryHandItem();
        self.primary = false;
        if self.enc1 ~= nil and self.enc1:getType() == (self.item:getType()) then
            self.primary = true;
        end
	    if self.primary then
            self.character:getPrimaryHandItem():Use();
            self.character:setPrimaryHandItem(nil);
			luautils.okModal(getText("UI_Object_Broken"), true);
	    elseif not self.primary then
            self.character:getSecondaryHandItem():Use();
            self.character:setSecondaryHandItem(nil);
			luautils.okModal(getText("UI_Object_Broken"), true);
	    end
		self.character:getBodyDamage():setUnhappynessLevel(self.character:getBodyDamage():getUnhappynessLevel() + 25);
	else
        self.enc = ISRichTextPanel:new(0, 0, 500, 500);
        self.enc:initialise();
        self.enc:setAnchorBottom(true);
        self.enc:setAnchorRight(true);
        self.dim = self.enc:wrapInCollapsableWindow();
        if getCore():getGameMode() == "Beginner" then
           self.dim:setX(10);
           self.dim:setY((getCore():getScreenHeight() / 2) - (self.enc.height / 2));
        else
           self.dim:setX((getCore():getScreenWidth() / 2) - (self.enc.width / 2));
           self.dim:setY((getCore():getScreenHeight() / 2) - (self.enc.height / 2));
        end
		self.dim:setTitle(self.item:getDisplayName());
        self.dim:addToUIManager();
		
        self.enc:setWidth(self.dim:getWidth());
        self.enc:setHeight(self.dim:getHeight()-16);
        self.enc:setY(16);
        local scrollBarWid = 0
        self.enc.marginRight = self.enc.marginLeft + scrollBarWid
        self.enc.autosetheight = false;
        self.enc.clip = true;
        self.enc:addScrollBars(); 
   	    self.enc.textDirty = true;
		self.enc.text = self.text;
	    self.enc:paginate();
	    self.enc:setYScroll(0);
		
		local recipes = self.character:getKnownRecipes();
		if self.text == getText("SurvivalGuide_entriebass") then
			if not recipes:contains("AttractBass") then
				recipes:add("AttractBass");
			end
		elseif self.text == getText("SurvivalGuide_entriecrappie") then
			if not recipes:contains("AttractCrappie") then
				recipes:add("AttractCrappie");
			end
		elseif self.text == getText("SurvivalGuide_entriepanfish") then
			if not recipes:contains("AttractPanfish") then
				recipes:add("AttractPanfish");
			end
		elseif self.text == getText("SurvivalGuide_entrieperch") then
			if not recipes:contains("AttractPerch") then
				recipes:add("AttractPerch");
			end
		elseif self.text == getText("SurvivalGuide_entriecatfish") then
			if not recipes:contains("AttractCatfish") then
				recipes:add("AttractCatfish");
			end
		elseif self.text == getText("SurvivalGuide_entriepike") then
			if not recipes:contains("AttractPike") then
				recipes:add("AttractPike");
			end
		elseif self.text == getText("SurvivalGuide_entrietrout") then
			if not recipes:contains("AttractTrout") then
				recipes:add("AttractTrout");
			end
		elseif self.text == getText("SurvivalGuide_entriewalleye") then
			if not recipes:contains("AttractWalleye") then
				recipes:add("AttractWalleye");
			end
		elseif self.text == getText("SurvivalGuide_entriertrout") then
			if not recipes:contains("AttractRainbowtrout") then
				recipes:add("AttractRainbowtrout");
			end
		elseif self.text == getText("SurvivalGuide_entriesalmon") then
			if not recipes:contains("AttractSalmon") then
				recipes:add("AttractSalmon");
			end
		elseif self.text == getText("SurvivalGuide_entriepeje") then
			if not recipes:contains("AttractPeje") then
				recipes:add("AttractPeje");
			end
		elseif self.text == getText("SurvivalGuide_entriecarp") then
			if not recipes:contains("AttractCarp") then
				recipes:add("AttractCarp");
			end
		elseif self.text == getText("SurvivalGuide_entriesnakehead") then
			if not recipes:contains("AttractSnakehead") then
				recipes:add("AttractSnakehead");
			end
		elseif self.text == getText("SurvivalGuide_entrietucunare") then
			if not recipes:contains("AttractTucunare") then
				recipes:add("AttractTucunare");
			end
		elseif self.text == getText("SurvivalGuide_entriepati") then
			if not recipes:contains("AttractPati") then
				recipes:add("AttractPati");
			end
		elseif self.text == getText("SurvivalGuide_entriepiranha") then
			if not recipes:contains("AttractPiranha") then
				recipes:add("AttractPiranha");
			end
		elseif self.text == getText("SurvivalGuide_entriepalometa") then
			if not recipes:contains("AttractPalometa") then
				recipes:add("AttractPalometa");
			end
		elseif self.text == getText("SurvivalGuide_entriepayara") then
			if not recipes:contains("AttractPayara") then
				recipes:add("AttractPayara");
			end
		elseif self.text == getText("SurvivalGuide_entriedorado") then
			if not recipes:contains("AttractDorado") then
				recipes:add("AttractDorado");
			end
		elseif self.text == getText("SurvivalGuide_entrietararira") then
			if not recipes:contains("AttractTararira") then
				recipes:add("AttractTararira");
			end
		elseif self.text == getText("SurvivalGuide_entriearowana") then
			if not recipes:contains("AttractArowana") then
				recipes:add("AttractArowana");
			end
		elseif self.text == getText("SurvivalGuide_entriesurubi") then
			if not recipes:contains("AttractSurubi") then
				recipes:add("AttractSurubi");
			end
		elseif self.text == getText("SurvivalGuide_entrieray") then
			if not recipes:contains("AttractRay") then
				recipes:add("AttractRay");
			end
		elseif self.text == getText("SurvivalGuide_entriepacu") then
			if not recipes:contains("AttractPacu") then
				recipes:add("AttractPacu");
			end
		elseif self.text == getText("SurvivalGuide_entriearapaima") then
			if not recipes:contains("AttractArapaima") then
				recipes:add("AttractArapaima");
			end
		elseif self.text == getText("SurvivalGuide_entriepiraiba") then
			if not recipes:contains("AttractPiraiba") then
				recipes:add("AttractPiraiba");
			end
		elseif self.text == getText("SurvivalGuide_entrietarpon") then
			if not recipes:contains("AttractTarpon") then
				recipes:add("AttractTarpon");
			end
		end
		
		if recipes:contains("AttractBass") and
		  recipes:contains("AttractCrappie") and
		  recipes:contains("AttractPanfish") and
		  recipes:contains("AttractPerch") and
		  recipes:contains("AttractCatfish") and
		  recipes:contains("AttractPike") and
		  recipes:contains("AttractTrout") and
		  recipes:contains("AttractWalleye") and
		  recipes:contains("AttractRainbowtrout") and
		  recipes:contains("AttractSalmon") and
		  recipes:contains("AttractPeje") and
		  recipes:contains("AttractCarp") and
		  recipes:contains("AttractSnakehead") and
		  recipes:contains("AttractTucunare") and
		  recipes:contains("AttractPati") and
		  recipes:contains("AttractPiranha") and
		  recipes:contains("AttractPalometa") and
		  recipes:contains("AttractPayara") and
		  recipes:contains("AttractDorado") and
		  recipes:contains("AttractTararira") and
		  recipes:contains("AttractArowana") and
		  recipes:contains("AttractSurubi") and
		  recipes:contains("AttractRay") and
		  recipes:contains("AttractPacu") and
		  recipes:contains("AttractArapaima") and
		  recipes:contains("AttractPiraiba") and
		  recipes:contains("AttractTarpon") then
		  
			if not recipes:contains("Wilson") then
				recipes:add("Wilson");
				self.character:playSound("EasterEgg");
				self.character:getInventory():AddItem("AdvancedFishing.WilsonBall");
				local finaltext = getText("UI_DiscoverEasterEgg");
				luautils.okRichModal(finaltext, true, 320, 500);
			end
		end
	end
end

function AFEnciclopedia1Action:new(character, item, time, text)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o.character = character;
	o.item = item;
	o.text = text;
	o.ichthyologist = character:HasTrait("ichthyologist");
	o.fishexpert = character:HasTrait("FishExpert");
	o.stopOnWalk = false;
	o.stopOnRun = true;
	o.maxTime = 250;
	if character:HasTrait("FastReader") then
		o.maxTime = o.maxTime - 50
	end
	if character:HasTrait("SlowReader") then
		o.maxTime = o.maxTime + 150
	end
	if time then
        o.maxTime = time;
    end
	return o;
end