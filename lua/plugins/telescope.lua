local keybinds = {
	{ "<leader>f",  desc = "Telescope" },
	{ "<leader>ff", "find_files",                desc = "Find files" },
	{ "<leader>fr", "oldfiles",                  desc = "Find recent files" },
	{ "<leader>fg", "live_grep",                 desc = "Live grep" },
	{ "<leader>fb", "buffers",                   desc = "Find buffer" },
	{ "<leader>fz", "current_buffer_fuzzy_find", desc = "Find in files" },
	{ "<leader>fh", "help_tags",                 desc = "Find help" },
}

return { ---@type LazySpec
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"BurntSushi/ripgrep",
		"nvim-telescope/telescope-symbols.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	cmd = "Telescope",
	keys = keybinds,
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")

		telescope.setup({})
		telescope.load_extension('fzf')

		for _, keybind in ipairs(keybinds) do
			local rhs = builtin[keybind[2]]
			if rhs ~= nil then
				vim.keymap.set("n", keybind[1], rhs, { desc = keybind.desc })
			end
		end
	end,
}
