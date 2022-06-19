--***********************************************************
--**       	            OSIRIS_CSX        	           	   **
--***********************************************************

require "recipecode"

-- If you eat ZombieMeat , 
function OnEat_ZombieMeat(food, character)
	if food:getType() == "ZombieMeat" then
		for i = 0, character:getBodyDamage():getBodyParts():size()-1 do
			character:getBodyDamage():getBodyParts():get(i):SetInfected(true);
		end
	end
end

function Return_AllUsedItems(items, result, player)
    	player:getInventory():AddItem("Base.PZGlassTestTube",1);

	for i=1,25 do
		player:getInventory():AddItem("Base.SyringeZempty",1);
	end
	
end

--Give player items in the kit

function Return_PZBloodCureKitItems(items, result, player)
	player:getInventory():AddItem("Base.PZGlassTestTube",1);
    player:getInventory():AddItem("Base.PZGlassFlask",1);
	player:getInventory():AddItem("Base.BoxedSyringes",1);
end
