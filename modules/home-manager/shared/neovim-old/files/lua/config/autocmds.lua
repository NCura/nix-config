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
