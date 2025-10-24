-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Register jinja file types for jinja-lsp
vim.filetype.add({
	extension = {
		jinja = "jinja",
		jinja2 = "jinja",
		j2 = "jinja",
	},
})

-- Auto-reload files when changed outside of Neovim (especially useful in tmux)
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
	desc = "Check for file changes when gaining focus",
	callback = function()
		if vim.api.nvim_get_mode().mode ~= "c" then
			vim.cmd("checktime")
		end
	end,
})

-- Timer-based polling for file changes (checks every 2 seconds even without interaction)
local timer = vim.loop.new_timer()
timer:start(
	2000,
	2000,
	vim.schedule_wrap(function()
		if vim.api.nvim_get_mode().mode ~= "c" then
			vim.cmd("checktime")
		end
	end)
)

-- Notify when file is changed outside of Neovim
vim.api.nvim_create_autocmd("FileChangedShellPost", {
	desc = "Notify when file is changed outside of Neovim",
	callback = function()
		vim.notify("File changed on disk. Buffer reloaded.", vim.log.levels.WARN)
	end,
})
