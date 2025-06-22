local function get_git_button(dashboard)
	local gitpath = vim.uv.cwd() .. "/.git"
	if (vim.uv or vim.loop).fs_stat(gitpath) then
		return dashboard.button("g", "󰊢  > Git", "<cmd>Neogit<CR>")
	end
end

return {
	"goolord/alpha-nvim",
	dependencies = {
		"echasnovski/mini.icons",
	},
	lazy = false,
	config = function()
		local dashboard = require("alpha.themes.dashboard")

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
			dashboard.button("e", "  > New file", "<cmd>ene<CR>"),
			dashboard.button("f", "󰈞  > Find file", "<cmd>Telescope find_files<CR>"),
			dashboard.button("r", "󰈢  > Recent", "<cmd>Telescope oldfiles<CR>"),
			get_git_button(dashboard),
			dashboard.button("h", "󰋖  > Help", "<cmd>Telescope help_tags<CR>"),
			dashboard.button("l", "  > Lazy", "<cmd>Lazy<CR>"),
			dashboard.button("c", "  > Config", "<cmd>e $MYVIMRC | cd %:p:h |  pwd<CR>"),
			dashboard.button("q", "󰈆  > Quit", "<cmd>qa<CR>"),
		}

		dashboard.section.footer.val = require("alpha.fortune")()

		-- Send config to alpha
		require("alpha").setup(dashboard.opts)

		local fg_color = "#" .. string.format("%06x", math.random(0, 0xFFFFFF))
		vim.api.nvim_set_hl(0, "AlphaHeader", { fg = fg_color })

		-- Disable folding on alpha buffer
		vim.cmd("autocmd FileType alpha setlocal nofoldenable")
	end,
}
