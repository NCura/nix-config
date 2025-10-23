-- Snacks.nvim - Collection of useful plugins
-- https://github.com/folke/snacks.nvim

local snacks = require("snacks")

snacks.setup({
	bigfile = { enabled = true },
	dashboard = { enabled = false }, -- Disabled: requires lazy.nvim
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
	terminal = {
		win = {
			style = "terminal",
		},
	},
})

-- Terminal keybindings
map("n", "<C-A-t>", function()
	snacks.terminal()
end, "Toggle terminal")
map("t", "<C-A-t>", function()
	snacks.terminal()
end, "Toggle terminal")
