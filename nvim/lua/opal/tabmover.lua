local M = {}

function M.next_tab()
  local current_tab = vim.fn.tabpagenr()
  local total_tabs = vim.fn.tabpagenr("$")
  if current_tab == total_tabs then
    vim.cmd("tabmove 0")
  else
    vim.cmd("tabmove +1")
  end
end

function M.prev_tab()
  local current_tab = vim.fn.tabpagenr()
  local total_tabs = vim.fn.tabpagenr("$")
  if current_tab == 1 then
    vim.cmd("tabmove " .. total_tabs)
  else
    vim.cmd("tabmove -1")
  end
end

function M.firtst_tab() end

return M
