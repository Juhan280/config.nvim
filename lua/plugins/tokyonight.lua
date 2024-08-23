return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("tokyonight").setup({
			style = "night",
			transparent = not vim.os.isAndroid(),
			styles = {
				comments = { italic = not vim.os.isAndroid() },
				keywords = { italic = not vim.os.isAndroid() },
				sidebars = vim.os.isAndroid() and "dark" or "transparent",
				floats = vim.os.isAndroid() and "dark" or "transparent",
			},
		})
		vim.cmd.colorscheme("tokyonight")
	end,
}
