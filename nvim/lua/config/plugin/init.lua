--
--
-- Root .lua file of the plugin module
--
--

local plugin = require('config.plugin.plugin')

require('config.plugin.setup')
require('config.plugin.nvim-cmp')


-- Autoinstall plugins if there weren't them
if plugin.first_start then
    vim.cmd[[ PackerInstall ]]
    return
end
