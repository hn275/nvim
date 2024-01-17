local ls = require("luasnip")

return {
    ls.snippet("try", {
        ls.choice_node(1, {
            ls.snippet_node(nil, {
                ls.text_node({ "try {", "\t" }),
                ls.insert_node(3),
                ls.text_node({ "", "} catch(e) {", "\t" }),
                ls.insert_node(1),
                ls.text_node({ "", "} finally {", "\t" }),
                ls.insert_node(2),
                ls.text_node({ "", "}" }),
            }),
            ls.snippet_node(nil, {
                ls.text_node({ "try {", "\t" }),
                ls.insert_node(2),
                ls.text_node({ "", "} catch(e) {", "\t" }),
                ls.insert_node(1),
                ls.text_node({ "", "}" }),
            }),
        }),
    }),

    ls.snippet("function", {
        ls.choice_node(1, {
            ls.snippet_node(nil, {
                ls.text_node("function "),
                ls.insert_node(1),
                ls.text_node("("),
                ls.insert_node(2),
                ls.text_node({ ") {", "\t" }),
                ls.insert_node(3),
                ls.text_node({ "", "}" }),
            }),
            ls.snippet_node(nil, {
                ls.text_node("const "),
                ls.insert_node(1),
                ls.text_node(" = ("),
                ls.insert_node(2),
                ls.text_node({ ") => {", "\t" }),
                ls.insert_node(3),
                ls.text_node({ "", "}" }),
            }),
        }),
    }),

    ls.snippet("import", {
        ls.text_node("import "),
        ls.insert_node(2),
        ls.text_node(' from "'),
        ls.insert_node(1),
        ls.text_node("\";"),
    }),
}
