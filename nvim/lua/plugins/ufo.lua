return {
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async" },
  event = "BufEnter",
  --    event = 'VeryLazy',   -- You can make it lazy-loaded via VeryLazy, but comment out if thing doesn't work
  -- init = function()
  --   vim.o.foldlevel = 99
  --   vim.o.foldlevelstart = 99
  -- end,
  config = function()
    --- @diagnostic disable: unused-local
    require("ufo").setup({
      provider_selector = function(_bnfnr, _filetype, _buftype)
        return { "treesitter", "indent" }
      end,
    })
  end,
}

-- TODO: keymap tips!
-- vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
-- vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
-- vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
-- vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
