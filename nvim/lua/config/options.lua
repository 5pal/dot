LazyVim.terminal.setup("bash")
vim.g.mapleader = " "
-- vim.g.snacks_animate = false
-- vim.env.PATH = "/opt/homebrew/bin:" .. vim.env.PATH
vim.g.minipairs_disable = true
vim.g.lazyvim_prettier_needs_config = true
vim.g.lazyvim_picker = "telescope"
vim.g.autoformat = true -- Enable formatters on save.
-- LazyVim picker to use.
-- Can be one of: telescope, fzf
-- Leave it to "auto" to automatically use the picker
-- enabled with `:LazyExtras`
vim.g.lazyvim_picker = "auto"

-- LazyVim completion engine to use.
-- Can be one of: nvim-cmp, blink.cmp
-- Leave it to "auto" to automatically use the completion engine
-- enabled with `:LazyExtras`
vim.g.lazyvim_cmp = "auto"
vim.g.ai_cmp = true

vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.number = true

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smartcase = true -- Don't ignore case with capitals
vim.opt.smarttab = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.showtabline = 2
vim.opt.cmdheight = 1
vim.opt.laststatus = 3
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.completeopt = { "menu", "menuone", "noselect" }
-- vim.o.shellcmdflag = "-i"
-- vim.opt.shell = "/bin/bash" -- A fix for neovim been slow for fish users
-- -- vim.opt.shell = "/opt/homebrew/bin/bash" -- A fix for neovim been slow for fish users
-- vim.opt.shell = "/opt/homebrew/bin/fish"
vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }
vim.opt.inccommand = "split"
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = false -- No Wrap lines
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current
vim.opt.splitkeep = "cursor"
vim.opt.mouse = "a"
vim.opt.mousescroll = "ver:1,hor:4"
vim.opt.fixeol = false

vim.opt.listchars:remove("tab:-")

-- list 모드 비활성화 (탭, 공백 등이 안 보이게)
vim.opt.list = false

-- folding configurtion

-- vim.opt.foldlevelstart = 1
-- vim.opt.foldnestmax = 4

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- quit command typo
vim.cmd([[command! Qa :qa]])
vim.cmd([[command! Q :q]])
vim.cmd([[command! W :w]])
vim.cmd([[command! Wq :wq]])

-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })

vim.cmd([[au BufNewFile,BufRead *.astro setf astro]])
vim.cmd([[au BufNewFile,BufRead Podfile setf ruby]])

if vim.fn.has("nvim-0.8") == 1 then
  vim.opt.cmdheight = 0
end

-- File types

vim.filetype.add({
  extension = {
    env = "dotenv",
    mdx = "mdx",
  },
  filename = {
    [".env"] = "dotenv",
    ["env"] = "dotenv",
  },
  pattern = {
    ["[jt]sconfig.*.json"] = "jsonc",
    ["%.env%.[%w_.-]+"] = "dotenv",
  },
})
