if BMSATM == nil then BMSATM = {} end
BMSATM.ClientDataBase = {}

function BMSATM.ClientDataBase.OnReceiveGlobalModData(key, modData)
    if modData then
    	ModData.remove(key)
        ModData.add(key, modData)
    end
end
Events.OnReceiveGlobalModData.Add(BMSATM.ClientDataBase.OnReceiveGlobalModData)

function BMSATM.ClientDataBase.OnConnected()
	ModData.request("MoneyBalance")
end
Events.OnConnected.Add(BMSATM.ClientDataBase.OnConnected)