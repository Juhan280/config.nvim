return { ---@type LazySpec
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"Issafalcon/lsp-overloads.nvim",

			-- for json schema
			"b0o/schemastore.nvim",
		},
		lazy = false,
		config = function()
			require("config.lsp-attach")

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
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig"
		},
		event = "VeryLazy",
		opts = {}
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		cond = function()
			return vim.fs.root(0, ".luarc.json") == nil
		end,
		opts = {
			library = {
				"lazy.nvim",
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"nvimtools/none-ls.nvim",
		cond = false,
		config = function()
			local null_ls = require("null-ls")
			local b = null_ls.builtins

			null_ls.setup({
				sources = {
					-- b.formatting.stylua,
					-- b.formatting.shfmt,
				},
			})
		end
	},
}
