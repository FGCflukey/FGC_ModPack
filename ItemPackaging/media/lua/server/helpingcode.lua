PackageRecipes = {}

function PackageRecipes.OnTestPacking(item, result)

    if item == nil then return false end

--	if item:getType() == "BlowTorch" and item:getUsedDelta() == 1 then
	if item:IsDrainable() and item:getUsedDelta() == 1 then
		return true
	else
		return false
	end
end