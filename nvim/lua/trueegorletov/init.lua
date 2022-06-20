--
--
-- My Neovim configuration's init.lua
--
--

--
-- REQUIRE ALL THE MODULES
--

require('trueegorletov.settings')
require('trueegorletov.vars')
require('trueegorletov.command')
require('trueegorletov.plugin')

-- Some keymaps have to be configured directly in plugin setups,
-- so they are stored there
local keymap = require('trueegorletov.keymap')



--
-- APPEARANCE CONFIGURATION
--

vim.cmd [[
colorscheme darcula
]]

vim.opt.guifont = 'JetBrainsMono Nerd Font:h15'



--
-- COMMON PLUGINS CONFIGURATION
--

-- Simple plugins that are not needed (at the moment) to be especially configured
require('lualine').setup()
require('Comment').setup()

-- nvim-tree.lua configuration
local nvim_tree = require('nvim-tree')

if not nvim_tree.setup_called then
    nvim_tree.setup()
end

-- Bufferline setup and configuration
require('bufferline').setup {
    options = {
        -- I'll be honest: I don't understand what is the difference between
        -- buffers and tabs and it really confuses me, so let mode be 'tabs'
        -- until I'll come up with opinion that use the 'buffers' mode is a
        -- really good idea
        mode = 'tabs',
        enforce_regular_tabs = true,

        -- Close icons at least don't work (lol) and imo it's redundant
        close_icon = '',
        buffer_close_icon = '',
    }
}



--
-- NVIM-CMP AND LSP SERVERS CONFIGURATION
--

-- nvim-lsp-installer config
local installer = require('nvim-lsp-installer').setup {
    automatic_installation = true,
}

--
-- nvim-cmp configuration
--

local cmp = require('cmp')

-- Default settings for all files
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    mapping = keymap.cmp,
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_helper' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
    }),
    experimental = {
        ghost_text = true,
    }
})

-- Use custom sources for gitcommit files
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources(
    {
        { name = 'cmp_git' },
    },
    {
        { name = 'buffer' },
    }
    )
})

-- Use buffer source for searching
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path sources for vim cmdline
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

--
-- Setup cmp-nvim-lsp
--

local capabilities =
require('cmp_nvim_lsp')
.update_capabilities(
vim.lsp.protocol.make_client_capabilities()
)

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
        keymap.lsp_on_attach(client, bufnr)
    end
}
)


lspconfig.sumneko_lua.setup {
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
    capabilities = capabilities,
}
