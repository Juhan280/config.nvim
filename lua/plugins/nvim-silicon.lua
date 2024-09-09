---@param clip boolean
local function silicon_file_range(clip)
	local old_func = vim.go.operatorfunc -- backup previous reference
	-- set a globally callable object/function
	_G.op_func_silicon = function()
		local start = vim.api.nvim_buf_get_mark(0, '[')[1]
		local finish = vim.api.nvim_buf_get_mark(0, ']')[1]

		local silicon = require("nvim-silicon")
		-- make a deep copy of the original options
		local options = vim.tbl_deep_extend("force", silicon.options, {})
		if clip then
			options.to_clipboard = true
			options.output = nil
		end

		silicon.start({ line1 = start, line2 = finish, range = 1 }, options)
		vim.go.operatorfunc = old_func -- restore previous opfunc
		_G.op_func_silicon = nil     -- deletes itself from global namespace
	end

	vim.go.operatorfunc = 'v:lua.op_func_silicon'
	vim.api.nvim_feedkeys('g@', 'n', false)
end

return {
	"michaelrommel/nvim-silicon",
	main = "nvim-silicon",
	cmd = "Silicon",
	keys = {
		{ mode = "v", "<leader>sc", function() require("nvim-silicon").clip() end, desc = "Copy code screenshot to clipboard" },
		{ mode = "v", "<leader>sf", function() require("nvim-silicon").file() end, desc = "Save code screenshot as file" },
		{ mode = "n", "<leader>sc", function() silicon_file_range(true) end,       desc = "Copy code screenshot to clipboard" },
		{ mode = "n", "<leader>sf", function() silicon_file_range(false) end,      desc = "Save code screenshot as file" },
	},
	opts = {
		font = "Inconsolata Nerd Font Mono",
		theme = vim.fn.stdpath("data") .. "/lazy/tokyonight.nvim/extras/sublime/tokyonight_night.tmTheme",
		-- Configuration here, or leave empty to use defaults
		line_offset = function(args)
			return args.line1
		end,
		window_title = function()
			return vim.fn.fnamemodify(
				vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()),
				":t"
			)
		end,
	}
}
