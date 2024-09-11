return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
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
					},
				},
				swap = {
					enable = true,
					swap_next = {
						["<leader>la"] = "@parameter.inner",
					},
					swap_previous = {
						["<leader>lA"] = "@parameter.inner",
					},
				},
			},

		})
	end,
}
