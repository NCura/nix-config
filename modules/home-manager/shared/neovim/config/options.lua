vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.clipboard = "unnamedplus"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

-- Indentation
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.mouse = "a"
vim.opt.showmode = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Auto-reload files when changed outside of Neovim
vim.opt.autoread = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.scrolloff = 20

vim.o.conceallevel = 2
vim.opt_local.conceallevel = 2
vim.o.winborder = "rounded"

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.virtualedit = "block"
vim.opt.inccommand = "split"
vim.opt.ignorecase = true

-- Diagnostics
vim.diagnostic.config({
	virtual_text = true,
	-- virtual_lines = true,
})
