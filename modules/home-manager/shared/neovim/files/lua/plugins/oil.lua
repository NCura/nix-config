return {
	"stevearc/oil.nvim",
	config = function()
		local oil = require("oil")
		oil.setup({
			win_options = {
				wrap = true,
			},
			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,
			keymaps = {
				["q"] = "actions.close",
			},
			view_options = {
				show_hidden = true,
				is_always_hidden = function(name, bufnr)
					return name == ".." or name == ".git"
				end,
			},
		})
	end,
}
