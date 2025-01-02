return {
  {
    enabled = false,
    "folke/flash.nvim",
    ---@type Flash.Config
    opts = {
      search = {
        forward = true,
        multi_window = false,
        wrap = false,
        incremental = true,
      },
    },
  },
  {
    "echasnovski/mini.hipatterns",
    event = "BufReadPre",
    opts = {
      highlighters = {
        hsl_color = {
          pattern = "hsl%(%d+,? %d+%%?,? %d+%%?%)",
          group = function(_, match)
            local utils = require("solarized-osaka.hsl")
            --- @type string, string, string
            local nh, ns, nl = match:match("hsl%((%d+),? (%d+)%%?,? (%d+)%%?%)")
            --- @type number?, number?, number?
            local h, s, l = tonumber(nh), tonumber(ns), tonumber(nl)
            --- @type string
            local hex_color = utils.hslToHex(h, s, l)
            return MiniHipatterns.compute_hex_color_group(hex_color, "bg")
          end,
        },
      },
    },
  },
  {
    "dinhhuy258/git.nvim",
    event = "BufReadPre",
    opts = {
      keymaps = {
        -- Open blame window
        blame = "<Leader>gb",
        -- Open file/folder in git repository
        browse = "<Leader>go",
      },
    },
  },
  -- {
  --   "saghen/blink.cmp",
  --   lazy = false,
  --   version = "v0.*",
  --   opts = {
  --     keymap = { preset = "default" },
  --     appearance = {
  --       use_nvim_cmp_as_default = true, -- Set nvim_cmp as the default completion plugin
  --       nerd_font_variant = "mono", -- Use a single style of Nerd Font
  --     },
  --     completion = {
  --       menu = {
  --         winblend = vim.o.pumblend,
  --       },
  --       documentation = {
  --         winblend = vim.o.pumblend,
  --       },
  --     },
  --     signature = {
  --       window = {
  --         winblend = vim.o.pumblend,
  --       },
  --     },
  --     sources = {
  --       default = { "lsp", "path", "snippets", "buffer" }, -- Specify the sources for autocompletion information
  --     },
  --   },
  -- },
}
