return {
    "simrat39/symbols-outline.nvim",
    config = function()
        require("symbols-outline").setup({
            highlight_hovered_item = true,
            show_guides = true,
            auto_preview = false,
            position = "right",
            relative_width = true,
            width = 45,
            auto_close = true,
            show_numbers = true,
            show_relative_numbers = true,
            show_symbol_details = true,
            preview_bg_highlight = "Pmenu",
            autofold_depth = 9,
            auto_unfold_hover = true,
            fold_markers = { "+", "-" },
            wrap = false,
            keymaps = { -- These keymaps can be a string or a table for multiple keys
                close = { "q" },
                goto_location = "<Cr>",
                focus_location = "o",
                hover_symbol = "<C-space>",
                toggle_preview = "K",
                rename_symbol = "rn",
                code_actions = "a",
                fold = "h",
                unfold = "l",
                fold_all = "H",
                unfold_all = "L",
                fold_reset = "R",
            },
        })
    end,

    init = function()
        vim.keymap.set("n", "<leader>s", ":SymbolsOutline<CR>")
    end,
}
