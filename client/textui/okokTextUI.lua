TextUI = {
    ---@param text string
    Show = function(text, position)
        exports['okokTextUI']:Open(text, 'lightgrey', 'left', true)
    end,

    Hide = function()
        exports['okokTextUI']:Close()
    end
}

return TextUI