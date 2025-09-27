return {
    {
        'mistweaverco/kulala.nvim',
        keys = {
            { '<leader>Qs', desc = 'Send request' },
            { '<leader>Qa', desc = 'Send all requests' },
            { '<leader>Qb', desc = 'Open scratchpad' },
        },
        ft = { 'http', 'rest' },
        opts = {
            global_keymaps = false,
            global_keymaps_prefix = '<leader>Q',
            kulala_keymaps_prefix = '',
        },
    },
}
