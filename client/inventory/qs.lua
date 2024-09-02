Inventory = {
    ---comment: Get item info
    ---@param item string
    ---@return table
    GetItemInfo = function(item)
        return exports['qs-inventory']:GetItemList()[item]
    end,

    InventoryState = function()
        return exports['qs-inventory']:inInventory()
    end,

    ChangeInventoryState = function(bool)
        return exports['qs-inventory']:setInventoryDisabled(bool)
    end,

    ToggleWeaponWheel = function(bool)
        return exports['qs-inventory']:WeaponWheel(bool)
    end,

    Search = function(table)
        local results = {} 
        for i = 1, #table do
            local items = exports['qs-inventory']:Search(table[i])
            results[#results + 1] = items
        end
        return results
    end
}

return Inventory