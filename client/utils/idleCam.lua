CreateThread(function()
    if not Config.DisableIdleCam then return end

    while true do
        InvalidateIdleCam()
        InvalidateVehicleIdleCam()
        Wait(5000)
    end
end)