local lsp = require('trueegorletov.lsp.lsp')

lsp.config.sumneko_lua.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            },
            runtime = {
                version = "LuaJIT",
                path = vim.split(package.path, ";")
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/site")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                }
            }
        }
    },
}
