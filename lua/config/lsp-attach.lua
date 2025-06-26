vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),

	callback = function(event)
		local client = vim.lsp.get_client_by_id(event.data.client_id)

		--- Helper function
		--- @param lhs string
		--- @param rhs string|function
		--- @param desc string
		local function nmap(lhs, rhs, desc)
			vim.keymap.set("n", lhs, rhs, { buffer = event.buf, desc = "LSP " .. desc })
		end

		-- Guard against servers without the signatureHelper capability
		if client and client.server_capabilities.signatureHelpProvider then
			---@diagnostic disable-next-line: missing-fields
			require("lsp-overloads").setup(client, {})
		end

		nmap("K", function()
			vim.lsp.buf.hover({ title = "Hover" })
		end, "Show Documentation")
		nmap("gd", vim.lsp.buf.definition, "Go to Definition")
		nmap("gD", vim.lsp.buf.declaration, "Go to Declaration")
		nmap("<leader>gtd", ":Telescope lsp_type_definitions<CR>", "Go to Type Definition")
		nmap("grr", ":Telescope lsp_references<CR>", "Show references")
		nmap("<leader>ls", ":Telescope lsp_document_symbols<CR>", "Show Document Symbols")
		nmap("<leader>ld", ":Telescope diagnostics<CR>", "Document Diagnostic")
		nmap("<leader>le", vim.diagnostic.open_float, "Floating diagnostics")

		-- nmap("<leader>lf", function()
		-- 	vim.lsp.buf.format({ async = true })
		-- end, "Formatting")
	end
})
