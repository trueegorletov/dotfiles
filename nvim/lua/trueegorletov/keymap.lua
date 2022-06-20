--
--
-- Keyboard mappings configuration file
--
--

-- Set the leader key
vim.g.mapleader = ","

-- Returns default options with merged opts
local function default(opts)
    local def = {
        silent = true,
        noremap = true,
    }

    for k, v in pairs(opts or {}) do
        def[k] = v
    end

    return def
end

local def = default()

local function map(modes, lhs, rhs, opts)
    local mapfunc =
    type(rhs) == 'function'
    and function (m, l, r, o) vim.keymap.set(m, l, r, o) end
    or function (m, l, r, o) vim.api.nvim_set_keymap(m, l, r, o) end

    opts = opts or def

    if string.find(modes, 'n') then
        mapfunc('n', lhs, rhs, opts)
    end

    if string.find(modes, 'v') then
        mapfunc('v', lhs, rhs, opts)
    end

    if string.find(modes, 'i') then
        mapfunc('i', lhs, rhs, opts)
    end
end

-- Shortcuts for non-usual options

local function log(opts)
    local def = default(opts)
    def.silent = false
    return def
end

local function remap(opts)
    local def = default(opts)
    def.noremap = false
    return def
end

local function expr(opts)
    local def = default(opts)
    def.expr = false
    return def
end



--
-- COMMON MAPPINGS
--

-- Make gt and gT work properly with bufferline
map('nv', 'gt', '<cmd>BufferLineCycleNext<cr>')
map('nv', 'gT', '<cmd>BufferLineCyclePrev<cr>')

-- With EasyMotion and numerous variety of ways to move it's much more effective
map('nv', 'H', '^')
map('nv', 'L', '$')

-- I don't want move my finger to shift one more time
map('nv', ';', '<cmd>')

map('n', '[d', vim.diagnostic.goto_prev)
map('n', ']d', vim.diagnostic.goto_next)



--
-- F-KEYS MAPPINGS
--

map('nv', '<f8>', '<cmd>TagbarToggle<cr>')
map('nv', '<f12>', [[  <cmd>ReloadConfig<cr> ]])


--
-- SPACE MAPPINGS
--

-- LSP diagnostics
map('n', '<space>e', vim.diagnostic.open_float)
map('n', '<space>q', vim.diagnostic.setloclist)

-- Bind some NvimTree actions
map('nv', '<space><space>', '<cmd>NvimTreeToggle<cr>')
map('nv', '<space>r', '<cmd>silent NvimTreeRefresh<cr>')
map('nv', '<space>f', '<cmd>silent NvimTreeFindFile<cr>')

-- And Telescope fuzzy finder
map('nv', '<space>ff', '<cmd>Telescope find_files<cr>')
map('nv', '<space>fg', '<cmd>Telescope live_grep<cr>')
map('nv', '<space>fb', '<cmd>Telescope buffers<cr>')
map('nv', '<space>fh', '<cmd>Telescope help_tags<cr>')



--
-- CTRL MAPPINGS
--

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



--
-- LEADER MAPPINGS
--

-- Faster save and quit
map('nv', '<leader>w', '<cmd>wa<cr>', log())
map('nv', '<leader>q', '<cmd>wq<cr>')

-- Easier access to the system clipboard buffer
map('nv', '<leader>y', '"*y"', log())
map('nv', '<leader>p', '"*p"', log())



--
-- COMPLEX-DECLARED MAPPINGS
--

-- Instead of using doubtful global variables,
-- we're just returning it at the end of file
local M = {};

-- Configure nvim-cmp mappings

local function has_words_before()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0
    and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]
    :sub(col, col)
    :match('%s') == nil
end

local luasnip = require('luasnip')
local cmp = require('cmp')

M.cmp = {
    ['<tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
        elseif has_words_before() then
            cmp.complete()
        else
            fallback()
        end
    end, { 'i', 's' }),
    ['<s-tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
        else
            fallback()
        end
    end, { 'i', 's' }),
    ['<c-d>'] = cmp.mapping.scroll_docs(-4),
    ['<c-f>'] = cmp.mapping.scroll_docs(4),
    ['<c-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
    },
    ['<c-space>'] = cmp.mapping.complete(),
}

-- Setup callback for LSP on_attach mappings

function M.lsp_on_attach(client, bufnr)
    -- TODO
end

return M
