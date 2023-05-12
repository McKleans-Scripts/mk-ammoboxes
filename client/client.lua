local QBCore = exports['qb-core']:GetCoreObject()

local AmmoBox = 4
local AmmoBoxData = {}

RegisterNetEvent('mk-ammoboxes:PistolAmmoBoxProg', function(ItemData)
    QBCore.Functions.Progressbar('McKlean-Progbar', Lang:t('prog.name'), Config.ProgBar, false, false, {
        disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true,
    }, {
        animDict = Config.AnimDict, anim = Config.Anim, animflag = 8,
    }, {}, {}, function()  
        TriggerServerEvent("mk-ammoboxes:AddPistolAmmo")
        AmmoBox = ItemData.info.uses
        AmmoBoxData = ItemData
        TriggerServerEvent("mk-ammoboxes:RemoveUse", AmmoBox, AmmoBoxData)
        ClearPedTasks(PlayerPedId())
    end, function()
        TriggerEvent('inventory:client:busy:status', false)
        QBCore.Functions.Notify(Lang:t('prog.cancelled'), 'error')
    end)
end)

RegisterNetEvent('mk-ammoboxes:SMGAmmoBoxProg', function(ItemData)
    print(ItemData)
    QBCore.Functions.Progressbar('McKlean-Progbar', Lang:t('prog.name'), Config.ProgBar, false, false, {
        disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true,
    }, {
        animDict = Config.AnimDict, anim = Config.Anim, animflag = 8,
    }, {}, {}, function()  
        TriggerServerEvent("mk-ammoboxes:AddSMGAmmo", ItemData)
        AmmoBox = ItemData.info.uses
        AmmoBoxData = ItemData
        TriggerServerEvent("mk-ammoboxes:RemoveUse", AmmoBox, AmmoBoxData)
        ClearPedTasks(PlayerPedId())
    end, function()
        TriggerEvent('inventory:client:busy:status', false)
        QBCore.Functions.Notify(Lang:t('prog.cancelled'), 'error')
    end)
end)

RegisterNetEvent('mk-ammoboxes:UpdateAmmoBox', function(AmmoBox)
    hp = AmmoBox
end)
