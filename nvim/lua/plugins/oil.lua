vim.api.nvim_create_autocmd("FileType", {
  pattern = "oil",
  callback = function()
    vim.opt_local.colorcolumn = ""
  end,
})

return {
  "stevearc/oil.nvim",
  dependency = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      watch_for_changes = true,
      columns = { "icon" },
      keymaps = {
        ["<C-h>"] = false,
        ["<M-h>"] = "actions.select_split",
      },
      view_options = {
        show_hidden = false, -- keymaps "g."
      },
      default_file_explorer = true,
    })

    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    -- vim.keymap.set("n", "_", function()
    --   require("oil").toggle_float()
    -- end)

    vim.keymap.set("n", "<space>-", require("oil").toggle_float)
    -- ["g."] = "actions.toggle_hidde",
  end,
}
