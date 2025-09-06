-- Install with: npm i -g @biomejs/biome

---@type vim.lsp.Config
return {
    cmd = { 'biome', 'lsp-proxy' },
    filetypes = {
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
        'json',
        'jsonc',
        'css',
        'scss',
        'vue',
        'astro',
        'svelte',
    },
    root_dir = function(fname)
        return vim.fs.root(fname, { 'biome.json', 'biome.jsonc' })
    end,
    single_file_support = false,
    settings = {},
}
