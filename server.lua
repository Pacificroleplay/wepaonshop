local QBCore = exports['qb-core']:GetCoreObject()

-- Purchase handler
RegisterNetEvent('prp-weaponshop:server:buyItem', function(itemName)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local shopItem = nil
    for _, v in pairs(Config.Products['weapons']) do
        if v.name == itemName then shopItem = v break end
    end

    if not shopItem then
        TriggerClientEvent('QBCore:Notify', src, "Item not found!", "error")
        return
    end

    -- Check license
    if shopItem.requiredLicense then
        local hasLicense = false
        for _, lic in pairs(shopItem.requiredLicense) do
            if Player.Functions.HasLicense(lic) then
                hasLicense = true
                break
            end
        end
        if not hasLicense then
            TriggerClientEvent('QBCore:Notify', src, "You do not have the required license!", "error")
            return
        end
    end

    -- Charge player
    if not Player.Functions.RemoveMoney('bank', shopItem.price, "shop-purchase") then
        TriggerClientEvent('QBCore:Notify', src, "Not enough money!", "error")
        return
    end

    local serial = nil
    if shopItem.type == 'weapon' then
        serial = tostring(math.random(10000000,99999999))
        Player.Functions.AddItem(shopItem.name, shopItem.amount, false, {serial = serial})
        exports['mdt-v2']:createWeapon({
            serial = serial,
            type = shopItem.name,
            owner = Player.PlayerData.citizenid,
            date = os.date("%Y-%m-%d %H:%M:%S")
        })
    else
        Player.Functions.AddItem(shopItem.name, shopItem.amount, false, shopItem.info)
    end

    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[shopItem.name], "add")
    TriggerClientEvent('QBCore:Notify', src, "You bought "..shopItem.name.." for $"..shopItem.price, "success")
end)
