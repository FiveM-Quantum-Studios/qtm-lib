VehicleKeys = {
    ---comment: Give vehicle keys
    ---@param vehicle number
    ---@param plate string
    Give = function(vehicle, plate)
        TriggerEvent('cd_garage:AddKeys', exports['cd_garage']:GetPlate(vehicle))
    end
}

return VehicleKeys