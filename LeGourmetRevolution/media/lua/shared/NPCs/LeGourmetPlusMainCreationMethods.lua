-- Made by Snake

LGBaseGameCharacterDetails = {}

LGBaseGameCharacterDetails.DoTraits = function()
	
	local bestchef = TraitFactory.addTrait("bestchef", getText("UI_trait_bestchef"), 0, getText("UI_trait_bestchefDesc"), true);
	bestchef:getFreeRecipes():add("Make Whipped Cream");
	bestchef:getFreeRecipes():add("Make CupCake Batter");
	bestchef:getFreeRecipes():add("Make Hotdog Bread Dough");
	bestchef:getFreeRecipes():add("Make Pizza Dough");
	bestchef:getFreeRecipes():add("Make Ketchup");
	bestchef:getFreeRecipes():add("Make Marinara");
	bestchef:getFreeRecipes():add("Make Mayonnaise");
	bestchef:getFreeRecipes():add("Make Mustard");
	bestchef:getFreeRecipes():add("Make Waffle Batter");
	bestchef:getFreeRecipes():add("Make sausages");
	bestchef:getFreeRecipes():add("Make cheese preparation");
	--bestchef:getFreeRecipes():add("Rest and make cheese");
	bestchef:getFreeRecipes():add("Paint cheese");
	bestchef:getFreeRecipes():add("Make Pizza Preparation");
	bestchef:getFreeRecipes():add("Make cheese preparation2");
	--bestchef:getFreeRecipes():add("Rest and make cheese in bar");
	bestchef:getFreeRecipes():add("Make cheese preparation3");
	--bestchef:getFreeRecipes():add("Rest and make cheese 3");
	bestchef:getFreeRecipes():add("Make marshmallows");
	bestchef:getFreeRecipes():add("Make modjeska");
	bestchef:getFreeRecipes():add("Butcher Jabali Meat");
	bestchef:getFreeRecipes():add("Butcher Cow Meat");
	bestchef:getFreeRecipes():add("Butcher Chicken Meat");
	bestchef:getFreeRecipes():add("Butcher Bear Meat");
	bestchef:getFreeRecipes():add("Butcher Deer Meat");
	bestchef:getFreeRecipes():add("Butcher Bison Meat");
	bestchef:getFreeRecipes():add("Butcher Moose Meat");
	bestchef:getFreeRecipes():add("Butcher Sheep Meat");
	bestchef:getFreeRecipes():add("Make homemade peanut butter");
	bestchef:getFreeRecipes():add("Make Milk Cream");
	bestchef:getFreeRecipes():add("Make Homemade Butter");
	bestchef:getFreeRecipes():add("Make Flour");
	bestchef:getFreeRecipes():add("Make CornFlour");
	bestchef:getFreeRecipes():add("Make Taco Shell");
	bestchef:getFreeRecipes():add("Make Tortilla");
	bestchef:getFreeRecipes():add("Make SunFlower Oil");
	bestchef:getFreeRecipes():add("Make Corn Oil");

	TraitFactory.addTrait("foodexpiration", getText("UI_trait_foodexpiration"), 2, getText("UI_trait_foodexpiration_des"), false);
	TraitFactory.addTrait("foodexpiration2", getText("UI_trait_foodexpiration"), 0, getText("UI_trait_foodexpiration_des"), true);

	local btend = TraitFactory.addTrait("Bartender2", getText("UI_trait_bartender"), 0, getText("UI_trait_bartenderdesc"), true);
	btend:getFreeRecipes():add("Make energy drink1");
	btend:getFreeRecipes():add("Make energy drink2");
	btend:getFreeRecipes():add("Make energy drink3");
	btend:getFreeRecipes():add("Make energy drink4");
	btend:getFreeRecipes():add("Make energy drink5");
	btend:getFreeRecipes():add("Make natural energy drink");
	btend:getFreeRecipes():add("Make Margarita Cocktail");
	btend:getFreeRecipes():add("Make Martini Cocktail");
	btend:getFreeRecipes():add("Make Mojito Cocktail");
	btend:getFreeRecipes():add("Make Cosmopolitan Cocktail");

	local farmerexp = TraitFactory.addTrait("farmerexp", getText("UI_trait_farmerexp"), 0, getText("UI_trait_farmerexpdesc"), true);
	farmerexp:getFreeRecipes():add("Sow CarrotSeed");
	farmerexp:getFreeRecipes():add("Sow Broccoli");
	farmerexp:getFreeRecipes():add("Sow Leek");
	farmerexp:getFreeRecipes():add("Sow Lettuce");
	farmerexp:getFreeRecipes():add("Sow Onion");
	farmerexp:getFreeRecipes():add("Sow Peanut");
	farmerexp:getFreeRecipes():add("Sow Radishes");
	farmerexp:getFreeRecipes():add("Sow Strawberry");
	farmerexp:getFreeRecipes():add("Sow Tomato");
	farmerexp:getFreeRecipes():add("Sow Potatoes");
	farmerexp:getFreeRecipes():add("Sow Cabbages");
	farmerexp:getFreeRecipes():add("Sow Pumpkin");
	farmerexp:getFreeRecipes():add("Sow Watermelon");
	farmerexp:getFreeRecipes():add("Sow Zucchini");
	farmerexp:getFreeRecipes():add("Sow Corn");
	farmerexp:getFreeRecipes():add("Sow Bean");
	farmerexp:getFreeRecipes():add("Sow BellPepper");
	farmerexp:getFreeRecipes():add("Sow Eggplant");
	farmerexp:getFreeRecipes():add("Sow Grape");
	farmerexp:getFreeRecipes():add("Sow Pea");
	farmerexp:getFreeRecipes():add("Sow Rice");
	farmerexp:getFreeRecipes():add("Sow Pineapple");
	farmerexp:getFreeRecipes():add("Sow Coffee");
	farmerexp:getFreeRecipes():add("Sow Chili");
	farmerexp:getFreeRecipes():add("Sow Jalapeno");
	farmerexp:getFreeRecipes():add("Sow Habanero");
	farmerexp:getFreeRecipes():add("Sow Wheat");
	farmerexp:getFreeRecipes():add("Sow Sugarcane");
	farmerexp:getFreeRecipes():add("Sow Sunflower");
	farmerexp:getFreeRecipes():add("Sow Tobacco");
	farmerexp:getFreeRecipes():add("Make Aphids Cure");

	local efish = TraitFactory.addTrait("FishExpert", getText("UI_trait_fishexp"), 0, getText("UI_trait_fishexpdesc"), true);
	efish:getFreeRecipes():add("Make fishing dough");
	efish:getFreeRecipes():add("Make strong fishing dough");
	efish:getFreeRecipes():add("Make fishing tackle");
	efish:getFreeRecipes():add("Add dough on fishing tackle");
	efish:getFreeRecipes():add("Add strong dough on fishing tackle");
	efish:getFreeRecipes():add("Add cricket on fishing tackle");
	efish:getFreeRecipes():add("Add worm on fishing tackle");
	efish:getFreeRecipes():add("Add red worm on fishing tackle");
	efish:getFreeRecipes():add("Add grasshopper on fishing tackle");
	efish:getFreeRecipes():add("Add cockroach on fishing tackle");
	efish:getFreeRecipes():add("Add baitfish on fishing tackle");
	efish:getFreeRecipes():add("Make fishing tackle2");
	efish:getFreeRecipes():add("Add dough on fishing tackle2");
	efish:getFreeRecipes():add("Add strong dough on fishing tackle2");
	efish:getFreeRecipes():add("Add cricket on fishing tackle2");
	efish:getFreeRecipes():add("Add worm on fishing tackle2");
	efish:getFreeRecipes():add("Add red worm on fishing tackle2");
	efish:getFreeRecipes():add("Add grasshopper on fishing tackle2");
	efish:getFreeRecipes():add("Add cockroach on fishing tackle2");
	efish:getFreeRecipes():add("Add baitfish on fishing tackle2");
	efish:getFreeRecipes():add("Add dentudo on fishing tackle2");
	efish:getFreeRecipes():add("Add anguila on fishing tackle2");
	efish:getFreeRecipes():add("Make fishing tackle3");
	efish:getFreeRecipes():add("Add dentudo on fishing tackle3");
	efish:getFreeRecipes():add("Add crab on fishing tackle3");
	efish:getFreeRecipes():add("Add pejerrey on fishing tackle3");
	efish:getFreeRecipes():add("Add rat on fishing tackle3");
	efish:getFreeRecipes():add("Add mouse on fishing tackle3");
	efish:getFreeRecipes():add("Add frog on fishing tackle3");
	efish:getFreeRecipes():add("Add anguila on fishing tackle3");
	efish:getFreeRecipes():add("Make fishing tackle4");
	
	efish:getFreeRecipes():add("Add dough on fishing tackle4");
	efish:getFreeRecipes():add("Add strong dough on fishing tackle4");
	efish:getFreeRecipes():add("Add cricket on fishing tackle4");
	efish:getFreeRecipes():add("Add worm on fishing tackle4");
	efish:getFreeRecipes():add("Add red worm on fishing tackle4");
	efish:getFreeRecipes():add("Add grasshopper on fishing tackle4");
	efish:getFreeRecipes():add("Add cockroach on fishing tackle4");
	efish:getFreeRecipes():add("Add baitfish on fishing tackle4");
	
	efish:getFreeRecipes():add("Make fishing tackle5");
	efish:getFreeRecipes():add("Add Dentudo on fishing tackle5");
	efish:getFreeRecipes():add("Add Pejerrey on fishing tackle5");
	efish:getFreeRecipes():add("Add Peach on fishing tackle5");
	efish:getFreeRecipes():add("Add dough on fishing tackle5");
	efish:getFreeRecipes():add("Add strong dough on fishing tackle5");
	efish:getFreeRecipes():add("Add turtle on fishing tackle5");
	efish:getFreeRecipes():add("Add anguila on fishing tackle5");

	efish:getFreeRecipes():add("Make fishing tackle6");
	efish:getFreeRecipes():add("Add anguila on fishing tackle6");
	efish:getFreeRecipes():add("Add rat on fishing tackle6");
	efish:getFreeRecipes():add("Add frog on fishing tackle6");
	efish:getFreeRecipes():add("Add mouse on fishing tackle6");


--	local icht = TraitFactory.addTrait("ichthyologist", getText("UI_trait_ichthyologist"), 2, getText("UI_trait_ichthyologistdesc"), false);
	local sfisherman = TraitFactory.addTrait("sportfisherman", getText("UI_trait_sportfisherman"), 2, getText("UI_trait_sportfishermandesc"), false);

	local cman = TraitFactory.addTrait("Caveman", getText("UI_trait_Caveman"), 0, getText("UI_trait_Cavemandesc"), true);
	cman:getFreeRecipes():add("Polish chipped stone");
	cman:getFreeRecipes():add("Make wooden grip");
	cman:getFreeRecipes():add("Make stone knife");
	cman:getFreeRecipes():add("Make shark knife");
	cman:getFreeRecipes():add("Make fur frame");
	cman:getFreeRecipes():add("Make Animal Trophys");
	cman:getFreeRecipes():add("Advanced frames");
	cman:getFreeRecipes():add("Cheese table");
	
	
	local shunter = TraitFactory.addTrait("HunterExpert", getText("UI_trait_hunterexpert"), 6, getText("UI_trait_hunterexpertdesc"), false);
	shunter:addXPBoost(Perks.Aiming, 1)
	shunter:addXPBoost(Perks.LGRHunting, 2)
	BaseGameCharacterDetails.SetTraitDescription(shunter)
	--local archery = TraitFactory.addTrait("archer", getText("UI_trait_archer"), 6, getText("UI_trait_archerdesc"), false);
	--archery:addXPBoost(Perks.Nimble, 1);
	--archery:getFreeRecipes():add("Make Arrow");
	--archery:getFreeRecipes():add("Make a Bow");
	TraitFactory.addTrait("Detectorist", getText("UI_trait_detectorist"), 3, getText("UI_trait_detectorist_des"), false);

	TraitFactory.setMutualExclusive("foodexpiration", "foodexpiration2");

    TraitFactory.sortList();
	--BaseGameCharacterDetails.SetTraitDescription(archery)
end

LGBaseGameCharacterDetails.DoProfessions = function()

    local fisherman = ProfessionFactory.getProfession("fisherman");
	fisherman:addFreeTrait("FishExpert");

    local chef = ProfessionFactory.getProfession("chef");
	chef:addFreeTrait("bestchef");
	chef:addFreeTrait("foodexpiration2");
	chef:addFreeTrait("Bartender2");

    local farmer = ProfessionFactory.getProfession("farmer");
	farmer:addFreeTrait("foodexpiration2");
	farmer:addFreeTrait("farmerexp");

    local burger = ProfessionFactory.getProfession("burgerflipper");
	burger:addFreeTrait("foodexpiration2");

    local parkranger = ProfessionFactory.getProfession("parkranger");
	parkranger:addFreeTrait("Caveman");
	
	local carpenter = ProfessionFactory.getProfession("carpenter");
	carpenter:getFreeRecipes():add("Advanced frames");
	carpenter:getFreeRecipes():add("Cheese table");

	local profList = ProfessionFactory.getProfessions()
	for i=1,profList:size() do
		local prof = profList:get(i-1)
		BaseGameCharacterDetails.SetProfessionDescription(prof)
	end
end

LGBaseGameCharacterDetails.checkstate  = function()
	local player = getSpecificPlayer(0);
	if player:getDescriptor():getProfession() == "chef" then
		--Rasgos
		if not player:HasTrait("bestchef") then
			player:getTraits():add("bestchef");
		end
		if not player:HasTrait("foodexpiration2") then
			player:getTraits():add("foodexpiration2");
		end
		if not player:HasTrait("Bartender2") then
			player:getTraits():add("Bartender2");
		end
		--Recetas de bestchef
		LGBaseGameCharacterDetails.AddChefRecipes();
		LGBaseGameCharacterDetails.AddBartenderRecipes();
	elseif player:getDescriptor():getProfession() == "farmer" then
		if not player:HasTrait("foodexpiration2") then
			player:getTraits():add("foodexpiration2");
		end
		if not player:HasTrait("farmerexp") then
			player:getTraits():add("farmerexp");
		end
		LGBaseGameCharacterDetails.AddFarmerRecipes();
	elseif player:getDescriptor():getProfession() == "parkranger" then
		if not player:HasTrait("Caveman") then
			player:getTraits():add("Caveman");
		end
		LGBaseGameCharacterDetails.AddCavemanRecipes();
	elseif player:getDescriptor():getProfession() == "burgerflipper" then
		if not player:HasTrait("foodexpiration2") then
			player:getTraits():add("foodexpiration2");
		end
	elseif player:HasTrait("bestchef") and not player:HasTrait("Bartender2") then
		LGBaseGameCharacterDetails.AddChefRecipes();
	elseif player:HasTrait("Bartender2") and not player:HasTrait("bestchef") then
		LGBaseGameCharacterDetails.AddBartenderRecipes();
	elseif player:HasTrait("Bartender2") and player:HasTrait("bestchef") then
		LGBaseGameCharacterDetails.AddChefRecipes();
		LGBaseGameCharacterDetails.AddBartenderRecipes();
	elseif player:getDescriptor():getProfession() == "fisherman" then
		--Rasgos
		if not player:HasTrait("FishExpert") then
			player:getTraits():add("FishExpert");
		end
		--Recetas de FishExpert
		LGBaseGameCharacterDetails.AddFishermanRecipes();
	else
	end
end

function LGBaseGameCharacterDetails:AddChefRecipes()
	local player = getPlayer();
	local plrecipe = player:getKnownRecipes();
	if not plrecipe:contains("Make Whipped Cream") then
		plrecipe:add("Make Whipped Cream");
	end
	if not plrecipe:contains("Make CupCake Batter") then
		plrecipe:add("Make CupCake Batter");
	end
	if not plrecipe:contains("Make Hotdog Bread Dough") then
		plrecipe:add("Make Hotdog Bread Dough");
	end
	if not plrecipe:contains("Make Pizza Dough") then
		plrecipe:add("Make Pizza Dough");
	end
	if not plrecipe:contains("Make Ketchup") then
		plrecipe:add("Make Ketchup");
	end
	if not plrecipe:contains("Make Marinara") then
		plrecipe:add("Make Marinara");
	end
	if not plrecipe:contains("Make Mayonnaise") then
		plrecipe:add("Make Mayonnaise");
	end
	if not plrecipe:contains("Make Mustard") then
		plrecipe:add("Make Mustard");
	end
	if not plrecipe:contains("Make Waffle Batter") then
		plrecipe:add("Make Waffle Batter");
	end
	if not plrecipe:contains("Make sausages") then
		plrecipe:add("Make sausages");
	end
	if not plrecipe:contains("Make cheese preparation") then
		plrecipe:add("Make cheese preparation");
	end
	--if not plrecipe:contains("Rest and make cheese") then
		--plrecipe:add("Rest and make cheese");
	--end
	if not plrecipe:contains("Paint cheese") then
		plrecipe:add("Paint cheese");
	end
	if not plrecipe:contains("Make cheese preparation2") then
		plrecipe:add("Make cheese preparation2");
	end
	--if not plrecipe:contains("Rest and make cheese in bar") then
		--plrecipe:add("Rest and make cheese in bar");
	--end
	if not plrecipe:contains("Make cheese preparation3") then
		plrecipe:add("Make cheese preparation3");
	end
	--if not plrecipe:contains("Rest and make cheese 3") then
		--plrecipe:add("Rest and make cheese 3");
	--end
	if not plrecipe:contains("Make marshmallows") then
		plrecipe:add("Make marshmallows");
	end
	if not plrecipe:contains("Make modjeska") then
		plrecipe:add("Make modjeska");
	end
	if not plrecipe:contains("Make CornFlour") then
		plrecipe:add("Make CornFlour");
	end
	if not plrecipe:contains("Make Flour") then
		plrecipe:add("Make Flour");
	end
	if not plrecipe:contains("Make Taco Shell") then
		plrecipe:add("Make Taco Shell");
	end
	if not plrecipe:contains("Make Tortilla") then
		plrecipe:add("Make Tortilla");
	end	
	if not plrecipe:contains("Butcher Jabali Meat") then
		plrecipe:add("Butcher Jabali Meat");
	end
	if not plrecipe:contains("Butcher Cow Meat") then
		plrecipe:add("Butcher Cow Meat");
	end
	if not plrecipe:contains("Butcher Chicken Meat") then
		plrecipe:add("Butcher Chicken Meat");
	end
	if not plrecipe:contains("Butcher Deer Meat") then
		plrecipe:add("Butcher Deer Meat");
	end
	if not plrecipe:contains("Butcher Sheep Meat") then
		plrecipe:add("Butcher Sheep Meat");
	end
	if not plrecipe:contains("Make homemade peanut butter") then
		plrecipe:add("Make homemade peanut butter");
	end
	if not plrecipe:contains("Make Pizza Preparation") then
		plrecipe:add("Make Pizza Preparation");
	end
	if not plrecipe:contains("Butcher Bear Meat") then
		plrecipe:add("Butcher Bear Meat");
	end
	if not plrecipe:contains("Make Milk Cream") then
		plrecipe:add("Make Milk Cream");
	end
	if not plrecipe:contains("Make Homemade Butter") then
		plrecipe:add("Make Homemade Butter");
	end
	if not plrecipe:contains("Butcher Bison Meat") then
		plrecipe:add("Butcher Bison Meat");
	end
	if not plrecipe:contains("Butcher Moose Meat") then
		plrecipe:add("Butcher Moose Meat");
	end
	if not plrecipe:contains("Make SunFlower Oil") then
		plrecipe:add("Make SunFlower Oil");
	end
	if not plrecipe:contains("Make Corn Oil") then
		plrecipe:add("Make Corn Oil");
	end
end

function LGBaseGameCharacterDetails:AddBartenderRecipes()
	local player = getPlayer();
	local plrecipe = player:getKnownRecipes();
	--Recetas de bartender2
	if not plrecipe:contains("Make energy drink1") then
		plrecipe:add("Make energy drink1");
	end
	if not plrecipe:contains("Make energy drink2") then
		plrecipe:add("Make energy drink2");
	end
	if not plrecipe:contains("Make energy drink3") then
		plrecipe:add("Make energy drink3");
	end
	if not plrecipe:contains("Make energy drink4") then
		plrecipe:add("Make energy drink4");
	end
	if not plrecipe:contains("Make energy drink5") then
		plrecipe:add("Make energy drink5");
	end
	if not plrecipe:contains("Make natural energy drink") then
		plrecipe:add("Make natural energy drink");
	end
	if not plrecipe:contains("Make Margarita Cocktail") then
		plrecipe:add("Make Margarita Cocktail");
	end
	if not plrecipe:contains("Make Martini Cocktail") then
		plrecipe:add("Make Martini Cocktail");
	end
	if not plrecipe:contains("Make Mojito Cocktail") then
		plrecipe:add("Make Mojito Cocktail");
	end
	if not plrecipe:contains("Make Cosmopolitan Cocktail") then
		plrecipe:add("Make Cosmopolitan Cocktail");
	end
end

function LGBaseGameCharacterDetails:AddFarmerRecipes()
	local player = getPlayer();
	local plrecipe = player:getKnownRecipes();
	--Recetas de granjero
	if not plrecipe:contains("Sow CarrotSeed") then
		plrecipe:add("Sow CarrotSeed");
	end
	if not plrecipe:contains("Sow Broccoli") then
		plrecipe:add("Sow Broccoli");
	end
	if not plrecipe:contains("Sow Leek") then
		plrecipe:add("Sow Leek");
	end
	if not plrecipe:contains("Sow Lettuce") then
		plrecipe:add("Sow Lettuce");
	end
	if not plrecipe:contains("Sow Onion") then
		plrecipe:add("Sow Onion");
	end
	if not plrecipe:contains("Sow Peanut") then
		plrecipe:add("Sow Peanut");
	end
	if not plrecipe:contains("Sow Radishes") then
		plrecipe:add("Sow Radishes");
	end
	if not plrecipe:contains("Sow Strawberry") then
		plrecipe:add("Sow Strawberry");
	end
	if not plrecipe:contains("Sow Tomato") then
		plrecipe:add("Sow Tomato");
	end
	if not plrecipe:contains("Sow Potatoes") then
		plrecipe:add("Sow Potatoes");
	end
	if not plrecipe:contains("Sow Cabbages") then
		plrecipe:add("Sow Cabbages");
	end
	if not plrecipe:contains("Sow Pumpkin") then
		plrecipe:add("Sow Pumpkin");
	end
	if not plrecipe:contains("Sow Watermelon") then
		plrecipe:add("Sow Watermelon");
	end
	if not plrecipe:contains("Sow Zucchini") then
		plrecipe:add("Sow Zucchini");
	end
	if not plrecipe:contains("Sow Corn") then
		plrecipe:add("Sow Corn");
	end
	if not plrecipe:contains("Sow Bean") then
		plrecipe:add("Sow Bean");
	end
	if not plrecipe:contains("Sow BellPepper") then
		plrecipe:add("Sow BellPepper");
	end
	if not plrecipe:contains("Sow Eggplant") then
		plrecipe:add("Sow Eggplant");
	end
	if not plrecipe:contains("Sow Grape") then
		plrecipe:add("Sow Grape");
	end
	if not plrecipe:contains("Sow Pea") then
		plrecipe:add("Sow Pea");
	end
	if not plrecipe:contains("Sow Rice") then
		plrecipe:add("Sow Rice");
	end
	if not plrecipe:contains("Sow Pineapple") then
		plrecipe:add("Sow Pineapple");
	end
	if not plrecipe:contains("Sow Coffee") then
		plrecipe:add("Sow Coffee");
	end
	if not plrecipe:contains("Sow Chili") then
		plrecipe:add("Sow Chili");
	end
	if not plrecipe:contains("Sow Habanero") then
		plrecipe:add("Sow Habanero");
	end
	if not plrecipe:contains("Sow Jalapeno") then
		plrecipe:add("Sow Jalapeno");
	end
	if not plrecipe:contains("Sow Wheat") then
		plrecipe:add("Sow Wheat");
	end
	if not plrecipe:contains("Sow Sugarcane") then
		plrecipe:add("Sow Sugarcane");
	end
	if not plrecipe:contains("Sow Sunflower") then
		plrecipe:add("Sow Sunflower");
	end
	if not plrecipe:contains("Sow Tobacco") then
		plrecipe:add("Sow Tobacco");
	end
	if not plrecipe:contains("Make Aphids Cure") then
		plrecipe:add("Make Aphids Cure");
	end
end

function LGBaseGameCharacterDetails:AddCavemanRecipes()
	local player = getPlayer();
	local plrecipe = player:getKnownRecipes();
	--Recetas de caveman
	if not plrecipe:contains("Polish chipped stone") then
		plrecipe:add("Polish chipped stone");
	end
	if not plrecipe:contains("Make wooden grip") then
		plrecipe:add("Make wooden grip");
	end
	if not plrecipe:contains("Make stone knife") then
		plrecipe:add("Make stone knife");
	end
	if not plrecipe:contains("Make shark knife") then
		plrecipe:add("Make shark knife");
	end
	if not plrecipe:contains("Make fur frame") then
		plrecipe:add("Make fur frame");
	end
	if not plrecipe:contains("Make Animal Trophys") then
		plrecipe:add("Make Animal Trophys");
	end
	if not plrecipe:contains("Advanced frames") then
		plrecipe:add("Advanced frames");
	end
	if not plrecipe:contains("Cheese table") then
		plrecipe:add("Cheese table");
	end
end

function LGBaseGameCharacterDetails:AddFishermanRecipes()
	local player = getPlayer();
	local plrecipe = player:getKnownRecipes();
	--Recetas de pescador
	if not plrecipe:contains("Make fishing dough") then
		plrecipe:add("Make fishing dough");
	end
	if not plrecipe:contains("Make strong fishing dough") then
		plrecipe:add("Make strong fishing dough");
	end
	if not plrecipe:contains("Make fishing tackle") then
		plrecipe:add("Make fishing tackle");
	end
	if not plrecipe:contains("Add dough on fishing tackle") then
		plrecipe:add("Add dough on fishing tackle");
	end
	if not plrecipe:contains("Add strong dough on fishing tackle") then
		plrecipe:add("Add strong dough on fishing tackle");
	end
	if not plrecipe:contains("Add cricket on fishing tackle") then
		plrecipe:add("Add cricket on fishing tackle");
	end
	if not plrecipe:contains("Add worm on fishing tackle") then
		plrecipe:add("Add worm on fishing tackle");
	end
	if not plrecipe:contains("Add red worm on fishing tackle") then
		plrecipe:add("Add red worm on fishing tackle");
	end
	if not plrecipe:contains("Add grasshopper on fishing tackle") then
		plrecipe:add("Add grasshopper on fishing tackle");
	end
	if not plrecipe:contains("Add cockroach on fishing tackle") then
		plrecipe:add("Add cockroach on fishing tackle");
	end
	if not plrecipe:contains("Add baitfish on fishing tackle") then
		plrecipe:add("Add baitfish on fishing tackle");
	end

	if not plrecipe:contains("Make fishing tackle2") then
		plrecipe:add("Make fishing tackle2");
	end
	if not plrecipe:contains("Add dough on fishing tackle2") then
		plrecipe:add("Add dough on fishing tackle2");
	end
	if not plrecipe:contains("Add strong dough on fishing tackle2") then
		plrecipe:add("Add strong dough on fishing tackle2");
	end
	if not plrecipe:contains("Add cricket on fishing tackle2") then
		plrecipe:add("Add cricket on fishing tackle2");
	end
	if not plrecipe:contains("Add worm on fishing tackle2") then
		plrecipe:add("Add worm on fishing tackle2");
	end
	if not plrecipe:contains("Add red worm on fishing tackle2") then
		plrecipe:add("Add red worm on fishing tackle2");
	end
	if not plrecipe:contains("Add grasshopper on fishing tackle2") then
		plrecipe:add("Add grasshopper on fishing tackle2");
	end
	if not plrecipe:contains("Add cockroach on fishing tackle2") then
		plrecipe:add("Add cockroach on fishing tackle2");
	end
	if not plrecipe:contains("Add baitfish on fishing tackle2") then
		plrecipe:add("Add baitfish on fishing tackle2");
	end
	if not plrecipe:contains("Add dentudo on fishing tackle2") then
		plrecipe:add("Add dentudo on fishing tackle2");
	end
	if not plrecipe:contains("Add anguila on fishing tackle2") then
		plrecipe:add("Add anguila on fishing tackle2");
	end

	if not plrecipe:contains("Make fishing tackle3") then
		plrecipe:add("Make fishing tackle3");
	end
	if not plrecipe:contains("Add dentudo on fishing tackle3") then
		plrecipe:add("Add dentudo on fishing tackle3");
	end
	if not plrecipe:contains("Add crab on fishing tackle3") then
		plrecipe:add("Add crab on fishing tackle3");
	end
	if not plrecipe:contains("Add pejerrey on fishing tackle3") then
		plrecipe:add("Add pejerrey on fishing tackle3");
	end
	if not plrecipe:contains("Add rat on fishing tackle3") then
		plrecipe:add("Add rat on fishing tackle3");
	end
	if not plrecipe:contains("Add mouse on fishing tackle3") then
		plrecipe:add("Add mouse on fishing tackle3");
	end
	if not plrecipe:contains("Add frog on fishing tackle3") then
		plrecipe:add("Add frog on fishing tackle3");
	end
	if not plrecipe:contains("Add anguila on fishing tackle3") then
		plrecipe:add("Add anguila on fishing tackle3");
	end

	if not plrecipe:contains("Make fishing tackle4") then
		plrecipe:add("Make fishing tackle4");
	end
	if not plrecipe:contains("Add dough on fishing tackle4") then
		plrecipe:add("Add dough on fishing tackle4");
	end
	if not plrecipe:contains("Add strong dough on fishing tackle4") then
		plrecipe:add("Add strong dough on fishing tackle4");
	end
	if not plrecipe:contains("Add cricket on fishing tackle4") then
		plrecipe:add("Add cricket on fishing tackle4");
	end
	if not plrecipe:contains("Add worm on fishing tackle4") then
		plrecipe:add("Add worm on fishing tackle4");
	end
	if not plrecipe:contains("Add red worm on fishing tackle4") then
		plrecipe:add("Add red worm on fishing tackle4");
	end
	if not plrecipe:contains("Add grasshopper on fishing tackle4") then
		plrecipe:add("Add grasshopper on fishing tackle4");
	end
	if not plrecipe:contains("Add cockroach on fishing tackle4") then
		plrecipe:add("Add cockroach on fishing tackle4");
	end
	if not plrecipe:contains("Add baitfish on fishing tackle4") then
		plrecipe:add("Add baitfish on fishing tackle4");
	end

	if not plrecipe:contains("Make fishing tackle5") then
		plrecipe:add("Make fishing tackle5");
	end
	if not plrecipe:contains("Add Dentudo on fishing tackle5") then
		plrecipe:add("Add Dentudo on fishing tackle5");
	end
	if not plrecipe:contains("Add Pejerrey on fishing tackle5") then
		plrecipe:add("Add Pejerrey on fishing tackle5");
	end
	if not plrecipe:contains("Add Peach on fishing tackle5") then
		plrecipe:add("Add Peach on fishing tackle5");
	end
	if not plrecipe:contains("Add dough on fishing tackle5") then
		plrecipe:add("Add dough on fishing tackle5");
	end
	if not plrecipe:contains("Add strong dough on fishing tackle5") then
		plrecipe:add("Add strong dough on fishing tackle5");
	end
	if not plrecipe:contains("Add turtle on fishing tackle5") then
		plrecipe:add("Add turtle on fishing tackle5");
	end
	if not plrecipe:contains("Add anguila on fishing tackle5") then
		plrecipe:add("Add anguila on fishing tackle5");
	end

	if not plrecipe:contains("Make fishing tackle6") then
		plrecipe:add("Make fishing tackle6");
	end
	if not plrecipe:contains("Add anguila on fishing tackle6") then
		plrecipe:add("Add anguila on fishing tackle6");
	end
	if not plrecipe:contains("Add rat on fishing tackle6") then
		plrecipe:add("Add rat on fishing tackle6");
	end
	if not plrecipe:contains("Add frog on fishing tackle6") then
		plrecipe:add("Add frog on fishing tackle6");
	end
	if not plrecipe:contains("Add mouse on fishing tackle6") then
		plrecipe:add("Add mouse on fishing tackle6");
	end
end

Events.OnGameBoot.Add(LGBaseGameCharacterDetails.DoTraits);
Events.OnGameBoot.Add(LGBaseGameCharacterDetails.DoProfessions);
Events.OnGameStart.Add(LGBaseGameCharacterDetails.checkstate);