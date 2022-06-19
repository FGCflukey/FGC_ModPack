function recipe_mypot(items, result, player)
	local inv = player:getInventory();
	inv:AddItem("Base.Pot");
end

function Recipe.OnGiveXP.MyCooking5(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Cooking, 5);
end

function Give12JarLids_OnCreate(items, result, player)

	for i=1, 12 do
		player:getInventory():AddItem("Base.JarLid");
	end
end

function Recipe.OnCreate.OpenCannedFood(items, result, player)
    local jar = items:get(0);
    local aged = jar:getAge() / jar:getOffAgeMax();

    result:setAge(result:getOffAgeMax() * aged);

    player:getInventory():AddItem("Base.EmptyJar");
	player:getInventory():AddItem("Base.JarLid");

--    print("you're new food have age " .. result:getAge());
end

function DullTool_OnCreate(items, result, player)

	local tool = nil;
	for i=0, items:size()-1 do
		local toolType = items:get(i):getType();
		if (toolType == "KitchenKnife" or "HuntingKnife") then
			tool = items:get(i);
			tool:setCondition(tool:getCondition() - 1);
		end
	end

end