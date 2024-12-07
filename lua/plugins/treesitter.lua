---@module "nvim-treesitter"
return { ---@type LazySpec
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		-- Plugin for `textobjects`
		"nvim-treesitter/nvim-treesitter-textobjects"
	},
	main = "nvim-treesitter.configs",
	version = false,
	lazy = false,
	build = ":TSUpdate",
	---@diagnostic disable-next-line: missing-fields
	opts = { ---@type TSConfig
		auto_install = true,
		highlight = { enable = true },
		indent = { enable = true },
		textobjects = {
			select = {
				enable = true,
				lookahead = true,

				keymaps = {
					af = { query = "@function.outer", desc = "around function" },
					["if"] = { query = "@function.inner", desc = "inside function" },
					ac = { query = "@class.outer", desc = "around class region" },
					ic = { query = "@class.inner", desc = "inside class region" },
					aP = { query = "@parameter.outer", desc = "around parameter" },
					iP = { query = "@parameter.inner", desc = "inside parameter" },
				},
			},
		},
	}
}
