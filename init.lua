-- setting map leader to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- bootstrapping lazy to vim
require("config.lazy")
require("config.keymaps")

-- vim configs
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.g.have_nerd_font = true
vim.opt.wrap = false

if vim.fn.has("wsl") == 1 then
	vim.g.clipboard = {
		copy = {
			["+"] = "clip.exe",
			["*"] = "clip.exe",
		},
		paste = {
			["+"] = "powershell.exe -c Get-Clipboard",
			["*"] = "powershell.exe -c Get-Clipboard",
		},
	}
end

vim.opt.clipboard = "unnamedplus"

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
