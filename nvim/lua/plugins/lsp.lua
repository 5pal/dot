return {
  -- tools
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "selene",
        "luacheck",
        "shellcheck",
        "shfmt",
        "tailwindcss-language-server",
        "css-lsp",
        "pyright", -- python lsp
        "java-test",
        "java-debug-adapter",
      })
    end,
  },

  -- lsp servers
  {
    "neovim/nvim-lspconfig",
    -- dependencies = { "saghen/blink.cmp" },
    ---@class PluginLspOpts
    opts = {
      inlay_hints = { enabled = false },
      ---@type lspconfig.options
      servers = {
        eslint = {
          settings = {
            -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
            workingDirectories = { mode = "auto" },
          },
        },
        jdtls = {},
        -- emmet_ls = {
        --   filetypes = {
        --     "astro",
        --     "css",
        --     "eruby",
        --     "handlebars",
        --     "html",
        --     "htmldjango",
        --     "javascriptreact",
        --     "less",
        --     "pug",
        --     "sass",
        --     "scss",
        --     "svelte",
        --     "typescriptreact",
        --     "vue",
        --   },
        -- },
        glslls = {},
        ts_ls = {},
        tsserver = {
          enabled = false,
        },
        vtsls = {
          enabled = false,
        },
        --css: Unknown rule @tailwind @apply
        cssls = {
          settings = {
            css = {
              lint = {
                unknownAtRules = "ignore",
              },
            },
          },
        },
        tailwindcss = {
          -- enable lsp server when git initialized
          root_dir = function(...)
            -- return require("lspconfig.util").root_pattern(".git")(...)
            return require("lspconfig.util").root_pattern(
              "tailwind.config.cjs",
              "tailwind.config.js",
              "tailwind.config.ts",
              "postcss.config.js"
            )(...)
          end,
          settings = {
            tailwindCSS = {
              experimental = {
                classRegex = {
                  { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
                  { "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                  { "cn\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
                  { "([a-zA-Z0-9\\-:]+)" },
                },
              },
            },
          },
        },
        html = {},
        yamlls = {},
        lua_ls = {
          -- enabled = false,
          single_file_support = true,
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                workspaceWord = true,
                callSnippet = "Both",
              },
              misc = {
                parameters = {
                  -- "--log-level=trace",
                },
              },
              hint = {
                enable = true,
                setType = false,
                paramType = true,
                paramName = "Disable",
                semicolon = "Disable",
                arrayIndex = "Disable",
              },
              doc = {
                privateName = { "^_" },
              },
              type = {
                castNumberToInteger = true,
              },
              diagnostics = {
                disable = { "incomplete-signature-doc", "trailing-space" },
                -- enable = false,
                groupSeverity = {
                  strong = "Warning",
                  strict = "Warning",
                },
                groupFileStatus = {
                  ["ambiguity"] = "Opened",
                  ["await"] = "Opened",
                  ["codestyle"] = "None",
                  ["duplicate"] = "Opened",
                  ["global"] = "Opened",
                  ["luadoc"] = "Opened",
                  ["redefined"] = "Opened",
                  ["strict"] = "Opened",
                  ["strong"] = "Opened",
                  ["type-check"] = "Opened",
                  ["unbalanced"] = "Opened",
                  ["unused"] = "Opened",
                },
                unusedLocalExclude = { "_*" },
              },
              format = {
                enable = false,
                defaultConfig = {
                  indent_style = "space",
                  indent_size = "2",
                  continuation_indent_size = "2",
                },
              },
            },
          },
        },
        pyright = {
          settings = {
            pyright = {
              disableOrganizeImports = true,
              disableTaggedHints = true,
            },
            python = {
              analysis = {
                diagnosticServerityOverrides = {
                  -- https://github.com/microsoft/pyright/blob/main/docs/configuration.md#type-check-diagnostics-settings
                  reportUndefindedVariable = "none",
                },
              },
            },
          },
        },
      },
      setup = {
        tsserver = function()
          -- disable tsserver
          return true
        end,
        ts_ls = function()
          -- disable tsserver
          return true
        end,
      },
    },
  },
  {
    "pmizio/typescript-tools.nvim",
    event = "BufReadPre",
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("typescript-tools").setup({
        settings = {
          separate_diagnostic_server = true,
          expose_as_code_action = "all",
          tsserver_plugins = {
            -- for TypeScript v4.9+
            -- "@styled/typescript-styled-plugin"
            "typescript-styled-plugin",
          },
          tsserver_max_memory = "auto",
          complete_function_calls = true,
          include_completions_with_insert_text = true,
          tsserver_file_preferences = {
            includeInlayParameterNameHints = "all", -- "none" | "literals" | "all";
            includeInlayParameterNameHintsWhenArgumentMatchesName = true,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayVariableTypeHintsWhenTypeMatchesName = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
            includeCompletionsForModuleExports = true,
            quotePreference = "auto",
            -- autoImportFileExcludePatterns = { "node_modules/*", ".git/*" },
          },
        },
      })
    end,
  },
}
