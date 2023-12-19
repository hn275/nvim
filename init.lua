-- Basic vim stuff
vim.o.backup = false            -- creates backup
vim.o.clipboard = "unnamedplus" -- allow accessing the clipboard for neovim
vim.o.conceallevel = 0          -- making `` visible in markdown files
vim.o.fileencoding = "utf-8"
vim.o.hlsearch = false          -- highlight all matched search
vim.o.ignorecase = true         -- ignore case in search pattern
vim.o.pumheight = 10            -- pop up menu height
vim.o.cmdheight = 1
vim.o.showcmd = false
vim.o.showmode = false      -- mode is displayed in the status line already
vim.o.smartcase = true      -- smart case
vim.o.autoindent = true     -- automatically apply indentation from the last line to the next line
vim.o.smartindent = false   -- enabling smart indent
vim.o.splitbelow = true     -- new vsplit is forced to opened up below
vim.o.splitright = true     -- new hsplit is forced to opened up to the right
vim.o.swapfile = false      -- prevent creating swap files
vim.o.termguicolors = true  -- set term gui colors
vim.o.timeoutlen = 1000     -- time to wait for a mapped sequence to reset
vim.o.undofile = true       -- persistent undo
vim.o.updatetime = 1000     -- faster completion (4000ms by default)
vim.o.writebackup = false   -- if a file is being edited by another program or was written by another program wont be allowed to write
vim.o.expandtab = true      -- expanding tab to spaces
vim.o.shiftwidth = 4        -- number of spaces indented
vim.o.tabstop = 4           -- number of spaces tab key inserts
vim.o.cursorline = true     -- highlighting current cursor lines
vim.o.cursorcolumn = false  -- highlight current cursor column
vim.o.number = true         -- line number
vim.o.wrap = false          -- no wrap
vim.o.relativenumber = true -- enable relative number
vim.o.numberwidth = 1       -- set number column width
vim.o.signcolumn = "yes:1"  -- show sign column when there is a sign
vim.o.foldmethod = "manual" -- setting fold method
vim.o.foldcolumn = "1"      -- dedicated column for fold symbols
vim.o.foldlevelstart = 999  -- always open all folds when entering a file
vim.o.laststatus = 0
vim.o.showtabline = 2
vim.o.compatible = false
vim.o.mouse = ""

vim.opt.shortmess:append("c")

vim.cmd([[
set iskeyword+=-
set colorcolumn=100
]])

vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "astro", "javascript", "javascriptreact", "typescript", "typescriptreact", "svelte", "html" },
    callback = function()
        vim.o.shiftwidth = 2
        vim.o.tabstop = 2
    end,
})

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
require("hn275.keybinds")
require("hn275.filetypes")
require("hn275.formatter")
require("hn275.fold")

-- Plugins
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

require("lazy").setup("plugins")
