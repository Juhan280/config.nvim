return { ---@type LazySpec
	'saghen/blink.cmp',
	dependencies = { 'rafamadriz/friendly-snippets' },
	event = { "InsertEnter" },

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = { preset = 'default' },

		appearance = { nerd_font_variant = 'mono' },

		completion = {
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 500,
			},
			menu = {
				draw = {
					columns = {
						{ "kind_icon" },
						{ "label",      "label_description" },
						{ "source_name" }
					},
				}
			},
			ghost_text = { enabled = true }
		},
		signature = { enabled = true },

		sources = {
			default = { 'lsp', 'path', 'snippets', 'buffer' },
			per_filetype = {
				lua = { inherit_defaults = true, "lazydev" }
			},
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
			},
		},

		fuzzy = {
			implementation = "prefer_rust_with_warning",
			sorts = {
				function(a, b)
					if (a.label:sub(1, 1) == "_") ~= (b.label:sub(1, 1) == "_") then
						-- return true to sort `a` after `b`, and vice versa
						return not a.label:sub(1, 1) == "_"
					end
					-- nothing returned, fallback to the next sort
				end,
				"score",
				"sort_text",
			},
		}
	},
	opts_extend = { "sources.default" }
}
