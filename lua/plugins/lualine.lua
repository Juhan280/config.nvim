return { ---@type LazySpec
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"echasnovski/mini.icons",
	},
	event = "VeryLazy",
	init = function()
		-- Set an empty winbar by default. So when the real winbar is loaded,
		-- it doesn't shift the entire buffer by one line
		vim.opt.winbar = " "
	end,
	opts = {
		options = {
			theme = "auto",
			ignore_focus = { "neo-tree", "undotree" },
			always_divide_middle = false,
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = {},
			lualine_x = {
				{
					require("lazy.status").updates,
					cond = require("lazy.status").has_updates,
					color = { fg = "#ff9e64" },
				},
			},
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
		winbar = {
			lualine_a = { "filename" },
			lualine_b = { "filetype" },
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
	},
}
