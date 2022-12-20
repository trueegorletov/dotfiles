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


-- No tab remapping by copilot
g.copilot_no_tab_map = true

-- Sublime Monokai with italics
g.sublimemonokai_term_italic = 1
