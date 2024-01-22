return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        { "<leader>t", "<CMD>NvimTreeToggle<CR>" },
    },
    config = function()
        vim.g.loaded_netwr = 1
        vim.g.loaded_netwrPlugin = 1
        vim.opt.termguicolors = true

        require("nvim-tree").setup({
            auto_reload_on_write = true,
            git = {
                enable = false,
                ignore = false,
                show_on_dirs = true,
                show_on_open_dirs = false,
            },
            on_attach = function(bufnr)
                local api = require("nvim-tree.api")

                local function opts(desc)
                    return {
                        desc = "nvim-tree: " .. desc,
                        buffer = bufnr,
                        noremap = true,
                        silent = true,
                        nowait = true,
                    }
                end

                api.config.mappings.default_on_attach(bufnr)

                -- remap edit command
                vim.keymap.set("n", "<CR>", "", opts("Open: in place"))
                vim.keymap.set("n", "o", api.node.open.edit, opts("Open: in place"))
            end,
            view = {
                side = "right",
                adaptive_size = true,
                relativenumber = true,
                float = {
                    enable = false,
                    quit_on_focus_loss = true,
                    open_win_config = {
                        relative = "cursor",
                        border = "single",
                    },
                },
            },
            filters = {
                dotfiles = false,
            },
        })
    end,
}
