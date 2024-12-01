Table = {
    isTableEmpty = function(tab)
        if type(tab) ~= "table" then
            error("Expected a table, got " .. type(tab))
        end
        for _ in pairs(tab) do
            return false
        end
        return true
    end
}

return Table