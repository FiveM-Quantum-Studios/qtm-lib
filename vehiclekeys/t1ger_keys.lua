VehicleKeys = {
    ---comment: Give vehicle keys
    ---@param vehicle number
    ---@param plate string
    Give = function(vehicle, plate)
        TriggerServerEvent('t1ger_keys:giveCopyKeys', plate, vehicle, cache.serverId)
    end
}

return VehicleKeys