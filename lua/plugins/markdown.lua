return { --- @type LazySpec
	"MeanderingProgrammer/markdown.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- Mandatory
		"nvim-tree/nvim-web-devicons",   -- Optional but recommended
	},
	ft = "markdown",
	opts = { ---@type render.md.UserConfig
		code = {
			left_pad = 1,
		},
	},
}
