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

qtm = {}
-- Server stuff
qtm.Framework = LoadServerFile('framework', DetectFramework())
qtm.Inventory = LoadServerFile('inventory', DetectInventory())
qtm.Server.Dispatch = LoadServerFile('dispatch', DetectDispatch())
qtm.Log = LoadServerFile('log', Config.Logging)
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

lib.versionCheck('FiveM-Quantum-Studios/qtm-lib')
