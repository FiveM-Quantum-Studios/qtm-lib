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
}

return Inventory