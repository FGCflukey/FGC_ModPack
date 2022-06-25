--Made by Snake
AFFishEnciclopediaMenu = {};

AFFishEnciclopediaMenu.doMenu = function(player, context, items)

	local pl = getSpecificPlayer(player);
	if not pl:HasTrait("Illiterate") then
	    local FEn1 = nil;
		local FEn2 = nil;
		local FEn3 = nil;
		local FEn4 = nil;
		local FEn5 = nil;
	
	    for i,v in ipairs(items) do
		    local tempitem = v;
            if not instanceof(v, "InventoryItem") then
                tempitem = v.items[1];
            end
		    if tempitem:getType() == "FishingEncyclopedia" then
			    FEn1 = tempitem;
		    end
		    if tempitem:getType() == "FishingEncyclopedia2" then
			    FEn2 = tempitem;
		    end
		    if tempitem:getType() == "FishingEncyclopedia3" then
			    FEn3 = tempitem;
		    end
		    if tempitem:getType() == "FishingEncyclopedia4" then
			    FEn4 = tempitem;
		    end
		    if tempitem:getType() == "FishingEncyclopedia5" then
			    FEn5 = tempitem;
		    end
	    end
		local option1 = "";
		local option2 = "";
		local option3 = "";
		local option4 = "";
		local option5 = "";
		local option6 = "";
	    if FEn1 then
            if FEn1:isEquipped() or
    	      (not getSpecificPlayer(player):getBodyDamage():getBodyPart(BodyPartType.Hand_R):isDeepWounded() and (getSpecificPlayer(player):getBodyDamage():getBodyPart(BodyPartType.Hand_R):getFractureTime() == 0 or getSpecificPlayer(player):getBodyDamage():getBodyPart(BodyPartType.Hand_R):getSplintFactor() > 0)) or
		      (not getSpecificPlayer(player):getBodyDamage():getBodyPart(BodyPartType.Hand_L):isDeepWounded() and (getSpecificPlayer(player):getBodyDamage():getBodyPart(BodyPartType.Hand_L):getFractureTime() == 0 or getSpecificPlayer(player):getBodyDamage():getBodyPart(BodyPartType.Hand_L):getSplintFactor() > 0)) then
				option1 = getText("SurvivalGuide_entriebass");
				option2 = getText("SurvivalGuide_entriecrappie");
				option3 = getText("SurvivalGuide_entriepanfish");
				option4 = getText("SurvivalGuide_entrieperch");
				option5 = getText("SurvivalGuide_entriecatfish");
			    local openE2 = context:addOption(getText("ContextMenu_OpenEncyclopedia"), FEn1, nil)
                local submenuE2 = context:getNew(context)
                context:addSubMenu(openE2, submenuE2)
			    submenuE2:addOption(getText("ContextMenu_bass_info") .. " " .. AFFishEnciclopediaMenu.getRecipetxt(player, "AttractBass"), FEn1, AFFishEnciclopediaMenu.FishInfo_OnCreate, player, option1);
				submenuE2:addOption(getText("ContextMenu_crappie_info") .. " " .. AFFishEnciclopediaMenu.getRecipetxt(player, "AttractCrappie"), FEn1, AFFishEnciclopediaMenu.FishInfo_OnCreate, player, option2);
				submenuE2:addOption(getText("ContextMenu_panfish_info") .. " " .. AFFishEnciclopediaMenu.getRecipetxt(player, "AttractPanfish"), FEn1, AFFishEnciclopediaMenu.FishInfo_OnCreate, player, option3);
				submenuE2:addOption(getText("ContextMenu_perch_info") .. " " .. AFFishEnciclopediaMenu.getRecipetxt(player, "AttractPerch"), FEn1, AFFishEnciclopediaMenu.FishInfo_OnCreate, player, option4);
				submenuE2:addOption(getText("ContextMenu_catfish_info") .. " " .. AFFishEnciclopediaMenu.getRecipetxt(player, "AttractCatfish"), FEn1, AFFishEnciclopediaMenu.FishInfo_OnCreate, player, option5);
		    end
	    end
	    if FEn2 then
            if FEn2:isEquipped() or
    	      (not getSpecificPlayer(player):getBodyDamage():getBodyPart(BodyPartType.Hand_R):isDeepWounded() and (getSpecificPlayer(player):getBodyDamage():getBodyPart(BodyPartType.Hand_R):getFractureTime() == 0 or getSpecificPlayer(player):getBodyDamage():getBodyPart(BodyPartType.Hand_R):getSplintFactor() > 0)) or
		      (not getSpecificPlayer(player):getBodyDamage():getBodyPart(BodyPartType.Hand_L):isDeepWounded() and (getSpecificPlayer(player):getBodyDamage():getBodyPart(BodyPartType.Hand_L):getFractureTime() == 0 or getSpecificPlayer(player):getBodyDamage():getBodyPart(BodyPartType.Hand_L):getSplintFactor() > 0)) then
				option1 = getText("SurvivalGuide_entriepike");
				option2 = getText("SurvivalGuide_entrietrout");
				option3 = getText("SurvivalGuide_entriewalleye");
				option4 = getText("SurvivalGuide_entriertrout");
				option5 = getText("SurvivalGuide_entriesalmon");
			    local openE2 = context:addOption(getText("ContextMenu_OpenEncyclopedia"), FEn2, nil)
                local submenuE2 = context:getNew(context)
                context:addSubMenu(openE2, submenuE2)
			    submenuE2:addOption(getText("ContextMenu_pike_info") .. " " .. AFFishEnciclopediaMenu.getRecipetxt(player, "AttractPike"), FEn2, AFFishEnciclopediaMenu.FishInfo_OnCreate, player, option1);
				submenuE2:addOption(getText("ContextMenu_trout_info") .. " " .. AFFishEnciclopediaMenu.getRecipetxt(player, "AttractTrout"), FEn2, AFFishEnciclopediaMenu.FishInfo_OnCreate, player, option2);
				submenuE2:addOption(getText("ContextMenu_walleye_info") .. " " .. AFFishEnciclopediaMenu.getRecipetxt(player, "AttractWalleye"), FEn2, AFFishEnciclopediaMenu.FishInfo_OnCreate, player, option3);
				submenuE2:addOption(getText("ContextMenu_rainbowtrout_info") .. " " .. AFFishEnciclopediaMenu.getRecipetxt(player, "AttractRainbowtrout"), FEn2, AFFishEnciclopediaMenu.FishInfo_OnCreate, player, option4);
				submenuE2:addOption(getText("ContextMenu_salmon_info") .. " " .. AFFishEnciclopediaMenu.getRecipetxt(player, "AttractSalmon"), FEn2, AFFishEnciclopediaMenu.FishInfo_OnCreate, player, option5);
		    end
	    end
	    if FEn3 then
            if FEn3:isEquipped() or
    	      (not getSpecificPlayer(player):getBodyDamage():getBodyPart(BodyPartType.Hand_R):isDeepWounded() and (getSpecificPlayer(player):getBodyDamage():getBodyPart(BodyPartType.Hand_R):getFractureTime() == 0 or getSpecificPlayer(player):getBodyDamage():getBodyPart(BodyPartType.Hand_R):getSplintFactor() > 0)) or
		      (not getSpecificPlayer(player):getBodyDamage():getBodyPart(BodyPartType.Hand_L):isDeepWounded() and (getSpecificPlayer(player):getBodyDamage():getBodyPart(BodyPartType.Hand_L):getFractureTime() == 0 or getSpecificPlayer(player):getBodyDamage():getBodyPart(BodyPartType.Hand_L):getSplintFactor() > 0)) then
				option1 = getText("SurvivalGuide_entriepeje");
				option2 = getText("SurvivalGuide_entriecarp");
				option3 = getText("SurvivalGuide_entriesnakehead");
				option4 = getText("SurvivalGuide_entrietucunare");
				option5 = getText("SurvivalGuide_entriepati");
			    local openE2 = context:addOption(getText("ContextMenu_OpenEncyclopedia"), FEn3, nil)
                local submenuE2 = context:getNew(context)
                context:addSubMenu(openE2, submenuE2)
			    submenuE2:addOption(getText("ContextMenu_peje_info") .. " " .. AFFishEnciclopediaMenu.getRecipetxt(player, "AttractPeje"), FEn3, AFFishEnciclopediaMenu.FishInfo_OnCreate, player, option1);
				submenuE2:addOption(getText("ContextMenu_carp_info") .. " " .. AFFishEnciclopediaMenu.getRecipetxt(player, "AttractCarp"), FEn3, AFFishEnciclopediaMenu.FishInfo_OnCreate, player, option2);
				submenuE2:addOption(getText("ContextMenu_snakehead_info") .. " " .. AFFishEnciclopediaMenu.getRecipetxt(player, "AttractSnakehead"), FEn3, AFFishEnciclopediaMenu.FishInfo_OnCreate, player, option3);
				submenuE2:addOption(getText("ContextMenu_tucunare_info") .. " " .. AFFishEnciclopediaMenu.getRecipetxt(player, "AttractTucunare"), FEn3, AFFishEnciclopediaMenu.FishInfo_OnCreate, player, option4);
				submenuE2:addOption(getText("ContextMenu_pati_info") .. " " .. AFFishEnciclopediaMenu.getRecipetxt(player, "AttractPati"), FEn3, AFFishEnciclopediaMenu.FishInfo_OnCreate, player, option5);
		    end
	    end
	    if FEn4 then
            if FEn4:isEquipped() or
    	      (not getSpecificPlayer(player):getBodyDamage():getBodyPart(BodyPartType.Hand_R):isDeepWounded() and (getSpecificPlayer(player):getBodyDamage():getBodyPart(BodyPartType.Hand_R):getFractureTime() == 0 or getSpecificPlayer(player):getBodyDamage():getBodyPart(BodyPartType.Hand_R):getSplintFactor() > 0)) or
		      (not getSpecificPlayer(player):getBodyDamage():getBodyPart(BodyPartType.Hand_L):isDeepWounded() and (getSpecificPlayer(player):getBodyDamage():getBodyPart(BodyPartType.Hand_L):getFractureTime() == 0 or getSpecificPlayer(player):getBodyDamage():getBodyPart(BodyPartType.Hand_L):getSplintFactor() > 0)) then
				option1 = getText("SurvivalGuide_entriepiranha");
				option2 = getText("SurvivalGuide_entriepalometa");
				option3 = getText("SurvivalGuide_entriepayara");
				option4 = getText("SurvivalGuide_entriedorado");
				option5 = getText("SurvivalGuide_entrietararira");
				option6 = getText("SurvivalGuide_entriearowana");
			    local openE2 = context:addOption(getText("ContextMenu_OpenEncyclopedia"), FEn4, nil)
                local submenuE2 = context:getNew(context)
                context:addSubMenu(openE2, submenuE2)
			    submenuE2:addOption(getText("ContextMenu_piranha_info") .. " " .. AFFishEnciclopediaMenu.getRecipetxt(player, "AttractPiranha"), FEn4, AFFishEnciclopediaMenu.FishInfo_OnCreate, player, option1);
				submenuE2:addOption(getText("ContextMenu_palometa_info") .. " " .. AFFishEnciclopediaMenu.getRecipetxt(player, "AttractPalometa"), FEn4, AFFishEnciclopediaMenu.FishInfo_OnCreate, player, option2);
				submenuE2:addOption(getText("ContextMenu_payara_info") .. " " .. AFFishEnciclopediaMenu.getRecipetxt(player, "AttractPayara"), FEn4, AFFishEnciclopediaMenu.FishInfo_OnCreate, player, option3);
				submenuE2:addOption(getText("ContextMenu_dorado_info") .. " " .. AFFishEnciclopediaMenu.getRecipetxt(player, "AttractDorado"), FEn4, AFFishEnciclopediaMenu.FishInfo_OnCreate, player, option4);
				submenuE2:addOption(getText("ContextMenu_tararira_info") .. " " .. AFFishEnciclopediaMenu.getRecipetxt(player, "AttractTararira"), FEn4, AFFishEnciclopediaMenu.FishInfo_OnCreate, player, option5);
				submenuE2:addOption(getText("ContextMenu_arowana_info") .. " " .. AFFishEnciclopediaMenu.getRecipetxt(player, "AttractArowana"), FEn4, AFFishEnciclopediaMenu.FishInfo_OnCreate, player, option6);
		    end
	    end
	    if FEn5 then
            if FEn5:isEquipped() or
    	      (not getSpecificPlayer(player):getBodyDamage():getBodyPart(BodyPartType.Hand_R):isDeepWounded() and (getSpecificPlayer(player):getBodyDamage():getBodyPart(BodyPartType.Hand_R):getFractureTime() == 0 or getSpecificPlayer(player):getBodyDamage():getBodyPart(BodyPartType.Hand_R):getSplintFactor() > 0)) or
		      (not getSpecificPlayer(player):getBodyDamage():getBodyPart(BodyPartType.Hand_L):isDeepWounded() and (getSpecificPlayer(player):getBodyDamage():getBodyPart(BodyPartType.Hand_L):getFractureTime() == 0 or getSpecificPlayer(player):getBodyDamage():getBodyPart(BodyPartType.Hand_L):getSplintFactor() > 0)) then
			    option1 = getText("SurvivalGuide_entriesurubi");
				option2 = getText("SurvivalGuide_entrieray");
				option3 = getText("SurvivalGuide_entriepacu");
				option4 = getText("SurvivalGuide_entriearapaima");
				option5 = getText("SurvivalGuide_entriepiraiba");
				option6 = getText("SurvivalGuide_entrietarpon");
				local openE = context:addOption(getText("ContextMenu_OpenEncyclopedia"), FEn5, nil)
                local submenuE = context:getNew(context)
                context:addSubMenu(openE, submenuE)
			    submenuE:addOption(getText("ContextMenu_surubi_info") .. " " .. AFFishEnciclopediaMenu.getRecipetxt(player, "AttractSurubi"), FEn5, AFFishEnciclopediaMenu.FishInfo_OnCreate, player, option1);
			    submenuE:addOption(getText("ContextMenu_ray_info") .. " " .. AFFishEnciclopediaMenu.getRecipetxt(player, "AttractRay"), FEn5, AFFishEnciclopediaMenu.FishInfo_OnCreate, player, option2);
			    submenuE:addOption(getText("ContextMenu_pacu_info") .. " " .. AFFishEnciclopediaMenu.getRecipetxt(player, "AttractPacu"), FEn5, AFFishEnciclopediaMenu.FishInfo_OnCreate, player, option3);
			    submenuE:addOption(getText("ContextMenu_arapaima_info") .. " " .. AFFishEnciclopediaMenu.getRecipetxt(player, "AttractArapaima"), FEn5, AFFishEnciclopediaMenu.FishInfo_OnCreate, player, option4);
			    submenuE:addOption(getText("ContextMenu_piraiba_info") .. " " .. AFFishEnciclopediaMenu.getRecipetxt(player, "AttractPiraiba"), FEn5, AFFishEnciclopediaMenu.FishInfo_OnCreate, player, option5);
			    submenuE:addOption(getText("ContextMenu_Tarpon_info") .. " " .. AFFishEnciclopediaMenu.getRecipetxt(player, "AttractTarpon"), FEn5, AFFishEnciclopediaMenu.FishInfo_OnCreate, player, option6);
		    end
	    end
	end
end
AFFishEnciclopediaMenu.FishInfo_OnCreate = function(item, playernum, option1, option2, option3, option4, option5, option6)
	if item ~= nil then
		local player = getSpecificPlayer(playernum)
		local text = option1 or option2 or option3 or option4 or option5 or option6;
		if luautils.haveToBeTransfered(player, item) then
			ISTimedActionQueue.add(ISInventoryTransferAction:new(player, item, item:getContainer(), player:getInventory()));
		end	
		if not item:isEquipped() then
			local toPrimary = true;
			if not (not getSpecificPlayer(playernum):getBodyDamage():getBodyPart(BodyPartType.Hand_R):isDeepWounded() and (getSpecificPlayer(playernum):getBodyDamage():getBodyPart(BodyPartType.Hand_R):getFractureTime() == 0 or getSpecificPlayer(playernum):getBodyDamage():getBodyPart(BodyPartType.Hand_R):getSplintFactor() > 0)) then
				toPrimary = false;
			elseif player:getPrimaryHandItem() and not player:getSecondaryHandItem() then
				if not getSpecificPlayer(playernum):getBodyDamage():getBodyPart(BodyPartType.Hand_L):isDeepWounded() and (getSpecificPlayer(playernum):getBodyDamage():getBodyPart(BodyPartType.Hand_L):getFractureTime() == 0 or getSpecificPlayer(playernum):getBodyDamage():getBodyPart(BodyPartType.Hand_L):getSplintFactor() > 0) then
					toPrimary = false;
				end
			end

			ISTimedActionQueue.add(ISEquipWeaponAction:new(player, item, 50, toPrimary, false))
		end
		ISTimedActionQueue.add(AFEnciclopedia1Action:new(player, item, time, text));
	end
end

AFFishEnciclopediaMenu.getRecipetxt = function(player, recipe)
	local recipes = getSpecificPlayer(player):getKnownRecipes();
	local text = "";
	if recipes:contains(recipe) then
		text = "(" .. getText("Tooltip_Enciclopedia_HasBeenRead") .. ")";
	end
	return text;
end


Events.OnFillInventoryObjectContextMenu.Add(AFFishEnciclopediaMenu.doMenu);