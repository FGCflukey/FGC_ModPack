function recipe_mewalletmoney(items, result, player)
    local wallet = ZombRand(7);
    if wallet == 6 then
       player:getInventory():AddItem("BMSATM.100Dollar");  
	elseif wallet == 5 then
       player:getInventory():AddItem("BMSATM.50Dollar");  
	elseif wallet == 4 then	
       player:getInventory():AddItem("BMSATM.20Dollar");  
	elseif wallet == 3 then
       player:getInventory():AddItem("BMSATM.10Dollar");  
	elseif wallet == 2 then
       player:getInventory():AddItem("BMSATM.5Dollar");  
	elseif wallet == 1 then	
       player:getInventory():AddItem("BMSATM.2Dollar");  
	elseif wallet == 0 then
       player:getInventory():AddItem("BMSATM.1Dollar");  
    end
end