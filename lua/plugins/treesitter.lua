return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
	version = false,
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		---@diagnostic disable-next-line: missing-fields
		config.setup({
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
			textobjects = {
				select = {
					enable = true,
					lookahead = true,

					keymaps = {
						["af"] = { query = "@function.outer", desc = "around function" },
						["if"] = { query = "@function.inner", desc = "inside function" },
						["ac"] = { query = "@class.outer", desc = "around class region" },
						["ic"] = { query = "@class.inner", desc = "inside class region" },
						["aP"] = { query = "@parameter.outer", desc = "around parameter" },
						["iP"] = { query = "@parameter.inner", desc = "inside parameter" },
					},
				},
			},
		})
	end,
}
