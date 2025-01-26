local M = {}

-- FIXME: Find error!
-- TODO:
function M.toggleInlayHints()
  vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled())
end

return M
