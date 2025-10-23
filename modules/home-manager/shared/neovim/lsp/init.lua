-- Native Neovim 0.11 LSP Configuration (no plugins)

-- LSP keymaps on attach
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local lsp_map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		-- Navigation with Telescope
		lsp_map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
		lsp_map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
		lsp_map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
		lsp_map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
		lsp_map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

		-- Symbols
		lsp_map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
		lsp_map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

		-- Actions
		lsp_map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
		lsp_map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
		lsp_map("K", vim.lsp.buf.hover, "Hover Documentation")

		-- Format with conform
		lsp_map("<leader>ff", function()
			require("conform").format()
		end, "[F]ormat")

		-- Toggle inlay hints
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
			lsp_map("<leader>th", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
			end, "[T]oggle Inlay [H]ints")
		end
	end,
})

-- Configure LSP servers
-- Server configurations are loaded from lsp/servers/<server_name>.lua via Nix
