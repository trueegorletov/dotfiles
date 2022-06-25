--
--
-- NVIM-CMP configuration
--
--

local cmp = require('cmp')

-- Default settings for all files
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    mapping = require('trueegorletov.keymap.complex').cmp,
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_helper' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
    }),
    experimental = {
        ghost_text = {
            hl_group = 'NonText'
        },
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
