VehicleKeys = {
    ---comment: Give vehicle keys
    ---@param vehicle number
    ---@param plate string
    Give = function(vehicle, plate)
        exports.wasabi_carlock:GiveKey(plate)
    end
}

return VehicleKeys