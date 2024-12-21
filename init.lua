-- setting map leader to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- bootstrapping lazy to vim
require("config.lazy")

-- vim configs
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.g.have_nerd_font = true

vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
