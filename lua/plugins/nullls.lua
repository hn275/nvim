    return {
        "nvimtools/none-ls.nvim",
        config = function() 
    local n = require("null-ls")
    local code_actions = n.builtins.code_actions
    local format = n.builtins.formatting
    local hover = n.builtins.hover
    local diagnostics = n.builtins.diagnostics
    local completion = n.builtins.completion

    n.setup({
        sources = {
            format.stylua,
            format.autopep8,
            format.clang_format,
            format.fish_indent,
            format.jq,
            format.gofmt,
            format.goimports,
            format.mdformat,
            format.prettierd,
            format.rustfmt,
            format.beautysh,

            code_actions.gomodifytags,
            code_actions.impl,

            diagnostics.actionlint,
            diagnostics.fish,
            diagnostics.golangci_lint,
            diagnostics.jsonlint,
            diagnostics.tsc,
        },
    })
        end
    }
