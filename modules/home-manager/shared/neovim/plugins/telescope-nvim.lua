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

-- Buffer and file search
map("n", "<leader><leader>", builtin.buffers, "[ ] Find existing buffers")
map("n", "<leader>s.", builtin.oldfiles, "[S]earch Recent Files")
map("n", "<leader>sf", builtin.find_files, "[S]earch [F]iles")

-- Text search
map("n", "<leader>sw", builtin.grep_string, "[S]earch current [W]ord")
map("n", "<leader>sg", builtin.live_grep, "[S]earch by [G]rep")

-- Navigation
map("n", "<leader>sr", builtin.resume, "[S]earch [R]esume")
map("n", "<leader>sp", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", "[S]earch [P]roject")

-- Telescope features
map("n", "<leader>ss", builtin.builtin, "[S]earch [S]elect Telescope")
map("n", "<leader>sd", builtin.diagnostics, "[S]earch [D]iagnostics")
map("n", "<leader>sh", builtin.help_tags, "[S]earch [H]elp")
map("n", "<leader>sk", builtin.keymaps, "[S]earch [K]eymaps")
map("n", "<leader>sn", ":Telescope notify<CR>", "[S]earch [N]otifications")
