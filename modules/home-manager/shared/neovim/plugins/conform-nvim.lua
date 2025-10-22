require("conform").setup({
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
	formatters_by_ft = {
		lua = { "stylua" },
		nix = { "nixfmt" },
		rust = { "rustfmt" },
	},
})

-- Manual format keymap
vim.keymap.set("n", "<leader>ff", function()
	require("conform").format()
end, { desc = "[F]ormat file" })
