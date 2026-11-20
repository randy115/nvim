-- setting map leader to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- bootstrapping lazy to vim
require("config.lazy")
require("config.keymaps")

-- vim configs
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.number = true
vim.opt.relativenumber = true
vim.g.have_nerd_font = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true

-- Fold markdown by heading (built-in ftplugin), but open files unfolded.
vim.g.markdown_folding = 1
vim.opt.foldlevelstart = 99

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

-- Over SSH there is no local clipboard tool, so route copies to the
-- terminal via OSC 52. Paste reads the local register to avoid a 10s
-- stall waiting for a terminal response.
if vim.env.SSH_TTY then
  local osc52 = require("vim.ui.clipboard.osc52")
  vim.g.clipboard = {
    copy = { ["+"] = osc52.copy("+") },
    paste = { ["+"] = function() return vim.split(vim.fn.getreg('"'), "\n") end },
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
