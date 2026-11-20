local M = {}

function M.setup()
  local command = "vscode-spring-boot.ls.start"
  local start = vim.lsp.commands[command]
  if not start then
    return
  end

  -- Spring can be requested before its client finishes initializing.
  -- Wait for both servers before enabling their classpath communication.
  local pending = false
  local function start_when_ready()
    if not pending then
      return
    end
    if #vim.lsp.get_clients({ name = "spring-boot" }) == 0 or #vim.lsp.get_clients({ name = "jdtls" }) == 0 then
      return
    end
    pending = false
    start()
  end

  vim.lsp.commands[command] = function()
    pending = true
    start_when_ready()
    return {}
  end

  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("spring-boot-ready", { clear = true }),
    callback = start_when_ready,
  })
end

return M
