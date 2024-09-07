return { ---@type LazySpec
	"mbbill/undotree",
	event = "VeryLazy",
	init = function()
		vim.g.undotree_SetFocusWhenToggle = true
		vim.opt.undofile = true
	end,
	config = function()
		vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Undotree" })
	end,
}
