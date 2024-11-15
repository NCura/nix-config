return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				-- python = { "isort", "black" },
				-- Use a sub-list to run only the first available formatter
				javascript = { { "prettierd", "prettier" } },
				json = { "jsonfmt" },
				nix = { "nixfmt", "nixpkgs-fmt", "alejandra" },
				html = { "htmlbeautifier" },
				php = { "php_cs_fixer" },
				toml = { "taplo" },
			},
		})
	end,
}
