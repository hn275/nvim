local ls = require("luasnip")
local postfix = require("luasnip.extras.postfix").postfix

return {
    ls.snippet("$", {
        ls.text_node("$"),
        ls.insert_node(1),
        ls.text_node("$"),
    }),

    ls.snippet("sym", {
        ls.text_node("#sym."),
    }),

    postfix(".", {
        ls.dynamic_node(1, function(_, parent)
            return ls.snippet_node(1, {
                ls.text_node("#" .. parent.env.POSTFIX_MATCH .. "["),
                ls.insert_node(1),
                ls.text_node("]"),
            })
        end),
    }),
}
