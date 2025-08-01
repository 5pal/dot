-- Formatting.
return {
    {
        'stevearc/conform.nvim',

        event = 'BufWritePre',

        opts = {
            notify_on_error = false,
            formatters_by_ft = {
                c = { name = 'clangd', timeout_ms = 500, lsp_format = 'prefer' },
                javascript = { 'biome', 'prettier', name = 'dprint', timeout_ms = 500, lsp_format = 'fallback' },
                javascriptreact = { 'biome', 'prettier', name = 'dprint', timeout_ms = 500, lsp_format = 'fallback' },
                json = { 'biome', 'prettier', name = 'dprint', timeout_ms = 500, lsp_format = 'fallback' },
                jsonc = { 'biome', 'prettier', name = 'dprint', timeout_ms = 500, lsp_format = 'fallback' },
                less = { 'prettier' },
                lua = { 'stylua' },
                markdown = { 'prettier' },
                rust = { name = 'rust_analyzer', timeout_ms = 500, lsp_format = 'prefer' },
                scss = { 'biome', 'prettier' },
                css = { 'biome', 'prettier' },
                sh = { 'shfmt' },
                python = { 'black' },
                typescript = { 'biome', 'prettier', name = 'dprint', timeout_ms = 500, lsp_format = 'fallback' },
                typescriptreact = { 'biome', 'prettier', name = 'dprint', timeout_ms = 500, lsp_format = 'fallback' },
                yaml = { 'prettier' },
                ['markdown.mdx'] = { 'prettier', 'markdownlint-cli2', 'markdown-toc' },
                -- For filetypes without a formatter:
                ['_'] = { 'trim_whitespace', 'trim_newlines' },
            },
            format_on_save = function()
                -- Don't format when minifiles is open, since that triggers the "confirm without
                -- synchronization" message.
                if vim.g.minifiles_active then
                    return nil
                end

                -- Skip formatting if triggered from my special save command.
                if vim.g.skip_formatting then
                    vim.g.skip_formatting = false
                    return nil
                end

                -- Stop if we disabled auto-formatting.
                if not vim.g.autoformat then
                    return nil
                end

                return {}
            end,
            formatters = {
                -- Require a Prettier configuration file to format.
                prettier = { require_cwd = true },
                -- Biome formatter configuration
                biome = {
                    command = 'biome',
                    args = { 'format', '--stdin-file-path', '$FILENAME' },
                    stdin = true,
                    require_cwd = true,
                },
            },
        },
        init = function()
            -- Use conform for gq.
            vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

            -- Start auto-formatting by default (and disable with my ToggleFormat command).
            vim.g.autoformat = true
        end,
    },
}
