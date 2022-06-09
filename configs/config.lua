Config = {}

--------------------------
-- Utility
--------------------------
Config.Utility = {
    Framework = "NEW", -- QBCore
    CoreName = "qb-core", -- Core Name
    Target = "qb-target", -- Name of your target
    EnableCallCops = true, -- Enable call cops?
    ChanceCallCops = 50, -- % To call cops
    Cooldown = 900000,   -- Cooldown
    NeedJob = false, -- Need Job?
    JobName = "", -- Job Name if you use NeedJob true
    VehicleKeysTrigger = "vehiclekeys:client:SetOwner",
    Peds = { 
        {type = 4, hash = GetHashKey("s_m_m_gaffer_01"), x = 707.04,  y = -1142.53,  z = 23.51, h = 90.93}, -- Los Santos
    },
    Locations = {
        vector3(707.04, -1142.53, 23.51)
    },
    Blips = {
        Enable = true, -- Enable blips?
        Sprite = 441,
        Scale = 0.8,
        Colour = 35,
        Name = "Fake Plate", -- Name of the blip
    },
}

