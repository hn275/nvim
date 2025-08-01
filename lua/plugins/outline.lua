return {
	"hedyhli/outline.nvim",
	lazy = true,
	cmd = { "Outline", "OutlineOpen" },
	keys = { -- Example mapping to toggle outline
		{ "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
	},
	opts = {
		outline_window = {
			width = 23,
			position = "left",
			show_numbers = true,
			show_relative_numbers = true,
		},
		keymaps = {
			close = "q",
		},
	},
}
