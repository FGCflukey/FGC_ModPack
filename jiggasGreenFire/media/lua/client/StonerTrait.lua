require('NPCs/MainCreationMethods');

local function DoStonerTrait()
	local stoner = TraitFactory.addTrait("Stoner", getText("UI_trait_stoner"), 2, getText("UI_trait_stonerdesc"), false);
end

--Events.OnGameBoot.Add(DoStonerTrait);
--No longer needed, work now done by MCMRecipe.lua