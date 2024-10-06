return { --- @type LazySpec
	"hrsh7th/nvim-cmp",
	version = false,
	dependencies = {
		"onsails/lspkind.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",

		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",

		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
					{ path = "luvit-meta/library", words = { "vim%.uv" } },
				},
			},
		},
		"Bilal2453/luvit-meta",

	},
	event = { "InsertEnter" },
	config = function()
		local cmp = require("cmp")
		local ls = require("luasnip")
		local lspkind = require("lspkind")
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			snippet = {
				expand = function(args)
					ls.lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				-- Select the [n]ext item
				['<C-n>'] = cmp.mapping.select_next_item(),
				-- Select the [p]revious item
				['<C-p>'] = cmp.mapping.select_prev_item(),

				-- Scroll the documentation window [b]ack / [f]orward
				['<C-b>'] = cmp.mapping.scroll_docs(-4),
				['<C-f>'] = cmp.mapping.scroll_docs(4),

				-- Manually trigger a completion from nvim-cmp.
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<Tab>"] = cmp.mapping.confirm({ select = true }),

				-- <c-l> will move you to the right of each of the expansion locations.
				-- <c-h> is similar, except moving you backwards.
				['<C-l>'] = cmp.mapping(function()
					if ls.locally_jumpable() then
						ls.jump(1)
					end
				end, { 'i', 's' }),
				['<C-h>'] = cmp.mapping(function()
					if ls.locally_jumpable(-1) then
						ls.jump(-1)
					end
				end, { 'i', 's' }),

			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "path" },
				{ name = "luasnip" },
			}, {
				{ name = "buffer", keyword_length = 3 },
			}),
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol_text",
					-- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
					maxwidth = function()
						return math.floor(0.45 * vim.o.columns)
					end,
					ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
					show_labelDetails = true, -- show labelDetails in menu. Disabled by default

					-- The function below will be called before any actual modifications from lspkind
					-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
					--[[ before = function(entry, vim_item)
						-- ...
						return vim_item
					end, ]]
				}),
				expandable_indicator = true,
				fields = { "abbr", "kind", "menu" },
			},
		})

		ls.config.set_config({
			history = false,
			updateevents = "TextChanged,TextChangedI",
		})
	end,
}
