vim.cmd([[
let g:user_emmet_mode='i'
]])

vim.api.nvim_set_keymap("i", "<c-l>", "<c-y>,", { noremap = true, silent = true })
