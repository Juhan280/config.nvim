require("config.setup")
require("config.options")

---@diagnostic disable-next-line: missing-fields
require("lazy").setup("plugins", {
	defaults = { lazy = true, version = "*" },
	dev = { path = "~/local_builds/" },
	install = { colorscheme = { "tokyonight" } },
	ui = { border = "rounded" },
	checker = { enabled = true, notify = false },
})

-- Diagnostic
vim.diagnostic.config({
	virtual_text = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚",
			[vim.diagnostic.severity.WARN] = "󰀪",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "󰌶",
		},
	},
})

-- Keymaps
vim.keymap.set("n", "<Esc>", ":noh<CR>", { silent = true })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
-- textobject to select entire buffer
vim.keymap.set({ "o", "x" }, "gG", function()
	vim.api.nvim_win_set_cursor(0, { 1, 0 })
	if not (vim.fn.mode():find("V")) then
		vim.cmd.normal({ "V", bang = true })
	end
	vim.cmd.normal({ "o", bang = true })
	vim.api.nvim_win_set_cursor(0, { vim.fn.line("$"), 0 })
end, { desc = "Entire Buffer" })

require("config.autocmds")
