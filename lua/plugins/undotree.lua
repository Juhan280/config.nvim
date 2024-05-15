return {
	"mbbill/undotree",
	config = function()
		vim.g.undotree_SetFocusWhenToggle = true
		vim.opt.undofile = true

		vim.keymap.set("n", "<leader>u", function()
			vim.cmd.UndotreeToggle()
		end)
	end,
}
