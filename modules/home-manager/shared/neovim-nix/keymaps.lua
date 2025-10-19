-- Basic keymaps (LSP keymaps will be added in the LSP config on LspAttach)

local map = function(mode, keys, func, desc)
	vim.keymap.set(mode, keys, func, { desc = desc })
end

-- Disable Q
map("n", "Q", "<nop>", "Disable Q")

-- Clear search highlighting
map("n", "<Esc>", "<cmd>nohlsearch<CR>", "Clear search highlighting")

-- Better word navigation (stay on same line)
map("n", "w", function()
	local current_line = vim.api.nvim_win_get_cursor(0)[1]
	vim.cmd("normal! w")
	if vim.api.nvim_win_get_cursor(0)[1] ~= current_line then
		vim.cmd("normal! b")
	end
end, "Go to next word on the same line")

map("n", "e", function()
	local current_line = vim.api.nvim_win_get_cursor(0)[1]
	vim.cmd("normal! e")
	if vim.api.nvim_win_get_cursor(0)[1] ~= current_line then
		vim.cmd("normal! ge")
	end
end, "Go to end of word on the same line")

-- Move lines up/down in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", "Move text down")
map("v", "K", ":m '<-2<CR>gv=gv", "Move text up")

-- Join lines without moving cursor
map("n", "J", "mzJ`z", "Join lines without moving cursor")

-- Center screen when searching
map("n", "n", "nzzzv", "Next search result (centered)")
map("n", "N", "Nzzzv", "Previous search result (centered)")

-- Center screen when scrolling
map("n", "<C-d>", "<C-d>zz", "Scroll half page down (centered)")
map("n", "<C-u>", "<C-u>zz", "Scroll half page up (centered)")

-- Insert blank lines
map("n", "<C-o>", ":normal! o<Esc>", "Insert blank line below")
map("n", "<C-S-O>", ":normal! O<Esc>", "Insert blank line above")

-- Window navigation (using kitty navigator)
vim.g.kitty_navigator_no_mappings = 1
map("n", "<D-C-A-S-h>", ":KittyNavigateLeft<CR>", "Move to left window")
map("n", "<D-C-A-S-j>", ":KittyNavigateDown<CR>", "Move to lower window")
map("n", "<D-C-A-S-k>", ":KittyNavigateUp<CR>", "Move to upper window")
map("n", "<D-C-A-S-l>", ":KittyNavigateRight<CR>", "Move to right window")

-- Window resizing
map("n", "<C-A-<>", "5<C-w><", "Decrease window width")
map("n", "<C-A->>", "5<C-w>>", "Increase window width")
map("n", "<C-w>+", "5<C-w>+", "Increase window height")
map("n", "<C-w>-", "5<C-w>-", "Decrease window height")

-- Buffer navigation
map("n", "<C-Tab>", ":bnext<CR>", "Next buffer")
map("n", "<C-A-Tab>", ":bprevious<CR>", "Previous buffer")
map("n", "<C-A-a>", ":b#<CR>", "Go to alternate buffer")

-- Save all
map("n", "<C-A-s>", ":wall<CR>", "Save all files")

-- Delete/change without yanking
map("n", "<leader>d", '"_d', "Delete without yank")
map("v", "<leader>d", '"_d', "Delete without yank")
map("n", "<leader>c", '"_c', "Change without yank")
map("v", "<leader>c", '"_c', "Change without yank")

-- Put without yanking in visual mode
map("x", "<leader>p", '"_dP', "Put without yank")

-- Search current selection in visual mode
map("v", "<leader>/", "y/\\V<C-R>=escape(@\",'/\\')<CR><CR>", "Search selection")

-- Diagnostics
map("n", "<leader>e", vim.diagnostic.open_float, "Show diagnostic [E]rror messages")
map("n", "<leader>q", vim.diagnostic.setloclist, "Open diagnostic [Q]uickfix list")
