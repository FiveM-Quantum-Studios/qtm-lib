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
    ---@param table string | table
    ---@return table
    Search = function(table)
        return ox_inventory:Search('count', {table})
    end,
    ---comment: Has player specific item count
    ---@param table string | table
    ---@param _quantity integer
    ---@return boolean
    HasItemCount = function(table, _quantity)
        local quantity = _quantity or 1
        return ox_inventory:Search('count', {table}) >= quantity
    end,
}

return Inventory