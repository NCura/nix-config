-- Lazygit.nvim - terminal UI for git commands
-- https://github.com/kdheepak/lazygit.nvim

-- Keymaps
map("n", "<leader>gs", vim.cmd.Git, "Git status")
map("n", "<C-A-g>", ":LazyGit<CR>", "Toggle LazyGit")
