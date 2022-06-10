local QBCore = exports[Config.Utility.CoreName]:GetCoreObject()

QBCore.Functions.CreateCallback('m-FakePlate:server:Pagar', function(source, cb)
    local src = source
    local Player  = QBCore.Functions.GetPlayer(src)
    if Player.Functions.RemoveMoney("cash", Config.Utility.Amount) then
        cb(true)
        TriggerClientEvent('QBCore:Notify', source, "You pay: $"..Config.Utility.Amount, "success")
    else
        TriggerClientEvent('QBCore:Notify', source, "You don't have money.", "error")
        cb(false)
    end
end)
