-- Treesitter configuration
-- https://github.com/nvim-treesitter/nvim-treesitter

require("nvim-treesitter.configs").setup({
	-- Syntax highlighting
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},

	-- Indentation based on treesitter
	indent = {
		enable = true,
	},

	-- Incremental selection
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<Leader>ss",
			node_incremental = "<Leader>si",
			scope_incremental = "<Leader>sc",
			node_decremental = "<Leader>sd",
		},
	},

	-- Text objects
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
				["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
			},
			selection_modes = {
				["@parameter.outer"] = "v", -- charwise
				["@function.outer"] = "v", -- linewise
				["@class.outer"] = "<c-v>", -- blockwise
			},
			include_surrounding_whitespace = true,
		},
	},
})
