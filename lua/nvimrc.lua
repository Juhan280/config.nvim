-- Row number setting
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.fillchars = "eob: "

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
local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
vim.opt.whichwrap:append("<>[]hl")

-- Keymaps
vim.keymap.set("n", "<Esc>", ":noh<CR>", { silent = true })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = 'Exit terminal mode' })

-- disable treesitter highlight for gitcommit file types
vim.api.nvim_create_autocmd("FileType", {
	desc = "Disable treesitter highlight for gitcommit file types",
	once = true,
	pattern = "gitcommit",
	command = "setlocal tabstop=2 | TSBufDisable highlight"
})

-- highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-on-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end
})
