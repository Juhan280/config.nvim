-- Install folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.api.nvim_echo({ { "Installing `lazy.nvim`...", "MoreMsg" } }, true, {})
	local out = vim.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	}):wait()

	if out.code ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out.stderr, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Allow differentiating between android and other os because
-- termux doesn't support some features
vim.os = { name = "" }
local f = io.popen("uname -o", "r")
if f then
	local output = f:read("*a")
	f:close()
	if output then
		vim.os.name = output:sub(1, -2)
	end
end
function vim.os:isAndroid()
	return self.name == "Android"
end
