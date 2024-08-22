return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", opts = {} },
		"williamboman/mason-lspconfig.nvim",
		{ "nvimtools/none-ls.nvim",  config = function() require("null-ls-config") end },
		"Issafalcon/lsp-overloads.nvim",

		"folke/neoconf.nvim",
	},
	lazy = false,
	config = function()
		local lspconfig = require("lspconfig")
		local masonlsp = require("mason-lspconfig")
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

		require("lsp-on-attach")
		require("neoconf").setup()

		require('lspconfig.ui.windows').default_options.border = "rounded"
		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			border = "rounded",
		})

		masonlsp.setup()

		local set_servers = {}

		masonlsp.setup_handlers({
			function(server)
				lspconfig[server].setup({
					capabilities = capabilities,
				})

				set_servers[server] = 1
			end,
		})

		-- servers that are not installed by mason but exists in the PATH
		local servers = {
			clangd = {},
			gleam = {},
			lua_ls = {},
			rust_analyzer = {
				settings = {
					['rust-analyzer'] = {
						diagnostics = {
							experimental = {
								enable = true,
							}
						}
					}
				},
			},
		}

		for server_name, server in pairs(servers) do
			if set_servers[server_name] ~= nil then goto continue end

			server.capabilities = vim.tbl_deep_extend('force', capabilities, server.capabilities or {})
			lspconfig[server_name].setup(server)
			set_servers[server_name] = 1

			::continue::
		end
	end,
}
