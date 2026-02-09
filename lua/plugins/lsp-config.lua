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

			---@type { [string]: vim.lsp.Config }
			local configs = {
				jsonls = {
					settings = {
						json = {
							schemas = require("schemastore").json.schemas(),
							validate = { enable = true },
						},
					},
				},
				rust_analyzer = {
					settings = {
						["rust-analyzer"] = {
							diagnostics = {
								experimental = {
									enable = true,
								},
							},
						},
					},
				},
				taplo = {
					root_dir = function(bufnr, on_dir)
						on_dir(vim.fs.root(bufnr, { ".git" }) or vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr)))
					end,
				},
				tinymist = {
					settings = {
						formatterMode = "typstyle",
					},
				},
				ts_ls = {
					-- do not attach ts_ls in a deno project
					root_dir = function(bufnr, on_dir)
						local root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" }
						local root_dir = vim.fs.root(bufnr, root_markers)
						if not root_dir then
							return
						end
						local bad_dir = vim.fs.root(bufnr, { "deno.json", "deno.jsonc" })
						if bad_dir and bad_dir:match("^" .. root_dir) then
							return
						end
						on_dir(root_dir)
					end,
				},
				denols = {
					root_markers = { { "deno.json", "deno.jsonc" }, ".git" },
					-- do not run in single file mode
					workspace_required = true,
				},
			}

			for name, config in pairs(configs) do
				vim.lsp.config(name, config)
			end

			vim.lsp.enable({
				"clangd",
				"denols",
				"lua_ls",
				"nushell",
				"rust_analyzer",
				"taplo",
				-- "tinymist",
			})

			-- Setup `termux-language-server`
			vim.api.nvim_create_autocmd({ "BufEnter" }, {
				pattern = {
					"build.sh",
					"*.subpackage.sh",
					"PKGBUILD",
					"*.install",
					"makepkg.conf",
					"*.ebuild",
					"*.eclass",
					"color.map",
					"make.conf",
				},
				callback = function()
					vim.lsp.start({
						name = "termux",
						cmd = { "termux-language-server" },
					})
				end,
			})
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		event = "VeryLazy",
		opts = {},
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			enabled = function(root_dir)
				return not vim.uv.fs_stat(root_dir .. "/.luarc.json")
			end,
			library = {
				"lazy.nvim",
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
}
