Fuel = {
    ---comment: Set fuel percentage
    ---@param vehicle string
    ---@param amount number
    SetFuel = function(vehicle, amount)
        exports["LegacyFuel"]:SetFuel(vehicle, amount)
    end,
---comment: Get fuel percentage
    ---@param vehicle string
    ---@return number
    GetFuel = function(vehicle)
        return exports["LegacyFuel"]:GetFuel(vehicle)
    end,
}

return Fuel