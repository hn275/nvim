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
		ls.add_snippets("rust", require("user.snippets.rust"))
		ls.add_snippets("go", require("user.snippets.golang"))

		local js_commons = require("user.snippets.js_commons")
		ls.add_snippets("javascript", js_commons)
		ls.add_snippets("svelte", js_commons)
		ls.add_snippets("astro", js_commons)
	end,
}
