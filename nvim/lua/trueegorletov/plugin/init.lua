--
--
-- Root .lua file for the plugin module
--
--

local plugin = require('trueegorletov.plugin.plugin')

require('trueegorletov.plugin.setup')
require('trueegorletov.plugin.nvim-cmp')


-- Autoinstall plugins if there weren't them
if plugin.first_start then
    vim.cmd[[ PackerInstall ]]
    return
end
