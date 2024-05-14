return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = true,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = true,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local lspconfig = require'lspconfig'
			-- local capabilities = require('cmp_nvim_lsp').default_capabilities()

			local servers = {"lua_ls"}

			for _, lsp in ipairs(servers) do
				lspconfig[lsp].setup {
					-- on_attach = on_attach,
					-- capabilities = capabilities,
				}
			end

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
