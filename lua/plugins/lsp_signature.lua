return {
	"ray-x/lsp_signature.nvim",
	event = "InsertEnter",
	opts = {},
	config = function()
		require("lsp_signature").setup({
			bind = true,
			handler_opts = {
				border = "single",
			},
			hint_prefix = "",
			padding = "",
		})
	end,
}
