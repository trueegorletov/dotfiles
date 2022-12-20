--
--
-- My Neovim configuration's init.lua
--
--

-- The actual configuration is separated between multiple modules,
-- so we just require them here:
require('config.plugin.init')
require('config.settings.init')
require('config.keymap.init')
require('config.lsp.init')
require('config.lang.init')
