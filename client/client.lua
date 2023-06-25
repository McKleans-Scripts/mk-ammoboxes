local QBCore = exports['qb-core']:GetCoreObject()

local AmmoBox = 4
local AmmoBoxData = {}

RegisterNetEvent('mk-ammoboxes:AmmoBoxProg', function(ItemData,ammo,ItemName)
    QBCore.Functions.Progressbar('McKlean-Progbar', Lang:t('prog.name'), Config.ProgBar, false, false, {
        disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true,
    }, {
        animDict = Config.AnimDict, anim = Config.Anim, animflag = 8,
    }, {}, {}, function()  
        TriggerServerEvent("mk-ammoboxes:AddAmmo",ammo)
        AmmoBox = ItemData.info.uses
        AmmoBoxData = ItemData
        TriggerServerEvent("mk-ammoboxes:RemoveUse", AmmoBox, AmmoBoxData,ItemName)
        ClearPedTasks(PlayerPedId())
    end, function()
        TriggerEvent('inventory:client:busy:status', false)
        QBCore.Functions.Notify(Lang:t('prog.cancelled'), 'error')
    end)
end)

RegisterNetEvent('mk-ammoboxes:UpdateAmmoBox', function(AmmoBox)
    hp = AmmoBox
end)
