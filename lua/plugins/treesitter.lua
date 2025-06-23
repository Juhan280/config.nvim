return { ---@type LazySpec
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		version = false,
		lazy = false,
		build = ":TSUpdate",
		config = function()
			-- Auto install logic
			local nvim_treesitter = require("nvim-treesitter")
			local available = nvim_treesitter.get_available()
			local function try_install_curr_lang()
				local installed = nvim_treesitter.get_installed()
				local lang = vim.bo.filetype
				if vim.tbl_contains(available, lang) and not vim.tbl_contains(installed, lang) then
					nvim_treesitter.install(lang):await(function()
						vim.notify(string.format("Installed treesitter '%s' parser", lang), vim.log.levels.INFO)
						vim.treesitter.start(0, lang)
					end)
				end
			end

			try_install_curr_lang()

			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "*" },
				group = vim.api.nvim_create_augroup("NvimTreesitter-auto_install", { clear = true }),
				callback = try_install_curr_lang,
			})

			-- Enable treesitter based indentation
			vim.o.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		event = "InsertEnter",
		config = function()
			require("nvim-treesitter-textobjects").setup({
				select = {
					lookahead = true,
				},
			})

			---@param lhs string
			---@param query_string string
			---@param desc string?
			local function mapxo(lhs, query_string, desc)
				vim.keymap.set({ "x", "o" }, lhs, function()
					require("nvim-treesitter-textobjects.select")
							.select_textobject(query_string, "textobjects")
				end, { desc = desc })
			end

			mapxo("af", "@function.outer", "around function")
			mapxo("if", "@function.inner", "inside function")
			mapxo("ac", "@class.outer", "around class region")
			mapxo("ic", "@class.inner", "inside class region")
			mapxo("aP", "@parameter.outer", "around parameter")
			mapxo("iP", "@parameter.inner", "inside parameter")
		end
	}
}
