return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		-- build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		build = "make",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
	{
		"kdheepak/lazygit.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				extensions = {
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
						-- the default case_mode is "smart_case"
					},
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
				pickers = {
					buffers = {
						mappings = {
							n = {
								["<C-s>"] = "select_vertical",
								["q"] = require("telescope.actions").close,
								["d"] = require("telescope.actions").delete_buffer,
							},
						},
					},
					find_files = {
						mappings = {
							n = {
								["<C-s>"] = "select_vertical",
								["q"] = require("telescope.actions").close,
							},
							i = {
								["<C-s>"] = "select_vertical",
							},
						},
					},
					live_grep = {
						mappings = {
							n = {
								["<C-s>"] = "select_vertical",
								["q"] = require("telescope.actions").close,
							},
							i = {
								["<C-s>"] = "select_vertical",
							},
						},
					},
					-- file_browser = {
					-- 	mappings = {
					-- 		n = {
					-- 			["<C-s>"] = "select_vertical",
					-- 		},
					-- 		i = {
					-- 			["<C-s>"] = "select_vertical",
					-- 		},
					-- 	},
					-- },
				},
			})

			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("fzf")
			require("telescope").load_extension("lazygit")
			require("telescope").load_extension("file_browser")
		end,
	},
}
