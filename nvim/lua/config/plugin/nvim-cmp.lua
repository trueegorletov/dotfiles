--
--
-- Nvim-cmp plugin settings file
--
--


local cmp = require('cmp')
local keymap = require('config.keymap.complex')


-- Default settings for all files
cmp.setup {
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = keymap.cmp,
    sources = cmp.config.sources {
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_helper' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
    },
    experimental = {
        ghost_text = 'Comment',
    }
}

-- Use custom sources for gitcommit files
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources {
        { name = 'cmp_git' },
        { name = 'buffer' },
    }
})

-- Use buffer source for searching
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources {
        { name = 'buffer' }
    }
})

-- Use cmdline & path sources for vim cmdline
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources{
        { name = 'path' },
        { name = 'cmdline' },
    }
})
