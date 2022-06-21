require 'Items/SuburbsDistributions'
require 'Items/Distributions'

local function PostBoxFix()
	SuburbsDistributions.all.postbox.rolls = 2;
end

Events.OnDistributionMerge.Add(PostBoxFix);