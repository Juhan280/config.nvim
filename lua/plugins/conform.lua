return { ---@type LazySpec
	"stevearc/conform.nvim",
	event = "BufWritePre",
	cmd = "ConformInfo",
	keys = {
		{
			"<leader>lf",
			function()
				require("conform").format({ async = true }, function(err)
					if not err then
						local mode = vim.api.nvim_get_mode().mode
						if vim.startswith(string.lower(mode), "v") then
							-- Escape to normal mode after formatting in visual mode
							vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
						end
					end
				end)
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
	---@module 'conform'
	---@type conform.setupOpts
	opts = {
		default_format_opts = { lsp_format = "fallback" },
		formatters_by_ft = { lua = { "stylua" } },
		format_on_save = { timeout_ms = 500 },
	},
}
