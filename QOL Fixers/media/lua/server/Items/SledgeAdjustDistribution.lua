require 'Items/ProceduralDistributions'

local function preDistributionMerge()
  table.insert(ProceduralDistributions.list["GarageTools"].items, "Base.Sledgehammer");
  table.insert(ProceduralDistributions.list["GarageTools"].items, 1);
  table.insert(ProceduralDistributions.list["GarageTools"].items, "Base.Sledgehammer2");
  table.insert(ProceduralDistributions.list["GarageTools"].items, 1);

  table.insert(ProceduralDistributions.list["ToolStoreTools"].items, "Base.Sledgehammer");
  table.insert(ProceduralDistributions.list["ToolStoreTools"].items, 1);
  table.insert(ProceduralDistributions.list["ToolStoreTools"].items, "Base.Sledgehammer2");
  table.insert(ProceduralDistributions.list["ToolStoreTools"].items, 1);

end
Events.OnPreDistributionMerge.Add(preDistributionMerge);