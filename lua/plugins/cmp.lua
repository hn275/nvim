return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"onsails/lspkind.nvim",
	},

	config = function()
		local cmp_status_ok, cmp = pcall(require, "cmp")
		local luasnip_ok, luasnip = pcall(require, "luasnip")
		local lspkind_ok, lspkind = pcall(require, "lspkind")

		if not cmp_status_ok or not luasnip_ok or not lspkind_ok then
			return
		end

		-- cmp setup
		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},

			window = {
				completion = {
					winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
					col_offset = 0,
					side_padding = 0,
				},
				documentation = cmp.config.window.bordered(),
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
				["<TAB>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.confirm({ select = true })
						return
					end

					-- check backspace
					local col = vim.fn.col(".") - 1
					local backspace = col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
					if backspace then
						fallback()
					end
				end, { "i", "s" }),
				["<C-j>"] = cmp.mapping(function(fallback)
					if luasnip.jumpable(1) then
						luasnip.jump(1)
					else
						fallback()
					end
				end, { "i" }),
				["<C-k>"] = cmp.mapping(function(fallback)
					if luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i" }),
				["<C-n>"] = cmp.mapping(function(callback)
					if luasnip.choice_active() then
						luasnip.change_choice(1)
					elseif cmp.visible() then
						cmp.select_next_item()
					else
						callback()
					end
				end, { "i" }),
				["<C-p>"] = cmp.mapping(function(callback)
					if luasnip.choice_active() then
						luasnip.change_choice(-1)
					elseif cmp.visible() then
						cmp.select_prev_item()
					else
						callback()
					end
				end, { "i" }),
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
				{ name = "nvim_lsp" },
				{ name = "nvim_lsp_signature_help" },
				{ name = "luasnip" },
				{ name = "path" },
				{ name = "buffer", keyword_length = 3 },
			}),

			confirm_opts = {
				behavior = cmp.ConfirmBehavior.Replace,
				select = false,
			},

			experimental = {
				ghost_text = true,
			},
		})
	end,
}
