local plugin = {
	"folke/which-key.nvim",
	keys = {
		"<leader>",
		"<c-r>",
		"<c-w>",
		-- '"',
		"'",
		"`",
		"c",
		"v",
		"g",
	},
	cmd = "WhichKey",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		plugins = { registers = not vim.os.isAndroid() },
	},
}

if not vim.os.isAndroid() then
	table.insert(plugin.keys, '"')
end

return plugin
