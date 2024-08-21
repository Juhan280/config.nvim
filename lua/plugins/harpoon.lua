local keybinds = {
	{ "<leader>a",  function(h) h:list():add() end,     desc = "Harpoon add file" },
	{
		"<C-e>",
		function(h) h.ui:toggle_quick_menu(h:list()) end,
		desc = "Harpoon quick menu"
	},

	{ "<leader>hh", function(h) h:list():select(1) end, desc = "buffer h" },
	{ "<leader>hj", function(h) h:list():select(2) end, desc = "buffer j" },
	{ "<leader>hk", function(h) h:list():select(3) end, desc = "buffer k" },
	{ "<leader>hl", function(h) h:list():select(4) end, desc = "buffer l" },
}

return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = keybinds,
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		for _, keybind in ipairs(keybinds) do
			vim.keymap.set("n", keybind[1], function()
				keybind[2](harpoon)
			end, { desc = keybind.desc })
		end
	end
}
