local dir = 'server/%s/%s'

function LoadFile(module, configuration)
    local dir = dir:format(module, string.lower(configuration))
    return lib.load(dir)
end

qtm = {}

qtm.Framework = LoadFile('framework', Config.Framework)
qtm.Inventory = LoadFile('inventory', Config.Inventory)
qtm.Dispatch = LoadFile('dispatch', Config.Dispatch)

exports('getCoreObject', function()
    return qtm
end)











RegisterCommand('Testt', function(source)
    ESX = exports[Config.FrameworkResource]:getSharedObject()
    qtm2 = exports['qtm-core']:getCoreObject()
    print(ESX.DumpTable(qtm2))
    --print(qtm.GetPlayerFromId(source).GetChar().dateofbirth)
end, false)