-- Use rounded border for floating preview by defaulr
local _ofp = vim.lsp.util.open_floating_preview
vim.lsp.util.open_floating_preview = function(contents, syntax, opts)
	opts = opts or {}
	opts.border = opts.border or "rounded"
	return _ofp(contents, syntax, opts)
end
