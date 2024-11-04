return { ---@type LazySpec
	'stevearc/oil.nvim',
	-- Optional dependencies
	dependencies = { "echasnovski/mini.icons" },
	cmd = "Oil",
	keys = { { "<leader>fo", desc = "Open oil buffer" } },
	config = function()
		require("oil").setup()
		vim.keymap.set("n", "<leader>fo", ":Oil<cr>", { desc = "Open oil buffer" })
	end
}
