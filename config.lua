Config = {}

-- Weapon & Item Products
Config.Products = {}
Config.Products['weapons'] = {
    {name = 'weapon_knife',         price = 50,  amount = 1, info = {}, type = 'weapon'},
    {name = 'weapon_bat',           price = 50,  amount = 1, info = {}, type = 'weapon'},
    {name = 'weapon_hatchet',       price = 50,  amount = 1, info = {}, type = 'weapon'},
    {name = 'pistol_ammo',          price = 75,  amount = 250, info = {}, type = 'item'},
    {name = 'weapon_pistol',        price = 225, amount = 1, info = {}, type = 'weapon'},
    {name = 'weapon_snspistol',     price = 150, amount = 1, info = {}, type = 'weapon'},
    {name = 'weapon_vintagepistol', price = 300, amount = 1, info = {}, type = 'weapon'}
}

-- Ammunation shop locations
Config.Shops = {
    ['ammunation'] = {label = 'Ammunation', coords = vector4(22.08, -1082.48, 38.15, 34.08), ped = 's_m_y_ammucity_01', scenario = 'WORLD_HUMAN_COP_IDLES', radius = 1.5, targetIcon = 'fas fa-gun', targetLabel = 'Open Ammunation', products = Config.Products['weapons'], showBlip = true, blipSprite = 110, blipScale = 0.6, blipColor = 1},
    ['ammunation2'] = {label = 'Ammunation', coords = vector4(809.68, -2159.13, 29.62, 1.43), ped = 's_m_y_ammucity_01', scenario = 'WORLD_HUMAN_COP_IDLES', radius = 1.5, targetIcon = 'fas fa-gun', targetLabel = 'Open Ammunation', products = Config.Products['weapons'], showBlip = true, blipSprite = 110, blipScale = 0.6, blipColor = 1},
    ['ammunation3'] = {label = 'Ammunation', coords = vector4(1692.67, 3761.38, 34.71, 227.65), ped = 's_m_y_ammucity_01', scenario = 'WORLD_HUMAN_COP_IDLES', radius = 1.5, targetIcon = 'fas fa-gun', targetLabel = 'Open Ammunation', products = Config.Products['weapons'], showBlip = true, blipSprite = 110, blipScale = 0.6, blipColor = 1},
    -- Add more shops here...
}
