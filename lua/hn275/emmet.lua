vim.g.user_emmet_install_global = 0
vim.g.user_emmet_mode = "inv"

vim.cmd([[
autocmd FileType javascript,typescript,javascriptreact,typescriptreact,svelte,astro,html EmmetInstall
]])
