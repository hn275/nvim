return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local has_telescope, telescope = pcall(require, "telescope")

		if not has_telescope then
			print("Telescope not found")
			return
		end

		local actions = require("telescope.actions")

		THEME = "ivy"

		telescope.setup({
			defaults = {
				mappings = {
					n = {
						["<Esc>"] = actions.close,
					},
				},
				layout_strategy = "horizontal",
				layout_config = {
					vertical = { width = 0.5 },

					bottom_pane = {
						preview_cutoff = 40,
						prompt_position = "top",
					},

					cursor = {
						height = 0.9,
						preview_cutoff = 40,
						width = 0.8,
					},
				},
				prompt_prefix = " > ",
				path_display = { "truncate" },
				scroll_strategy = "limit",
				border = true,
			},
			pickers = {
				commands = {
					theme = THEME,
				},
				live_grep = {
					theme = THEME,
				},
				find_files = {
					theme = THEME,
					ignore = false,
					hidden = false,
				},
				file_browser = {
					theme = THEME,
				},
				lsp_references = {
					theme = THEME,
				},
				buffers = {
					theme = THEME,
				},
			},
			extensions = {},
		})

		local t = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", t.find_files)
		vim.keymap.set("n", "<leader>fg", t.live_grep)
		vim.keymap.set("n", "<leader>fd", t.diagnostics)
		vim.keymap.set("n", "<leader>ft", "<CMD>Telescope builtin<CR>")
	end,
}
