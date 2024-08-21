return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			style = "night",
			transparent = false,
			styles = {
				comments = { italic = not vim.os.isAndroid() },
				keywords = { italic = not vim.os.isAndroid() },
			},
		})
		vim.cmd.colorscheme("tokyonight")
	end,
}
