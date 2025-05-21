-- mapleader is needed to be defined before anything else
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Row number setting
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- Use system clipboard by default
vim.opt.clipboard = "unnamedplus"

-- Tab setting
vim.opt.tabstop = 2
vim.opt.shiftwidth = 0   -- when set to zero, it uses 'tabstop' value
vim.opt.softtabstop = -1 -- when it is negative, it follows 'shiftwidth'
vim.opt.expandtab = false

-- wraping and scrolling
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 5

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Allow insensitive tab completion in command mode
vim.opt.ignorecase = true

-- Execute .nvim.lua, .nvimrc, and .exrc files in the current directory
vim.opt.exrc = true

-- Check spelling in comments other places
vim.opt.spell = true
vim.api.nvim_create_autocmd("FileType", {
	desc = "Disable spell in certain filetypes",
	pattern = "checkhealth,man",
	command = "setlocal nospell"
})

-- Set rounded border for floating windows
vim.opt.winborder = "rounded"

-- Folds
vim.opt.foldlevelstart = 5
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
vim.opt.whichwrap:append("<>[]hl")
