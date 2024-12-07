return { ---@type LazySpec
	"mbbill/undotree",
	init = function()
		vim.g.undotree_SetFocusWhenToggle = true
		vim.opt.undofile = true
	end,
	keys = { { "<leader>u", vim.cmd.UndotreeToggle, desc = "Undotree" } },
}
