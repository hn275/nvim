return {
	"j-hui/fidget.nvim",
	opts = {},
	event = "VeryLazy",
	config = function(_, opts)
		require("fidget").setup(opts)
	end,
}
