--
--
-- Global common mappings configuration file
--
--

local keymap = require('config.keymap.keymap')
local map = keymap.map
local remap = keymap.remap

local M = {}


-- When I push Enter, please save the working buffer
map('nv', '<cr>', ':w<cr>')

map('ic', '<tab>', 'copilot#Accept("<cr>")', keymap.default({
    script = true,
    expr = true,
}))


-- Make gt and gT work properly with bufferline
map('nv', 'gt', '<cmd>BufferLineCycleNext<cr>', remap())
map('nv', 'gT', '<cmd>BufferLineCyclePrev<cr>', remap())

-- With EasyMotion and numerous variety of ways to move it's much more effective
map('nvo', 'H', '^')
map('nvo', 'L', '$')
map('nvo', '^', 'H')
map('nvo', '$', 'L')

-- Sneak.vim mappings
map('n', 's', '<Plug>Sneak_s')
map('n', 'S', '<Plug>Sneak_S')
map('o', 'z', '<Plug>Sneak_s')
map('o', 'Z', '<Plug>Sneak_S')
map('v', 's', '<Plug>Sneak_s')
map('v', 'Z', '<Plug>Sneak_S')
map('nv', 't', '<Plug>Sneak_t')
map('nv', 'T', '<Plug>Sneak_T')
map('nv', 'f', '<Plug>Sneak_f')
map('nv', 'F', '<Plug>Sneak_F')
map('nv', ';', '<Plug>Sneak_;')
map('nv', '\\', '<Plug>Sneak_,')

-- Esc to enter normal mode in terminal
map('t', '<esc>', '<c-\\><c-n>')

-- LSP-related common mappings

map('n', '[d', vim.diagnostic.goto_prev)
map('n', ']d', vim.diagnostic.goto_next)

function M.lsp(bufopts)
    map('n', 'gD', vim.lsp.buf.declaration, bufopts)
    map('n', 'gd', vim.lsp.buf.definition, bufopts)
    map('n', 'K', vim.lsp.buf.hover, bufopts)
    map('n', 'gi', vim.lsp.buf.implementation, bufopts)
    map('n', 'gr', vim.lsp.buf.references, bufopts)
end

-- Nvim-cmp common mappings

local function has_words_before()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0
    and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]
    :sub(col, col)
    :match('%s') == nil
end

local luasnip = require('luasnip')
local cmp = require('cmp')

function M.cmp(table)
    table['<tab>'] = cmp.mapping(function(fallback)
        if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
        elseif has_words_before() then
            cmp.complete()
        else
            fallback()
        end
    end, { 'i', 's' })
    table['<s-tab>'] = cmp.mapping(function(fallback)
        if luasnip.jumpable(-1) then
            luasnip.jump(-1)
        else
            fallback()
        end
    end, { 'i', 's' })
end



--
-- F-KEYS MAPPINGS
--

-- Toggle Floaterm
map('nv', '<f8>', '<cmd>FloatermToggle<cr>')
map('t', '<f8>', '<c-\\><c-n><cmd>FloatermToggle<cr>')

-- Toggle UndoTree
map('nv', '<f9>', '<cmd>UndotreeToggle<cr>')
-- Format the file in current buffer
map('nv', '<f10>', '<cmd>Autoformat<cr>')
-- Display Tagbar for the file in current buffer
map('nv', '<f11>', '<cmd>TagbarToggle<cr>')
-- Reload Neovim configuration files
map('nv', '<f12>', '<cmd>ReloadConfig<cr>')



return M
