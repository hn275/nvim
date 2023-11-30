vim.cmd([[
let g:user_emmet_mode='inv'
let g:user_emmet_install_global = 0
autocmd FileType javascript,typescript,javascriptreact,typescriptreact,svelte,astro,html EmmetInstall
]])
