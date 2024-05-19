-- Row number setting
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.fillchars = "eob: "

vim.g.mapleader = " "

-- Tab setting
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = false
vim.opt.softtabstop = 2

-- wrap and scrolling
vim.opt.wrap = false
vim.opt.scrolloff = 3
vim.opt.sidescrolloff = 3

-- Diagnostic Signs
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Keymaps
vim.keymap.set("n", "<Esc>", ":noh<CR>", { silent = true })
