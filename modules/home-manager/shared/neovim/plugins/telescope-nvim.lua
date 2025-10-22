local telescope = require("telescope")
local builtin = require("telescope.builtin")

-- Configure telescope
telescope.setup({
	defaults = {
		initial_mode = "normal",
		mappings = {
			i = {
				["<C-u>"] = false,
				["<C-d>"] = false,
			},
		},
	},
	extensions = {
		file_browser = {
			hijack_netrw = false,
		},
	},
})

-- Load extensions
telescope.load_extension("file_browser")
telescope.load_extension("notify")

-- Keymaps
local map = function(keys, func, desc)
	vim.keymap.set("n", keys, func, { desc = desc })
end

-- Buffer and file search
map("<leader><leader>", builtin.buffers, "[ ] Find existing buffers")
map("<leader>s.", builtin.oldfiles, "[S]earch Recent Files")

-- Text search
map("<leader>sw", builtin.grep_string, "[S]earch current [W]ord")
map("<leader>sg", builtin.live_grep, "[S]earch by [G]rep")

-- Navigation
map("<leader>sr", builtin.resume, "[S]earch [R]esume")
map("<leader>sp", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", "[S]earch [P]roject")

-- Telescope features
map("<leader>ss", builtin.builtin, "[S]earch [S]elect Telescope")
map("<leader>sd", builtin.diagnostics, "[S]earch [D]iagnostics")
map("<leader>sh", builtin.help_tags, "[S]earch [H]elp")
map("<leader>sk", builtin.keymaps, "[S]earch [K]eymaps")
map("<leader>sn", ":Telescope notify<CR>", "[S]earch [N]otifications")
