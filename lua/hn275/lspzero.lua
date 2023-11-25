local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup()
require('mason-lspconfig').setup({
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
