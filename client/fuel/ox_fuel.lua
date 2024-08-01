if GetResourceState('ox_fuel') ~= 'started' then return end

Qtm = {
    SetFuel = function(vehicle, amount)
        Entity(vehicle).state.fuel = amount
    end,

    GetFuel = function(vehicle)
        return Entity(vehicle).state.fuel
    end,
}

return Qtm