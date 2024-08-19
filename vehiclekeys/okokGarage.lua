VehicleKeys = {
    ---comment: Give vehicle keys
    ---@param vehicle number
    ---@param plate string
    Give = function(vehicle, plate)
        TriggerServerEvent("okokGarage:GiveKeys", plate)
    end
}

return VehicleKeys