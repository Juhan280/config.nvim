return { ---@type LazySpec
	"numToStr/Comment.nvim",
	version = false,
	keys = {
		{ "gcc", mode = "n", desc = "Toggle comment line" },
		{ "gc", mode = { "n", "o" }, desc = "Toggle comment linewise" },
		{ "gc", mode = "x", desc = "Toggle comment linewise (visual)" },
		{ "gbc", mode = "n", desc = "Toggle comment block" },
		{ "gb", mode = { "n", "o" }, desc = "Toggle comment blockwise" },
		{ "gb", mode = "x", desc = "Toggle comment blockwise (visual)" },
	},
	opts = {},
}
