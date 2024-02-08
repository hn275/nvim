local autocmd_id = vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = "*.*",
    callback = function()
        if vim.bo.filetype == "typst" then return end
        vim.lsp.buf.format()
    end,
})

local fmt_on_save = function()
    if autocmd_id == nil then
        autocmd_id = vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            pattern = "*.*",
            callback = function()
                if vim.bo.filetype == "typst" then
                    return
                end
                vim.lsp.buf.format()
                -- vim.cmd("FormatWrite")
            end,
        })
        print("AutoFmt on")
    else
        vim.api.nvim_del_autocmd(autocmd_id)
        autocmd_id = nil
        print("AutoFmt off")
    end
end

vim.api.nvim_create_user_command("AutoFmt", fmt_on_save, {})
