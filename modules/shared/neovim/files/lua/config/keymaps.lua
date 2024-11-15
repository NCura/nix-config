local telescope_builtin = require("telescope.builtin")
local harpoon = require("harpoon")

local map_n = function(keys, func, desc)
	vim.keymap.set("n", keys, func, { desc = desc })
end

local map_v = function(keys, func, desc)
	vim.keymap.set("v", keys, func, { desc = desc })
end

local map_x = function(keys, func, desc)
	vim.keymap.set("x", keys, func, { desc = desc })
end

local map_i = function(keys, func, desc)
	vim.keymap.set("i", keys, func, { desc = desc })
end

local run_function = function(name, arg)
	return function()
		if arg ~= nil then
			return vim.fn[name](arg)
		else
			return vim.fn[name]()
		end
	end
end

local harpoon_list = function(number)
	return function()
		harpoon:list():select(number)
	end
end

--------------------------------------------------------------------------------------------------------
----------------------------------------------- Nothing ------------------------------------------------
--------------------------------------------------------------------------------------------------------
-- map_n("Q", "<nop>", "Disable Q")
map_n("w", function()
	local current_line = vim.api.nvim_win_get_cursor(0)[1]
	vim.cmd("normal! w")
	if vim.api.nvim_win_get_cursor(0)[1] ~= current_line then
		vim.cmd("normal! b")
	end
end, "Go to next word on the same line")
map_n("e", function()
	local current_line = vim.api.nvim_win_get_cursor(0)[1]
	vim.cmd("normal! e")
	if vim.api.nvim_win_get_cursor(0)[1] ~= current_line then
		vim.cmd("normal! ge")
	end
end, "Go to next word on the same line")
map_v("J", ":m '>+1<CR>gv=gv", "Move text up")
map_n("J", "mzJ`z", "Join lines without moving cursor")
map_v("K", ":m '>-2<CR>gv=gv", "Move text down")
map_n("N", "Nzzzv", "Repeat last search then center")
map_n("n", "nzzzv", "Repeat last search,in opposite direction then center")
map_n("-", require("oil").toggle_float)

-- local function next_word_same_line()
--     local current_line = vim.api.nvim_win_get_cursor(0)[1]
--     -- Move to the next word
--     vim.cmd('normal! w')
--     -- If the line number changed, go back to the original position
--     if vim.api.nvim_win_get_cursor(0)[1] ~= current_line then
--         vim.cmd('normal! b')
--     end
-- end

--------------------------------------------------------------------------------------------------------
----------------------------------------------- <leader> -----------------------------------------------
--------------------------------------------------------------------------------------------------------
map_n("<Esc>", "<cmd>nohlsearch<CR>")
map_n("<leader><leader>", function()
	telescope_builtin.buffers({
		initial_mode = "normal",
		sort_mru = true,
		-- sort_lastused = true,
	})
end, "[ ] Find existing buffers")
map_v("<leader>/", "y/\\V<C-R>=escape(@\",'/\\')<CR><CR>", "Search selection")

map_n("<leader>q", vim.diagnostic.setloclist, "Open diagnostic [Q]uickfix list")
map_n("<leader>e", vim.diagnostic.open_float, "Show diagnostic [E]rror messages")
map_n("<leader>u", "<cmd>lua require('undotree').toggle()<cr>")
map_x("<leader>p", '"_dP', "Put without yank")
map_n("<leader>pv", vim.cmd.Ex, "Open file explorer")

map_n("<leader>d", '"_d', "Delete without yank")
map_v("<leader>d", '"_d', "Delete without yank")
map_n("<leader>S", '<cmd>lua require("spectre").toggle()<CR>', "Toggle Spectre")
map_n("<leader>Sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', "Search current word")
map_v("<leader>Sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', "Search current word")
map_n(
	"<leader>Sf",
	'<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
	"Search word on current file"
)
map_n("<leader>s.", telescope_builtin.oldfiles, '[S]earch Recent Files ("." for repeat)')
map_n("<leader>sw", telescope_builtin.grep_string, "[S]earch current [W]ord")
map_n("<leader>sr", telescope_builtin.resume, "[S]earch [R]esume")
map_n("<leader>sp", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", "[S]earch [P]roject")
map_n("<leader>ss", telescope_builtin.builtin, "[S]earch [S]elect Telescope")
map_n("<leader>sd", telescope_builtin.diagnostics, "[S]earch [D]iagnostics")
map_n("<leader>sf", telescope_builtin.find_files, "[S]earch [F]iles")
map_n("<leader>sg", telescope_builtin.live_grep, "[S]earch by [G]rep")
map_n("<leader>sh", telescope_builtin.help_tags, "[S]earch [H]elp")
map_n("<leader>sk", telescope_builtin.keymaps, "[S]earch [K]eymaps")
map_n("<leader>gs", vim.cmd.Git)
map_n("<leader>ha", function()
	harpoon:list():add()
end, "Add buffer to Harpoon list")
map_n("<leader>c", '"_c', "Change without yank")
map_v("<leader>c", '"_c', "Change without yank")

--------------------------------------------------------------------------------------------------------
----------------------------------------------- <C> ----------------------------------------------------
--------------------------------------------------------------------------------------------------------
map_n("<C-Tab>", ":bnext<CR>", "Next buffer")
map_n("<C-d>", "<C-d>zz", "Scroll half page down then center")
map_n("<C-u>", "<C-u>zz", "Scroll half page up then center")
-- map_n("<C-h>", "<C-w>h", "Move focus to the left window")
-- map_n("<C-l>", "<C-w>l", "Move focus to the right window")
-- map_n("<C-j>", "<C-w>j", "Move focus to the lower window")
-- map_n("<C-k>", "<C-w>k", "Move focus to the upper window")
-- map_n("<C->>", "5<C-w>>", "Increase window width by 5")
-- map_n("<C-<>", "5<C-w><", "Decrease window width by 5")
map_n("<C-w>+", "5<C-w>+", "Increase window height by 5")
map_n("<C-w>-", "5<C-w>-", "Decrease window height by 5")
map_n("<C-o>", "<nop>", "Disable <C-o>")
map_n("<C-o>", ":normal! o<Esc>", "Insert new line below cursor")
-- map_n("<C-o>", ":let save_cursor = getcurpos() | normal! o<Esc> | call setpos('.', save_cursor)")
--------------------------------------------------------------------------------------------------------
----------------------------------------------- <A> ----------------------------------------------------
--------------------------------------------------------------------------------------------------------
-- vim.g.codeium_disable_bindings = 1
map_i("<A-y>", function()
	return vim.fn["codeium#Accept"]()
end, "Accept codeium suggestion")
map_i("<A-n>", run_function("codeium#CycleCompletions", 1), "Cycle codeium suggestions")
map_i("<A-p>", run_function("codeium#CycleCompletions", -2), "Cycle codeium suggestions")
map_i("<A-Space>", run_function("codeium#Complete"), "Complete codeium suggestion")
map_i("<A-Space>", function()
	return vim.fn["codeium#Complete"]()
end, "Complete codeium suggestion")

--------------------------------------------------------------------------------------------------------
----------------------------------------------- <C-S> --------------------------------------------------
--------------------------------------------------------------------------------------------------------
map_n("<C-S-O>", ":normal O<Esc>", "Insert new line above cursor")
map_n("<C-S-P>", function()
	harpoon:list():prev()
end, "Previous buffer in Harpoon list")
map_n("<C-S-N>", function()
	harpoon:list():next()
end, "Next buffer in Harpoon list")

--------------------------------------------------------------------------------------------------------
----------------------------------------------- <C-A> --------------------------------------------------
--------------------------------------------------------------------------------------------------------
-- map_n("<C-A-Tab>", ":b#<CR>", "Previous buffer")
map_n("<C-A-Tab>", ":bprevious<CR>", "Previous buffer")
map_n("<C-A-a>", ":b#<CR>", "Go to previous buffer")
-- map_n("<C-A-a>", ":bprevious<CR>", "Go to previous buffer")
map_n("<C-A-s>", ":wall<CR>", "Save all files")
map_n("<C-A-g>", ":LazyGit<CR>", "Toggle LazyGit")
map_n("<C-A-t>", ":Neotree toggle<CR>", "Toggle neotree")

map_n("<C-A-z>", harpoon_list(1), "Select buffer [1] in Harpoon list")
map_n("<C-A-x>", harpoon_list(2), "Select buffer [2] in Harpoon list")
map_n("<C-A-c>", harpoon_list(3), "Select buffer [3] in Harpoon list")
map_n("<C-A-v>", harpoon_list(4), "Select buffer [4] in Harpoon list")
map_n("<C-A-b>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, "Toggle Harpoon list")

vim.g.kitty_navigator_no_mappings = 1
map_n("<D-C-A-S-h>", ":KittyNavigateLeft<CR>", "Move focus to the left window")
map_n("<D-C-A-S-j>", ":KittyNavigateDown<CR>", "Move focus to the lower window")
map_n("<D-C-A-S-k>", ":KittyNavigateUp<CR>", "Move focus to the upper window")
map_n("<D-C-A-S-l>", ":KittyNavigateRight<CR>", "Move focus to the right window")
-- map_n("<C-A-h>", "<C-w>h", "Move focus to the left window")
-- map_n("<C-A-j>", "<C-w>j", "Move focus to the lower window")
-- map_n("<C-A-k>", "<C-w>k", "Move focus to the upper window")
-- map_n("<C-A-l>", "<C-w>l", "Move focus to the right window")
map_n("<C-A-<>", "5<C-w><", "Decrease window width by 5")
map_n("<C-A->>", "5<C-w>>", "Increase window width by 5")

-- map_n('<leader>p', function()
--   vim.fn.setreg('+', vim.fn.system('wl-paste -n'), 'c')
--   vim.cmd('normal! "+p')
-- end)
--
-- map_v('<leader>y', function()
--   local selected_text = vim.fn.getreg('"')
--   vim.fn.system('wl-copy', selected_text)
-- end)
--
-- map_n('<leader>yy', function()
--   local current_line = vim.fn.getline('.')
--   vim.fn.system('wl-copy', current_line)
--   -- vim.fn.system('echo ' .. vim.fn.shellescape(current_line) .. ' | wl-copy')
-- end)
--
