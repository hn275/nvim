local ls = require("luasnip")
local postfix = require("luasnip.extras.postfix").postfix

return {
    ls.snippet("text", {
        ls.text_node("#text("),
        ls.insert_node(1),
        ls.text_node(")["),
        ls.insert_node(0),
        ls.text_node("];"),
    }),
}
