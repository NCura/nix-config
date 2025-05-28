local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("rust", {
	s("islandfn", {
		t({ "#[island]", "" }),
		t("fn "),
		i(1, "function_name"),
		t("() -> impl IntoView {"),
		t({ "", "    view! {", "        " }),
		i(0),
		t({ "", "    }", "}" }),
	}),
})
