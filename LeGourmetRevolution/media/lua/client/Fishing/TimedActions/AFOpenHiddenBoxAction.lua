require ("TimedActions/ISBaseTimedAction");

AFOpenHiddenBoxAction = ISBaseTimedAction:derive("AFOpenHiddenBoxAction");

function AFOpenHiddenBoxAction:isValid()
	return ((self.character:getPrimaryHandItem() ~= nil and self.character:getPrimaryHandItem():getType() == "HiddenBox") or (self.character:getSecondaryHandItem() ~= nil and self.character:getSecondaryHandItem():getType() == "HiddenBox"));
end

function AFOpenHiddenBoxAction:update()
    self.item:setJobDelta(self:getJobDelta());
end

function AFOpenHiddenBoxAction:start()
    --self.character:getEmitter():playSoundImpl("browselurebox", nil)
	self.character:playSound("browselurebox")
    self.item:setJobType(getText("ContextMenu_OpenHiddenBox"));
    self.item:setJobDelta(0.0);
	self:setActionAnim(CharacterActionAnims.Craft);
end


function AFOpenHiddenBoxAction:stop()
	ISBaseTimedAction.stop(self);
	self.item:setJobDelta(0.0);
end

function AFOpenHiddenBoxAction:perform()

    ISBaseTimedAction.perform(self);
	self.item:setJobDelta(0.0);

	self.character:playSound("openhiddenbox");
    local player = getPlayer()
	local plrecipe = self.character:getKnownRecipes();

	local extrachoice = nil;
	local luckvariable = ZombRand(6);
	local totalpercent = 30 + luckvariable;
	if self.character:HasTrait("Unlucky") then
		totalpercent = totalpercent - ZombRand(10,21);
	elseif self.character:HasTrait("Lucky") then
		totalpercent = totalpercent + ZombRand(10,21);
	end

	if totalpercent <= 0 then
		totalpercent = 1;
	end
	if totalpercent >= 100 then
		totalpercent = 100;
	end

    if ZombRand(1, 101) <= totalpercent then
	    self.character:Say(getText("IGUI_PlayerText_hiddenbox1"));
		local inv = self.character:getInventory();
		local iR = ZombRand(1,101);
		local items = {};
		if ZombRand(20) == 10 then
			extrachoice = true;
		else
			extrachoice = nil;
		end
		if iR <= 15 then
			items = {"AdvancedFishing.FishingAnglerBook1", 
				"AdvancedFishing.FishingAnglerBook2", 
				"AdvancedFishing.FishingAnglerBook3", 
				"AdvancedFishing.FishingAnglerBook4", 
				"AdvancedFishing.FishingAnglerBook5",
				"AdvancedFishing.FishingAnglerBook6",
				"AdvancedFishing.FishingAnglerBook7",
				"Base.LGClimatologyMag"};
		elseif iR >= 16 and iR <= 30 then
			items = {"AdvancedFishing.FishingLead1",
				"AdvancedFishing.FishingLead2",
				"AdvancedFishing.FishingLead3",
				"AdvancedFishing.SmallHookPacket",
				"AdvancedFishing.MediumHookPacket",
				"AdvancedFishing.BigHookPacket"};
		elseif iR >= 31 and iR <= 50 then
			items = {"AdvancedFishing.FishingLead1",
				"AdvancedFishing.FishingLead2",
				"AdvancedFishing.FishingLead3",
				"AdvancedFishing.SmallHookPacket",
				"AdvancedFishing.MediumHookPacket",
				"AdvancedFishing.BigHookPacket"};
		elseif iR >= 51 and iR <= 75 then
			items = {"AdvancedFishing.StormFlutterstick",
				"AdvancedFishing.RattlinRap",
				"AdvancedFishing.SwimJig",
				"AdvancedFishing.SwimJig2",
				"AdvancedFishing.SwimJig3",
				"AdvancedFishing.GTPopper",
				"AdvancedFishing.SpoonLure1",
				"AdvancedFishing.SpoonLure2",
				"AdvancedFishing.SpoonLure3",
				"AdvancedFishing.JitterBug",
				"AdvancedFishing.Crankbait",
				"AdvancedFishing.SwimShad",
				"AdvancedFishing.Alfers",
				"AdvancedFishing.Spinnerbait"};
		elseif iR >= 76 and iR <= 99 then
			items = {"AdvancedFishing.FishingLine2",
				"AdvancedFishing.FishingLine3",
				"AdvancedFishing.AcidC",
				"AdvancedFishing.Boya1",
				"AdvancedFishing.Boya2",
				"AdvancedFishing.Boya3",
				"AdvancedFishing.WormsPacket"};
		elseif iR == 100 then
			if ZombRand(2) == 1 then
				items = {"Base.Spiffo"
				};
			else
				items = {"AdvancedFishing.WilsonBall"
				};
			end
		end
		if iR ~= 100 then
			if extrachoice ~= nil then
				local rolls = ZombRand(1, #items+1);
				if rolls > 1 then
					for i = 0, rolls do
						inv:AddItem(items[ZombRand(1, #items+1)]);
					end
				else
					inv:AddItem(items[ZombRand(1, #items+1)]);
				end
			else
				inv:AddItem(items[ZombRand(1, #items+1)]);
			end
		elseif iR == 100 then
			if items[1] == "Base.Spiffo" then
				inv:AddItem(items[1]);
			elseif items[1] == "AdvancedFishing.WilsonBall" then
				if not plrecipe:contains("Wilson") then
					plrecipe:add("Wilson");
					self.character:playSound("EasterEggDiscovered", false);
					inv:AddItem(items[1]);
					local finaltext = getText("UI_DiscoverEasterEgg");
					luautils.okRichModal(finaltext, true, 320, 500);
				else
					inv:AddItem("Base.Spiffo");
				end
			end	
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
    self.prim = self.character:getPrimaryHandItem();
    self.hbox = false;
    if self.prim ~= nil and self.prim:getType() == "HiddenBox" then
        self.hbox = true;
    end
	if self.hbox then
        self.character:getPrimaryHandItem():Use();
        self.character:setPrimaryHandItem(nil);
	elseif not self.hbox then
        self.character:getSecondaryHandItem():Use();
        self.character:setSecondaryHandItem(nil);
	end
end

function AFOpenHiddenBoxAction:new(character, item, time)
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