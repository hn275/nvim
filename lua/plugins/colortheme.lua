--[[
return {
	"lewpoly/sherbet.nvim",
	config = function()
		vim.cmd("colorscheme sherbet")
	end,
}
--]]

return {
    "navarasu/onedark.nvim",
    config = function ()
        local colortheme = require("onedark")
        colortheme.setup(
            {
                style = "deep"
            }
        )
        colortheme.load()
    end
}
