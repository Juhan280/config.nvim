local lsp_config = vim.lsp.config

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

			lsp_config("jsonls", {
				settings = {
					json = {
						schemas = require("schemastore").json.schemas(),
						validate = { enable = true },
					},
				},
			})

			local handle = io.popen("cargo ndk-env --json")
			local cargo_ndk_env = {}
			if handle then
				local output = handle:read("*a")
				handle:close()
				cargo_ndk_env = vim.json.decode(output)
			else
				vim.notify("Failed to run 'cargo ndk-env'. Is cargo-ndk installed and in PATH?", vim.log.levels.ERROR)
			end

			lsp_config("rust_analyzer", {
				settings = {
					["rust-analyzer"] = {
						diagnostics = {
							experimental = {
								enable = true,
							},
						},
						cargoEnv = cargo_ndk_env
					},
				},
			})

			lsp_config("taplo", {
				root_dir = function(bufnr, on_dir)
					on_dir(vim.fs.root(bufnr, { ".git" }) or vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr)))
				end,
			})

			lsp_config("tinymist", {
				settings = {
					formatterMode = "typstyle",
				},
			})

			lsp_config("ts_ls", {
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
			})

			lsp_config("denols", {
				root_markers = { { "deno.json", "deno.jsonc" }, ".git" },
				-- do not run in single file mode
				workspace_required = true,
			})

			vim.lsp.enable({
				"clangd",
				"denols",
				"lua_ls",
				"nushell",
				"taplo",
				-- "tinymist",
			})

			if not vim.os:isAndroid() then
				vim.lsp.enable("rust_analyzer")
			end

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
