-- Native Neovim 0.11 LSP Configuration (no plugins)

-- LSP keymaps on attach
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		-- Navigation
		map("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
		map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
		map("gr", vim.lsp.buf.references, "[G]oto [R]eferences")
		map("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
		map("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")

		-- Actions
		map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
		map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
		map("K", vim.lsp.buf.hover, "Hover Documentation")

		-- Format
		map("<leader>ff", function()
			vim.lsp.buf.format({ async = true })
		end, "[F]ormat")
	end,
})

-- Configure LSP servers
-- Server configurations are loaded from lsp/servers/<server_name>.lua via Nix
