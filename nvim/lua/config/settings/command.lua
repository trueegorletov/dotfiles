--
--
-- Command settings file
--
--


local M = {}


--
-- Custom commands definitions
--

-- Add a command shortcut for utils.reload_config() function
vim.cmd [[
command! ReloadConfig :lua require('config.utils').reload_config()
]]



--
-- Autocmd settings
--

local create_autocmd = vim.api.nvim_create_autocmd;


create_autocmd(
{ 'BufWritePre' },
{
    pattern = { '*' },
    command = ':silent Autoformat',
}
)




return M
