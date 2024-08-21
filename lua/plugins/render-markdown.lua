return { --- @type LazySpec
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- Mandatory
		"nvim-tree/nvim-web-devicons",   -- Optional but recommended
	},
	ft = "markdown",
	opts = { ---@type render.md.UserConfig
		preset = "lazy",
	},
}
