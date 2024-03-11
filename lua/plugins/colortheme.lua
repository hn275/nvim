return {
	"lewpoly/sherbet.nvim",
	config = function()
		vim.cmd("colorscheme sherbet")
	end,
}

--[[
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


return {
	"olivercederborg/poimandres.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("poimandres").setup({
			-- leave this setup function empty for default config
			-- or refer to the configuration section
			-- for configuration options
		})
	end,

	-- optionally set the colorscheme within lazy config
	init = function()
		vim.cmd("colorscheme poimandres")
	end,
}

return {
    "no-clown-fiesta/no-clown-fiesta.nvim",
    config = function()
        require("no-clown-fiesta").setup({
            transparent = false, -- Enable this to disable the bg color
            styles = {
                -- You can set any of the style values specified for `:h nvim_set_hl`
                comments = {},
                keywords = {},
                functions = {},
                variables = {},
                type = { bold = true },
                lsp = { underline = true },
            },
        })
    end,
    init = function()
        vim.cmd("colorscheme no-clown-fiesta")
    end
}
--]]
