return {
	{ "tpope/vim-fugitive", cmd = "Git" },
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		opts = { current_line_blame = true },
	},
}
