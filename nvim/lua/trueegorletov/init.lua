--
--
-- My Neovim configuration's init.lua
--
--

-- The actual configuration is separated between multiple modules,
-- so we just require them here:
require('trueegorletov.keymap.init')
require('trueegorletov.lang.init')
require('trueegorletov.lsp.init')
require('trueegorletov.plugin.init')
require('trueegorletov.settings.init')

