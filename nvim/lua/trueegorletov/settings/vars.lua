--
--
-- Here is the place for all global variable settings which are not in lua/opts.lua
--
--

-- Global Vim settings
local g = vim.g

g.t_co = 256
g.background = 'dark'


-- Update the packpath
local packer_path = vim.fn.stdpath('data') .. '/site'
vim.o.packpath = vim.o.packpath .. ',' .. packer_path

