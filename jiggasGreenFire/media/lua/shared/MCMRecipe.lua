require('NPCs/MainCreationMethods');

local function GFStarterKit(char, square)
	if SandboxVars.StarterKit then
		local bag = char:getInventory():FindAndReturn("Base.Bag_Schoolbag");
		local lighter = false;
		if not bag then
			bag = char:getInventory():AddItem("Base.Bag_Schoolbag");
		end
		if getWorld():getDifficulty() == "Easy" then
			if char:HasTrait("Smoker") and char:HasTrait("Stoner") then
				for i=1, 10 do
					bag:getItemContainer():AddItem("Greenfire.GFCigarette");
				end
				bag:getItemContainer():AddItem("Greenfire.Spliff");
				bag:getItemContainer():AddItem("Greenfire.CannabisSeed");
				if not lighter then
					bag:getItemContainer():AddItem("Base.Lighter");
					lighter = true;
				end
			elseif char:HasTrait("Smoker") and not char:HasTrait("Stoner") then
				bag:getItemContainer():AddItem("Greenfire.GFCigarettes");
				if not lighter then
					bag:getItemContainer():AddItem("Base.Lighter");
					lighter = true;
				end
			elseif not char:HasTrait("Smoker") and char:HasTrait("Stoner") then
				bag:getItemContainer():AddItem("Greenfire.Cannabis");
				bag:getItemContainer():AddItem("Greenfire.Joint");
				bag:getItemContainer():AddItem("Greenfire.CannabisSeed");
				if not lighter then
					bag:getItemContainer():AddItem("Base.Lighter");
					lighter = true;
				end
			end
			if char:HasTrait("Alcoholic") and not getActivatedMods():contains("DynamicTraits") then
				bag:getItemContainer():AddItem("Base.WhiskeyFull");
			end

		elseif getWorld():getDifficulty() == "Normal" then
			if char:HasTrait("Smoker") and char:HasTrait("Stoner") then
				for i=1, 5 do
					bag:getItemContainer():AddItem("Greenfire.GFCigarette");
				end
				bag:getItemContainer():AddItem("Greenfire.Spliff");
				bag:getItemContainer():AddItem("Greenfire.CannabisSeed");
				if not lighter then
					bag:getItemContainer():AddItem("Base.Matches");
					lighter = true;
				end
			elseif char:HasTrait("Smoker") and not char:HasTrait("Stoner") then
				for i=1, 10 do
					bag:getItemContainer():AddItem("Greenfire.GFCigarette");
				end
				if not lighter then
					bag:getItemContainer():AddItem("Base.Matches");
					lighter = true;
				end
			elseif not char:HasTrait("Smoker") and char:HasTrait("Stoner") then
				bag:getItemContainer():AddItem("Greenfire.Joint");
				bag:getItemContainer():AddItem("Greenfire.CannabisSeed");
				if not lighter then
					bag:getItemContainer():AddItem("Base.Matches");
					lighter = true;
				end
			end
			if char:HasTrait("Alcoholic") and not getActivatedMods():contains("DynamicTraits") then
				bag:getItemContainer():AddItem("Base.Wine");
				bag:getItemContainer():AddItem("Base.Corkscrew");
			end
		elseif getWorld():getDifficulty() == "Hard" then
			if char:HasTrait("Smoker") and char:HasTrait("Stoner") then
				bag:getItemContainer():AddItem("Greenfire.Spliff");
			elseif char:HasTrait("Smoker") and not char:HasTrait("Stoner") then
				bag:getItemContainer():AddItem("Greenfire.GFCigarette");
			elseif not char:HasTrait("Smoker") and char:HasTrait("Stoner") then
				bag:getItemContainer():AddItem("Greenfire.HalfJoint");
			end
			if char:HasTrait("Alcoholic") and not getActivatedMods():contains("DynamicTraits") then
				bag:getItemContainer():AddItem("Base.BeerCan");
			end
		else
			if char:HasTrait("Smoker") and char:HasTrait("Stoner") then
				bag:getItemContainer():AddItem("Greenfire.Spliff");
			elseif char:HasTrait("Smoker") and not char:HasTrait("Stoner") then
				bag:getItemContainer():AddItem("Greenfire.GFCigarette");
			elseif not char:HasTrait("Smoker") and char:HasTrait("Stoner") then
				bag:getItemContainer():AddItem("Greenfire.HalfJoint");
			end
			if char:HasTrait("Alcoholic") and not getActivatedMods():contains("DynamicTraits") then
				bag:getItemContainer():AddItem("Base.BeerCan");
			end
		end
	end
	return
end

local function initRecipes()
	TraitFactory.addTrait("Stoner", getText("UI_trait_stoner"), 2, getText("UI_trait_stonerdesc"), false);
	if not getActivatedMods():contains("DynamicTraits") and not getActivatedMods():contains("ToadTraits") then
		TraitFactory.addTrait("Alcoholic", getText("UI_trait_alcoholic"), -3, getText("UI_trait_alcoholicdesc"), false);
	end
	TraitFactory.getTrait("Stoner"):getFreeRecipes():add("Make CannaButter with Shake");
	TraitFactory.getTrait("Stoner"):getFreeRecipes():add("Make CannaButter with Kief");
	TraitFactory.getTrait("Stoner"):getFreeRecipes():add("Make CannaButter with Hashish");
	TraitFactory.getTrait("Stoner"):getFreeRecipes():add("Make Nice Crispiez");
	TraitFactory.getTrait("Stoner"):getFreeRecipes():add("Make Nice Crispiez from individual Marshmallows");
	TraitFactory.getTrait("Stoner"):getFreeRecipes():add("Make Special Brownies");
	TraitFactory.getTrait("Stoner"):getFreeRecipes():add("Make CannaButter");
	TraitFactory.getTrait("Stoner"):getFreeRecipes():add("Sift Shake");
	TraitFactory.getTrait("Gardener"):getFreeRecipes():add("Prepare Cannabis Curing Jar");
	TraitFactory.getTrait("Gardener"):getFreeRecipes():add("Prepare Half Full Cannabis Curing Jar");
	TraitFactory.getTrait("Gardener"):getFreeRecipes():add("Prepare Nearly Full Cannabis Curing Jar");
	TraitFactory.getTrait("Gardener"):getFreeRecipes():add("Prepare Full Cannabis Curing Jar");
	TraitFactory.getTrait("Gardener"):getFreeRecipes():add("Add Cannabis to Curing Jar");
	TraitFactory.getTrait("Gardener"):getFreeRecipes():add("Add More Cannabis to Curing Jar");
	TraitFactory.getTrait("Gardener"):getFreeRecipes():add("Add Two More Cannabis to Curing Jar");
	TraitFactory.getTrait("Gardener"):getFreeRecipes():add("Add Three More Cannabis to Curing Jar");
	TraitFactory.getTrait("Gardener"):getFreeRecipes():add("Fill Cannabis Curing Jar");
	TraitFactory.getTrait("Gardener"):getFreeRecipes():add("Add Two Cannabis to Half Full Curing Jar");
	TraitFactory.getTrait("Gardener"):getFreeRecipes():add("Sift Shake");
	TraitFactory.getTrait("Gardener"):getFreeRecipes():add("Trim Fresh Cannabis");
	TraitFactory.getTrait("Gardener"):getFreeRecipes():add("Trim Dry Cannabis");
	TraitFactory.getTrait("Gardener"):getFreeRecipes():add("Roll Cigar");
	TraitFactory.getTrait("Gardener"):getFreeRecipes():add("Roll Cannabis Cigar");	
	TraitFactory.getTrait("Gardener"):getFreeRecipes():add("Roll Premium Cannabis Cigar");
	TraitFactory.getTrait("Gardener"):getFreeRecipes():add("Roll Deluxe Cannabis Cigar");
	TraitFactory.getTrait("Gardener"):getFreeRecipes():add("Roll Reserve Cannabis Cigar");
	TraitFactory.getTrait("Gardener"):getFreeRecipes():add("Make Blunt Wrap");
	TraitFactory.getTrait("Gardener"):getFreeRecipes():add("Make Fly Cure");
	TraitFactory.getTrait("Gardener"):getFreeRecipes():add("Make Fly Cure from Cigar Leaf");
	ProfessionFactory.getProfession("farmer"):getFreeRecipes():add("Prepare Cannabis Curing Jar");
	ProfessionFactory.getProfession("farmer"):getFreeRecipes():add("Prepare Half Full Cannabis Curing Jar");
	ProfessionFactory.getProfession("farmer"):getFreeRecipes():add("Prepare Nearly Full Cannabis Curing Jar");
	ProfessionFactory.getProfession("farmer"):getFreeRecipes():add("Prepare Full Cannabis Curing Jar");
	ProfessionFactory.getProfession("farmer"):getFreeRecipes():add("Add Cannabis to Curing Jar");
	ProfessionFactory.getProfession("farmer"):getFreeRecipes():add("Add More Cannabis to Curing Jar");
	ProfessionFactory.getProfession("farmer"):getFreeRecipes():add("Add Three More Cannabis to Curing Jar");
	ProfessionFactory.getProfession("farmer"):getFreeRecipes():add("Fill Cannabis Curing Jar");
	ProfessionFactory.getProfession("farmer"):getFreeRecipes():add("Add Two Cannabis to Half Full Curing Jar");
	ProfessionFactory.getProfession("farmer"):getFreeRecipes():add("Add Two More Cannabis to Curing Jar");
	ProfessionFactory.getProfession("farmer"):getFreeRecipes():add("Trim Fresh Cannabis");
	ProfessionFactory.getProfession("farmer"):getFreeRecipes():add("Trim Dry Cannabis");
	ProfessionFactory.getProfession("farmer"):getFreeRecipes():add("Sift Shake");
	ProfessionFactory.getProfession("farmer"):getFreeRecipes():add("Roll Cigar");
	ProfessionFactory.getProfession("farmer"):getFreeRecipes():add("Roll Cannabis Cigar");	
	ProfessionFactory.getProfession("farmer"):getFreeRecipes():add("Roll Premium Cannabis Cigar");
	ProfessionFactory.getProfession("farmer"):getFreeRecipes():add("Roll Deluxe Cannabis Cigar");
	ProfessionFactory.getProfession("farmer"):getFreeRecipes():add("Roll Reserve Cannabis Cigar");
	ProfessionFactory.getProfession("farmer"):getFreeRecipes():add("Make Blunt Wrap");
	ProfessionFactory.getProfession("farmer"):getFreeRecipes():add("Make Fly Cure");
	ProfessionFactory.getProfession("farmer"):getFreeRecipes():add("Make Fly Cure from Cigar Leaf");
	TraitFactory.getTrait("Cook"):getFreeRecipes():add("Make CannaButter with Shake");
	TraitFactory.getTrait("Cook"):getFreeRecipes():add("Make CannaButter with Kief");
	TraitFactory.getTrait("Cook"):getFreeRecipes():add("Make CannaButter with Hashish");
	TraitFactory.getTrait("Cook"):getFreeRecipes():add("Make Nice Crispiez");
	TraitFactory.getTrait("Cook"):getFreeRecipes():add("Make Nice Crispiez from individual Marshmallows");
	TraitFactory.getTrait("Cook"):getFreeRecipes():add("Make Special Brownies");
	TraitFactory.getTrait("Cook"):getFreeRecipes():add("Make CannaButter");
	ProfessionFactory.getProfession("chef"):getFreeRecipes():add("Make Special Brownies");
	ProfessionFactory.getProfession("chef"):getFreeRecipes():add("Make CannaButter");
	ProfessionFactory.getProfession("chef"):getFreeRecipes():add("Make CannaButter with Shake");
	ProfessionFactory.getProfession("chef"):getFreeRecipes():add("Make CannaButter with Kief");
	ProfessionFactory.getProfession("chef"):getFreeRecipes():add("Make CannaButter with Hashish");
	ProfessionFactory.getProfession("chef"):getFreeRecipes():add("Make Nice Crispiez");
	ProfessionFactory.getProfession("chef"):getFreeRecipes():add("Make Nice Crispiez from individual Marshmallows");
	ProfessionFactory.getProfession("burgerflipper"):getFreeRecipes():add("Make Special Brownies");
	ProfessionFactory.getProfession("burgerflipper"):getFreeRecipes():add("Make CannaButter");
	ProfessionFactory.getProfession("burgerflipper"):getFreeRecipes():add("Make CannaButter with Shake");
	ProfessionFactory.getProfession("burgerflipper"):getFreeRecipes():add("Make CannaButter with Kief");
	ProfessionFactory.getProfession("burgerflipper"):getFreeRecipes():add("Make CannaButter with Hashish");
	ProfessionFactory.getProfession("burgerflipper"):getFreeRecipes():add("Make Nice Crispiez");
	ProfessionFactory.getProfession("burgerflipper"):getFreeRecipes():add("Make Nice Crispiez from individual Marshmallows");
end


Events.OnGameBoot.Add(initRecipes);
Events.OnNewGame.Add(GFStarterKit);