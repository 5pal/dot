-- Surround selections, add quotes, etc.
return {
    {
        'kylechui/nvim-surround',
        event = 'VeryLazy',
        opts = {
            -- keymaps = {
            --     insert = false,
            --     insert_line = false,
            --     visual_line = false,
            --     normal = 'yz',
            --     normal_cur = 'yzz',
            --     normal_line = 'yZ',
            --     normal_cur_line = 'yZZ',
            --     visual = 'Z',
            -- },
        },
        keymaps = {
            { 'n', 'yz', '<cmd>lua require("nvim-surround").operator()<CR>', desc = 'Surround operator' },
            {
                'n',
                'yzz',
                '<cmd>lua require("nvim-surround").operator(true)<CR>',
                desc = 'Surround operator (linewise)',
            },
            { 'n', 'yZ', '<cmd>lua require("nvim-surround").line()<CR>', desc = 'Surround line' },
            {
                'n',
                'yZZ',
                '<cmd>lua require("nvim-surround").line(true)<CR>',
                desc = 'Surround line (add to end of line)',
            },
            { 'x', 'Z', '<cmd>lua require("nvim-surround").visual()<CR>', desc = 'Surround visual selection' },
        },
    },
}
