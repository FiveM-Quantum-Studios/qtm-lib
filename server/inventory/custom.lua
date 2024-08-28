Inventory = {
    ---comment: Get player item count
    ---@param source string
    ---@param item string
    ---@return integer | boolean
    GetItemCount = function(source, item)
        return false --Replace false with the actual event/export
    end,
    ---comment: Get item label
    ---@param source string
    ---@param item string
    ---@return string | boolean
    GetItemLabel = function(source, item)
        return false --Replace false with the actual event/export
    end,
    ---comment: Remove item from inventory
    ---@param source string
    ---@param item string
    ---@param quantity integer
    ---@return boolean
    RemoveItem = function(source, item, quantity, metadata, slot)
        return false --Replace false with the actual event/export
    end,
    ---comment: Add item to inventory
    ---@param source string
    ---@param item string
    ---@param quantity integer
    ---@return boolean | string
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
    ---comment: Force open inventory
    ---@param source string
    ---@param stashType string
    ---@param stashName string
    ---@return boolean
    ForceOpenInventory = function(source, stashType, stashName)
        return false --Replace false with the actual event/export
    end,
    ---comment: Get inventory
    ---@param source string
    ---@param owner string
    ---@return table | boolean
    GetInventory = function(source, owner)
        return false --Replace false with the actual event/export
    end,
    ---comment: Register stash
    ---@param id string
    ---@param label string
    ---@param slots integer
    ---@param maxWeight number
    ---@param owner string
    ---@param groups table
    ---@param coords vector3
    ---@return boolean
    RegisterStash = function(id, label, slots, maxWeight, owner, groups, coords)
        return false --Replace false with the actual event/export
    end
}

return Inventory