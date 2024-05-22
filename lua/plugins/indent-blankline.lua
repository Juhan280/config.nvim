return {
	"lukas-reineke/indent-blankline.nvim",
	event = "VeryLazy",
	config = function()
		local ilb = require("ibl")
		ilb.setup()
	end,
}
