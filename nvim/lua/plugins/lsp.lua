return {
  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    lazy = false,
    config = function()
      vim.g.rustaceanvim = {
        server = {
          settings = {
            ["rust-analyzer"] = {
              inlayHints = {
                bindingModeHints = {
                  enable = false,
                },
                chainingHints = {
                  enable = true,
                },
                closingBraceHints = {
                  enable = true,
                  minLines = 25,
                },
                closureReturnTypeHints = {
                  enable = "never",
                },
                lifetimeElisionHints = {
                  enable = "never",
                  useParameterNames = false,
                },
                maxLength = 25,
                parameterHints = {
                  enable = true,
                },
                reborrowHints = {
                  enable = "never",
                },
                renderColons = true,
                typeHints = {
                  enable = true,
                  hideClosureInitialization = false,
                  hideNamedConstructor = false,
                },
              },
            },
          },
        },
      }
    end,
  },
  {
    "pmizio/typescript-tools.nvim",
    event = "BufReadPre",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
      settings = {

        tsserver_plugins = {
          -- for TypeScript v4.9+
          -- "@styled/typescript-styled-plugin"
          "typescript-styled-plugin",
        },

        jsx_close_tag = {
          enable = true,
          filetypes = { "javascriptreact", "typescriptreact" },
        },

        tsserver_file_preferences = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayVariableTypeHintsWhenTypeMatchesName = false,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
    },
  },
  -- {
  --   "pmizio/typescript-tools.nvim",
  --   event = "BufReadPre",
  --   ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  --   dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  --   config = function()
  --     require("typescript-tools").setup({
  --       settings = {
  --         separate_diagnostic_server = true,
  --         expose_as_code_action = "all",
  --         tsserver_plugins = {
  --           -- for TypeScript v4.9+
  --           -- "@styled/typescript-styled-plugin"
  --           "typescript-styled-plugin",
  --         },
  --         tsserver_max_memory = "auto",
  --         complete_function_calls = true,
  --         include_completions_with_insert_text = true,
  --         tsserver_file_preferences = {
  --           includeInlayParameterNameHints = "all", -- "none" | "literals" | "all";
  --           includeInlayParameterNameHintsWhenArgumentMatchesName = true,
  --           includeInlayFunctionParameterTypeHints = true,
  --           includeInlayVariableTypeHints = true,
  --           includeInlayVariableTypeHintsWhenTypeMatchesName = true,
  --           includeInlayPropertyDeclarationTypeHints = true,
  --           includeInlayFunctionLikeReturnTypeHints = true,
  --           includeInlayEnumMemberValueHints = true,
  --           includeCompletionsForModuleExports = true,
  --           quotePreference = "auto",
  --           -- autoImportFileExcludePatterns = { "node_modules/*", ".git/*" },
  --         },
  --       },
  --     })
  --   end,
  -- },
}
