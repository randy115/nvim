return {
  {
    "christoomey/vim-tmux-navigator",
    vim.keymap.set("n", "<C-Space>h", "<cmd><C-U>TmuxNavigateLeft<cr>"),
    vim.keymap.set("n", "<C-Space>j", "<cmd><C-U>TmuxNavigateDown<cr>"),
    vim.keymap.set("n", "<C-Space>k", "<cmd><C-U>TmuxNavigateUp<cr>"),
    vim.keymap.set("n", "<C-Space>l", "<cmd><C-U>TmuxNavigateRight<cr>"),
    vim.keymap.set("n", "<C-Space>n", "<cmd><C-U>TmuxNavigatePrevious<cr>"),
  },
}
