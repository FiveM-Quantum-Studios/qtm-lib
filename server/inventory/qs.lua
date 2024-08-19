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
    ClearInventory = function(source, keep)
        return exports['qs-inventory']:ClearInventory(source, keep)
    end,

    ForceOpenInventory = function(source, stashType, stashName)
        local other = {}
        other.maxweight = 10000
        other.slots = 50
        if stashType == 'player' then
            stashType = 'otherplayer'
        end
        if stashType == 'stash' then
            return TriggerServerEvent("inventory:server:OpenInventory", stashType, stashName, other)
        else
            return TriggerServerEvent("inventory:server:OpenInventory", stashType, stashName)
        end
    end,

    GetInventory = function(source, owner)
        return exports['qs-inventory']:GetInventory(source)
    end,

    RegisterStash = function(id, label, slots, maxWeight, owner, groups, coords, source)
        return exports['qs-inventory']:RegisterStash(source, id, slots, maxWeight)
    end
}

return Inventory