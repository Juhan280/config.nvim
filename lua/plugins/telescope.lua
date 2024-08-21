local keybinds = {
	{ "<leader>ff", "find_files",                desc = "Find files" },
	{ "<leader>fr", "oldfiles",                  desc = "Find recent files" },
	{ "<leader>fg", "live_grep",                 desc = "Live grep" },
	{ "<leader>fb", "buffers",                   desc = "Find buffer" },
	{ "<leader>fz", "current_buffer_fuzzy_find", desc = "Find in files" },
	{ "<leader>fh", "help_tags",                 desc = "Find help" },
}

return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"BurntSushi/ripgrep",
		"nvim-telescope/telescope-ui-select.nvim",
	},
	cmd = "Telescope",
	keys = keybinds,
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

		for _, keybind in ipairs(keybinds) do
			vim.keymap.set("n", keybind[1], builtin[keybind[2]], { desc = keybind.desc })
		end

		telescope.load_extension("ui-select")
	end,
}
