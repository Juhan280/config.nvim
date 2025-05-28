return { ---@type LazySpec
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "mason-org/mason.nvim",           opts = {} },
		{ "mason-org/mason-lspconfig.nvim", opts = {} },
		{ "nvimtools/none-ls.nvim",         config = function() require("config.null-ls") end },
		"Issafalcon/lsp-overloads.nvim",

		"folke/neoconf.nvim",
		-- for json schema
		"b0o/schemastore.nvim",
	},
	lazy = false,
	config = function()
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		local ok, nvim_cmp = pcall(require, "cmp_nvim_lsp")
		if ok then
			capabilities = nvim_cmp.default_capabilities(capabilities)
		end

		require("config.lsp-attach")
		-- require("neoconf").setup()

		-- servers that are not installed by mason but exists in the PATH
		local servers = {
			"clangd",
			"gleam",
			"lua_ls",
			"nushell",
			"rust_analyzer",
			"taplo",
			"tinymist",
		}

		---@type { [string]: vim.lsp.Config }
		local configs = {
			["*"] = { capabilities = capabilities },
			jsonls = {
				settings = {
					json = {
						schemas = require('schemastore').json.schemas(),
						validate = { enable = true },
					},
				}
			},
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
			taplo = {
				root_dir = function(bufnr, on_dir)
					on_dir(vim.fs.root(bufnr, { '.git' }) or vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr)))
				end,
			},
			tinymist = {
				settings = {
					formatterMode = "typstyle",
				}
			},
		}

		for name, config in pairs(configs) do
			vim.lsp.config(name, config)
		end
		vim.lsp.enable(servers)
	end,
}
