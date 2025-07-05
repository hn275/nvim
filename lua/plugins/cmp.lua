return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"saadparwaiz1/cmp_luasnip",
		"onsails/lspkind.nvim",
	},

	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")

		-- cmp setup
		cmp.setup({
			window = {
				completion = {
					col_offset = 0,
					side_padding = 1,
				},
				documentation = {
					col_offset = 0,
					side_padding = 1,
				},
			},

			mapping = {
				["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
				["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
				["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
				["<C-y>"] = cmp.config.disable,
				["<C-z>"] = cmp.mapping({
					i = cmp.mapping.abort(),
					c = cmp.mapping.close(),
				}),
				["<C-n>"] = cmp.mapping(function(callback)
					if cmp.visible() then
						cmp.select_next_item()
					else
						callback()
					end
				end, { "i" }),
				["<C-p>"] = cmp.mapping(function(callback)
					if cmp.visible() then
						cmp.select_prev_item()
					else
						callback()
					end
				end, { "i" }),
				["<Tab>"] = cmp.mapping(function(callback)
					if cmp.visible() then
						cmp.confirm({ select = true })
					else
						callback()
					end
				end),
			},

			matching = {
				disallow_fuzzy_matching = true, -- allow fuzzy matching
				disallow_partial_matching = true, -- allow partial matching
			},

			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					local kind = lspkind.cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
					local strings = vim.split(kind.kind, "%s", { trimempty = true })
					kind.kind = " " .. (strings[1] or "") .. " "
					kind.menu = "    [" .. (strings[2] or "") .. "]"
					return kind
				end,
			},

			sources = cmp.config.sources({
				{ name = "nvim_lsp_signature_help" },
				{ name = "nvim_lsp" },
				{ name = "path" },
				{
					name = "buffer",
					keyword_length = 3,
				},
			}),
		})
	end,
}
