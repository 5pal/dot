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
        -- formats = {
        --   key = function(item)
        --     return { { "[", hl = "special" }, { item.key, hl = "key" }, { "]", hl = "special" } }
        --   end,
        -- },
        -- sections = {
        --   { section = "terminal", cmd = "fortune -s | cowsay", hl = "header", padding = 1, indent = 8 },
        --   { title = "MRU", padding = 1 },
        --   { section = "recent_files", limit = 8, padding = 1 },
        --   { title = "MRU ", file = vim.fn.fnamemodify(".", ":~"), padding = 1 },
        --   { section = "recent_files", cwd = true, limit = 8, padding = 1 },
        --   { title = "Sessions", padding = 1 },
        --   { section = "projects", padding = 1 },
        --   { title = "Bookmarks", padding = 1 },
        --   { section = "keys" },
        -- },
        {
          sections = {
            { section = "header" },
            {
              pane = 2,
              section = "terminal",
              cmd = "colorscript -e square",
              height = 5,
              padding = 1,
            },
            { section = "keys", gap = 1, padding = 1 },
            function()
              local in_git = Snacks.git.get_root() ~= nil
              local cmds = {
                {
                  title = "Notifications",
                  cmd = "gh notify -s -a -n5",
                  icon = " ",
                  height = 5,
                  enabled = true,
                },
                {
                  title = "Open Issues",
                  cmd = "gh issue list -L 3",
                  icon = " ",
                  height = 7,
                },
                {
                  icon = " ",
                  title = "Open PRs",
                  cmd = "gh pr list -L 3",
                  height = 7,
                },
                {
                  icon = " ",
                  title = "Git Status",
                  cmd = "hub --no-pager diff --stat -B -M -C",
                  height = 10,
                },
              }
              return vim.tbl_map(function(cmd)
                return vim.tbl_extend("force", {
                  pane = 2,
                  section = "terminal",
                  enabled = in_git,
                  padding = 1,
                  ttl = 5 * 60,
                  indent = 3,
                }, cmd)
              end, cmds)
            end,
            { section = "startup" },
          },
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
