return {
	"norcalli/nvim-colorizer.lua",
	event = "VeryLazy",
	config = function()
		require("colorizer").setup()
		vim.api.nvim_command("ColorizerToggle")
	end,
}
