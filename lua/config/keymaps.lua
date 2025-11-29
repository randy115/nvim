-- setting map leader to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- oil mappings
vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })

-- buffer mappings
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })
vim.keymap.set("n", "<leader><leader>", "<C-^>", { desc = "Toggle last buffer" })

-- window mappings
vim.keymap.set("n", "<leader>wh", "<C-w>s", { desc = "Horizontal split window" })
vim.keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Vertical split window" })
vim.keymap.set("n", "<leader>wq", "<C-w>c", { desc = "Close window" })
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Tab navigation
vim.keymap.set("n", "<leader>tc", ":tabnew<CR>", { desc = "New tab" })
vim.keymap.set("n", "<leader>td", ":tabclose<CR>", { desc = "Close tab" })
vim.keymap.set("n", "<leader>tp", ":tabprevious<CR>", { desc = "Previous tab" })
vim.keymap.set("n", "<leader>tn", ":tabnext<CR>", { desc = "Next tab" })
