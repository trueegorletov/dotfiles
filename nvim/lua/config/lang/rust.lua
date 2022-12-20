--
--
-- Rust-specific settings file
--
--

local M = {}

-- Setup crates.io integration plugin
require('crates').setup()

-- Setup rust-tools
require('rust-tools').setup {
    tools = {
        autoSetHints = true,
        inlay_hints = {
            only_current_line = false,
            show_parameter_hints = true,
        }
    },
}



--
-- Rust-specific autocommands
--

local mod = [[ lua require('config.lang.rust') ]]

vim.api.nvim_create_autocmd(
{ 'FileType' },
{
    pattern = { 'toml' },
    command = [[
    lua require('cmp').setup.buffer { sources = { { name = 'crates' } } }
    ]],
}
)

-- Rust-specific key bindings

vim.api.nvim_create_autocmd(
{ 'FileType' },
{
    pattern = { 'rust' },
    command = mod .. '.keymap()',
}
)


local keymap = require('config.keymap.keymap')
local map = keymap.map

function M.keymap()
    map('nv', '<f1>', '<cmd>silent !cargo fix<cr>')
end



return M
