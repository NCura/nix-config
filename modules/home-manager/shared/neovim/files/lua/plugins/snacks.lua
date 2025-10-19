return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		dashboard = { enabled = true },
		explorer = { enabled = false },
		indent = { enabled = true },
		input = { enabled = true },
		picker = { enabled = false },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = false },
		scroll = { enabled = false },
		statuscolumn = { enabled = true },
		words = { enabled = true },
		terminal = {},
	},
	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				-- local map = function(keys, func, desc, modes)
				-- 	vim.keymap.set(modes or { "n" }, keys, func, { desc = desc })
				-- end

				-- map("<leader>st", function()
				-- 	Snacks.terminal()
				-- end, "Toggle terminal", { "n", "t" })
			end,
		})
	end,
}
