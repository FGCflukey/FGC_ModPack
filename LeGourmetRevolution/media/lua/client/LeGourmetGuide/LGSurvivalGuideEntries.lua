require "Util/LuaList"

LGSurvivalGuideEntries = {}

LGSurvivalGuideEntries.list = LuaList:new();

LGSurvivalGuideEntries.addSurvivalGuideEntry = function (title, text, moreInfo, openConditionMethod, completeConditionMethod, moreInfoText)
    local entry = {title = title, text = text, moreInfo = moreInfo};

    LGSurvivalGuideEntries.list:add(entry);
end

LGSurvivalGuideEntries.getEntry = function(num)
    return LGSurvivalGuideEntries.list:get(num);
end

LGSurvivalGuideEntries.getEntryCount = function()
    return LGSurvivalGuideEntries.list:size();
end

LGSurvivalGuideEntries.addSurvivalGuideEntry(getText("SurvivalGuide_lgentrie1title"), getText("SurvivalGuide_lgentrie1txt"), getText("SurvivalGuide_lgentrie1moreinfo"));

LGSurvivalGuideEntries.addSurvivalGuideEntry(getText("SurvivalGuide_lgentrie2title"), getText("SurvivalGuide_lgentrie2txt"), getText("SurvivalGuide_lgentrie2moreinfo"));

LGSurvivalGuideEntries.addSurvivalGuideEntry(getText("SurvivalGuide_lgentrie3title"), getText("SurvivalGuide_lgentrie3txt"), getText("SurvivalGuide_lgentrie3moreinfo"));

LGSurvivalGuideEntries.addSurvivalGuideEntry(getText("SurvivalGuide_lgentrie4title"), getText("SurvivalGuide_lgentrie4txt"), getText("SurvivalGuide_lgentrie4moreinfo"));

LGSurvivalGuideEntries.addSurvivalGuideEntry(getText("SurvivalGuide_lgentrie5title"), getText("SurvivalGuide_lgentrie5txt"), getText("SurvivalGuide_lgentrie5moreinfo"));

LGSurvivalGuideEntries.addSurvivalGuideEntry(getText("SurvivalGuide_lgentrie6title"), getText("SurvivalGuide_lgentrie6txt"), getText("SurvivalGuide_lgentrie6moreinfo"));

LGSurvivalGuideEntries.addSurvivalGuideEntry(getText("SurvivalGuide_lgentrie7title"), getText("SurvivalGuide_lgentrie7txt"), getText("SurvivalGuide_lgentrie7moreinfo"));

LGSurvivalGuideEntries.addSurvivalGuideEntry(getText("SurvivalGuide_lgentrie8title"), getText("SurvivalGuide_lgentrie8txt"), getText("SurvivalGuide_lgentrie8moreinfo"));
