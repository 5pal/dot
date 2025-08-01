-- Cute code action floating window.Add commentMore actions
return {
    {
        'rachartier/tiny-code-action.nvim',
        event = 'LspAttach',
        opts = {
            picker = {
                'buffer',
                opts = {
                    hotkeys = true,
                    -- Use numeric labels.
                    hotkeys_mode = function(titles)
                        return vim.iter(ipairs(titles))
                            :map(function(i)
                                return tostring(i)
                            end)
                            :totable()
                    end,
                },
            },
        },
    },
}
