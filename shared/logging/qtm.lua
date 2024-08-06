local LoggingTypes = {
    ['info'] = '[^4Info^0]',
    ['debug'] = '[^3DEBUG^0]',
    ['error'] = '[^1ERROR^0]',
}

Logging = function(code, ...)
    local script = "[^2"..GetInvokingResource().."^0]"

    if not lib.table.contains({'error', 'debug', 'info'}, code) then
        script = code
        local action = ...
        local args = {...}
        table.remove(args, 1)

        print(script, LoggingTypes[action], ...)
    else
        print(script, LoggingTypes[code], ...)
    end
end

return Logging