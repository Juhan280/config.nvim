return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		local fortune = require("alpha.fortune")

		-- Set header
		dashboard.section.header.val = {
			"                                                     ",
			"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
			"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
			"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
			"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
			"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
			"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
			"                                                     ",
		}
		dashboard.section.header.opts.hl = "AlphaHeader"

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("e", "  > New file", ":ene<CR>"),
			dashboard.button("f", "󰈞  > Find file", ":Telescope find_files<CR>"),
			dashboard.button("r", "󰈢  > Recent", ":Telescope oldfiles<CR>"),
			dashboard.button("h", "󰋖  > Help", ":Telescope help_tags<CR>"),
			dashboard.button("l", "  > Open Lazy", ":Lazy<CR>"),
			dashboard.button("c", "  > Config", ":e $MYVIMRC | :cd %:p:h |  pwd<CR>"),
			dashboard.button("q", "󰈆  > Quit", ":qa<CR>"),
		}

		dashboard.section.footer.val = fortune()

		-- Send config to alpha
		alpha.setup(dashboard.opts)

		vim.api.nvim_create_autocmd("VimEnter", {
			once = true,
			callback = function()
				local fg_color = "#" .. string.format("%06x", math.random(0, 0xFFFFFF))
				vim.api.nvim_set_hl(0, "AlphaHeader", { fg = fg_color })
			end,
		})

		-- Disable folding on alpha buffer
		vim.cmd("autocmd FileType alpha setlocal nofoldenable")
	end,
}
