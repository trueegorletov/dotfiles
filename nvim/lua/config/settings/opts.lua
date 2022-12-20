--
-- This is a unite file for all cmd/opt-based vim settings
--
-- You can also see my minimalistic config-files/.vimrc which often reproduces
-- settings from here
--


local utils = require('config.utils')


-- Make some aliases to avoid writing 'vim.' every time
local cmd = vim.cmd
local opt = vim.opt



--
-- Primary settings
--

-- Basic settings
cmd [[
filetype indent plugin on
syntax enable
]]

-- Useful cursor options
opt.colorcolumn = '100'
opt.cursorline = true
opt.number = true
opt.relativenumber = true

-- Make :vsp open split at right and :sp at bottom
opt.splitright = true
opt.splitbelow = true

-- It's a well-known fact that programmers who use spaces make more money
-- I'm not a miser, but I prefer to use this settings to avoid that pit:
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4

-- Enable Vim's indentation
opt.autoindent = true
opt.smartindent = true

-- Syntax-based vim folding
opt.foldmethod = 'syntax'

-- Make CursorHold being triggered fine
opt.updatetime = 250



--
-- UI-specific settings
--

-- Don't render tildes
vim.cmd [[ highlight EndOfBuffer guifg=bg ]]



--
-- Terminal-specific settings
--

-- Use all colors in terminal
opt.termguicolors = true

-- Redraw faster and lazily
opt.ttyfast = true
opt.lazyredraw = true



--
-- Advanced saving settings
--

home = os.getenv('HOME') .. '/'

-- Backup settings
opt.backup = true
opt.backupdir = utils.create_if_needed(home .. '.nvim/files/backup')
opt.backupext = '-vimbackup'
opt.backupskip = ''


-- Swap settings
opt.directory = utils.create_if_needed(home .. '.nvim/files/swap')
opt.updatecount = 100

-- Undo history settings
opt.undofile = true
opt.undodir = utils.create_if_needed(home .. '.nvim/files/undo')

-- Viminfo
opt.viminfo = [['100,n]]
.. utils.create_if_needed(home ..'.nvim/files/info/viminfo')

