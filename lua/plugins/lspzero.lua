-- KEYBINDINGS
local lsp = vim.lsp.buf
local diag = vim.diagnostic

local KEY_BINDS = {
	{
		mode = "n",
		key = "K",
		fn = lsp.hover,
	},
	{
		mode = "n",
		key = "gs",
		fn = lsp.signature_help,
	},
	{
		mode = "n",
		key = "ga",
		fn = lsp.code_action,
	},
	{
		mode = "n",
		key = "gd",
		fn = lsp.definition,
	},
	{
		mode = "n",
		key = "gf",
		fn = lsp.references,
	},
	{
		mode = "n",
		key = "ge",
		fn = diag.open_float,
	},
	{
		mode = "n",
		key = "gn",
		fn = function()
			diag.jump({ count = 1, float = true })
		end,
	},
	{
		mode = "n",
		key = "gp",
		fn = function()
			diag.jump({ count = -1, float = true })
		end,
	},
	{
		mode = "n",
		key = "gD",
		fn = diag.setqflist, -- open all diagnostics
	},
	{
		mode = "n",
		key = "<leader>rn",
		fn = lsp.rename,
	},
}

local function attach_key_bindings(lsp_zero)
	lsp_zero.on_attach(function(_, bufnr)
		for _, v in ipairs(KEY_BINDS) do
			vim.keymap.set(v.mode, v.key, v.fn, { noremap = true, silent = true, buffer = bufnr })
		end
		lsp_zero.default_keymaps({ buffer = bufnr })
	end)
end

-- This is a list of LSP servers to be installed and configured.
local SERVERS = {
	"bashls",
	"clangd",
	"rust_analyzer",
	"gopls",
	"ts_ls",
	"tinymist",
	"lua_ls",
	"emmet_language_server",
	"pylsp",
	"htmx",
	"taplo",
	"docker_compose_language_service",
	"dockerls",
	"sqls",
}

return {
	"VonHeikemen/lsp-zero.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	branch = "v3.x",
	config = function()
		local lsp_zero = require("lsp-zero")

		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = SERVERS,
			handlers = {
				lsp_zero.default_setup,
			},
			automatic_enable = true,
		})

		attach_key_bindings(lsp_zero)

		-- lua lsp has to be configed this way to get global vim api
		vim.lsp.config("lua_ls", {
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

		vim.lsp.config("clangd", {
			capabilities = {
				offsetEncoding = "utf-8",
			},
		})

		vim.lsp.config("rust_analyzer", {
			-- Other Configs ...
			on_attach = function(client, bufnr)
				vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
			end,
			settings = {
				["rust-analyzer"] = {
					diagnostics = {
						enable = true,
					},
					checkOnSave = true,
				},
			},
		})
	end,
}
