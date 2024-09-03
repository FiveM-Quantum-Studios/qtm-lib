Log = {
    Create = function(source, event, message, hook)
        lib.logger(source, event, message)
    end,
}

return Log