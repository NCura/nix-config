local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("rust", {
	s("leptos_island", {
		t({ "#[island]", "" }),
		t("fn "),
		i(1, "function_name"),
		t("() -> impl IntoView {"),
		t({ "", "    view! {", "        " }),
		i(0),
		t({ "", "    }", "}" }),
	}),
})

ls.add_snippets("rust", {
	s("leptos_component", {
		t({ "#[component]", "" }),
		t("fn "),
		i(1, "function_name"),
		t("() -> impl IntoView {"),
		t({ "", "    view! {", "        " }),
		i(0),
		t({ "", "    }", "}" }),
	}),
})

ls.add_snippets("rust", {
	s("leptos_server", {
		t({ "#[server]", "" }),
		t("pub async fn "),
		i(1, "function_name"),
		t("() -> Result<(), NCError> {"),
		i(0),
		t({ "", "", "    Ok(())", "}" }),
	}),
})
