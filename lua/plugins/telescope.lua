return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"BurntSushi/ripgrep",
		"nvim-telescope/telescope-ui-select.nvim",
	},
	cmd = "Telescope",
	keys = {
		{ "<leader>ff", desc = "Find File" },
		{ "<leader>fr", desc = "Find Recent Files" },
		{ "<leader>fg", desc = "Live Grep" },
		{ "<leader>fb", desc = "Find Buffer" },
		{ "<leader>fz", desc = "Find in current buffer" },
		{ "<leader>fh", desc = "Find Help" },
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")

		telescope.setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
			},
		})

		vim.keymap.set("n", "<leader>ff", builtin.find_files)
		vim.keymap.set("n", "<leader>fr", builtin.oldfiles)
		vim.keymap.set("n", "<leader>fg", builtin.live_grep)
		vim.keymap.set("n", "<leader>fb", builtin.buffers)
		vim.keymap.set("n", "<leader>fz", builtin.current_buffer_fuzzy_find)
		vim.keymap.set("n", "<leader>fh", builtin.help_tags)

		telescope.load_extension("ui-select")
	end,
}
