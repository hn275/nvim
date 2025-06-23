return {
	"github/copilot.vim",
	lazy = false, -- lazy loading
	config = function()
		vim.g.copilot_assume_mapped = true
		vim.g.copilot_enabled = false
		vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
			expr = true,
			replace_keycodes = false,
		})
		vim.g.copilot_no_tab_map = true
	end,
}
