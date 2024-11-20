Inventory = {
    ---comment: Get item info
    ---@param item string
    ---@return table
    GetItemInfo = function(item)
        return exports['qs-inventory']:GetItemList()[item]
    end,
    ---comment: Get player inv state
    ---@return boolean
    InventoryState = function()
        return exports['qs-inventory']:inInventory()
    end,
    ---comment: Change player inv state
    ---@param bool boolean
    ChangeInventoryState = function(bool)
        return exports['qs-inventory']:setInventoryDisabled(bool)
    end,
    ---comment: Change if player has weaponwheel
    ---@param bool boolean
    ToggleWeaponWheel = function(bool)
        return exports['qs-inventory']:WeaponWheel(bool)
    end,
    ---comment: Search for items
    ---@param table any
    ---@return table
    Search = function(table)
        local results = {} 
        for i = 1, #table do
            local items = exports['qs-inventory']:Search(table[i])
            results[#results + 1] = items
        end
        return results
    end,
    ---comment: Has player specific item count
    ---@param table string | table
    ---@param _quantity integer
    ---@return boolean
    HasItemCount = function(table, _quantity)
        local quantity = _quantity or 1
        local results = {} 
        for i = 1, #table do
            local items = exports['qs-inventory']:Search(table[i])
            results[#results + 1] = items
        end
        return results >= quantity
    end,
}

return Inventory