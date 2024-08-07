local clientDir = 'client/%s/%s'
local sharedDir = 'shared/%s/%s'

function LoadClientFile(module, configuration)
    return lib.load(clientDir:format(module, string.lower(configuration)))
end

function LoadSharedFile(module, configuration)
    return lib.load(sharedDir:format(module, string.lower(configuration)))
end

function DetectFramework()
    local framework = nil
    if GetResourceState('es_extended') == 'started' then 
        framework = 'esx'
    elseif GetResourceState('qb-core') == 'started' then
        framework = 'qb'
    elseif GetResourceState('qbx') == 'started' then
        framework = 'qbx'
    elseif GetResourceState('ox_core') == 'started' then
        framework = 'ox'
    end
    if not framework then
        framework = 'custom'
    end
    return framework
end

function DetectFuel()
    local fuel = nil
    if GetResourceState('ox_fuel') == 'started' then
        fuel = 'ox_fuel'
    elseif GetResourceState('cdn-fuel') == 'started' then
        fuel = 'cdn-fuel'
    elseif GetResourceState('LegacyFuel') == 'started' then
        fuel = 'LegacyFuel'
    elseif GetResourceState('rcore_fuel') == 'started' then
        fuel = 'rcore_fuel'
    end
    if not fuel then
        fuel = 'custom'
    end
    return fuel
end

function DetectWeather()
    local weather = nil
    if GetResourceState('cd_easytime') == 'started' then
        weather = 'cd_easytime'
    elseif GetResourceState('qb-weathersync') == 'started' then
        weather = 'qb-weathersync'
    elseif GetResourceState('renewed-weathersync') == 'started' then
        weather = 'renewed-weathersync'
    end
    if not weather then
        weather = 'custom'
    end
    return weather
end

function DetectVehicleKeys()
    local vehicleKeys = nil
    if GetResourceState('cd_garage') == 'started' then
        vehicleKeys = 'cd_garage'
    elseif GetResourceState('okokGarage') == 'started' then
        vehicleKeys = 'okokGarage'
    elseif GetResourceState('qb-vehiclekeys') == 'started' then
        vehicleKeys = 'qb-vehicleKeys'
    elseif GetResourceState('qs-vehiclekeys') == 'started' then
        vehicleKeys = 'qs-vehicleKeys'
    elseif GetResourceState('t1ger_keys') == 'started' then
        vehicleKeys = 't1ger_keys'
    elseif GetResourceState('vehicles_keys') == 'started' then
        vehicleKeys = 'vehicles_keys'
    elseif GetResourceState('wasabi_carlock') == 'started' then
        vehicleKeys = 'wasabi_carlock'
    end
    if not vehicleKeys then
        vehicleKeys = 'custom'
    end
    return vehicleKeys
end




qtm = {}

qtm.Framework = LoadClientFile('framework', DetectFramework())
qtm.Fuel = LoadClientFile('fuel', DetectFuel())
qtm.VehicleKeys = LoadClientFile('vehiclekeys', DetectVehicleKeys())
qtm.Weather = LoadClientFile('weather', DetectWeather())

qtm.Notification = LoadSharedFile('notification', Config.Notifications)
qtm.Logging = LoadSharedFile('logging', 'qtm')

local qtm_meta = {
    __index = function(table, key)
        if key == "Framework" then
            return rawget(table, key)
        else
            return nil
        end
    end
}

setmetatable(qtm, qtm_meta)

exports('getSharedObject', function() return qtm end)