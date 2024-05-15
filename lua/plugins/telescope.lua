return {
	{ "nvim-telescope/telescope-ui-select.nvim" },
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"BurntSushi/ripgrep",
		},
		keys = {
			"<leader>ff",
			"<leader>fr",
			"<leader>fg",
			"<leader>fb",
			"<leader>fh",
		},
		config = function()
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")
			local wk = require("which-key")

			telescope.setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})

			wk.register({
				["<leader>f"] = {
					f = { builtin.find_files, "Find File" },
					r = { builtin.oldfiles, "Open Recent File" },
					g = { builtin.live_grep, "Live Grep" },
					b = { builtin.buffers, "Find Buffer" },
					h = { builtin.help_tags, "Find Help" },
				},
			})

			telescope.load_extension("ui-select")
		end,
	},
}
