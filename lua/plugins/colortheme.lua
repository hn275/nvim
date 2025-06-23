return {
	"navarasu/onedark.nvim",
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		local onedark = require("onedark")

		onedark.setup({
			style = "darker",
		})

		onedark.load()

		-- One Dark colors
		local colors = {
			bg = "#282c34",
			fg = "#abb2bf",
			blue = "#61afef",
			cyan = "#56b6c2",
			green = "#98c379",
			purple = "#c678dd",
			red = "#e06c75",
			yellow = "#e5c07b",
			orange = "#d19a66",
			gray = "#5c6370",
			dark_gray = "#2c323c",
			light_gray = "#3e4452",
		}

		-- Popup menu highlighting
		vim.api.nvim_set_hl(0, "Pmenu", { bg = colors.dark_gray, fg = colors.fg })
		vim.api.nvim_set_hl(0, "PmenuSel", { bg = colors.blue, fg = colors.bg, bold = true })
		vim.api.nvim_set_hl(0, "PmenuSbar", { bg = colors.light_gray })
		vim.api.nvim_set_hl(0, "PmenuThumb", { bg = colors.gray })
	end,
}
