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
    ---@return boolean
    RemoveItem = function(source, item, quantity, metadata, slot)
        return exports['qs-inventory']:RemoveItem(source, item, quantity, slot, metadata)
    end,
    ---comment: Add item to inventory
    ---@param source string
    ---@param item string
    ---@param quantity integer
    ---@return boolean | string
    AddItem = function(source, item, quantity, metadata, slot)
        return exports['qs-inventory']:AddItem(source, item, quantity, slot, metadata)
    end,
    ---comment: Clear inventory
    ---@param source string
    ---@param keep table
    ---@return boolean
    ClearInventory = function(source, keep) -- Something like this maybe? Need to test.
        local inventory = exports['qs-inventory']:GetInventory(source)
        for _, item in pairs(inventory) do
            if lib.table.contains(keep, item.name) then
                goto continue
            else
                exports['qs-inventory']:RemoveItem(source, item.name, item.count)
            end
            ::continue::
        end
    end,

    ForceOpenInventory = function(source, stashType, stashName)
        -- ???
        -- return ox_inventory:forceOpenInventory(source, stashType, stashName)
    end,

    GetInventory = function(source, owner)
        return exports['qs-inventory']:GetInventory(source)
    end,

    RegisterStash = function(id, label, slots, maxWeight, owner, groups, coords, source)
        return exports['qs-inventory']:RegisterStash(source, id, slots, maxWeight)
    end
}

return Inventory