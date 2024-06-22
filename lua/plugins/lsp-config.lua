local on_attach = require("lsp-on-attach")

return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		{ "williamboman/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
		{ "nvimtools/none-ls.nvim", config = function() require("null-ls-config") end },
		"Issafalcon/lsp-overloads.nvim",

		"folke/neoconf.nvim",
	},
	lazy = false,
	config = function()
		local lspconfig = require("lspconfig")
		local masonlsp = require("mason-lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		require("neoconf").setup()

		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			border = "rounded",
		})

		masonlsp.setup()

		local set_servers = {}

		masonlsp.setup_handlers({
			function(server)
				lspconfig[server].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})

				set_servers[server] = 1
			end,
		})

		-- servers that are not installed by mason but exists in the PATH
		local servers = {
			"clangd",
			"gleam",
			"lua_ls",
			-- "rust_analyzer",
		}

		lspconfig.rust_analyzer.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				['rust-analyzer'] = {
					diagnostics = {
						experimental = {
							enable = true,
						}
					}
				}
			},
		})

		for _, server in ipairs(servers) do
			if set_servers[server] ~= nil then goto continue end

			lspconfig[server].setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			set_servers[server] = 1

			::continue::
		end
	end,
}
