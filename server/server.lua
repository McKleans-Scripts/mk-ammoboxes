local QBCore = exports['qb-core']:GetCoreObject()

---------- / Useable Items

CreateThread(function()
    local PistolAmmoBox = { "pistolammobox" }
		for k,v in pairs(PistolAmmoBox) do QBCore.Functions.CreateUseableItem(v, function(source, item) TriggerClientEvent('mk-ammoboxes:PistolAmmoBoxProg', source, item) end) end
    local SMGAmmoBox = { "smgammobox" }
		for k,v in pairs(SMGAmmoBox) do QBCore.Functions.CreateUseableItem(v, function(source, item) TriggerClientEvent('mk-ammoboxes:SMGAmmoBoxProg', source, item) end) end
end)

RegisterNetEvent("mk-ammoboxes:RemoveUse", function(hp, data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if hp == 1 then
        Player.Functions.RemoveItem('pistolammobox', 1, data.slot)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['pistolammobox'], "remove")
    else
        Player.PlayerData.items[data.slot].info.uses = Player.PlayerData.items[data.slot].info.uses - 1
        Player.Functions.SetInventory(Player.PlayerData.items)
    end
end)

RegisterNetEvent("mk-ammoboxes:AddPistolAmmo", function(hp, data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem('pistol_ammo', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['pistol_ammo'], "add")
end)

RegisterNetEvent("mk-ammoboxes:AddSMGAmmo", function(hp, data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem('smg_ammo', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['smg_ammo'], "add")
end)