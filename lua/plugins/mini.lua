return {
	{ 'echasnovski/mini.ai',        event = "VeryLazy", opts = {} },
	{ 'echasnovski/mini.pairs',     event = "VeryLazy", opts = {} },
	{ 'echasnovski/mini.operators', event = "VeryLazy", opts = {} },
	{
		'echasnovski/mini.operators',
		event = "VeryLazy",
		opts = {
			exchange = {
				prefix = '<leader>x',
			}
		}
	},
	{
		'echasnovski/mini.surround',
		event = "VeryLazy",
		opts = {
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
		}
	},
	{ 'echasnovski/mini.notify', event = "VeryLazy", opts = {} },
	{ "echasnovski/mini.icons",  opts = {} }
}
