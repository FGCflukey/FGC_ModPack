require "Definitions/CMBSpecialLootDef"
if CMBSpecialLootDef then
	if CMBSpecialLootDef["Magazines"] then
		table.insert(CMBSpecialLootDef["Magazines"].items, "Base.SurvivalistMag1");
		table.insert(CMBSpecialLootDef["Magazines"].items, "Base.SurvivalistMag2");
		table.insert(CMBSpecialLootDef["Magazines"].items, "Base.SurvivalistMag3");
		table.insert(CMBSpecialLootDef["Magazines"].items, "Base.SurvivalistMag4");
		table.insert(CMBSpecialLootDef["Magazines"].items, "Base.SurvivalistMag5");
		table.insert(CMBSpecialLootDef["Magazines"].items, "Base.SurvivalistMag6");
	end
end