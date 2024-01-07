return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/nvim-cmp",
        "saadparwaiz1/cmp_luasnip", -- for luasnip
    },

    config = function()
        local cmp_status_ok, cmp = pcall(require, "cmp")
        local luasnip_ok, luasnip = pcall(require, "luasnip")

        if not cmp_status_ok or not luasnip_ok then
            return
        end

        local mapping = {
            ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
            ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
            ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
            ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` to remove the default `<C-y>` mapping.
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
        }

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            window = {
                -- completion = cmp.config.window.bordered(), -- completion border
                documentation = cmp.config.window.bordered(), -- documentation border
            },
            mapping = mapping,
            matching = {
                disallow_fuzzy_matching = false, -- allow fuzzy matching
                disallow_partial_matching = false, -- allow partial matching
            },
            formatting = {
                fields = { "abbr", "menu" },
                format = function(entry, vim_item)
                    vim_item.kind = nil -- no icons
                    vim_item.menu = ({
                        nvim_lsp = "LSP",
                        luasnip = "SNIP",
                        buffer = "BUFF",
                        path = "PATH",
                    })[entry.source.name]
                    return vim_item
                end,
            },
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
            }),
            confirm_opts = {
                behavior = cmp.ConfirmBehavior.Replace,
                select = false,
            },
            experimental = {
                ghost_text = false,
            },
        })
    end,
}
