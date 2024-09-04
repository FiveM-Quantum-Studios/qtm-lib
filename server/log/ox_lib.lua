local Log = {
    Create = function(source, event, message, hook)
        if not IsDuplicityVersion() then return end
        lib.logger(source, event, message)
    end,
}

return Log