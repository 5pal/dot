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
        'vue',
        'astro',
        'svelte',
    },
    root_markers = { 'biome.json', 'biome.jsonc' },
    single_file_support = false,
    settings = {},
}
