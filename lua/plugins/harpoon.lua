return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		vim.keymap.set("n", "<leader>'", function()
			ui.toggle_quick_menu()
		end, {})

		vim.keymap.set("n", "<leader>a", function()
			mark.add_file()
		end, {})

		vim.keymap.set("n", "<c-n>", function()
			ui.nav_next()
		end, {})

		vim.keymap.set("n", "<c-p>", function()
			ui.nav_prev()
		end, {})
	end,
}
