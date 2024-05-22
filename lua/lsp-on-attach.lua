--- Generate optionsbfor keymap
--- @param bufnr number
--- @param desc string
--- @return table
local function gen_opts(bufnr, desc)
	return { buffer = bufnr, desc = desc }
end

return function(client, bufnr)
	--- Guard against servers without the signatureHelper capability
	if client.server_capabilities.signatureHelpProvider then
		require("lsp-overloads").setup(client, {})
	end

	vim.keymap.set("n", "K", vim.lsp.buf.hover, gen_opts(bufnr, "Show Documentation"))
	vim.keymap.set("n", "<A-k>", vim.lsp.buf.signature_help, gen_opts(bufnr, "Signature help"))
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, gen_opts(bufnr, "LSP Rename"))
	vim.keymap.set("n", "<leader>lf", function()
		vim.diagnostic.open_float({ border = "rounded" })
	end, gen_opts(bufnr, "Floating diagnostics"))
	vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, gen_opts(bufnr, "Go to definition"))
	vim.keymap.set(
		"n",
		"<leader>gtd",
		":TroubleToggle lsp_type_definitions<CR>",
		gen_opts(bufnr, "Go to type definition")
	)
	vim.keymap.set("n", "<leader>gr", ":TroubleToggle lsp_references<CR>", gen_opts(bufnr, "Show references"))
	vim.keymap.set("n", "<leader>ca", function()
		vim.api.nvim_command("Lazy load telescope.nvim")
		vim.lsp.buf.code_action()
	end, gen_opts(bufnr, "LSP Code Action"))
	vim.keymap.set("n", "<leader>dl", ":TroubleToggle document_diagnostics<CR>", gen_opts(bufnr, "Document diagnostic"))
	vim.keymap.set(
		"n",
		"<leader>dwl",
		":TroubleToggle workspace_diagnostics<CR>",
		gen_opts(bufnr, "Workspace diagnostic")
	)

	vim.keymap.set("n", "<leader>fm", function()
		vim.lsp.buf.format({ async = true })
	end, { desc = "LSP Formatting" })
end
