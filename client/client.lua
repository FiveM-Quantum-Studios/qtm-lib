local clientDir = 'client/%s/%s'
local sharedDir = 'shared/%s/%s'

function LoadClientFile(module, configuration)
    return lib.load(clientDir:format(module, string.lower(configuration)))
end

function LoadSharedFile(module, configuration)
    return lib.load(sharedDir:format(module, string.lower(configuration)))
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





qtm = {}

qtm.Fuel = LoadClientFile('fuel', DetectFuel())
qtm.Weather = LoadClientFile('weather', DetectWeather())
qtm.Notification = LoadSharedFile('notification', Config.Notifications)

exports('getCoreObject', function() return qtm end)