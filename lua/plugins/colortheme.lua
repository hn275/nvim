return {
	"rebelot/kanagawa.nvim",
	config = function()
		require("kanagawa").setup({
			compile = true,
			theme = "wave",
		})

		vim.cmd("colorscheme kanagawa")
	end,
}
