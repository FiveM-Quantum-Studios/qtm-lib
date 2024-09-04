Inventory = {
    ---comment: Get item info
    ---@param item string
    ---@return table | boolean
    GetItemInfo = function(item)
        return false
    end,
    ---comment: Get player inv state
    ---@return boolean
    InventoryState = function()
        return false
    end,
    ---comment: Change player inv state
    ---@param bool boolean
    ToggleInventoryBusy = function(bool)
        return false
    end,
    ---comment: Change if player has weaponwheel
    ---@param bool boolean
    ToggleWeaponWheel = function(bool)
        return false
    end,
    ---comment: Search for items
    ---@param table any
    ---@return table | boolean
    Search = function(table)
        return false
    end,
}

return Inventory