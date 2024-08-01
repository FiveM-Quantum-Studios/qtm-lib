Inventory = {
    ---comment: Get player item count
    ---@param source string
    ---@param item string
    ---@return integer
    GetItemCount = function(source, item)
        return exports['qs-inventory']:GetItemTotalAmount(source, item)
    end,
    ---comment: Remove item from inventory
    ---@param source string
    ---@param item string
    ---@param quantity integer
    ---@return boolean | 'qs'
    RemoveItem = function(source, item, quantity, metadata, slot)
        exports['qs-inventory']:AddItem(source, item, quantity, slot, metadata)
        return 'qs'
    end,
    ---comment: Add item to inventory
    ---@param source string
    ---@param item string
    ---@param quantity integer
    ---@return boolean | string | 'qs'
    AddItem = function(source, item, quantity, metadata, slot)
        exports['qs-inventory']:RemoveItem(source, item, quantity, slot, metadata)
        return 'qs'
    end,
    ---comment: Clear inventory
    ---@param source string
    ---@param keep table
    ---@return boolean | 'qs'
    ClearInventory = function(source, keep)
        return 'qs'
    end,
}

return Inventory