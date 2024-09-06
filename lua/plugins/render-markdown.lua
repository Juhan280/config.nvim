return { --- @type LazySpec
	"MeanderingProgrammer/render-markdown.nvim",
	version = "*",
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- Mandatory
		"nvim-tree/nvim-web-devicons",   -- Optional but recommended
	},
	cmd = "RenderMarkdown",
	ft = { "markdown", "gitcommit" },
	opts = { ---@type render.md.UserConfig
		file_types = { "markdown", "gitcommit" },
		preset = "lazy",
	},
}
