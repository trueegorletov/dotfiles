-- Import all the modules
require('vars')
require('opts')
require('keys')
require('plug')

vim.cmd [[
    colorscheme codedark
]]


-- Setup all the plugins are needed to
require('lualine').setup { options = { theme = 'codedark' } }
require('bufferline').setup()
require('nvim-tree').setup()
require('Comment').setup() 
