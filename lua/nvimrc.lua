-- Row number setting
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- Tab setting
vim.opt.tabstop = 2
vim.opt.shiftwidth = 0   -- when set to zero, it uses 'tabstop' value
vim.opt.softtabstop = -1 -- when it is negative, it follows 'shiftwidth'
vim.opt.expandtab = false

-- wraping and scrolling
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 5

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Allow insensitive tab completion in command mode
vim.opt.ignorecase = true

-- Check spelling in comments other places
vim.opt.spell = true
vim.api.nvim_create_autocmd("FileType", {
	desc = "Disable spell in certain filetypes",
	pattern = "man",
	command = "setlocal nospell"
})

-- Diagnostic Signs
local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Folds
vim.opt.foldlevelstart = 5
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
vim.opt.whichwrap:append("<>[]hl")

-- Keymaps
vim.keymap.set("n", "<Esc>", ":noh<CR>", { silent = true })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = 'Exit terminal mode' })
-- textobject to select entire buffer
vim.keymap.set({ "o", "x" }, "gG", function()
	vim.api.nvim_win_set_cursor(0, { 1, 0 })
	if not (vim.fn.mode():find("V")) then vim.cmd.normal { "V", bang = true } end
	vim.cmd.normal { "o", bang = true }
	vim.api.nvim_win_set_cursor(0, { vim.fn.line("$"), 0 })
end, { desc = "entire buffer" })

-- For some reason tabstop is set back to 8 in gitcommit filetype
vim.api.nvim_create_autocmd("FileType", {
	desc = "Set tabstop to 2",
	once = true,
	pattern = "gitcommit",
	command = "setlocal tabstop=2"
})

-- highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-on-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end
})

---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
local progress = vim.defaulttable()
vim.api.nvim_create_autocmd("LspProgress", {
	---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		local value = ev.data.params
		.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
		if not client or type(value) ~= "table" then
			return
		end
		local p = progress[client.id]

		for i = 1, #p + 1 do
			if i == #p + 1 or p[i].token == ev.data.params.token then
				p[i] = {
					token = ev.data.params.token,
					msg = ("[%3d%%] %s%s"):format(
						value.kind == "end" and 100 or value.percentage or 100,
						value.title or "",
						value.message and (" **%s**"):format(value.message) or ""
					),
					done = value.kind == "end",
				}
				break
			end
		end

		local msg = {} ---@type string[]
		progress[client.id] = vim.tbl_filter(function(v)
			return table.insert(msg, v.msg) or not v.done
		end, p)

		local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
		vim.notify(table.concat(msg, "\n"), vim.log.levels.INFO, {
			id = "lsp_progress",
			title = client.name,
			opts = function(notif)
				notif.icon = #progress[client.id] == 0 and " "
						or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
			end,
		})
	end,
})
