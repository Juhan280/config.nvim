---@module "render-markdown"
return { ---@type LazySpec
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"echasnovski/mini.icons",
	},
	cmd = "RenderMarkdown",
	ft = { "markdown", "gitcommit" },
	opts = { ---@type render.md.UserConfig
		file_types = { "markdown", "gitcommit" },
		preset = "lazy",
	},
}
