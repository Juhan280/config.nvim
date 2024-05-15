return {
	"nvimtools/none-ls.nvim",
	keys = { { "<leader>fm", vim.lsp.buf.format, desc = "Format Code" } },
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
			},
		})
	end,
}
