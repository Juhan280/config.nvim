local keybinds = {
	{ "<leader>a", function() require("harpoon"):list():add() end, desc = "Harpoon add file" },
	{ "<leader>h", desc = "Harpoon" },
	{
		"<leader>hg",
		function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end,
		desc = "Harpoon quick menu"
	},

	{ "<leader>hh", function() require("harpoon"):list():select(1) end, desc = "buffer h" },
	{ "<leader>hj", function() require("harpoon"):list():select(2) end, desc = "buffer j" },
	{ "<leader>hk", function() require("harpoon"):list():select(3) end, desc = "buffer k" },
	{ "<leader>hl", function() require("harpoon"):list():select(4) end, desc = "buffer l" },
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
			if keybind[2] ~= nil then
				vim.keymap.set("n", keybind[1], keybind[2], { desc = keybind.desc })
			end
		end
	end
}
