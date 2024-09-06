return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"echasnovski/mini.icons",
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	keys = {
		{ "<C-n>",     ":Neotree position=right toggle reveal<CR>", desc = "Neotree toggle" },
		{ "<leader>e", ":Neotree position=right focus reveal<CR>",  desc = "Neotree focud" },
	},
	opts = {},
}
