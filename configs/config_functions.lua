local QBCore = exports[Config.Utility.CoreName]:GetCoreObject()
function Notify(msg)
    QBCore.Functions.Notify(msg)
end

function progressBar(msg)
    QBCore.Functions.Progressbar("progressBar", msg, 5000, false, true, {disableMovement = true,disableCarMovement = true,disableMouse = false,
    disableCombat = true}, {}, {}, {}, function() end)
end

function PoliceCall()
    -- Trigger your dispach
end
