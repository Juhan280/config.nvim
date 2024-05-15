return {
	"nvimtools/none-ls.nvim",
	keys = { "<leader>fm" },
	config = function()
		local null_ls = require("null-ls")
		local wk = require("which-key")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
			},
		})

		wk.register({
			["<leader>fm"] = { vim.lsp.buf.format, "Format Code" },
		})
	end,
}
