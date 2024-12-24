-- setting map leader to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- bootstrapping lazy to vim
require("config.lazy")

-- vim configs
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.g.have_nerd_font = true

vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

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
