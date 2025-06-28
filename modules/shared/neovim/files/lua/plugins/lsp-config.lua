return {
	"neovim/nvim-lspconfig",
	dependencies = {
		-- Automatically install LSPs and related tools to stdpath for Neovim
		-- { "williamboman/mason.nvim", config = true }, -- NOTE: Must be loaded before dependants
		-- "williamboman/mason-lspconfig.nvim",
		-- "WhoIsSethDaniel/mason-tool-installer.nvim",

		-- Useful status updates for LSP.
		-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
		{ "j-hui/fidget.nvim", opts = {} },

		-- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
		-- used for completion, annotations and signatures of Neovim apis
		-- { "folke/neodev.nvim", opts = {} },
	},
	lazy = false,
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				-- Jump to the definition of the word under your cursor.
				--  This is where a variable was first declared, or where a function is defined, etc.
				--  To jump back, press <C-t>.
				map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

				-- Find references for the word under your cursor.
				map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

				-- Jump to the implementation of the word under your cursor.
				--  Useful when your language has ways of declaring types without an actual implementation.
				map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

				-- Jump to the type of the word under your cursor.
				--  Useful when you're not sure what type a variable is and you want to see
				--  the definition of its *type*, not where it was *defined*.
				map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")

				-- Fuzzy find all the symbols in your current document.
				--  Symbols are things like variables, functions, types, etc.
				map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")

				-- Fuzzy find all the symbols in your current workspace
				--  Similar to document symbols, except searches over your whole project.
				map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

				-- Rename the variable under your cursor
				--  Most Language Servers support renaming across files, etc.
				map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

				-- Execute a code action, usually your cursor needs to be on top of an error
				-- or a suggestion from your LSP for this to activate.
				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

				-- Opens a popup that displays documentation about the word under your cursor
				--  See `:help K` for why this keymap
				map("K", vim.lsp.buf.hover, "Hover Documentation")

				-- WARN: This is not Goto Definition, this is Goto Declaration.
				--  For example, in C this would take you to the header
				map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

				map("<leader>ff", ":lua require('conform').format()<CR>", "[F]ormat")
				-- The following two autocommands are used to highlight references of the
				-- word under your cursor when your cursor rests there for a little while.
				--    See `:help CursorHold` for information about when this is executed
				--
				-- When you move your cursor, the highlights will be cleared (the second autocommand).
				-- local client = vim.lsp.get_client_by_id(event.data.client_id)
				-- if client and client.server_capabilities.documentHighlightProvider then
				-- 	vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				-- 		buffer = event.buf,
				-- 		callback = vim.lsp.buf.document_highlight,
				-- 	})
				--
				-- 	vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				-- 		buffer = event.buf,
				-- 		callback = vim.lsp.buf.clear_references,
				-- 	})
				-- end
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.server_capabilities.documentHighlightProvider then
					local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.clear_references,
					})

					vim.api.nvim_create_autocmd("LspDetach", {
						group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
						callback = function(event2)
							vim.lsp.buf.clear_references()
							vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
						end,
					})
				end

				if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
					map("<leader>th", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
					end, "[T]oggle Inlay [H]ints")
				end
			end,
		})

		-- Show line diagnostics automatically in hover window
		-- You will likely want to reduce updatetime which affects CursorHold
		-- note: this setting is global and should be set only once
		-- vim.o.updatetime = 250
		-- vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
		-- 	group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
		-- 	callback = function()
		-- 		vim.diagnostic.open_float(nil, { focus = false })
		-- 	end,
		-- })

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
		local lspconfig = require("lspconfig")

		lspconfig.css_variables.setup({
			capabilities = capabilities,
		})

		lspconfig.cssls.setup({
			capabilities = capabilities,
			settings = {
				scss = {
					lint = {
						unknownAtRules = { "ignore" },
					},
				},
			},
		})

		lspconfig.html.setup({
			capabilities = capabilities,
		})

		lspconfig.ansiblels.setup({
			capabilities = capabilities,
		})

		lspconfig.terraformls.setup({
			capabilities = capabilities,
		})

		lspconfig.jsonls.setup({
			capabilities = capabilities,
		})

		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					completion = {
						callSnippet = "Replace",
					},
					-- diagnostics = { disable = { 'missing-fields' } },
				},
			},
		})

		lspconfig.marksman.setup({
			capabilities = capabilities,
		})

		lspconfig.nil_ls.setup({
			capabilities = capabilities,
		})

		lspconfig.rust_analyzer.setup({
			capabilities = capabilities,
			settings = {
				["rust-analyzer"] = {
					cargo = {
						allFeatures = true,
						features = { "ssr" },
						loadOutDirsFromCheck = true,
						runBuildScripts = true,
					},
					diagnostics = {
						disabled = { "inactive-code" },
					},
					-- Add clippy lints for Rust.
					-- checkOnSave = {
					-- 	allFeatures = true,
					-- 	command = "clippy",
					-- 	extraArgs = { "--no-deps" },
					-- },
					-- procMacro = {
					-- 	enable = true,
					-- 	ignored = {
					-- 		["async-trait"] = { "async_trait" },
					-- 		["napi-derive"] = { "napi" },
					-- 		["async-recursion"] = { "async_recursion" },
					-- 	},
					-- },
					-- check = {
					-- features = { "all" },
					-- command = "clippy",
					-- extraArgs = { "--no-deps" },
					-- },
					-- rustfmt = {
					-- 	overrideCommand = { "leptosfmt", "--stdin", "--rustfmt" },
					-- },
				},
			},
		})

		lspconfig.rust_analyzer.setup({
			capabilities = capabilities,
			settings = {
				["rust-analyzer"] = {
					cargo = {
						allFeatures = true,
						features = { "all" },
						buildScripts = {
							enable = true,
						},
					},
					check = {
						features = { "all" },
						command = "clippy",
						extraArgs = { "--no-deps" },
					},
					procMacro = {
						enable = true,
						ignored = {
							["async-trait"] = { "async_trait" },
							["napi-derive"] = { "napi" },
							["async-recursion"] = { "async_recursion" },
						},
					},
					-- rustfmt = {
					-- 	overrideCommand = { "leptosfmt", "--stdin", "--rustfmt" },
					-- },
				},
			},
		})

		lspconfig.sqlls.setup({
			capabilities = capabilities,
		})

		-- lspconfig.tailwindcss.setup({
		-- 	autostart = "false",
		-- 	capabilities = capabilities,
		-- 	filetypes = { "html", "php", "css", "sass", "scss", "javascript", "rust" },
		-- })
		-- lspconfig.typos_lsp.setup({
		-- 	capabilities = capabilities,
		-- })
	end,
}
