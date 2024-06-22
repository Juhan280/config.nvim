-- mapleader is needed to be defined before anything else
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.cmd('echo "Installing `lazy.nvim`" | redraw')
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local opts = {
	defaults = { lazy = true },
	install = { colorscheme = { "night-owl" } },
	ui = { border = "rounded" },
	checker = { enabled = true, notify = false },
	change_detection = { notify = false },
}

require("lazy").setup("plugins", opts)
require("nvimrc")
