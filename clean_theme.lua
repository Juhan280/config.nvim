---[[
--- This file is for running nvim with only the tokyonight plugin
---]]

vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy/tokyonight.nvim")
---@diagnostic disable-next-line: missing-fields
require("tokyonight").load({
	style = "night",
	transparent = true,
	styles = {
		sidebars = "transparent",
		floats = "transparent",
	},
	on_colors = function(colors)
		-- The default comment is very hard to read
		colors.comment = "#8080c0"
	end
})
