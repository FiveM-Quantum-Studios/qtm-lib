qtm = exports['qtm-lib']:getSharedObject()

if not IsDuplicityVersion() then -- Only register this event for the client

    RegisterNetEvent('qtm:onPlayerLoaded', function()
        Logging('debug', 'Player loaded')
    end)

    RegisterNetEvent('qtm:onPlayerLogout', function()
        Logging('debug', 'Player logged out')
    end)
end

