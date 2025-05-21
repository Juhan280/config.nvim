---@module "which-key"
return { ---@type LazySpec
	"folke/which-key.nvim",
	event = "VeryLazy",
	cmd = "WhichKey",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {},
}
