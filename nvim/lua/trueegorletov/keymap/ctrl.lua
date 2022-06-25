--
-- CTRL MAPPINGS
--

local keymap = require('trueegorletov.keymap.keymap')
local map = keymap.map

local M = {}


-- Make window jumping easier
map('n', '<c-h>', '<c-w>h')
map('n', '<c-j>', '<c-w>j')
map('n', '<c-k>', '<c-w>k')
map('n', '<c-l>', '<c-w>l')

-- This can be useful sometimes
map('i', '<c-h>', '<left>')
map('i', '<c-j>', '<down>')
map('i', '<c-k>', '<up>')
map('i', '<c-l>', '<right>')

-- Enable windows resizing mode
--
-- It's default mapping, but overmind developer of the extension didn't like
-- usual way to set mappings so let it be here for clarity
vim.g.winresizer_start_key = '<c-e>'


-- LSP-related ctrl mappings
function M.lsp(bufopts)
    map('n', '<c-s>', vim.lsp.buf.signature_help, bufopts)
end


-- nvim-cmp ctrl mappings

local cmp = require('cmp')

function M.cmp(table)
    table['<c-d>'] = cmp.mapping.scroll_docs(-4)
    table['<c-f>'] = cmp.mapping.scroll_docs(4)
    table['<c-e>'] = cmp.mapping.abort()
    table['<cr>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
    }
    table['<c-space>'] = cmp.mapping.complete()
end


return M


