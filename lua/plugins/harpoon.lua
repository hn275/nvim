return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim", "rcarriga/nvim-notify" },
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup()

		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():add()
			local file = vim.fn.expand("%")
			vim.notify("Added to harpoon: " .. file, vim.log.levels.INFO, {
				title = "Harpoon",
				timeout = 2000,
				on_open = function(win)
					local buf = vim.api.nvim_win_get_buf(win)
					vim.api.nvim_set_option_value("filetype", "markdown", {
						buf = buf,
					})
				end,
			})
		end)
		vim.keymap.set("n", "<leader>hh", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<C-k>", function()
			harpoon:list():prev()
		end)
		vim.keymap.set("n", "<C-j>", function()
			harpoon:list():next()
		end)
	end,
}
