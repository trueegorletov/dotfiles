--
--
-- Global leader mappings configuration file
--
--

local keymap = require('config.keymap.keymap')
local map = keymap.map
local log = keymap.log

-- Set the leader key
vim.g.mapleader = ","

-- EasyMotion mappings
map('v', '<leader>w', '<Plug>(easymotion-bd-w)')
map('n', '<leader>w', '<Plug>(easymotion-overwin-w)')
map('v', '<leader>W', '<Plug>(easymotion-bd-W)')
map('n', '<leader>W', '<Plug>(easymotion-overwin-W)')
map('v', '<leader>e', '<Plug>(easymotion-bd-e)')
map('n', '<leader>e', '<Plug>(easymotion-overwin-e)')
map('v', '<leader>E', '<Plug>(easymotion-bd-E)')
map('n', '<leader>E', '<Plug>(easymotion-overwin-E)')
map('v', '<leader>l', '<Plug>(easymotion-bd-jk)')
map('n', '<leader>l', '<Plug>(easymotion-overwin-line)')
map('nv', '<leader>f', '<Plug>(easymotion-sn)')

-- Easier access to the system clipboard buffer
map('nv', '<leader>y', '"*y"', log())
map('nv', '<leader>p', '"*p"', log())



