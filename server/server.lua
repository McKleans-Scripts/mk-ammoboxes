local QBCore = exports['qb-core']:GetCoreObject()

---------- / Useable Items

CreateThread(function()
    for k,v in pairs(Config.AmmoBoxes) do
        if QBCore.Shared.Items[k] ~= nil then
            QBCore.Functions.CreateUseableItem(k, function(source, item) 
                TriggerClientEvent('mk-ammoboxes:AmmoBoxProg', source, item, v.AmmoType,k) 
            end) 
        else
            print("MK-AMMOBOXES:Item = "..k.." Not Found In QBCore/Shared/Items.Lua")
        end
    end
end)

RegisterNetEvent("mk-ammoboxes:RemoveUse", function(hp, data,item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if hp == 1 then
        Player.Functions.RemoveItem(item, 1, data.slot)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove")
    else
        Player.PlayerData.items[data.slot].info.uses = Player.PlayerData.items[data.slot].info.uses - 1
        Player.Functions.SetInventory(Player.PlayerData.items)
    end
end)

RegisterNetEvent("mk-ammoboxes:AddAmmo", function(ammo)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem(ammo, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[ammo], "add")
end)