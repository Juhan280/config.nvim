return { ---@type LazySpec
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"nvim-telescope/telescope.nvim",
		},
		version = false,
		cmd = "Neogit",
		opts = {},
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		opts = { current_line_blame = true },
	},
	{
		"akinsho/git-conflict.nvim",
		version = false, -- TODO: remove it when v>2.1.0 is dropped
		event = "VeryLazy",
		---@module "git-conflict"
		---@type GitConflictUserConfig
		opts = {
			default_commands = false,
		}
	},
}
