require("config.setup")
require("config.options")

---@diagnostic disable-next-line: missing-fields
require("lazy").setup("plugins", {
	defaults = { lazy = true, version = "*" },
	dev = { path = "~/local_builds/" },
	install = { colorscheme = { "tokyonight" } },
	checker = { enabled = true, notify = false },
	ui = {
		border = "rounded",
		custom_keys = {
			["<localleader>t"] = {
				function(plugin)
					require("lazy.util").float_term(vim.g.shell, {
						cwd = plugin.dir,
					})
				end,
				desc = "Open terminal in plugin dir",
			},
		},
	},
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
vim.keymap.set("n", "<Esc>", "<cmd>noh<CR>")
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

require("config.autocmds")
