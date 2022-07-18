--
--
-- Global common mappings configuration file
--
--

local keymap = require('trueegorletov.keymap.keymap')
local map = keymap.map

local M = {}


-- Faster save and quit
map('nv', '<space>w', '<cmd>wa<cr>')
map('nv', '<space>q', function ()
    vim.cmd [[ silent! w! ]]
    vim.cmd [[ q ]]
end)
map('nv', '<space>x', function ()
    vim.cmd [[ wa ]]
    vim.cmd [[ tabclose ]]
end)

-- Hide search highlighting
map('nv', '<space>h', '<cmd>nohlsearch<cr>')

-- LSP diagnostics
map('n', '<space>e', vim.diagnostic.open_float)
map('n', '<space>l', vim.diagnostic.setloclist)

-- Toggle NvimTree
map('nv', '<space><space>', '<cmd>NvimTreeFocus<cr>')
map('nv', '<space>t', '<cmd>NvimTreeToggle<cr>')

-- And Telescope fuzzy finder
map('nv', '<space>ff', '<cmd>Telescope find_files<cr>')
map('nv', '<space>fp', '<cmd>Telescope projects<cr>')
map('nv', '<space>fg', '<cmd>Telescope live_grep<cr>')
map('nv', '<space>fb', '<cmd>Telescope buffers<cr>')
map('nv', '<space>fh', '<cmd>Telescope help_tags<cr>')


-- LSP-related space mappings
function M.lsp(bufopts)
    map('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    map(
    'n', '<space>wr',
    vim.lsp.buf.remove_workspace_folder, bufopts
    )
    map('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    map('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    map('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    map('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    map('n', '<space>i', vim.lsp.buf.formatting, bufopts)
end


return M
