return {
    "nvim-lualine/lualine.nvim",
    config = function()
        -- lualine
        local statusline_ok, status = pcall(require, "lualine")
        if not statusline_ok then
            return
        end

        local modes = {
            ["n"] = "N",
            ["no"] = "P",
            ["nov"] = "P",
            ["noV"] = "P",
            ["no�"] = "P",
            ["niI"] = "N",
            ["niR"] = "N",
            ["niV"] = "N",
            ["nt"] = "N",
            ["v"] = "V",
            ["vs"] = "V",
            ["V"] = "V",
            ["Vs"] = "V",
            [" "] = "V",
            ["�s"] = "V",
            ["s"] = "SEL",
            ["S"] = "S",
            ["�"] = "S",
            ["i"] = "I",
            ["ic"] = "I",
            ["ix"] = "I",
            ["R"] = "R",
            ["Rc"] = "R",
            ["Rx"] = "R",
            ["Rv"] = "V",
            ["Rvc"] = "V",
            ["Rvx"] = "V",
            ["c"] = "C",
            ["cv"] = "EX",
            ["ce"] = "EX",
            ["r"] = "R",
            ["rm"] = "MORE",
            ["r?"] = "CONFIRM",
            ["!"] = "SHELL",
            ["t"] = "T",
        }
        status.setup({
            options = {
                icons_enabled = true,
                theme = "auto",
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = false,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                },
            },
            sections = {
                lualine_a = {
                    function()
                        return modes[vim.api.nvim_get_mode().mode] or "__"
                    end,
                },
                lualine_b = { "branch" },
                lualine_c = { "diagnostics" },
                lualine_x = {},
                lualine_y = { "location", "progress" },
                lualine_z = {},
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {
                lualine_a = {},
                lualine_b = {
                    {
                        "tabs",
                        mode = 2,
                        use_mode_colors = true,
                        max_length = vim.o.columns,
                    },
                },
                lualine_c = {},
                lualine_x = { "diagnostics" },
                lualine_y = { "diff", "branch" },
                lualine_z = {},
            },
            winbar = nil,
            inactive_winbar = {},
            extensions = {},
        })

        status.hide({
            place = { "statusline" }, -- The segment this change applies to.
            unhide = false,   -- whether to re-enable lualine again/
        })
    end,
}
