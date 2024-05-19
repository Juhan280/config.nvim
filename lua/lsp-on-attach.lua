return function(client, bufnr)
	local opts = { buffer = bufnr }

	--- Guard against servers without the signatureHelper capability
	if client.server_capabilities.signatureHelpProvider then
		require("lsp-overloads").setup(client, {})
	end

	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<A-k>", vim.lsp.buf.signature_help, opts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "<leader>lf", function()
		vim.diagnostic.open_float({ border = "rounded" })
	end, opts)
	vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "<leader>ca", function()
		vim.api.nvim_command("Lazy load telescope.nvim")
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>dl", ":TroubleToggle document_diagnostics<CR>", {})

	vim.keymap.set("n", "<leader>fm", function()
		vim.lsp.buf.format({ async = true })
	end, { desc = "LSP Formatting" })

end
