vim.g.user_emmet_install_global = 0
vim.g.user_emmet_mode = "nv"
vim.cmd([[
autocmd FileType javascript,typescript,javascriptreact,typescriptreact,svelte,astro,html EmmetInstall
]])

return {
    "mattn/emmet-vim",
    "nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
    "tpope/vim-fugitive",
}
