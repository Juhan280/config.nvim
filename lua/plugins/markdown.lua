return { --- @type LazySpec
	"MeanderingProgrammer/markdown.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- Mandatory
		"nvim-tree/nvim-web-devicons", -- Optional but recommended
	},
	ft = "markdown",
	opts = {
		latex_enabled = true
	},
}
