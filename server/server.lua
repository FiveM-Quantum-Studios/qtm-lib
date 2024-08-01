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
    return inventory
end

function DetectDispatch()
    local dispatch = nil
    if GetResourceState('qtm-dispatch') == 'started' then
        dispatch = 'qtm-dispatch'
    end
    if not dispatch then
        dispatch = 'custom'
    end
    return dispatch
end

qtm = {}

qtm.Framework = LoadServerFile('framework', DetectFramework())
qtm.Inventory = LoadServerFile('inventory', DetectInventory())
qtm.Dispatch = LoadServerFile('dispatch', DetectDispatch())
qtm.Notification = LoadSharedFile('notification', Config.Notifications)

exports('getCoreObject', function()
    return qtm
end)











RegisterCommand('Testt', function(source)
    ESX = exports[Config.FrameworkResource]:getSharedObject()
    qtm2 = exports['qtm-lib']:getCoreObject()
    print(ESX.DumpTable(qtm2))
    --print(qtm.GetPlayerFromId(source).GetChar().dateofbirth)
end, false)