Events.OnGameStart.Add( function ()
	print ("LGEP: Buscando sistema de Mod Necroforge");
	if NecroList then
		print ("Items de Le Gourmet Evolution agregados a Necroforge");
		if NecroList.Items.Taco then	
			else
			NecroList.Items.Taco = {"Food", nil, nil, getItemText("Taco"), "Base.Taco", "Item_Taco", nil, nil, nil};
		end
		if NecroList.Items.EnergyDrink then	
		else
			NecroList.Items.EnergyDrink = {"Drink", nil, nil, getItemText("Energy_Drink"), "legourmet.EnergyDrink", "Item_EnergyDrink", nil, nil, nil};
		end
		if NecroList.Items.EnergyDrink2 then	
		else
			NecroList.Items.EnergyDrink2 = {"Drink", nil, nil, getItemText("Energy_Drink"), "legourmet.EnergyDrink2", "Item_EnergyDrink2", nil, nil, nil};
		end
		if NecroList.Items.EnergyDrink3 then	
		else
			NecroList.Items.EnergyDrink3 = {"Drink", nil, nil, getItemText("Energy_Drink"), "legourmet.EnergyDrink3", "Item_SNKEnergyDrink3", nil, nil, nil};
		end
		if NecroList.Items.EnergyDrink4 then	
		else
			NecroList.Items.EnergyDrink4 = {"Drink", nil, nil, getItemText("Energy_Drink"), "legourmet.EnergyDrink4", "Item_SNKEnergyDrink4", nil, nil, nil};
		end
		if NecroList.Items.EnergyDrink5 then
		else
			NecroList.Items.EnergyDrink5 = {"Drink", nil, nil, getItemText("Energy_Drink"), "legourmet.EnergyDrink5", "Item_SNKEnergyDrink5", nil, nil, nil};
		end
		if NecroList.Items.EnergyDrinkBottle then
		else
			NecroList.Items.EnergyDrinkBottle = {"Drink", nil, nil, getItemText("Maximum_Energy"), "legourmet.EnergyDrinkBottle", "Item_EnergyDrinkBottle", nil, nil, nil};
		end
		if NecroList.Items.NaturalEnergyDrinkBottle then
		else
			NecroList.Items.NaturalEnergyDrinkBottle = {"Drink", nil, nil, getItemText("Natural_Maximum_Energy"), "legourmet.NaturalEnergyDrinkBottle", "Item_EnergyDrinkBottle", nil, nil, nil};
		end
		if NecroList.Items.Vodka then
		else
			NecroList.Items.Vodka = {"Drink", nil, nil, getItemText("Vodka"), "legourmet.VodkaFull", "Item_VodkaFull", nil, nil, nil};
		end
		if NecroList.Items.ColaBottle then	
			else
			NecroList.Items.ColaBottle = {"Drink", nil, nil, getItemText("Cola"), "legourmet.ColaBottle", "Item_Cola", nil, nil, nil};
		end
		if NecroList.Items.GumPack then	
			else
			NecroList.Items.GumPack = {"Food", nil, nil, getItemText("Pack_of_Chewing_Gum"), "legourmet.GumPack", "Item_GumPack", nil, nil, nil};
		end
		if NecroList.Items.GumPack1 then	
			else
			NecroList.Items.GumPack1 = {"Food", nil, nil, getItemText("Pack_of_Chewing_Gum"), "legourmet.GumPack1", "Item_GumPack1", nil, nil, nil};
		end
		if NecroList.Items.GumPack2 then	
			else
			NecroList.Items.GumPack2 = {"Food", nil, nil, getItemText("Pack_of_Chewing_Gum"), "legourmet.GumPack2", "Item_GumPack2", nil, nil, nil};
		end
		if NecroList.Items.GummyBears then	
			else
			NecroList.Items.GummyBears = {"Food", nil, nil,  getItemText("Gummy_Bears"), "legourmet.GummyBears", "Item_GummyBears", nil, nil, nil};
		end
		if NecroList.Items.CornCandy then	
			else
			NecroList.Items.CornCandy = {"Food", nil, nil, getItemText("Corn_Candy"), "legourmet.CornCandy", "Item_CandyCorn", nil, nil, nil};
		end
		if NecroList.Items.GummyWorms then	
		else
			NecroList.Items.GummyWorms = {"Food", nil, nil, getItemText("Gummy_Worms"), "legourmet.GummyWorms", "Item_GummyWorms", nil, nil, nil};
		end
		if NecroList.Items.CandySkil then	
		else
			NecroList.Items.CandySkil = {"Food", nil, nil, getItemText("Skil_Candy"), "legourmet.CandySkil", "Item_CandySkil", nil, nil, nil};
		end
		if NecroList.Items.MixCandy then	
		else
			NecroList.Items.MixCandy = {"Food", nil, nil, getItemText("Mix_Candy"), "legourmet.MixCandy", "Item_CandyColors", nil, nil, nil};
		end
		if NecroList.Items.JellyBeans then	
		else
			NecroList.Items.JellyBeans = {"Food", nil, nil, getItemText("Jelly_Beans"), "legourmet.JellyBeans", "Item_JellyBeans", nil, nil, nil};
		end
		-- Sodas --
		if NecroList.Items.Soda01 then	
		else
			NecroList.Items.Soda01 = {"Drink", nil, nil, getItemText("Soda_(Cherry)"), "legourmet.Soda01", "Item_Soda01", nil, nil, nil};
		end
		if NecroList.Items.Soda02 then	
		else
			NecroList.Items.Soda02 = {"Drink", nil, nil, getItemText("Soda_(Cola)"), "legourmet.Soda02", "Item_Soda02", nil, nil, nil};
		end
		if NecroList.Items.Soda03 then	
		else
			NecroList.Items.Soda03 = {"Drink", nil, nil, getItemText("Soda_(Cream)"), "legourmet.Soda03", "Item_Soda03", nil, nil, nil};
		end
		if NecroList.Items.Soda04 then	
		else
			NecroList.Items.Soda04 = {"Drink", nil, nil, getItemText("Soda_(Dr. Prepper)"), "legourmet.Soda04", "Item_Soda04", nil, nil, nil};
		end
		if NecroList.Items.Soda05 then	
		else
			NecroList.Items.Soda05 = {"Drink", nil, nil, getItemText("Soda_(Ginger Ale)"), "legourmet.Soda05", "Item_Soda05", nil, nil, nil};
		end
		if NecroList.Items.Soda06 then	
		else
			NecroList.Items.Soda06 = {"Drink", nil, nil, getItemText("Soda_(Grape)"), "legourmet.Soda06", "Item_Soda06", nil, nil, nil};
		end
		if NecroList.Items.Soda07 then	
		else
			NecroList.Items.Soda07 = {"Drink", nil, nil, getItemText("Soda_(Grapefruit)"), "legourmet.Soda07", "Item_Soda07", nil, nil, nil};
		end
		if NecroList.Items.Soda08 then	
		else
			NecroList.Items.Soda08 = {"Drink", nil, nil, getItemText("Soda_(Lemon Lime)"), "legourmet.Soda08", "Item_Soda08", nil, nil, nil};
		end
		if NecroList.Items.Soda09 then	
		else
			NecroList.Items.Soda09 = {"Drink", nil, nil, getItemText("Soda_(Pineapple)"), "legourmet.Soda09", "Item_Soda09", nil, nil, nil};
		end
		if NecroList.Items.Soda10 then	
		else
			NecroList.Items.Soda10 = {"Drink", nil, nil, getItemText("Soda_(Root Beer)"), "legourmet.Soda10", "Item_Soda10", nil, nil, nil};
		end
		if NecroList.Items.Soda11 then	
		else
			NecroList.Items.Soda11 = {"Drink", nil, nil, getItemText("Soda_(Orange)"), "legourmet.Soda11", "Item_Soda11", nil, nil, nil};
		end
		if NecroList.Items.Soda12 then	
		else
			NecroList.Items.Soda12 = {"Drink", nil, nil, getItemText("Soda_(Blueberry)"), "legourmet.Soda12", "Item_Soda12", nil, nil, nil};
		end
		--
		if NecroList.Items.CannedSoupClassic then	
		else
			NecroList.Items.CannedSoupClassic = {"Food", nil, nil, getItemText("Canned_Soup_Classic"), "legourmet.CannedSoupClassic", "Item_CannedSoupClassic", nil, nil, nil};
		end
		if NecroList.Items.PopLemon then	
		else
			NecroList.Items.PopLemon = {"Drink", nil, nil, getItemText("Pop"), "legourmet.PopLemon", "Item_PopLemon", nil, nil, nil};
		end
		if NecroList.Items.PopOrange then	
		else
			NecroList.Items.PopOrange = {"Drink", nil, nil, getItemText("Pop"), "legourmet.PopOrange", "Item_PopOrange", nil, nil, nil};
		end
		if NecroList.Items.Crisps5 then	
		else
			NecroList.Items.Crisps5 = {"Food", nil, nil, getItemText("Chips"), "legourmet.Crisps5", "Item_Crisps5", nil, nil, nil};
		end
		if NecroList.Items.Crisps6 then	
		else
			NecroList.Items.Crisps6 = {"Food", nil, nil, getItemText("Chips"), "legourmet.Crisps6", "Item_Crisps6", nil, nil, nil};
		end
		if NecroList.Items.Crisps7 then	
		else
			NecroList.Items.Crisps7 = {"Food", nil, nil, getItemText("Chips"), "legourmet.Crisps7", "Item_Crisps7", nil, nil, nil};
		end
		if NecroList.Items.Crisps8 then	
		else
			NecroList.Items.Crisps8 = {"Food", nil, nil, getItemText("Chips"), "legourmet.Crisps8", "Item_Crisps8", nil, nil, nil};
		end
		if NecroList.Items.Crisps9 then	
		else
			NecroList.Items.Crisps9 = {"Food", nil, nil, getItemText("Chips"), "legourmet.Crisps9", "Item_Crisps9", nil, nil, nil};
		end
		if NecroList.Items.WChocolate then	
		else
			NecroList.Items.WChocolate = {"Food", nil, nil, getItemText("White_Chocolate"), "legourmet.WChocolate", "Item_WChocolate", nil, nil, nil};
		end
		if NecroList.Items.Chardonnay then	
			NecroList.Items.Chardonnay = {"Drink", nil, nil, getItemText("Chardonnay_Closed"), "Base.Wine", "Item_WineFull", nil, nil, nil};
		else
			NecroList.Items.Chardonnay = {"Drink", nil, nil, getItemText("Chardonnay_Closed"), "Base.Wine", "Item_WineFull", nil, nil, nil};
		end
		if NecroList.Items.ChardonnayOpen then	
		else
			NecroList.Items.ChardonnayOpen = {"Drink", nil, nil, getItemText("Chardonnay_Open"), "legourmet.Winea", "Item_OpenWineFull", nil, nil, nil};
		end
		if NecroList.Items.Red_Wine then	
			NecroList.Items.Red_Wine = {"Drink", nil, nil, getItemText("Red_Wine_Closed"), "Base.Wine2", "Item_Wine2Full", nil, nil, nil};
		else
			NecroList.Items.Red_Wine = {"Drink", nil, nil, getItemText("Red_Wine_Closed"), "Base.Wine2", "Item_Wine2Full", nil, nil, nil};
		end
		if NecroList.Items.Red_Wine_Open then	
		else
			NecroList.Items.Red_Wine_Open  = {"Drink", nil, nil, getItemText("Red_Wine_Open"), "legourmet.Wine2a", "Item_OpenWine2Full", nil, nil, nil};
		end
		if NecroList.Items.Rose_Wine then	
		else
			NecroList.Items.Rose_Wine  = {"Drink", nil, nil, getItemText("Rose_Wine_Closed"), "legourmet.Wine3", "Item_WineRoseClosed", nil, nil, nil};
		end
		if NecroList.Items.Rose_Wine_Open then	
		else
			NecroList.Items.Rose_Wine_Open  = {"Drink", nil, nil, getItemText("Rose_Wine_Open"), "legourmet.Wine3a", "Item_WineRoseOpen", nil, nil, nil};
		end
		if NecroList.Items.JuiceBox2 then	
		else
			NecroList.Items.JuiceBox2  = {"Drink", nil, nil, getItemText("Juice_Box_(Orange)"), "legourmet.JuiceBox2", "Item_JuiceOrangeBox", nil, nil, nil};
		end
		if NecroList.Items.JuiceBox3 then	
		else
			NecroList.Items.JuiceBox3  = {"Drink", nil, nil, getItemText("Juice_Box_(Apple)"), "legourmet.JuiceBox3", "Item_JuiceAppleBox", nil, nil, nil};
		end
		if NecroList.Items.JuiceBox4 then	
		else
			NecroList.Items.JuiceBox4  = {"Drink", nil, nil, getItemText("Juice_Box_(Peaches)"), "legourmet.JuiceBox4", "Item_JuicePeachesBox", nil, nil, nil};
		end
		if NecroList.Items.JuiceBox5 then	
		else
			NecroList.Items.JuiceBox5  = {"Drink", nil, nil, getItemText("Juice_Box_(Banana)"), "legourmet.JuiceBox5", "Item_JuiceBananaBox", nil, nil, nil};
		end
		if NecroList.Items.EnergyMagazine then	
		else
			NecroList.Items.EnergyMagazine = {"Literature", "Cooking", nil, getItemText("Energy_Drinks_Magazine"), "legourmet.EnergyMagazine", "Item_EnergyMag", nil, nil, nil};
		end
		if NecroList.Items.LGCookingMag then	
		else
			NecroList.Items.LGCookingMag = {"Literature", "Cooking", nil, getItemText("Le_Gourmet_Cooking_Magazine"), "Base.LGCookingMag", "Item_GMagazineFood1", nil, nil, nil};
		end
		if NecroList.Items.LGCookingMag2 then	
		else
			NecroList.Items.LGCookingMag2 = {"Literature", "Cooking", nil, getItemText("Le_Gourmet_Cooking_Magazine"), "Base.LGCookingMag2", "Item_GMagazineFood2", nil, nil, nil};
		end
		if NecroList.Items.LGCookingMag3 then	
		else
			NecroList.Items.LGCookingMag3 = {"Literature", "Cooking", nil, getItemText("Le_Gourmet_Cooking_Magazine"), "Base.LGCookingMag3", "Item_GMagazineFood3", nil, nil, nil};
		end
		if NecroList.Items.LGCookingMag4 then	
		else
			NecroList.Items.LGCookingMag4 = {"Literature", "Cooking", nil, getItemText("Le_Gourmet_Cooking_Magazine"), "Base.LGCookingMag4", "Item_GMagazineFood4", nil, nil, nil};
		end
		if NecroList.Items.LGCookingMag5 then	
		else
			NecroList.Items.LGCookingMag5 = {"Literature", "Cooking", nil, getItemText("Le_Gourmet_Cooking_Magazine"), "Base.LGCookingMag5", "Item_GMagazineFood5", nil, nil, nil};
		end
		if NecroList.Items.KitchenBrush then	
		else
			NecroList.Items.KitchenBrush = {"Cooking", nil, nil, getItemText("Kitchen_Brush"), "Base.KitchenBrush", "Item_KitchenBrush", nil, nil, nil};
		end
		if NecroList.Items.MolinoCoffee then	
		else
			NecroList.Items.MolinoCoffee = {"Cooking", nil, nil, getItemText("Molino_Coffee"), "Base.MolinoCoffee", "Item_Molino", nil, nil, nil};
		end
		if NecroList.Items.CheeseMoldEmpty then	
		else
			NecroList.Items.CheeseMoldEmpty = {"Cooking", nil, nil, getItemText("Cheese_Mold"), "Base.CheeseMoldEmpty", "Item_CheeseMold", nil, nil, nil};
		end
		if NecroList.Items.CheeseMoldEmpty2 then	
		else
			NecroList.Items.CheeseMoldEmpty2 = {"Cooking", nil, nil, getItemText("Cheese_Mold_2"), "Base.CheeseMoldEmpty2", "Item_CheeseMold3", nil, nil, nil};
		end
		if NecroList.Items.CheeseMoldEmpty3 then	
		else
			NecroList.Items.CheeseMoldEmpty3 = {"Cooking", nil, nil, getItemText("Cheese_Mold_3"), "Base.CheeseMoldEmpty3", "Item_CheeseMold4", nil, nil, nil};
		end
		if NecroList.Items.CitricAcid then	
		else
			NecroList.Items.CitricAcid = {"Cooking", nil, nil, getItemText("Citric_Acid"), "Base.CitricAcid", "Item_CitricAcid", nil, nil, nil};
		end
		if NecroList.Items.EmptyJar2 then	
		else
			NecroList.Items.EmptyJar2 = {"Cooking", nil, nil, getItemText("Empty_Jar"), "Base.EmptyJar2", "Item_JarlidEmpty", nil, nil, nil};
		end
		if NecroList.Items.WaterSaucepan then	
		else
			NecroList.Items.WaterSaucepan = {"Drink", nil, nil, getItemText("Saucepan_with_Water"), "Base.WaterSaucepan", "Item_Saucepanwater", nil, nil, nil};
		end
		if NecroList.Items.WaffleMachine then	
		else
			NecroList.Items.WaffleMachine = {"Cooking", nil, nil, getItemText("Waffle_Maker_Empty"), "Base.WaffleMachine", "Item_Wafflerab", nil, nil, nil};
		end
		if NecroList.Items.ManualMeatMincer then	
		else
			NecroList.Items.ManualMeatMincer = {"Cooking", nil, nil, getItemText("Manual_Meat_Mincer"), "Base.ManualMeatMincer", "Item_Picadoramanual", nil, nil, nil};
		end
		if NecroList.Items.ManualMeatMincerS then	
		else
			NecroList.Items.ManualMeatMincerS = {"Cooking", nil, nil, getItemText("Manual_Sausage_Maker"), "Base.ManualMeatMincerS", "Item_PicadoramanualS", nil, nil, nil};
		end
		if NecroList.Items.ElectricMeatMincer then	
		else
			NecroList.Items.ElectricMeatMincer = {"Cooking", nil, nil, getItemText("Electrical_Meat_Mincer"), "Base.ElectricMeatMincer", "Item_Picadoraeempty", nil, nil, nil};
		end
		if NecroList.Items.ElectricMeatMincerS then	
		else
			NecroList.Items.ElectricMeatMincerS = {"Cooking", nil, nil, getItemText("Electrical_Sausage_Maker"), "Base.ElectricMeatMincerS", "Item_Picadorasausageempty", nil, nil, nil};
		end
		if NecroList.Items.LgBinoculars then	
		else
			NecroList.Items.LgBinoculars = {"Camping", nil, nil, getItemText("Binoculars"), "Base.LgBinoculars", "Item_LgBinoculars", nil, nil, nil};
		end
		if NecroList.Items.BearTrap then	
		else
			NecroList.Items.BearTrap = {"Camping", nil, nil, getItemText("Bear_Trap"), "Base.BearTrap", "Item_BearTrap", nil, nil, nil};
		end
		if NecroList.Items.KnifeDepostador then	
		else
			NecroList.Items.KnifeDepostador = {"Camping", "Weapons", nil, getItemText("Knife_Depostador"), "Base.KnifeDepostador", "Item_KnifeDepostador", nil, nil, nil};
		end
		if NecroList.Items.HuntingCard1 then	
		else
			NecroList.Items.HuntingCard1 = {"Literature", "Camping", nil, getItemText("Hunting_card_(Rats)"), "Base.HuntingCard1", "Item_HuntingCardRat", nil, nil, nil};
		end
		if NecroList.Items.HuntingCard2 then	
		else
			NecroList.Items.HuntingCard2 = {"Literature", "Camping", nil, getItemText("Hunting_card_(Mouses)"), "Base.HuntingCard2", "Item_HuntingCardMouse", nil, nil, nil};
		end
		if NecroList.Items.HuntingCard3 then	
		else
			NecroList.Items.HuntingCard3 = {"Literature", "Camping", nil, getItemText("Hunting_card_(Birds)"), "Base.HuntingCard3", "Item_HuntingCardBird", nil, nil, nil};
		end
		if NecroList.Items.HuntingCard4 then	
		else
			NecroList.Items.HuntingCard4 = {"Literature", "Camping", nil, getItemText("Hunting_card_(Squirrels)"), "Base.HuntingCard4", "Item_HuntingCardSquirrel", nil, nil, nil};
		end
		if NecroList.Items.HuntingCard5 then	
		else
			NecroList.Items.HuntingCard5 = {"Literature", "Camping", nil, getItemText("Hunting_card_(Rabbits)"), "Base.HuntingCard5", "Item_HuntingCardRabbit", nil, nil, nil};
		end
		if NecroList.Items.HuntingCard6 then	
		else
			NecroList.Items.HuntingCard6 = {"Literature", "Camping", nil, getItemText("Hunting_card_(Wild_Pigs)"), "Base.HuntingCard6", "Item_HuntingCardWildPig", nil, nil, nil};
		end
		if NecroList.Items.HuntingCard7 then	
		else
			NecroList.Items.HuntingCard7 = {"Literature", "Camping", nil, getItemText("Hunting_card_(Cow)"), "Base.HuntingCard7", "Item_HuntingCardCow", nil, nil, nil};
		end
		if NecroList.Items.HuntingCard8 then	
		else
			NecroList.Items.HuntingCard8 = {"Literature", "Camping", nil, getItemText("Hunting_card_(Chicken)"), "Base.HuntingCard8", "Item_HuntingCardChicken", nil, nil, nil};
		end
		if NecroList.Items.HuntingCard9 then	
		else
			NecroList.Items.HuntingCard9 = {"Literature", "Camping", nil, getItemText("Hunting_card_(Bear)"), "Base.HuntingCard9", "Item_HuntingCardBear", nil, nil, nil};
		end
		if NecroList.Items.HuntingCard10 then	
		else
			NecroList.Items.HuntingCard10 = {"Literature", "Camping", nil, getItemText("Hunting_card_(Crow)"), "Base.HuntingCard10", "Item_HuntingCardCrow", nil, nil, nil};
		end
		if NecroList.Items.SeedBook then	
		else
			NecroList.Items.SeedBook = {"Literature", "Camping", nil, getItemText("Seed_Book"), "legourmetfarming.SeedBook", "Item_SeedBook", nil, nil, nil};
		end
		if NecroList.Items.UnknownSeed then	
		else
			NecroList.Items.UnknownSeed = {"Farming", nil, nil, getItemText("Unknown_Seeds"), "legourmetfarming.UnknownSeed", "Item_RiceSeeds", nil, nil, nil};
		end
		if NecroList.Items.CoffeeSeed then	
		else
			NecroList.Items.CoffeeSeed = {"Farming", nil, nil, getItemText("Coffee_Seeds"), "legourmetfarming.CafeSeed", "Item_Cafeseeds", nil, nil, nil};
		end
		if NecroList.Items.LGTrait then	
		else
			NecroList.Items.LGTrait = {"Traits", nil, nil, "Trait - " .. getText("UI_trait_foodexpiration"), "NecroForge.NecroFunction", "media/ui/Traits/trait_foodexpiration2.png", nil, nil, nil, "Trait", "foodexpiration2"};
		end
		if NecroList.Items.LGTrait2 then	
		else
			NecroList.Items.LGTrait2 = {"Traits", nil, nil, "Trait - " .. getText("UI_trait_bartender"), "NecroForge.NecroFunction", "media/ui/Traits/trait_bartender2.png", nil, nil, nil, "Trait", "Bartender2"};
		end
		if NecroList.Items.LGTrait3 then	
		else
			NecroList.Items.LGTrait3 = {"Traits", nil, nil, "Trait - " .. getText("UI_trait_bestchef"), "NecroForge.NecroFunction", "media/ui/Traits/trait_bestchef.png", nil, nil, nil, "Trait", "bestchef"};
		end
		if NecroList.Items.Oil then	
		else
			NecroList.Items.Oil = {"Food", nil, nil, getItemText("Oil"), "Base.Oil", "Item_VegetableOil", nil, nil, nil};
		end
		if NecroList.Items.WhippedCream then	
		else
			NecroList.Items.WhippedCream = {"Food", nil, nil, getItemText("Whipped_Cream"), "Base.WhippedCream", "Item_Creambatter", nil, nil, nil};
		end
		if NecroList.Items.RCheese1 then	
		else
			NecroList.Items.RCheese1 = {"Food", nil, nil, getItemText("Homemade_Cheese"), "Base.RCheese1", "Item_CheeseR1", nil, nil, nil};
		end
		if NecroList.Items.HandmadeCheese then	
		else
			NecroList.Items.HandmadeCheese = {"Food", nil, nil, getItemText("Homemade_Cheese"), "Base.HandmadeCheese", "Item_CheeseBig", nil, nil, nil};
		end
		if NecroList.Items.RCheese2 then	
		else
			NecroList.Items.RCheese2 = {"Food", nil, nil, getItemText("Bar_of_cheese"), "Base.RCheese2", "Item_CheeseR2", nil, nil, nil};
		end
		if NecroList.Items.RCheese3 then	
		else
			NecroList.Items.RCheese3 = {"Food", nil, nil, getItemText("Homemade_Mozzarella"), "Base.RCheese3", "Item_CheeseR3", nil, nil, nil};
		end
		if NecroList.Items.MilkPowder then	
		else
			NecroList.Items.MilkPowder = {"Food", nil, nil, getItemText("Milk_Powder"), "Base.MilkPowder", "Item_MilkPowder", nil, nil, nil};
		end
		if NecroList.Items.MoldesMagBox then	
		else
			NecroList.Items.MoldesMagBox = {"Cooking", nil, nil, getItemText("Cupcake_Mold_Box"), "Base.MoldesMagBox", "Item_CupClosedbox", nil, nil, nil};
		end
		if NecroList.Items.PackSalchichas then	
		else
			NecroList.Items.PackSalchichas = {"Food", nil, nil, getItemText("Salchicha_Pack"), "Base.PackSalchichas", "Item_SalchichaPack", nil, nil, nil};
		end
		if NecroList.Items.HogCasings then	
		else
			NecroList.Items.HogCasings = {"Food", nil, nil, getItemText("Hog_casings"), "Base.HogCasings", "Item_Hogcasings", nil, nil, nil};
		end
		if NecroList.Items.Hotdogbreaddough then	
		else
			NecroList.Items.Hotdogbreaddough = {"Food", nil, nil, getItemText("Hot_Dog_Bread"), "Base.Hotdogbreaddough", "Item_Breadhotdog", nil, nil, nil};
		end
		if NecroList.Items.Alfalfa then	
		else
			NecroList.Items.Alfalfa = {"Food", nil, nil, getItemText("Alfalfa"), "Base.Alfalfa", "Item_Alfalfa", nil, nil, nil};
		end
		if NecroList.Items.DeadCanary then	
		else
			NecroList.Items.DeadCanary = {"Food", nil, nil, getItemText("Dead_Canary"), "Base.DeadCanary", "Item_CanaryDead", nil, nil, nil};
		end
		if NecroList.Items.MustardSeeds then	
		else
			NecroList.Items.MustardSeeds = {"Farming", nil, nil, getItemText("Mustard_Seeds"), "Base.MustardSeeds", "Item_Mostaza", nil, nil, nil};
		end
		if NecroList.Items.MedicalHose then	
		else
			NecroList.Items.MedicalHose = {"Medicine", nil, nil, getItemText("Medical_hose"), "Base.MedicalHose", "Item_MedicalHose", nil, nil, nil};
		end
		if NecroList.Items.Bsodium then	
		else
			NecroList.Items.Bsodium = {"Medicine", nil, nil, getItemText("Bicarbonate_Soda"), "legourmetfarming.BSodium", "Item_BicarbonateSodium", nil, nil, nil};
		end
		if NecroList.Items.RiceBagSeed then	
		else
			NecroList.Items.RiceBagSeed = {"Farming", nil, nil, getItemText("Rice_Seeds_Packet"), "legourmetfarming.RiceBagSeed", "Item_RiceBagSeed", nil, nil, nil};
		end
		if NecroList.Items.ChiliBagSeed then	
		else
			NecroList.Items.ChiliBagSeed = {"Farming", nil, nil, getItemText("Chili_Seeds_Packet"), "legourmetfarming.ChiliBagSeed", "Item_ChiliBagSeed", nil, nil, nil};
		end
		if NecroList.Items.CoffeeBagSeed then	
		else
			NecroList.Items.CoffeeBagSeed = {"Farming", nil, nil, getItemText("Coffee_Seeds_Packet"), "Base.CoffeeBag", "Item_CafeBag", nil, nil, nil};
		end
		if NecroList.Items.BeanBagSeed then	
		else
			NecroList.Items.BeanBagSeed = {"Farming", nil, nil, getItemText("Bean_Seeds_Packet"), "legourmetfarming.BeanBagSeed", "Item_BeanBagSeed", nil, nil, nil};
		end
		if NecroList.Items.CornBagSeed then	
		else
			NecroList.Items.CornBagSeed = {"Farming", nil, nil, getItemText("Corn_Seeds_Packet"), "legourmetfarming.CornBagSeed", "Item_CornBagSeed", nil, nil, nil};
		end
		if NecroList.Items.BellPepperBagSeed then	
		else
			NecroList.Items.BellPepperBagSeed = {"Farming", nil, nil, getItemText("Bell_Pepper_Seeds_Packet"), "legourmetfarming.BellPepperBagSeed", "Item_BellPepperBagSeed", nil, nil, nil};
		end
		if NecroList.Items.EggplantBagSeed then	
		else
			NecroList.Items.EggplantBagSeed = {"Farming", nil, nil, getItemText("Eggplant_Seeds_Packet"), "legourmetfarming.EggplantBagSeed", "Item_EggplantBagSeed", nil, nil, nil};
		end
		if NecroList.Items.GrapeBagSeed then	
		else
			NecroList.Items.GrapeBagSeed = {"Farming", nil, nil, getItemText("Grape_Seeds_Packet"), "legourmetfarming.GrapeBagSeed", "Item_GrapeBagSeed", nil, nil, nil};
		end
		if NecroList.Items.LeekBagSeed then	
		else
			NecroList.Items.LeekBagSeed = {"Farming", nil, nil, getItemText("Leek_Seeds_Packet"), "legourmetfarming.LeekBagSeed", "Item_LeekBagSeed", nil, nil, nil};
		end
		if NecroList.Items.LettuceBagSeed then	
		else
			NecroList.Items.LettuceBagSeed = {"Farming", nil, nil, getItemText("Lettuce_Seeds_Packet"), "legourmetfarming.LettuceBagSeed", "Item_LettuceBagSeed", nil, nil, nil};
		end
		if NecroList.Items.OnionBagSeed then	
		else
			NecroList.Items.OnionBagSeed = {"Farming", nil, nil, getItemText("Onion_Seeds_Packet"), "legourmetfarming.OnionBagSeed", "Item_OnionBagSeed", nil, nil, nil};
		end
		if NecroList.Items.PeaBagSeed then	
		else
			NecroList.Items.PeaBagSeed = {"Farming", nil, nil, getItemText("Pea_Seeds_Packet"), "legourmetfarming.PeaBagSeed", "Item_PeaBagSeed", nil, nil, nil};
		end
		if NecroList.Items.PeanutBagSeed then	
		else
			NecroList.Items.PeanutBagSeed = {"Farming", nil, nil, getItemText("Peanut_Seeds_Packet"), "legourmetfarming.PeanutBagSeed", "Item_PeanutBagSeed", nil, nil, nil};
		end
		if NecroList.Items.PumpkinBagSeed then	
		else
			NecroList.Items.PumpkinBagSeed = {"Farming", nil, nil, getItemText("Pumpkin_Seeds_Packet"), "legourmetfarming.PumpkinBagSeed", "Item_PumpkinBagSeed", nil, nil, nil};
		end
		if NecroList.Items.WatermelonBagSeed then	
		else
			NecroList.Items.WatermelonBagSeed = {"Farming", nil, nil, getItemText("Watermelon_Seeds_Packet"), "legourmetfarming.WatermelonBagSeed", "Item_WatermelonBagSeed", nil, nil, nil};
		end
		if NecroList.Items.ZucchiniBagSeed then	
		else
			NecroList.Items.ZucchiniBagSeed = {"Farming", nil, nil, getItemText("Zucchini_Seeds_Packet"), "legourmetfarming.ZucchiniBagSeed", "Item_ZucchiniBagSeed", nil, nil, nil};
		end
		if NecroList.Items.LemonSeed then	
		else
			NecroList.Items.LemonSeed = {"Farming", nil, nil, getItemText("Lemon_Seeds"), "legourmetfarming.LemonSeed", "Item_LemonSeeds", nil, nil, nil};
		end
		if NecroList.Items.LimeSeed then	
		else
			NecroList.Items.LimeSeed = {"Farming", nil, nil, getItemText("Lime_Seeds"), "legourmetfarming.LimeSeed", "Item_LemonSeeds", nil, nil, nil};
		end
		if NecroList.Items.OrangeSeed then	
		else
			NecroList.Items.OrangeSeed = {"Farming", nil, nil, getItemText("Orange_Seeds"), "legourmetfarming.OrangeSeed", "Item_OrangeSeeds", nil, nil, nil};
		end
		if NecroList.Items.AppleSeed then	
		else
			NecroList.Items.AppleSeed = {"Farming", nil, nil, getItemText("Apple_Seeds"), "legourmetfarming.AppleSeed", "Item_AppleSeeds", nil, nil, nil};
		end
		if NecroList.Items.PeachSeed then	
		else
			NecroList.Items.PeachSeed = {"Farming", nil, nil, getItemText("Peach_Seeds"), "legourmetfarming.PeachSeed", "Item_PeachSeeds", nil, nil, nil};
		end
		if NecroList.Items.BananaSeed then	
		else
			NecroList.Items.BananaSeed = {"Farming", nil, nil, getItemText("Banana_Seeds"), "legourmetfarming.BananaSeed", "Item_BananaSeeds", nil, nil, nil};
		end
		if NecroList.Items.PineappleSeed then	
		else
			NecroList.Items.PineappleSeed = {"Farming", nil, nil, getItemText("Pineapple_Seeds"), "legourmetfarming.PineappleSeed", "Item_PineappleSeeds", nil, nil, nil};
		end
		if NecroList.Items.PineapplebagSeed then	
		else
			NecroList.Items.PineapplebagSeed = {"Farming", nil, nil, getItemText("Pineapple_Seeds_Packet"), "legourmetfarming.PineappleBagSeed", "Item_PineappleBagSeed", nil, nil, nil};
		end
		if NecroList.Items.CherrySeed then	
		else
			NecroList.Items.CherrySeed = {"Farming", nil, nil, getItemText("Cherry_Seeds"), "legourmetfarming.CherrySeed", "Item_TZ_LRRadishSeeds", nil, nil, nil};
		end
		if NecroList.Items.AvocadoSeed then	
		else
			NecroList.Items.AvocadoSeed = {"Farming", nil, nil, getItemText("Avocado_Seeds"), "legourmetfarming.AvocadoSeed", "Item_AvocadoSeeds", nil, nil, nil};
		end
		if NecroList.Items.PizzaDough then	
		else
			NecroList.Items.PizzaDough = {"Food", nil, nil, getItemText("Pizza_Dough"), "Base.PizzaDough", "Item_Dough", nil, nil, nil};
		end
		if NecroList.Items.PizzaPrep then	
		else
			NecroList.Items.PizzaPrep = {"Food", nil, nil, getItemText("Pizza_Preparation"), "Base.PizzaPrep", "Item_Pizzapan", nil, nil, nil};
		end
		if NecroList.Items.PizzaRaw then	
		else
			NecroList.Items.PizzaRaw = {"Food", nil, nil, getItemText("Pizza"), "Base.PizzaRaw", "Item_Pizzapan2", nil, nil, nil};
		end
		if NecroList.Items.Tomatosauce then	
		else
			NecroList.Items.Tomatosauce = {"Food", nil, nil, getItemText("Saucepan_with_Tomato_sauce"), "Base.Tomatosauce", "Item_Saucepantomato", nil, nil, nil};
		end
		if NecroList.Items.Marshmallow then	
		else
			NecroList.Items.Marshmallow = {"Food", nil, nil, getItemText("Marshmallow"), "Base.Marshmallow", "Item_Marshmallow", nil, nil, nil};
		end
		if NecroList.Items.MarshmallowP then	
		else
			NecroList.Items.MarshmallowP = {"Food", nil, nil, getItemText("Marshmallow_Package"), "Base.MarshmallowPackage", "Item_Marshmallowpacket", nil, nil, nil};
		end
		if NecroList.Items.Gelatine then	
		else
			NecroList.Items.Gelatine = {"Food", nil, nil, getItemText("Gelatine"), "Base.Gelatine", "Item_Gelatine", nil, nil, nil};
		end
		if NecroList.Items.Hmodjeska then	
		else
			NecroList.Items.Hmodjeska = {"Food", nil, nil, getItemText("Modjeska"), "Base.HomemadeModjeska", "Item_Modjeska", nil, nil, nil};
		end
		if NecroList.Items.Saucepancaramel then	
		else
			NecroList.Items.Saucepancaramel = {"Food", nil, nil, getItemText("Saucepan_caramel"), "Base.Saucepancaramel", "Item_Saucepancaramel", nil, nil, nil};
		end
		if NecroList.Items.MarshmallowBowl then	
		else
			NecroList.Items.MarshmallowBowl = {"Food", nil, nil, getItemText("Marshmallow_Bowl"), "Base.MarshmallowBowl", "Item_MarshmallowBowl", nil, nil, nil};
		end
		if NecroList.Items.Cowribs then	
		else
			NecroList.Items.Cowribs = {"Food", nil, nil, getItemText("Cow_ribs"), "Base.Cowribs", "Item_Costillar", nil, nil, nil};
		end
		if NecroList.Items.Cowshortribs then	
		else
			NecroList.Items.Cowshortribs = {"Food", nil, nil, getItemText("Cow_short_ribs"), "Base.Cowshortribs", "Item_Asado", nil, nil, nil};
		end
		if NecroList.Items.BeerBottleEmpty then	
		else
			NecroList.Items.BeerBottleEmpty = {"Drink", nil, nil, getItemText("Empty_Bottle"), "legourmet.BeerBottleEmpty", "Item_RHP_BA17CrystalBottle", nil, nil, nil};
		end
		if NecroList.Items.Beer1 then	
		else
			NecroList.Items.Beer1 = {"Drink", nil, nil, getItemText("Black_Beer_Bottle"), "legourmet.Beer1", "Item_RHP_BA09Beer1", nil, nil, nil};
		end
		if NecroList.Items.Beer2 then	
		else
			NecroList.Items.Beer2 = {"Drink", nil, nil, getItemText("Lemon_Beer_Bottle"), "legourmet.Beer2", "Item_RHP_BA10Beer2", nil, nil, nil};
		end
		if NecroList.Items.Beer3 then	
		else
			NecroList.Items.Beer3 = {"Drink", nil, nil, getItemText("Amber_Beer_Bottle"), "legourmet.Beer3", "Item_RHP_BA11Beer3", nil, nil, nil};
		end
		if NecroList.Items.BeerSixPack1 then	
		else
			NecroList.Items.BeerSixPack1 = {"Drink", nil, nil, getItemText("Black_Beer_Six_Pack"), "legourmet.BeerSixPack1", "Item_RHP_BA12Beersixpack1", nil, nil, nil};
		end
		if NecroList.Items.BeerSixPack2 then	
		else
			NecroList.Items.BeerSixPack2 = {"Drink", nil, nil, getItemText("Lemon_Beer_Six_Pack"), "legourmet.BeerSixPack2", "Item_RHP_BA13Beersixpack2", nil, nil, nil};
		end
		if NecroList.Items.BeerSixPack3 then	
		else
			NecroList.Items.BeerSixPack3 = {"Drink", nil, nil, getItemText("Amber_Beer_Six_Pack"), "legourmet.BeerSixPack3", "Item_RHP_BA14Beersixpack3", nil, nil, nil};
		end
		if NecroList.Items.Beercan1 then	
		else
			NecroList.Items.Beercan1 = {"Drink", nil, nil, getItemText("Beer_Can"), "legourmet.Beercan1", "Item_RHP_BA18Beercan1", nil, nil, nil};
		end
		if NecroList.Items.Beercan2 then	
		else
			NecroList.Items.Beercan2 = {"Drink", nil, nil, getItemText("Beer_Can"), "legourmet.Beercan2", "Item_RHP_BA19Beercan2", nil, nil, nil};
		end
		if NecroList.Items.Beercan3 then	
		else
			NecroList.Items.Beercan3 = {"Drink", nil, nil, getItemText("Beer_Can"), "legourmet.Beercan3", "Item_RHP_BA20Beercan3", nil, nil, nil};
		end
		if NecroList.Items.Beercan4 then	
		else
			NecroList.Items.Beercan4 = {"Drink", nil, nil, getItemText("Beer_Can"), "legourmet.Beercan4", "Item_RHP_BA21Beercan4", nil, nil, nil};
		end
		if NecroList.Items.BeerCanEmpty then	
		else
			NecroList.Items.BeerCanEmpty = {"Drink", nil, nil, getItemText("Empty_can"), "legourmet.BeerCanEmpty", "Item_RHP_BA22Can", nil, nil, nil};
		end
		if NecroList.Items.Shaker then	
		else
			NecroList.Items.Shaker = {"Drink", nil, nil, getItemText("Shaker"), "legourmet.Shaker", "Item_RHP_KU07Shaker", nil, nil, nil};
		end
		if NecroList.Items.MargaritaGlass then	
		else
			NecroList.Items.MargaritaGlass = {"Drink", nil, nil, getItemText("Margarita_Glass"), "legourmet.MargaritaGlass", "Item_RHP_BG01MargaritaGlass", nil, nil, nil};
		end
		if NecroList.Items.MartiniGlass then	
		else
			NecroList.Items.MartiniGlass = {"Drink", nil, nil, getItemText("Martini_Glass"), "legourmet.MartiniGlass", "Item_RHP_BG02MartiniGlass", nil, nil, nil};
		end
		if NecroList.Items.GreenOlives then	
		else
			NecroList.Items.GreenOlives = {"Drink", "Food", nil, getItemText("Green_Olives"), "legourmet.GreenOlives", "Item_Greenolives", nil, nil, nil};
		end
		if NecroList.Items.GreenOlives2 then	
		else
			NecroList.Items.GreenOlives2 = {"Drink", "Food", nil, getItemText("Simple_Green_Olives"), "legourmet.GreenOlives2", "Item_Simplegreenolives", nil, nil, nil};
		end
		if NecroList.Items.CocktailSpoon then	
		else
			NecroList.Items.CocktailSpoon = {"Drink", nil, nil, getItemText("Cocktail_Spoon"), "legourmet.CocktailSpoon", "Item_RHP_KU08CocktailSpoon", nil, nil, nil};
		end
		if NecroList.Items.IceCubes then	
		else
			NecroList.Items.IceCubes = {"Drink", "Food", nil, getItemText("Ice_Cubes"), "legourmet.IceCubes", "Item_RHP_KI01IceCubes", nil, nil, nil};
		end
		if NecroList.Items.SodaBottle then	
		else
			NecroList.Items.SodaBottle = {"Drink", nil, nil, getItemText("Soda_Bottle"), "legourmet.SodaBottle", "Item_RHP_KI13SodaBottleFull", nil, nil, nil};
		end
		if NecroList.Items.WhiteTequila then	
		else
			NecroList.Items.WhiteTequila = {"Drink", nil, nil, getItemText("White_Tequila_Bottle"), "legourmet.WhiteTequila", "Item_RHP_BA07WhiteTequila", nil, nil, nil};
		end
		if NecroList.Items.TripleSec then	
		else
			NecroList.Items.TripleSec = {"Drink", nil, nil, getItemText("Triple_Sec_Bottle"), "legourmet.TripleSec", "Item_RHP_BA06TripleSec", nil, nil, nil};
		end
		if NecroList.Items.Lime then	
		else
			NecroList.Items.Lime = {"Drink", "Food", nil, getItemText("Lime"), "legourmet.Lime", "Item_RHP_KI09Lime", nil, nil, nil};
		end
		if NecroList.Items.DrinksMag2 then	
		else
			NecroList.Items.DrinksMag2 = {"Literature", nil, nil, getItemText("Drinks_Magazine"), "legourmet.DrinksMag2", "Item_RHP_BM02DrinksMagazine", nil, nil, nil};
		end
		if NecroList.Items.BeeNest then	
		else
			NecroList.Items.BeeNest = {"Food", "Camping", nil, getItemText("Bee_Nest"), "Base.BeeNest", "Item_BeeNest", nil, nil, nil};
		end
		if NecroList.Items.HoneyJar then	
		else
			NecroList.Items.HoneyJar = {"Food", nil, nil, getItemText("Jar_of_Honey"), "Base.HoneyJar", "Item_Honeyjar", nil, nil, nil};
		end
		if NecroList.Items.Ginebra then	
		else
			NecroList.Items.Ginebra = {"Drink", nil, nil, getItemText("Gin_Bottle"), "legourmet.Ginebra", "Item_RHP_BA01Gin", nil, nil, nil};
		end
		if NecroList.Items.DryVermouth then	
		else
			NecroList.Items.DryVermouth = {"Drink", nil, nil, getItemText("Dry_Vermouth"), "legourmet.DryVermouth", "Item_RHP_BA02DryVermouth", nil, nil, nil};
		end
		if NecroList.Items.WhiteRum then	
		else
			NecroList.Items.WhiteRum = {"Drink", nil, nil, getItemText("White_Rum_Bottle"), "legourmet.WhiteRum", "Item_RHP_BA03WhiteRum", nil, nil, nil};
		end
		if NecroList.Items.Rum then	
		else
			NecroList.Items.Rum = {"Drink", nil, nil, getItemText("Rum_Bottle"), "legourmet.Rum", "Item_RHP_BA04Rum", nil, nil, nil};
		end
		if NecroList.Items.Aguaardiente then	
		else
			NecroList.Items.Aguaardiente = {"Drink", nil, nil, getItemText("Agua_Ardiente_Bottle"), "legourmet.Aguaardiente", "Item_RHP_BA05Aguaardiente", nil, nil, nil};
		end
		if NecroList.Items.JarOlives2 then	
		else
			NecroList.Items.JarOlives2 = {"Food", nil, nil, getItemText("Green_Olives_Jar"), "legourmet.JarOlives2", "Item_JarOlives", nil, nil, nil};
		end
		if NecroList.Items.JarOlives then	
		else
			NecroList.Items.JarOlives = {"Food", nil, nil, getItemText("Green_Olives_Jar"), "legourmet.JarOlives", "Item_JarOlives2", nil, nil, nil};
		end
		if NecroList.Items.JarOlives3 then	
		else
			NecroList.Items.JarOlives3 = {"Food", nil, nil, getItemText("Simple_Green_Olives_Jar"), "legourmet.JarOlives3", "Item_JarOlives3", nil, nil, nil};
		end
		if NecroList.Items.JarOlives4 then	
		else
			NecroList.Items.JarOlives4 = {"Food", nil, nil, getItemText("Simple_Green_Olives_Jar"), "legourmet.JarOlives4", "Item_JarOlives4", nil, nil, nil};
		end
		if NecroList.Items.SaltStone then	
		else
			NecroList.Items.SaltStone = {"Food", "Camping", nil, getItemText("Salt_Stone"), "Base.SaltStone", "Item_SaltStone", nil, nil, nil};
		end
		if NecroList.Items.Pepperplant then	
		else
			NecroList.Items.Pepperplant = {"Food", "Camping", nil, getItemText("Pepper_Plant"), "Base.Pepperplant", "Item_pepperplant", nil, nil, nil};
		end
		if NecroList.Items.HiddenBox then	
		else
			NecroList.Items.HiddenBox = {"Misc.", nil, nil, getItemText("Hidden_box"), "AdvancedFishing.HiddenBox", "Item_HiddenBox", nil, nil, nil};
		end
		if NecroList.Items.BirdNest then	
		else
			NecroList.Items.BirdNest = {"Misc.", nil, nil, getItemText("Bird_Nest"), "Base.BirdNest", "Item_BirdNest", nil, nil, nil};
		end
		if NecroList.Items.DeerHead then	
		else
			NecroList.Items.DeerHead = {"Misc.", nil, nil, getItemText("Deer_Head"), "Base.DeerHead", "Item_Deerhead", nil, nil, nil};
		end
		if NecroList.Items.CowHead then	
		else
			NecroList.Items.CowHead = {"Misc.", nil, nil, getItemText("Cow_Head"), "Base.CowHead", "Item_Cowhead", nil, nil, nil};
		end
		if NecroList.Items.BearHead then	
		else
			NecroList.Items.BearHead = {"Misc.", nil, nil, getItemText("Bear_Head"), "Base.BearHead", "Item_Bearhead", nil, nil, nil};
		end
		if NecroList.Items.BoarHead then	
		else
			NecroList.Items.BoarHead = {"Misc.", nil, nil, getItemText("Boar_Head"), "Base.BoarHead", "Item_Boarhead", nil, nil, nil};
		end
		if NecroList.Items.BisonHead then	
		else
			NecroList.Items.BisonHead = {"Misc.", nil, nil, getItemText("Bison_Head"), "Base.BisonHead", "Item_Bisonhead", nil, nil, nil};
		end
		if NecroList.Items.WaterCubebox then	
		else
			NecroList.Items.WaterCubebox = {"Drink", nil, nil, getItemText("Water_cube_box"), "Base.WaterCubebox", "Item_cubeboxfull", nil, nil, nil};
		end
		if NecroList.Items.DeadMutton then	
		else
			NecroList.Items.DeadMutton = {"Misc.", nil, nil, getItemText("Dead_Mutton"), "Base.DeadMutton", "Item_Deadsheep", nil, nil, nil};
		end
		if NecroList.Items.DeadBlackBear then	
		else
			NecroList.Items.DeadBlackBear = {"Misc.", nil, nil, getItemText("Dead_Black_Bear"), "Base.DeadBlackBear", "Item_Deadbearblack", nil, nil, nil};
		end
		if NecroList.Items.WilsonBall then	
		else
			NecroList.Items.WilsonBall = {"Misc.", nil, nil, getItemText("Wilson_Ball"), "AdvancedFishing.WilsonBall", "Item_Wilson", nil, nil, nil};
		end
		if NecroList.Items.CowRug then	
		else
			NecroList.Items.CowRug = {"Misc.", nil, nil, getItemText("Cow_Rug"), "Base.CowRug", "Item_CowRug", nil, nil, nil};
		end
		if NecroList.Items.BearRug then	
		else
			NecroList.Items.BearRug = {"Misc.", nil, nil, getItemText("Bear_Rug"), "Base.BearRug", "Item_BearRug", nil, nil, nil};
		end
		if NecroList.Items.SharkTooth then	
		else
			NecroList.Items.SharkTooth = {"Misc.", nil, nil, getItemText("Shark_tooth"), "Base.SharkTooth", "Item_SharkTooth", nil, nil, nil};
		end
		--if NecroList.Items.SurvivalKnife then	
		--else
		--	NecroList.Items.SurvivalKnife = {"Camping", "Weapons", nil, getItemText("Survival_knife"), "Base.SurvivalKnife", "Item_SurvivalKnife", nil, nil, nil};
		--end
		if NecroList.Items.SurvivalKnife2 then	
		else
			NecroList.Items.SurvivalKnife2 = {"Camping", "Weapons", nil, getItemText("SharkTooth_knife"), "Base.SurvivalKnife2", "Item_SharkKnife", nil, nil, nil};
		end
		if NecroList.Items.WoodenGrip then	
		else
			NecroList.Items.WoodenGrip = {"Misc.", nil, nil, getItemText("Wooden_grip"), "Base.WoodenGrip", "Item_woodengrip", nil, nil, nil};
		end
		if NecroList.Items.SurvivalistMag1 then	
		else
			NecroList.Items.SurvivalistMag1 = {"Literature", nil, nil, getItemText("The_Survivalist_Magazine"), "Base.SurvivalistMag1", "Item_SurvivalMag1", nil, nil, nil};
		end
		if NecroList.Items.SharpedknifeStone then	
		else
			NecroList.Items.SharpedknifeStone = {"Misc.", nil, nil, getItemText("Chipped_knife_stone"), "Base.SharpedknifeStone", "Item_KnStone", nil, nil, nil};
		end
		if NecroList.Items.SurvivalistMag2 then	
		else
			NecroList.Items.SurvivalistMag2 = {"Literature", nil, nil, getItemText("The_Survivalist_Magazine2"), "Base.SurvivalistMag2", "Item_SurvivalMag2", nil, nil, nil};
		end
		if NecroList.Items.SurvivalistMag3 then	
		else
			NecroList.Items.SurvivalistMag3 = {"Literature", nil, nil, getItemText("The_Survivalist_Magazine3"), "Base.SurvivalistMag3", "Item_SurvivalMag3", nil, nil, nil};
		end
		if NecroList.Items.SurvivalistMag4 then	
		else
			NecroList.Items.SurvivalistMag4 = {"Literature", nil, nil, getItemText("The_Survivalist_Magazine4"), "Base.SurvivalistMag4", "Item_SurvivalMag4", nil, nil, nil};
		end
		if NecroList.Items.SurvivalistMag5 then	
		else
			NecroList.Items.SurvivalistMag5 = {"Literature", nil, nil, getItemText("The_Survivalist_Magazine5"), "Base.SurvivalistMag5", "Item_SurvivalMag5", nil, nil, nil};
		end
		if NecroList.Items.ClimateMagazine then	
		else
			NecroList.Items.ClimateMagazine = {"Literature", "Camping", nil, getItemText("Climatology_Magazine"), "Base.LGClimatologyMag", "Item_ClimatologyMag1", nil, nil, nil};
		end
		if NecroList.Items.WheatBagSeed then	
		else
			NecroList.Items.WheatBagSeed = {"Farming", nil, nil, getItemText("Wheat_Seeds_Packet"), "legourmetfarming.WheatBagSeed", "Item_WheatBagSeed", nil, nil, nil};
		end
		if NecroList.Items.SugarcaneBagSeed then	
		else
			NecroList.Items.SugarcaneBagSeed = {"Farming", nil, nil, getItemText("Sugarcane_Seeds_Packet"), "legourmetfarming.SugarcaneBagSeed", "Item_SugarcaneBagSeed", nil, nil, nil};
		end
		if NecroList.Items.SunflowerBagSeed then	
		else
			NecroList.Items.SunflowerBagSeed = {"Farming", nil, nil, getItemText("Sunflower_Seeds_Packet"), "legourmetfarming.SunFlowerBagSeed", "Item_SunflowerBagSeed", nil, nil, nil};
		end
		if NecroList.Items.CowSkin then	
		else
			NecroList.Items.CowSkin = {"Misc.", nil, nil, getItemText("Cow_skin"), "Base.CowSkin", "Item_AnimalSkinCow", nil, nil, nil};
		end
		if NecroList.Items.DeerSkin then	
		else
			NecroList.Items.DeerSkin = {"Misc.", nil, nil, getItemText("Deer_skin"), "Base.DeerSkin", "Item_AnimalSkinDeer", nil, nil, nil};
		end
		if NecroList.Items.BearSkin then	
		else
			NecroList.Items.BearSkin = {"Misc.", nil, nil, getItemText("Bear_skin"), "Base.BearSkin", "Item_AnimalSkinBear", nil, nil, nil};
		end
		if NecroList.Items.Sugarcane then	
		else
			NecroList.Items.Sugarcane = {"Food", "Farming", nil, getItemText("Sugarcane"), "Base.Sugarcane", "Item_Sugarcane", nil, nil, nil};
		end
		if NecroList.Items.SugarcanePile then	
		else
			NecroList.Items.SugarcanePile = {"Food", "Farming", nil, getItemText("Sugarcane_Pile"), "Base.SugarcanePile", "Item_CanePile", nil, nil, nil};
		end
		if NecroList.Items.MetalDetector then	
		else
			NecroList.Items.MetalDetector = {"Misc", nil, nil, getItemText("Metal_detector"), "AdvancedFishing.MetalDetector", "Item_MetalDetector", nil, nil, nil};
		end
		if NecroList.Items.TreeBranchWindow then	
		else
			NecroList.Items.TreeBranchWindow = {"Misc.", nil, nil, getItemText("Natural_Tree_Branch_Window"), "Base.TreeBranchWindow", "Item_treebranchwindow", nil, nil, nil};
		end
		if NecroList.Items.CheeseMoldFull then	
		else
			NecroList.Items.CheeseMoldFull = {"Food", nil, nil, getItemText("Bar_of_cheese"), "Base.CheeseMoldFull", "Item_CheeseMoldfull1", nil, nil, nil};
		end
		if NecroList.Items.CheeseMoldFull2 then
		else
			NecroList.Items.CheeseMoldFull2 = {"Food", nil, nil, getItemText("BarCheese_in_Mold"), "Base.CheeseMoldFull2", "Item_CheeseMold3full", nil, nil, nil};
		end
		if NecroList.Items.CheeseMoldFull3 then	
		else
			NecroList.Items.CheeseMoldFull3 = {"Food", nil, nil, getItemText("Mozzarella_in_Mold"), "Base.CheeseMoldFull3", "Item_CheeseMoldfull4", nil, nil, nil};
		end
		if NecroList.Items.Bow1 then	
		else
			NecroList.Items.Bow1 = {"Weapons", nil, nil, getItemText("Handmade_Bow"), "Base.HandmadeBow", "Item_lgepbow", nil, nil, nil};
		end
		if NecroList.Items.BowArrow then	
		else
			NecroList.Items.BowArrow = {"Ammunition", "Weapons", nil, getItemText("Handmade_Arrows"), "Base.BowArrow", "Item_AncientArrows", nil, nil, nil};
		end
		if NecroList.Items.Quiver then	
		else
			NecroList.Items.Quiver = {"Ammunition", "Weapons", nil, getItemText("Quiver"), "Base.Quiver", "Item_Quiver", nil, nil, nil};
		end
		if NecroList.Items.BowsMag1 then	
		else
			NecroList.Items.BowsMag1 = {"Literature", nil, nil, getItemText("Bows_Magazine_1"), "Base.BowsMag1", "Item_MagazineBows", nil, nil, nil};
		end
		if NecroList.Items.Crossbow then	
		else
			NecroList.Items.Crossbow = {"Weapons", nil, nil, getItemText("Crossbow"), "Base.Crossbow", "Item_LGEPCrossbow", nil, nil, nil};
		end
		if NecroList.Items.CrossbowArrow then	
		else
			NecroList.Items.CrossbowArrow = {"Ammunition", "Weapons", nil, getItemText("Crossbow_Bolts"), "Base.CrossbowArrow", "Item_CrosbowBolts", nil, nil, nil};
		end
		if NecroList.Items.SlingshotW1 then	
		else
			NecroList.Items.SlingshotW1 = {"Weapons", nil, nil, getItemText("Slingshot"), "Base.SlingshotWeapon", "Item_Gomera1", nil, nil, nil};
		end
		if NecroList.Items.SlingshotW2 then	
		else
			NecroList.Items.SlingshotW2 = {"Weapons", nil, nil, getItemText("Carpenter_Slingshot"), "Base.SlingshotWeapon2", "Item_Slingshot2", nil, nil, nil};
		end
		if NecroList.Items.Ministones then	
		else
			NecroList.Items.Ministones = {"Ammunition", "Weapons", nil, getItemText("Mini_Stones"), "Base.MiniStones", "Item_MiniStones", nil, nil, nil};
		end
		if NecroList.Items.Fishinglurebox then	
		else
			NecroList.Items.Fishinglurebox = {"Camping", nil, nil, getItemText("Fishing_lure_box"), "AdvancedFishing.Fishinglurebox", "Item_FishingLureBox", nil, nil, nil};
		end
		if NecroList.Items.StormFlutterstick then	
		else
			NecroList.Items.StormFlutterstick = {"Camping", nil, nil, getItemText("Storm_Flutterstick"), "AdvancedFishing.StormFlutterstick", "Item_StormFlutterstickMadflash", nil, nil, nil};
		end
		if NecroList.Items.RattlinRap then	
		else
			NecroList.Items.RattlinRap = {"Camping", nil, nil, getItemText("Rapala_rattlin"), "AdvancedFishing.RattlinRap", "Item_RattlinRap", nil, nil, nil};
		end
		if NecroList.Items.SwimJig then	
		else
			NecroList.Items.SwimJig = {"Camping", nil, nil, getItemText("Swim_Jig"), "AdvancedFishing.SwimJig", "Item_Jig1", nil, nil, nil};
		end
		if NecroList.Items.SwimJig2 then	
		else
			NecroList.Items.SwimJig2 = {"Camping", nil, nil, getItemText("Swim_Jig"), "AdvancedFishing.SwimJig2", "Item_Jig2", nil, nil, nil};
		end
		if NecroList.Items.SwimJig3 then	
		else
			NecroList.Items.SwimJig3 = {"Camping", nil, nil, getItemText("Swim_Jig"), "AdvancedFishing.SwimJig3", "Item_Jig3", nil, nil, nil};
		end
		if NecroList.Items.GTPopper then	
		else
			NecroList.Items.GTPopper = {"Camping", nil, nil, getItemText("GT_Popper"), "AdvancedFishing.GTPopper", "Item_GTPopper", nil, nil, nil};
		end
		if NecroList.Items.SpoonLure1 then	
		else
			NecroList.Items.SpoonLure1 = {"Camping", nil, nil, getItemText("Storm_Spoon"), "AdvancedFishing.SpoonLure1", "Item_Spoon1", nil, nil, nil};
		end
		if NecroList.Items.SpoonLure2 then	
		else
			NecroList.Items.SpoonLure2 = {"Camping", nil, nil, getItemText("Storm_Spoon"), "AdvancedFishing.SpoonLure2", "Item_Spoon2", nil, nil, nil};
		end
		if NecroList.Items.SpoonLure3 then	
		else
			NecroList.Items.SpoonLure3 = {"Camping", nil, nil, getItemText("Storm_Spoon"), "AdvancedFishing.SpoonLure3", "Item_Spoon3", nil, nil, nil};
		end
		if NecroList.Items.JitterBug then	
		else
			NecroList.Items.JitterBug = {"Camping", nil, nil, getItemText("Jitterbug"), "AdvancedFishing.JitterBug", "Item_Jitterbug", nil, nil, nil};
		end
		if NecroList.Items.Crankbait then	
		else
			NecroList.Items.Crankbait = {"Camping", nil, nil, getItemText("Evergreen_crankbait"), "AdvancedFishing.Crankbait", "Item_EverGreenCrankbait", nil, nil, nil};
		end
		if NecroList.Items.SwimShad then	
		else
			NecroList.Items.SwimShad = {"Camping", nil, nil, getItemText("SwimShad"), "AdvancedFishing.SwimShad", "Item_SwimShad", nil, nil, nil};
		end
		if NecroList.Items.Alfers then	
		else
			NecroList.Items.Alfers = {"Camping", nil, nil, getItemText("Mojarra_Alfers"), "AdvancedFishing.Alfers", "Item_Alfers", nil, nil, nil};
		end
		if NecroList.Items.Spinnerbait then	
		else
			NecroList.Items.Spinnerbait = {"Camping", nil, nil, getItemText("Spinnerbait"), "AdvancedFishing.Spinnerbait", "Item_Spinnerbait", nil, nil, nil};
		end
		if NecroList.Items.Smallfloaterline then	
		else
			NecroList.Items.Smallfloaterline = {"Camping", nil, nil, getItemText("0Floating_line"), "AdvancedFishing.0Smallfloaterline", "Item_Tackle1", nil, nil, nil};
		end
		if NecroList.Items.Mediumfloaterline then	
		else
			NecroList.Items.Mediumfloaterline = {"Camping", nil, nil, getItemText("Medium_floating_line"), "AdvancedFishing.Mediumfloaterline", "Item_Tackle2", nil, nil, nil};
		end
		if NecroList.Items.Bigfloaterline then	
		else
			NecroList.Items.Bigfloaterline = {"Camping", nil, nil, getItemText("Big_floating_line"), "AdvancedFishing.Bigfloaterline", "Item_Tackle3", nil, nil, nil};
		end
		if NecroList.Items.SmallDeepline then	
		else
			NecroList.Items.SmallDeepline = {"Camping", nil, nil, getItemText("Small_deep_line"), "AdvancedFishing.SmallDeepline", "Item_Tackle4", nil, nil, nil};
		end
		if NecroList.Items.MediumDeepline then	
		else
			NecroList.Items.MediumDeepline = {"Camping", nil, nil, getItemText("Medium_deep_line"), "AdvancedFishing.MediumDeepline", "Item_Tackle5", nil, nil, nil};
		end
		if NecroList.Items.HeavyDeepline then	
		else
			NecroList.Items.HeavyDeepline = {"Camping", nil, nil, getItemText("Heavy_deep_line"), "AdvancedFishing.HeavyDeepline", "Item_Tackle6", nil, nil, nil};
		end
		if NecroList.Items.LGManual then	
		else
			NecroList.Items.LGManual = {"Literature", nil, nil, getItemText("Le_Gourmet_Manual"), "Base.ManualLG", "Item_LGManualBook", nil, nil, nil};
		end
		if NecroList.Items.GoldenHook then
		else
			NecroList.Items.GoldenHook = {"Camping", nil, nil, getItemText("Golden_Hook"), "AdvancedFishing.GoldenHook", "Item_HookG", nil, nil, nil};
		end
		if NecroList.Items.SportFishingBook then	
		else
			NecroList.Items.SportFishingBook = {"Literature", nil, nil, getItemText("Sport_Fishing_Book"), "AdvancedFishing.SportFishingBook", "Item_FishingEncyclopedia2", nil, nil, nil};
		end
		if NecroList.Items.Mint then	
		else
			NecroList.Items.Mint = {"Drink", nil, nil, getItemText("Mint"), "legourmet.Mint", "Item_RHP_KI10Mint", nil, nil, nil};
		end
		if NecroList.Items.Mint then	
		else
			NecroList.Items.Mint = {"Drink", "Food", nil, getItemText("Mint"), "legourmet.Mint", "Item_RHP_KI10Mint", nil, nil, nil};
		end
		if NecroList.Items.Glass then	
		else
			NecroList.Items.Glass = {"Drink", nil, nil, getItemText("Crystal_Glass"), "legourmet.Glass", "Item_RHP_KU03Glass", nil, nil, nil};
		end
	else
		print ("LGEP: No se encuentra mod Necroforge, items de LGEP no agregados a Necroforge.");
	end
end)