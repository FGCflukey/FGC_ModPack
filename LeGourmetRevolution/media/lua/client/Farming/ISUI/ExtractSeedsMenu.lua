ExtractSeedsMenu = {};

ExtractSeedsMenu.doMenu = function(player, context, items)
    local pl = getSpecificPlayer(player);

    local Fruit = nil;
    for i, v in ipairs(items) do
        local tempitem = v;
        if not instanceof(v, "InventoryItem") then tempitem = v.items[1]; end
        if tempitem:IsFood() and
            (tempitem:getFoodType() == "Fruits" or tempitem:getType() ==
                "Tomato") and tempitem:IsRotten() then
            if pl:getInventory():contains(tempitem) then
                Fruit = tempitem
            end
        end
    end

    if Fruit then
        local seeds = nil
        local key = Fruit:getType()
        if key == "Grapefruit" then key = "GrapeFruit" end -- seriously? I hate string based types
        if key == "Grapes" then key = "Grape" end -- seriously? I hate string based types
        seeds = InventoryItemFactory.CreateItem(
                    "legourmetfarming." .. key .. "Seed")
        if seeds == nil then
            seeds = InventoryItemFactory.CreateItem("farming." .. key .. "Seed")
        end
        if seeds == nil then return end
        local option = context:addOption("Extract Seeds", Fruit,
                                         ExtractSeedsMenu.ExtractSeeds, pl, 0);
        print(Fruit:getFullType())
        if pl:getInventory():getItemCount(Fruit:getFullType()) > 1 then
            local SubMenu = context:getNew(context);
            context:addSubMenu(option, SubMenu);
            local _option = SubMenu:addOption(getText("ContextMenu_One"), Fruit,
                                              ExtractSeedsMenu.ExtractSeeds, pl,
                                              1);
            local _option2 = SubMenu:addOption(getText("ContextMenu_All"),
                                               Fruit,
                                               ExtractSeedsMenu.ExtractSeeds,
                                               pl, 0);
        end
    end
end
ExtractSeedsMenu.ExtractSeeds = function(item, playerObj, count)
    local key = item:getType()
    if key == "Grapefruit" then key = "GrapeFruit" end -- seriously? I hate string based types
    if key == "Grapes" then key = "Grape" end -- seriously? I hate string based types

    if count == 1 then
        local seeds = nil
        seeds = InventoryItemFactory.CreateItem(
                    "legourmetfarming." .. key .. "Seed")
        if seeds == nil then
            seeds = InventoryItemFactory.CreateItem("farming." .. key .. "Seed")
        end
        if seeds == nil then return end
        playerObj:getInventory():AddItem(seeds)
        playerObj:getInventory():Remove(item)
    else
        local cur = 0
        local to_remove = {}
        local to_add = {}

        for i = 0, playerObj:getInventory():getItems():size() - 1 do
            local cur_item = playerObj:getInventory():getItems():get(i);
            if cur_item:getType() == item:getType() and cur_item:IsRotten() then
                to_remove[cur] = cur_item
                to_add[cur] = seeds
                cur = cur + 1
            end
        end
        to_remove[cur] = item

        local seed_key = "legourmetfarming." .. key .. "Seed"
        local seeds = InventoryItemFactory.CreateItem(seed_key)
        if seeds == nil then
            seed_key = "farming." .. key .. "Seed"
            seeds = InventoryItemFactory.CreateItem(seed_key)
        end
        if seeds == nil then return end

        print("REMOVE")
        for _, i in ipairs(to_remove) do
            print(i)
            playerObj:getInventory():Remove(i)
            seed = InventoryItemFactory.CreateItem(seed_key)
            playerObj:getInventory():AddItem(seed)
        end

    end
end

Events.OnFillInventoryObjectContextMenu.Add(ExtractSeedsMenu.doMenu);
