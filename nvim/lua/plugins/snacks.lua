return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      ---@type snacks.scroll.Config
      scroll = { enabled = false },
      indent = { enabled = true },
      input = { enabled = true },
      bigfile = { enabled = true },
      lazygit = {
        configure = true,
        -- extra configuration for lazygit that will be merged with the default
        -- snacks does NOT have a full yaml parser, so if you need `"test"` to appear with the quotes
        -- you need to double quote it: `"\"test\""`
        config = {
          os = { editPreset = "nvim-remote" },
          gui = { nerdFontsVersion = "3" },
        },
        theme_path = vim.fs.normalize(vim.fn.stdpath("cache") .. "/lazygit-theme.yml"),
        -- Theme for lazygit
        win = {
          style = "lazygit",
        },
      },
      terminal = {},
      notifier = {
        enabled = true,
        timeout = 3000,
        style = "fancy",
      },
      quickfile = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      styles = {
        input = {},
        lazygit = {
          width = 0,
          height = 0,
        },
        notification = {
          wo = { wrap = true }, -- Wrap notifications
        },
      },
      dashboard = {
        formats = {
          key = function(item)
            return { { "[", hl = "special" }, { item.key, hl = "key" }, { "]", hl = "special" } }
          end,
        },
        sections = {
          { section = "terminal", cmd = "fortune -s | cowsay", hl = "header", padding = 1, indent = 8 },
          { title = "MRU", padding = 1 },
          { section = "recent_files", limit = 8, padding = 1 },
          { title = "MRU ", file = vim.fn.fnamemodify(".", ":~"), padding = 1 },
          { section = "recent_files", cwd = true, limit = 8, padding = 1 },
          { title = "Sessions", padding = 1 },
          { section = "projects", padding = 1 },
          { title = "Bookmarks", padding = 1 },
          { section = "keys" },
        },
      },
    },
    keys = {
      {
        "<c-_>",
        function()
          Snacks.terminal.toggle({ "fish" }, { win = { position = "bottom" } })
        end,
        desc = "Open Fish Terminal",
      },
    },
  },
}
