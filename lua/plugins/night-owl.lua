return {
	"oxfist/night-owl.nvim",
	lazy = false,
	name = "night-owl",
	priority = 1000,
	config = function()
		require("night-owl").setup({ italics = false })
		vim.cmd.colorscheme("night-owl")

		vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#c792ea" })
	end,
}
