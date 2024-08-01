Inventory = {
    ---comment: Get player item count
    ---@param source string
    ---@param item string
    ---@return boolean | integer
    GetItemCount = function(source, item)
        return false --Replace false with the actual event/export
    end,
    ---comment: Remove item from inventory
    ---@param source string
    ---@param item string
    ---@param quantity integer
    ---@return boolean | 'qs'
    RemoveItem = function(source, item, quantity, metadata, slot)
        return false --Replace false with the actual event/export
    end,
    ---comment: Add item to inventory
    ---@param source string
    ---@param item string
    ---@param quantity integer
    ---@return boolean | string | 'qs'
    AddItem = function(source, item, quantity, metadata, slot)
        return false --Replace false with the actual event/export
    end,
    ---comment: Clear inventory
    ---@param source string
    ---@param keep table
    ---@return boolean
    ClearInventory = function(source, keep)
        return false --Replace false with the actual event/export
    end,
}

return Inventory