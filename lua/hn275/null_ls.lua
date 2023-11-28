return function()
	local n = require("null-ls")
	local code_actions = n.builtins.code_actions
	local format = n.builtins.formatting
	local hover = n.builtins.hover
	local diagnostics = n.builtins.diagnostics
	local completion = n.builtins.completion

	n.setup({
		sources = {
			format.stylua,
			format.autopep8,
			format.clang_format,
			format.eslint_d,
			format.fish_indent,
			format.jq,
			format.gofmt,
			format.goimports,
			format.google_java_format,
			format.markdownlint,
			format.mdformat,
			format.prettier_d_slim,
			format.rustfmt,
			format.sqlformat,

			code_actions.eslint_d,
			code_actions.gomodifytags,
			code_actions.impl,

			completion.spell,

			diagnostics.actionlint,
			diagnostics.cppcheck,
			diagnostics.cpplint,
			diagnostics.eslint_d,
			diagnostics.fish,
			diagnostics.golangci_lint,
			diagnostics.jsonlint,
			diagnostics.markdownlint,
			diagnostics.misspell,
			diagnostics.mypy,
			diagnostics.pylint,
			diagnostics.tsc,

			hover.dictionary,
		},
	})
end
