return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("tokyonight").setup({
			style = "night",
			transparent = true,
			styles = {
				comments = { italic = not vim.os.isAndroid() },
				keywords = { italic = not vim.os.isAndroid() },
				sidebars = "transparent",
				floats = "transparent",
			},
		})
		vim.cmd.colorscheme("tokyonight")
	end,
}
