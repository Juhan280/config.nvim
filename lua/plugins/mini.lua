return { ---@type LazySpec
	{ "nvim-mini/mini.pairs",     event = "VeryLazy", opts = {} },
	{ "nvim-mini/mini.operators", event = "VeryLazy", opts = {} },
	{
		"nvim-mini/mini.ai",
		event = "VeryLazy",
		cond = false,
		opts = {},
	},
	{
		"nvim-mini/mini.operators",
		event = "VeryLazy",
		opts = {
			exchange = {
				prefix = "<leader>x",
			},
			replace = {
				prefix = "<leader>r",
			},
		},
	},
	{
		"nvim-mini/mini.surround",
		event = "VeryLazy",
		opts = {
			mappings = {
				add = "ys",
				delete = "ds",
				find = "",
				find_left = "",
				highlight = "",
				replace = "cs",
				update_n_lines = "",
			},
			search_method = "cover_or_next",
		},
	},
	{
		"nvim-mini/mini.icons",
		specs = {
			{ "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
		},
		init = function()
			package.preload["nvim-web-devicons"] = function()
				require("mini.icons").mock_nvim_web_devicons()
				return package.loaded["nvim-web-devicons"]
			end
		end,
		opts = {},
	},
}
