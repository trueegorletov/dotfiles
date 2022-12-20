--
--
-- Main configuration file for all LSP things
--
--


--
-- Setup cmp-nvim-lsp
--

local lspconfig = require('lspconfig');

lspconfig.util.default_config = vim.tbl_deep_extend(
'force',
lspconfig.util.default_config,
{
    flags = {
        debounce_text_changes = 150,
    },
    capabilities = require('cmp_nvim_lsp').update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
    ),
    on_attach = function(client, bufnr)
        require('config.keymap.complex').lsp_on_attach(client, bufnr)
    end
}
)



--
-- Config diagnostics appearance
--
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = true,
    severity_sort = false,
})



--
-- Setup nvim-lsp-installer
--
require('nvim-lsp-installer').setup {
    -- All them don't work but let this settings be

    automatic_installation = true,
    ensure_installed = {'sumneko_lua', 'rust_analyzer'}
}




return {
    config = lspconfig,
}
