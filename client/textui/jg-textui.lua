TextUI = {
    ---@param text string
    Show = function(text)
        exports['jg-textui']:DrawText(text)
    end,

    Hide = function()
        exports['jg-textui']:HideText()
    end
}

return TextUI