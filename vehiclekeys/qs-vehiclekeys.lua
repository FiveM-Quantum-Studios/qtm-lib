VehicleKeys = {
    ---comment: Give vehicle keys
    ---@param vehicle number
    ---@param plate string
    Give = function(vehicle, plate)
        local model = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
        exports['qs-vehiclekeys']:GiveKeys(plate, model, true)
    end
}

return VehicleKeys