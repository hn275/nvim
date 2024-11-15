return {
	"nvimtools/none-ls.nvim",
	config = function()
		local n = require("null-ls")
		local code_actions = n.builtins.code_actions
		local format = n.builtins.formatting
		local hover = n.builtins.hover
		local diagnostics = n.builtins.diagnostics
		local completion = n.builtins.completion

		n.setup({
			sources = {
				format.stylua,
				format.clang_format.with({
					extra_args = {
						"-style=file:" .. vim.fn.expand("~/.clang-format"),
					},
				}),
				format.gofmt,
				format.goimports,
				format.prettier,
                format.black, -- python formatter

				diagnostics.actionlint,
				diagnostics.golangci_lint,
			},
		})
	end,
}
