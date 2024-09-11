-- Basic vim stuff
vim.o.backup = false
vim.o.clipboard = "unnamedplus" -- allow accessing the clipboard for neovim
vim.o.conceallevel = 0 -- making `` visible in markdown files
vim.o.fileencoding = "utf-8"
vim.o.hlsearch = false -- highlight all matched search
vim.o.ignorecase = true -- ignore case in search pattern
vim.o.pumheight = 10 -- pop up menu height
vim.o.cmdheight = 0
vim.o.showcmd = false
vim.o.showmode = false
vim.o.smartcase = true
vim.o.autoindent = true
vim.o.smartindent = false
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.swapfile = false
vim.o.termguicolors = true
vim.o.timeoutlen = 1000
vim.o.undofile = true
vim.o.updatetime = 1000
vim.o.writebackup = false
vim.o.expandtab = false
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.cursorline = true
vim.o.cursorcolumn = false
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.numberwidth = 1
vim.o.signcolumn = "yes:1" -- show sign column when there is a sign
vim.o.foldmethod = "manual" -- setting fold method
vim.o.foldcolumn = "1" -- dedicated column for fold symbols
vim.o.foldlevelstart = 999 -- always open all folds when entering a file
vim.o.laststatus = 0
vim.o.showtabline = 2
vim.o.compatible = false
-- vim.o.mouse = ""

vim.opt.shortmess:append("c")

vim.cmd([[
set iskeyword+=-
set colorcolumn=80
]])

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
require("user.keybinds")
require("user.filetypes")
require("user.formatter")
require("user.fold")

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
