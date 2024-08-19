Fuel = {
    ---comment: Set fuel percentage
    ---@param vehicle string
    ---@param amount number
    SetFuel = function(vehicle, amount)
        exports['rcore_fuel']:SetVehicleFuel(vehicle, amount)
    end,
    ---comment: Get fuel percentage
    ---@param vehicle string
    ---@return number
    GetFuel = function(vehicle)
        local currentFuelLiters = exports["rcore_fuel"]:GetVehicleFuelLiters(vehicle)
        local maxFuelLiters = exports["rcore_fuel"]:GetMaximumFuelCapacityForVehicle(vehicle)
        
        return (currentFuelLiters / maxFuelLiters) * 100
    end,
}

return Fuel