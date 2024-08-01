VehicleKeys = {
    ---comment: Give vehicle keys
    ---@param vehicle number
    ---@param plate string
    Give = function(vehicle, plate)
        TriggerServerEvent('vehicles_keys:selfGiveVehicleKeys', plate)
    end
}

return VehicleKeys