return {
	"rebelot/kanagawa.nvim",
	-- "lewpoly/sherbet.nvim",
	config = function()
		-- vim.cmd("colorscheme sherbet")
		-- Default options:
		require("kanagawa").setup({
			compile = false, -- enable compiling the colorscheme
			undercurl = true, -- enable undercurls
			commentStyle = { italic = true },
			functionStyle = {},
			keywordStyle = { italic = true },
			statementStyle = { bold = true },
			typeStyle = {},
			transparent = false, -- do not set background color
			dimInactive = false, -- dim inactive window `:h hl-NormalNC`
			terminalColors = true, -- define vim.g.terminal_color_{0,17}
			colors = { -- add/modify theme and palette colors
				palette = {},
				theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
			},
			overrides = function(colors) -- add/modify highlights
				return {}
			end,
			theme = "wave", -- Load "wave" theme when 'background' option is not set
			background = { -- map the value of 'background' option to a theme
				dark = "wave", -- try "dragon" !
				light = "lotus",
			},
		})

		-- setup must be called before loading
		vim.cmd("colorscheme kanagawa")
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
