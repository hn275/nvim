local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"jsonnet_ls",
		"bashls",
		"clangd",
		"pyright",
		"rust_analyzer",
		"tailwindcss",
		"tsserver",
		"gopls",
		"astro",
		"svelte",
		"cssls",
		"typst_lsp",
	},
	handlers = {
		lsp_zero.default_setup,
	},
})

-- lua lsp has to be configed this way to get global vim api
local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using
				-- (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = {
					"vim",
					"require",
				},
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})
