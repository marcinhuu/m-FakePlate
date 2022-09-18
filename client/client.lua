local QBCore = exports[Config.Utility.CoreName]:GetCoreObject()
local esperar = false
local peds = Config.Utility.Peds

CreateThread(function()
    for _, item in pairs(peds) do RequestModel(item.hash) while not HasModelLoaded(item.hash) do Wait(1) end
        ped =  CreatePed(item.type, item.hash, item.x, item.y, item.z, item.a, false, true)
        SetBlockingOfNonTemporaryEvents(ped, true) SetPedDiesWhenInjured(ped, false) SetEntityHeading(ped, item.h) SetPedCanPlayAmbientAnims(ped, true) SetPedCanRagdollFromPlayerImpact(ped, false) 
        SetEntityInvincible(ped, true) FreezeEntityPosition(ped, true)
    end
end)

CreateThread(function()
    if Config.Utility.Blips.Enable then
    for _, info in pairs(Config.Utility.Locations) do local blip = AddBlipForCoord(info.x, info.y, info.z) SetBlipSprite(blip, Config.Utility.Blips.Sprite) SetBlipDisplay(blip, 4) SetBlipScale(blip, Config.Utility.Blips.Scale) SetBlipAsShortRange(blip, true)
        SetBlipColour(blip, Config.Utility.Blips.Colour) BeginTextCommandSetBlipName("STRING") AddTextComponentSubstringPlayerName(Config.Utility.Blips.Name) EndTextCommandSetBlipName(blip)
    end end 
end)

CreateThread(function ()
    for k, v in pairs(Config.Utility.Locations) do
        name = "FakePlate"..k
        exports[Config.Utility.Target]:AddBoxZone(name, vector3(v.x, v.y, v.z), 2, 2, { name = name, heading = 0, debugPoly = false,}, 
        {options = {{event = "m-FakePlate:Client:UsarFakePlate", icon = "fas fa-car", label = "I need a fakeplate" },
        --{event = "m-FakePlate:Client:ColocarOldPlate", icon = "fas fa-car", label = "Original Plate" },
        }, distance = 5.0})
    end
end)

RegisterNetEvent('m-FakePlate:Client:UsarFakePlate')
AddEventHandler('m-FakePlate:Client:UsarFakePlate', function()
    local job = QBCore.Functions.GetPlayerData().job.name
    if Config.Utility.NeedJob == true then if job ~= Config.Utility.JobName then QBCore.Functions.Notify("You have the wrong job.") return false end end
    if esperar then QBCore.Functions.Notify("There is currently a cooldown for you, You must wait longer before doing this again.", "error") else ChangePlate() end
end)

function ChangePlate(veh, AntigaMatricula)
    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
    local Matricula = tostring(math.random(1000, 9999))
    --local AntigaMatricula = GetVehicleNumberPlateText(veh)
    QBCore.Functions.TriggerCallback('m-FakePlate:server:Pagar', function(cb)  
        if cb then
            if Config.Utility.EnableCallCops then local Chance = math.random(1,100) if Chance <= Config.Utility.ChanceCallCops then PoliceCall() end end
            QBCore.Functions.Progressbar("progressBar", "Changing the plate...", 5000, false, true, {disableMovement = true,disableCarMovement = true,disableMouse = false,
            disableCombat = true}, {}, {}, {}, function() end)
            Wait(5000)
            SetVehicleNumberPlateText(veh, "FAKE"..Matricula)
            TriggerEvent(Config.Utility.VehicleKeysTrigger, QBCore.Functions.GetPlate(veh))
            QBCore.Functions.Notify("Your new plate: FAKE"..Matricula)
            --Wait(2500)
            --QBCore.Functions.Notify("Your old plate: "..AntigaMatricula)
            if Config.Utility.CooldownEnable then
                Cooldown()
            end
        end
    end)
end

function Cooldown() esperar = true Wait(Config.Utility.Cooldown) esperar = false end