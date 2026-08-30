return {
  {
    "nvim-treesitter/nvim-treesitter",
    -- Pinned explicitly: existing clones cache `origin/HEAD -> origin/master`
    -- from before upstream flipped its default, and git never refreshes it.
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install({
        "java",
        "go",
        "javascript",
        "python",
        "typescript",
        "tsx",
        "yaml",
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "markdown",
        "markdown_inline",
        "jinja",
      })

      -- Highlighting is opt-in per buffer on the main branch. This replaces
      -- the old `highlight.disable` callback, including its 100KB guard.
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(ev)
          local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(ev.buf))
          if ok and stats and stats.size > 100 * 1024 then
            return
          end
          pcall(vim.treesitter.start, ev.buf)
        end,
      })
    end,
  },
}
