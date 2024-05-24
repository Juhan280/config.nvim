return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	event = "VeryLazy",
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
				{
					require("lazy.status").updates,
					cond = require("lazy.status").has_updates,
					color = { fg = "#ff9e64" },
				},
				{
					function()
						local lsp_progress = vim.lsp.util.get_progress_messages()[1]

						if lsp_progress.percentage == nil then
							return "(LSP) " .. lsp_progress.title
						else
							return "(LSP) "
									.. lsp_progress.title
									.. " ("
									.. lsp_progress.percentage
									.. "/100): "
									.. lsp_progress.message
						end
					end,
					cond = function()
						return vim.lsp.util.get_progress_messages()[1] ~= nil
					end,
					color = { bg = "#8E5249" },
				},
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
