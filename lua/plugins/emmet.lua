return {
	"olrtg/nvim-emmet",
	ft = { "html", "javascriptreact", "typescriptreact" },
	config = function()
		vim.keymap.set({ "n", "v" }, "<leader>y,", require("nvim-emmet").wrap_with_abbreviation)
	end,
}
