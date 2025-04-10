local serverDir = 'server/%s/%s'
local sharedDir = 'shared/%s/%s'

function LoadServerFile(module, configuration)
    return lib.load(serverDir:format(module, string.lower(configuration)))
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

function DetectInventory()
    local inventory = nil
    if GetResourceState('ox_inventory') == 'started' then
        inventory = 'ox'
    elseif GetResourceState('qs-inventory') == 'started' then
        inventory = 'qs'
    elseif GetResourceState('origen_inventory') == 'started' then
        inventory = 'origen_inventory'
    elseif GetResourceState('es_extended') == 'started' then
        inventory = 'esx'
    end
    if not inventory then
        inventory = 'custom'
    end
    Logging('debug', 'Inventory: '..inventory..' detected')
    return inventory
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

function DetectBilling()
    local billing = nil
    if GetResourceState('okokBilling') == 'started' then
        billing = 'okok'
    elseif GetResourceState('qs-billing') == 'started' then
        billing = 'qs'
    elseif GetResourceState('cs_billing') == 'started' then
        billing = 'cs'
    elseif GetResourceState('es_extended') == 'started' then
        billing = 'esx'
    elseif GetResourceState('qbx_core') == 'started' then
        billing = 'qbox'
    end
    if not billing then
        billing = 'custom'
    end
    Logging('debug', 'Billing: '..billing..' detected')
    return billing
end

qtm = {}
-- Server stuff
qtm.Framework = LoadServerFile('framework', DetectFramework())
qtm.Inventory = LoadServerFile('inventory', DetectInventory())
qtm.Server = {
    Dispatch = LoadServerFile('dispatch', DetectDispatch()),
    Anticheat = LoadServerFile('utils', 'anticheat'),
    VersionChecker = LoadServerFile('utils', 'versioncheck')
}
qtm.Billing = LoadServerFile('billing', DetectBilling())
qtm.Log = LoadServerFile('log', Config.Logging)
-- Shared stuff
qtm.Notification = LoadSharedFile('notification', Config.Notifications)
qtm.Logging = LoadSharedFile('logging', 'qtm')
qtm.DumpTable = LoadSharedFile('dumptable', 'qtm')
qtm.Utils = {
    Table = LoadSharedFile('utils', 'table')
}



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

lib.versionCheck('FiveM-Quantum-Studios/qtm-lib')
