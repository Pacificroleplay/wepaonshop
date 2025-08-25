local QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()
    for _, shop in pairs(Config.Shops) do
        local modelHash = GetHashKey(shop.ped)
        RequestModel(modelHash)
        while not HasModelLoaded(modelHash) do Wait(10) end

        local ped = CreatePed(4, modelHash, shop.coords.x, shop.coords.y, shop.coords.z-1.0, shop.coords.w, false, true)
        SetEntityHeading(ped, shop.coords.w)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        TaskStartScenarioInPlace(ped, shop.scenario, 0, true)

        exports['qb-target']:AddTargetEntity(ped, {
            options = {
                {
                    type = "client",
                    event = "prp-weaponshop:client:openShopMenu",
                    icon = shop.targetIcon,
                    label = shop.targetLabel,
                    shopProducts = shop.products
                }
            },
            distance = shop.radius
        })

        if shop.showBlip then
            local blip = AddBlipForCoord(shop.coords.x, shop.coords.y, shop.coords.z)
            SetBlipSprite(blip, shop.blipSprite)
            SetBlipScale(blip, shop.blipScale)
            SetBlipColour(blip, shop.blipColor)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(shop.label)
            EndTextCommandSetBlipName(blip)
        end
    end
end)

RegisterNetEvent('prp-weaponshop:client:openShopMenu', function(data)
    local menu = {{header = "Ammunation", isMenuHeader = true}}

    for _, item in pairs(data.shopProducts) do
        local txt = "$"..item.price
        if item.requiredLicense then txt = txt .. " (License Required)" end
        table.insert(menu, {
            header = item.name,
            txt = txt,
            params = { event = "prp-weaponshop:server:buyItem", args = item.name }
        })
    end

    exports['qb-menu']:openMenu(menu)
end)
