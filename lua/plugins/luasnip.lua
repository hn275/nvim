return {
    "L3MON4D3/LuaSnip",
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    build = "make install_jsregexp",
    config = function()
        local ls_ok, ls = pcall(require, "luasnip")
        if not ls_ok then
            return
        end
        ls.add_snippets("typst", require("user.snippets.typst"))
    end,
}
