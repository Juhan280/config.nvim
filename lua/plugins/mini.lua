return {
	{
		"echasnovski/mini.nvim",
		version = false,
		event = "VeryLazy",
		config = function()
			require("mini.ai").setup()
			require("mini.pairs").setup()
			require('mini.operators').setup({
				exchange = {
					prefix = '<leader>x',
				}
			})
			require('mini.surround').setup({
				mappings = {
					add = 'ys',
					delete = 'ds',
					find = '',
					find_left = '',
					highlight = '',
					replace = 'cs',
					update_n_lines = '',
				},
				search_method = 'cover_or_next',
			})

			require('mini.notify').setup()
		end,
	},
	{
		"echasnovski/mini.icons",
		opts = {}
	}
}
