return {
	{ "tpope/vim-fugitive", cmd = "Git" },
	{
		"lewis6991/gitsigns.nvim",
		event = "BufEnter",
		opts = { current_line_blame = true },
	},
}
