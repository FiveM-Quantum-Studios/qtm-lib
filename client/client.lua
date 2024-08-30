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
    elseif GetResourceState('qbox_core') == 'started' then
        framework = 'qbx'
    elseif GetResourceState('ox_core') == 'started' then
        framework = 'ox'
    end
    if not framework then
        framework = 'custom'
    end
    Logging('debug', 'Framework: '..framework..' detected')
    return framework
end

function DetectDispatch()
    local dispatch = nil
    if GetResourceState('cd_dispatch') == 'started' then
        dispatch = 'cd_dispatch'
    elseif GetResourceState('qs-dispatch') == 'started' then
        dispatch = 'qs-dispatch'
    elseif GetResourceState('rcore_dispatch') == 'started' then
        dispatch = 'rcore_dispatch'
    end
    if not dispatch then
        dispatch = 'custom'
    end
    Logging('debug', 'Dispatch: '..dispatch..' detected')
    return dispatch
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
    Logging('debug', 'Fuel: '..fuel..' detected')
    return fuel
end

function DetectInventory()
    local inventory = nil
    if GetResourceState('ox_inventory') == 'started' then
        inventory = 'ox'
    elseif GetResourceState('qs-inventory') == 'started' then
        inventory = 'qs'
    end
    if not inventory then
        inventory = 'custom'
    end
    Logging('debug', 'Inventory: '..inventory..' detected')
    return inventory
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
    Logging('debug', 'Weather: '..weather..' detected')
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
    Logging('debug', 'VehicleKeys: '..vehicleKeys..' detected')
    return vehicleKeys
end

function DetectTextUI()
    local textui = nil
    if GetResourceState('ox_lib') == 'started' then
        textui= 'ox_lib'
    elseif GetResourceState('cd_drawtextui') == 'started' then
        textui = 'cd_drawtextui'
    elseif GetResourceState('jg-textui') == 'started' then
        textui = 'jg-textui'
    elseif GetResourceState('okokTextUI') == 'started' then 
        textui = 'okokTextUI'
    else
        textui = 'custom'
    end
    Logging('debug', 'textui: '..textui..' detected')
    return textui
end




qtm = {}
-- Client stuff
qtm.Framework = LoadClientFile('framework', DetectFramework())
qtm.Dispatch = LoadClientFile('dispatch', DetectDispatch())
qtm.Fuel = LoadClientFile('fuel', DetectFuel())
qtm.Inventory = LoadClientFile('inventory', DetectInventory())
qtm.TextUI = LoadClientFile('textui', DetectTextUI())
qtm.VehicleKeys = LoadClientFile('vehiclekeys', DetectVehicleKeys())
qtm.Weather = LoadClientFile('weather', DetectWeather())
qtm.Camera = LoadClientFile('snippets', 'camera')

-- Shared stuff
qtm.Notification = LoadSharedFile('notification', Config.Notifications)
qtm.Logging = LoadSharedFile('logging', 'qtm')
qtm.DumpTable = LoadSharedFile('dumpTable', 'qtm')

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