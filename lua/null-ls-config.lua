local null_ls = require("null-ls")
local b = null_ls.builtins

null_ls.setup({
	sources = {
		b.code_actions.proselint,
		b.diagnostics.proselint,
		-- b.formatting.stylua,
		-- b.formatting.shfmt,
	},
})
