local LgOverlayMap = {}
LgOverlayMap.VERSION = 1
LgOverlayMap["camping_02_20"] = {{ name = "other", tiles = {"camping_02_21", "camping_02_21"} }}
LgOverlayMap["camping_02_22"] = {{ name = "other", tiles = {"camping_02_23", "camping_02_23"} }}
LgOverlayMap["camping_02_24"] = {{ name = "other", tiles = {"camping_02_25", "camping_02_25"} }}
LgOverlayMap["camping_02_26"] = {{ name = "other", tiles = {"camping_02_27", "camping_02_27"} }}
LgOverlayMap["camping_02_42"] = {{ name = "other", tiles = {"camping_02_44", "camping_02_44"} }}
LgOverlayMap["camping_02_43"] = {{ name = "other", tiles = {"camping_02_44", "camping_02_44"} }}
LgOverlayMap["carpentry_03_13"] = {{ name = "other", tiles = {"carpentry_03_17", "carpentry_03_18"} }}
LgOverlayMap["carpentry_03_14"] = {{ name = "other", tiles = {"carpentry_03_17", "carpentry_03_18"} }}
LgOverlayMap["carpentry_03_15"] = {{ name = "other", tiles = {"carpentry_03_17", "carpentry_03_18"} }}
LgOverlayMap["carpentry_03_16"] = {{ name = "other", tiles = {"carpentry_03_17", "carpentry_03_18"} }}
if not TILEZED then
  getContainerOverlays():addOverlays(LgOverlayMap)
end

return LgOverlayMap