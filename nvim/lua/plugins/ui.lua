return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    init = function()
      vim.g.lualine_laststatus = vim.o.laststatus
      if vim.fn.argc(-1) > 0 then
        vim.o.statusline = " "
      else
        vim.o.laststatus = 0
      end
    end,
    config = function()
      require("config.lualine")
    end,
  },

  -- animations
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.scroll = {
        enable = false,
      }
    end,
  },

  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup({})
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPost",
    opts = {
      user_default_options = {
        names = false,
      },
    },
  },

  { "echasnovski/mini.cursorword", event = { "BufReadPost", "BufNewFile" }, config = true },

  -- buffer line
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>bb", "<cmd>BufferLinePick<CR>", { noremap = true, silent = true } },
      { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>" },
      { "<leader>br", "<Cmd>BufferLineCloseRight<CR>" },
      { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>" },
      { "<S-tab>", "<cmd>BufferLineCyclePrev<cr>", { noremap = true, silent = true } },
      { "<tab>", "<cmd>BufferLineCycleNext<cr>", { noremap = true, silent = true } },
    },
    config = function()
      require("config.bufferline")
    end,
  },
  -- {
  --   "akinsho/bufferline.nvim",
  --   event = "VeryLazy",
  --   keys = {
  --     { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
  --     { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
  --   },
  --   opts = {
  --     options = {
  --       mode = "tabs",
  --       -- separator_style = "slant",
  --       show_buffer_close_icons = false,
  --       show_close_icon = false,
  --     },
  --   },
  -- },

  -- filename
  {
    "b0o/incline.nvim",
    dependencies = { "craftzdog/solarized-osaka.nvim" },
    event = "BufReadPre",
    priority = 1200,
    config = function()
      local colors = require("solarized-osaka.colors").setup()

      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = colors.magenta500, guifg = colors.base04 },
            InclineNormalNC = { guifg = colors.violet500, guibg = colors.base03 },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = {
          cursorline = true,
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if vim.bo[props.buf].modified then
            filename = "[+] " .. filename
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = color }, { " " }, { filename } }
        end,
      })
    end,
  },
  -- hardtime
  -- {
  --   "m4xshen/hardtime.nvim",
  --   dependencies = { "MunifTanjim/nui.nvim" },
  --   opts = {},
  -- },
  -- statusline
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   opts = function(_, opts)
  --     local LazyVim = require("lazyvim.util")
  --     opts.sections.lualine_c[4] = {
  --       LazyVim.lualine.pretty_path({
  --         length = 0,
  --         relative = "cwd",
  --         modified_hl = "MatchParen",
  --         directory_hl = "",
  --         filename_hl = "Bold",
  --         modified_sign = "",
  --         readonly_icon = " 󰌾 ",
  --       }),
  --     }
  --   end,
  -- },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = true,
        tmux = true,
        kitty = { enabled = false, font = "+2" },
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) functon
  },

  -- {
  --   "nvimdev/dashboard-nvim",
  --   event = "VimEnter",
  --   opts = function(_, opts)
  --     local logo = [[
  --                                                     
  --              ████ ██████           █████      ██
  --             ███████████             █████ 
  --             █████████ ███████████████████ ███   ███████████
  --            █████████  ███    █████████████ █████ ██████████████
  --           █████████ ██████████ █████████ █████ █████ ████ █████
  --         ███████████ ███    ███ █████████ █████ █████ ████ █████
  --        ██████  █████████████████████ ████ █████ █████ ████ ██████
  --     ]]
  --     logo = string.rep("\n", 8) .. logo .. "\n\n"
  --     opts.config.header = vim.split(logo, "\n")
  --   end,
  -- },
}
