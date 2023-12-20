-- Key map function
local k = function(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true })
end

-- Unbinding key
local normal_keys = {
    "<C-t>",
    "ZQ",
}
for _, key in pairs(normal_keys) do
    k("n", key, "<NOP>")
end

-- Do not yank when deleting with x
k("n", "x", '"_x')

-- Remapping leader key is done in ./lua/hn275/lazy.lua
-- so all plugins can have the proper keybinds

-- Tabs --
k("n", "tt", "<CMD>tabe<CR>")
k("n", "tr", "<CMD>tabclose<CR>")

-- Split --
k("n", "sj", "<CMD>split<CR>")
k("n", "sl", "<CMD>vsplit<CR>")

-- Move panes
k("n", "gh", "<C-w>h")
k("n", "gj", "<C-w>j")
k("n", "gk", "<C-w>k")
k("n", "gl", "<C-w>l")

-- quick fold functions
k("n", "<leader>=", "[mva{zf")

-- quick jump but centers the cursor
k("n", "<C-d>", "<C-d>zz")
k("n", "<C-u>", "<C-u>zz")
k("n", "<C-f>", "<C-f>zz")
k("n", "<C-b>", "<C-b>zz")
k("n", "{", "{zz")
k("n", "}", "}zz")
k("n", "[m", "[mzz")

-- Visual Mode --
-- stay in visual mode while indenting
k("v", "<", "<gv")
k("v", ">", ">gv")

-- Insert Mode --
vim.api.nvim_create_autocmd({ "FileType" }, {
    desc = "Go err handling",
    pattern = { "go" },
    group = vim.api.nvim_create_augroup("GoErrHandling", { clear = true }),
    callback = function()
        k("i", "<C-e>", "err != nil {}<ESC>i<CR><ESC>O")
    end,
})

-- Move block of codes around
k("v", "J", ":m '>+1<CR>gv=gv")
k("v", "K", ":m '<-2<CR>gv=gv")

-- Terminal --
k("t", "<Esc>", "<C-\\><C-N>") -- to normal mode in term
