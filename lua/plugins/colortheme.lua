    -- "lewpoly/sherbet.nvim",
return {
    "navarasu/onedark.nvim",
    config = function()
        local colortheme = require("onedark")
        colortheme.setup({
            style = "darker",
        })
        colortheme.load()
    end,
}
