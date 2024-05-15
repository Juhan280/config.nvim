return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
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
			lualine_x = {},
			lualine_y = {
				"encoding",
				function()
					return vim.lsp.get_active_clients()[1].name
				end,
			},
			lualine_z = { "progress", "location" },
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
