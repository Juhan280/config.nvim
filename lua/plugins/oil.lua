return { ---@type LazySpec
	'stevearc/oil.nvim',
	-- Optional dependencies
	dependencies = { "echasnovski/mini.icons" },
	lazy = false, -- required to open oil directly when passing a directory as the argument
	opts = {},
	keys = { { "<leader>fo", ":Oil<cr>", desc = "Open oil buffer" } }
}
