-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc", "markdown" },
  callback = function()
    vim.opt.conceallevel = 0
    vim.opt_local.spell = false
  end,
})

-- Highlight when yanking (copying) text
-- Try it with 'yap' in normal mode
-- See ':help vim.highlight.on_yank()'
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  pattern = "*",
  desc = "Highlight when yanking (copying) text",
  callback = function()
    vim.highlight.on_yank({
      timeout = 200,
      visual = true,
    })
  end,
})
