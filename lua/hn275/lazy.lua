local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "              -- Make sure to set `mapleader` before lazy so your mappings are correct
require("lazy").setup({
    "nvim-tree/nvim-web-devicons", -- So many plugins require this
    "nvim-lua/plenary.nvim",       -- Useful lua functions used ny lots of plugins
    "nvim-lua/popup.nvim",         -- An implementation of the Popup API from vim in Neovim
    {
        "lewpoly/sherbet.nvim",
        config = function()
            vim.cmd("colorscheme sherbet")
        end,
    },
    "nvim-telescope/telescope.nvim",
    {
        "iamcco/markdown-preview.nvim",
        config = function()
            vim.fn["mkdp#util#install"]()
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        cmd = "TSUpdate",
    },
    "nvim-lualine/lualine.nvim",
    "tpope/vim-fugitive",
    "mattn/emmet-vim",
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "TSUpdateSync" },
        config = require("hn275.treesitter")

    },
    "rest-nvim/rest.nvim",
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "VonHeikemen/lsp-zero.nvim",        branch = "v3.x" },
    { "neovim/nvim-lspconfig" },
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/nvim-cmp",
    {
        "L3MON4D3/LuaSnip", -- snippet engine
        version = "2",
        build = "make install_jsregexp",
    },
    "saadparwaiz1/cmp_luasnip", -- for luasnip
    {
        "nvimtools/none-ls.nvim",
        config = require("hn275.null_ls"),
    },
})
