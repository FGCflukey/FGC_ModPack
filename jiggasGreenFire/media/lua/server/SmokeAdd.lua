function SmokeKief(char)
	if char == nil then return end
	if getActivatedMods():contains("jiggasAddictionMod") then
		if char:getModData().potcount == nil then 
			char:getModData().potcount = 0;
		end
		char:getModData().potcount = (char:getModData().potcount) + 2;
		if char:getModData().potcount > 3 then
			char:getModData().potcount = 3;
		end
	end
	char:getModData().gotstoned = 3;
	if char:getModData().stonedamt == nil then 
		char:getModData().stonedamt = 0;
	end
	char:getModData().stonedamt = (char:getModData().stonedamt) + 4;
end

function SmokeHash(char)
	if char == nil then return end
	if getActivatedMods():contains("jiggasAddictionMod") then
		if char:getModData().potcount == nil then 
			char:getModData().potcount = 0;
		end
		char:getModData().potcount = (char:getModData().potcount) + 3;
		if char:getModData().potcount > 3 then
			char:getModData().potcount = 3;
		end
	end
	char:getModData().gotstoned = 3;
	if char:getModData().stonedamt == nil then 
		char:getModData().stonedamt = 0;
	end
	char:getModData().stonedamt = (char:getModData().stonedamt) + 8;
end

function SmokeWeed(char)
	if char == nil then return end
	if getActivatedMods():contains("jiggasAddictionMod") then
		if char:getModData().potcount == nil then 
			char:getModData().potcount = 0;
		end
		char:getModData().potcount = (char:getModData().potcount) + 1;
		if char:getModData().potcount > 3 then
			char:getModData().potcount = 3;
		end
	end
	char:getModData().gotstoned = 3;
	if char:getModData().stonedamt == nil then 
		char:getModData().stonedamt = 0;
	end
	char:getModData().stonedamt = (char:getModData().stonedamt) + 2;
end

function SmokeHalfWeed(char)
	if char == nil then return end
	if getActivatedMods():contains("jiggasAddictionMod") then
		if char:getModData().potcount == nil then 
			char:getModData().potcount = 0;
		end
		char:getModData().potcount = (char:getModData().potcount) + 1;
		if char:getModData().potcount > 3 then
			char:getModData().potcount = 3;
		end
	end
	char:getModData().gotstoned = 3;
	if char:getModData().stonedamt == nil then 
		char:getModData().stonedamt = 0;
	end
	char:getModData().stonedamt = (char:getModData().stonedamt) + 1;
end