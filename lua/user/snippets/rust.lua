local ls = require("luasnip")

return {
    ls.snippet("fn", {
        ls.text_node("fn "),
        ls.insert_node(1),
        ls.text_node("("),
        ls.insert_node(2),
        ls.text_node(") "),
        ls.insert_node(2),
        ls.text_node({ "{", "\t" }),
        ls.insert_node(0),
        ls.text_node({ "", "}" }),
    }),

    ls.snippet("impl", {
        ls.text_node("impl "),
        ls.insert_node(1),
        ls.text_node(" for "),
        ls.insert_node(2),
        ls.text_node({ " {", "\tfn " }),
        ls.insert_node(3),
        ls.text_node("("),
        ls.insert_node(4),
        ls.text_node(") "),
        ls.insert_node(5),
        ls.text_node({ "{", "\t\t" }),
        ls.insert_node(0),
        ls.text_node({ "", "\t}" }),
        ls.text_node({ "", "}" }),
    }),
}
