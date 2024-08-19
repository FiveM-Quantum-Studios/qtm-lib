VehicleKeys = {
    ---comment: Give vehicle keys
    ---@param vehicle number
    ---@param plate string
    Give = function(vehicle, plate)
        TriggerServerEvent('qb-vehiclekeys:server:AcquireVehicleKeys', plate)
    end
}

return VehicleKeys