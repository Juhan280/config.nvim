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
				comments = { italic = not vim.os:isAndroid() },
				keywords = { italic = not vim.os:isAndroid() },
				sidebars = "transparent",
				floats = "transparent",
			},
			on_colors = function(colors)
				-- The default comment is very hard to read
				colors.comment = "#8080c0"
			end,
			on_highlights = function(highlights, colors)
				highlights.LineNr = { fg = colors.comment }
				highlights.LineNrAbove = "LineNr"
				highlights.LineNrBelow = "LineNr"
			end,
		})
		vim.cmd.colorscheme("tokyonight")
	end,
}
