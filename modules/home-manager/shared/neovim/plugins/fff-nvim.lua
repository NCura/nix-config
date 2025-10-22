-- FFF.nvim - Smart fuzzy file picker
-- https://github.com/dmtrKovalenko/fff.nvim

local fff = require("fff")

fff.setup({
	base_path = vim.fn.getcwd(),
	max_results = 1000,
	lazy_sync = true,
	layout = {
		height = 0.8,
		width = 0.8,
	},
    preview = {
        line_numbers = true,
        wrap_lines = true

    },
})

-- Keybindings
vim.keymap.set("n", "<leader>sf", ":FFFFind<CR>", { desc = "[S]earch [F]iles" })
