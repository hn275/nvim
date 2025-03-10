local ls = require("luasnip")

return {
	ls.snippet("range", {
		ls.text_node("for "),
		ls.insert_node(1),
		ls.text_node(" := range "),
		ls.insert_node(2),
		ls.text_node({ " {", "\t" }),
		ls.insert_node(0),
		ls.text_node({ "", "}" }),
	}),
}
