return {
	"nvimtools/none-ls.nvim",
	config = function()
		local n = require("null-ls")
		local code_actions = n.builtins.code_actions
		local hover = n.builtins.hover
		local diagnostics = n.builtins.diagnostics
		local completion = n.builtins.completion

		n.setup({
			sources = {
				diagnostics.actionlint,
				diagnostics.golangci_lint,

				hover.printenv,
			},
		})
	end,
}
