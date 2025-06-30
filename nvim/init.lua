-- Global variables.
vim.g.projects_dir = vim.env.HOME .. '/Code'
vim.g.personal_projects_dir = vim.g.projects_dir .. '/Personal'
vim.g.work_projects_dir = '/Volumes/git'

-- Set my colorscheme.
vim.cmd.colorscheme 'miss-dracula'

-- Install Lazy.
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    }
end
vim.opt.rtp = vim.opt.rtp ^ lazypath

---@type LazySpec
local plugins = 'plugins'

-- General setup and goodies (order matters here).
require 'settings'
require 'keymaps'
require 'commands'
require 'autocmds'
require 'statusline'
require 'winbar'
require 'marks'
require 'lsp'

-- Configure plugins.
require('lazy').setup(plugins, {
    ui = { border = 'rounded' },
    dev = { path = vim.g.projects_dir },
    install = {
        -- Do not automatically install on startup.
        missing = false,
    },
    change_detection = { notify = true },
    -- None of my plugins use luarocks so disable this.
    rocks = {
        enabled = false,
    },
    defaults = {
        -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
        -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
        lazy = false,
        -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
        -- have outdated releases, which may break your Neovim install.
        version = false, -- always use the latest git commit
        -- version = "*", -- try installing the latest stable version for plugins that support semver
    },
    checker = {
        enabled = true,
    },
    performance = {
        rtp = {
            -- Stuff I don't use.
            disabled_plugins = {
                'gzip',
                'netrwPlugin',
                'rplugin',
                'tarPlugin',
                'tohtml',
                'tutor',
                'zipPlugin',
            },
        },
    },
})

-- Enable the new experimental command-line features.
require('vim._extui').enable {}
