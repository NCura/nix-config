require("conform").setup({
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { { "prettierd", "prettier" } },
		json = { "jsonfmt" },
		nix = { "nixfmt", "nixpkgs-fmt", "alejandra" },
		html = { "htmlbeautifier" },
		php = { "php_cs_fixer" },
		toml = { "taplo" },
		rust = { "rustfmt" },
	},
})

-- Manual format keymap
vim.keymap.set("n", "<leader>ff", function()
	require("conform").format()
end, { desc = "[F]ormat file" })
