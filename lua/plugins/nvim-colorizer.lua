return {
	"norcalli/nvim-colorizer.lua",
	event = "VeryLazy",
	config = function()
		require("colorizer").setup({ "*", "!lazy" })
		vim.api.nvim_command("ColorizerToggle")
	end,
}
