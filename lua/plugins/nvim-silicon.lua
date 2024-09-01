return {
	"michaelrommel/nvim-silicon",
	main = "nvim-silicon",
	cmd = "Silicon",
	keys = {
		{ mode = "v", "<leader>s",  desc = "Silicon" },
		{ mode = "v", "<leader>sc", function() require("nvim-silicon").clip() end,  desc = "Copy code screenshot to clipboard" },
		{ mode = "v", "<leader>sf", function() require("nvim-silicon").file() end,  desc = "Save code screenshot as file" },
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
