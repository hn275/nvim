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

        -- keybindings
        local lsp = vim.lsp.buf
        local diag = vim.diagnostic
        local keybindings = {
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
                key = "gD",
                fn = lsp.definition,
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
                fn = diag.goto_next,
            },
            {
                mode = "n",
                key = "gp",
                fn = diag.goto_prev,
            },
            {
                mode = "n",
                key = "<leader>rn",
                fn = lsp.rename,
            },
        }

        lsp_zero.on_attach(function(_, bufnr)
            for _, v in ipairs(keybindings) do
                vim.keymap.set(v.mode, v.key, v.fn, { noremap = true, silent = true, buffer = bufnr })
            end
            lsp_zero.default_keymaps({ buffer = bufnr })
        end)

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

        lspconfig.clangd.setup({
            capabilities = {
                offsetEncoding = "utf-8",
            },
        })

        lspconfig.rust_analyzer.setup({
            -- Other Configs ...
            on_attach = function(client, bufnr)
                vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
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

        lspconfig.htmx.setup({})
    end,
}
