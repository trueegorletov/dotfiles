--
--
-- Command settings file
--
--

--
-- Custom commands definitions
--

-- Add a command shortcut for utils.reload_config() function
vim.cmd [[
command! ReloadConfig :lua require('trueegorletov.utils').reload_config()
]]



--
-- Autocmd settings
--

vim.api.nvim_create_autocmd(
{ 'BufWritePre' },
{
    pattern = { '*' },
    command = ':silent Autoformat',
}
)
