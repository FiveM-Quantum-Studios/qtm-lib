local ox_inventory = exports.ox_inventory

Inventory = {
    ---comment: Get item info
    ---@param item string
    ---@return table
    GetItemInfo = function(item)
        return ox_inventory:Items(item)
    end,

    InventoryState = function()
        return LocalPlayer.state.invOpen
    end,

    ToggleInventoryBusy = function(bool)
        return LocalPlayer.state.invBusy == bool
    end,

    ToggleWeaponWheel = function(bool)
        return ox_inventory:weaponWheel(bool)
    end,

    Search = function(table)
        local items = ox_inventory:Search(source, 'count', {table})
        return items
    end,
}

return Inventory