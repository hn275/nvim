return function()
    local treesitter_status, treesitter = pcall(require, "nvim-treesitter.configs")
    if not treesitter_status then
        print("treesitter not found")
        return
    end
    treesitter.setup({
        auto_install = true,
        highlight = { enable = true, },
        indent = { enable = true, },
    })
end
