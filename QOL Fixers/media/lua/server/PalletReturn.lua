--Return additional Nails from recycling a pallet
function GiveBack_Nails(items, result, player)
	player:getInventory():AddItem("Base.Nails",1);	  
	player:getInventory():AddItem("Base.Nails",1);	  
	player:getInventory():AddItem("Base.Nails",1);	  
	player:getInventory():AddItem("Base.Nails",1);	  

end

function GiveBack_OneRope(items, result, player)
	player:getInventory():AddItem("Base.Rope",1);	  

end

function GiveBack_TwoRope(items, result, player)
	player:getInventory():AddItem("Base.Rope",1);
	player:getInventory():AddItem("Base.Rope",1);

end

function GiveBack_Logs(items, result, player)
	player:getInventory():AddItem("Base.Log",1);	  
	player:getInventory():AddItem("Base.Log",1);	  
	player:getInventory():AddItem("Base.Log",1);	  
	player:getInventory():AddItem("Base.Log",1);
	player:getInventory():AddItem("Base.Log",1);

end

function GiveBack_Pallet(items, result, player)
	player:getInventory():AddItem("Base.Woodenpallet",1);	  

end

function GiveBack_RopeAndPallet(items, result, player)
	player:getInventory():AddItem("Base.Woodenpallet",1);	  
	player:getInventory():AddItem("Base.Rope",1);	  
	player:getInventory():AddItem("Base.Rope",1);	  

end