Fuel = {
    ---comment: Set fuel percentage
    ---@param vehicle string
    ---@param amount number
    SetFuel = function(vehicle, amount)
        Entity(vehicle).state.fuel = amount
    end,
    ---comment: Get fuel percentage
    ---@param vehicle string
    ---@return number
    GetFuel = function(vehicle)
        return Entity(vehicle).state.fuel
    end,
}

return Fuel