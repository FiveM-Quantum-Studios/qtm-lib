local ox_inventory = exports.ox_inventory

Inventory = {
    ---comment: Get item info
    ---@param item string
    ---@return table
    GetItemInfo = function(item)
        return ox_inventory:Items(item)
    end,
    ---comment: Get player inv state
    ---@return boolean
    InventoryState = function()
        return LocalPlayer.state.invOpen
    end,
    ---comment: Change player inv state
    ---@param bool boolean
    ToggleInventoryBusy = function(bool)
        return LocalPlayer.state.invBusy == bool
    end,
    ---comment: Change if player has weaponwheel
    ---@param bool boolean
    ToggleWeaponWheel = function(bool)
        return ox_inventory:weaponWheel(bool)
    end,
    ---comment: Search for items
    ---@param table any
    ---@return table
    Search = function(table)
        local items = ox_inventory:Search('count', {table})
        return items
    end,
}

return Inventory