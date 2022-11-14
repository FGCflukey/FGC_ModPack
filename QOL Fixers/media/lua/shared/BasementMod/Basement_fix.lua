local oldProc = Basement.IsObjectHatch

--- Check an object is a hatch
---@return boolean
function Basement.IsObjectHatch(obj)
	if obj == nil then 
		return false
	else
		return oldProc( obj)
	end
end