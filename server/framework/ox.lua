Framework = {










    lib.callback.register('qtm-lib:SpawnVehicle', function(source, model, pos, heading)
        local player = Ox.GetPlayer(player)
        if not player then return end
        return Ox.CreateVehicle({ model = model, owner = source.charid }, pos, heading)
    end)
}

return Framework