--
-- This is a unite file for all cmd/opt-based vim settings
--
-- You can also see my minimalistic config-files/.vimrc which often reproduces
-- settings from here
--

require('generic')
 
-- Make some aliases to avoid writing 'vim.' every time
local cmd = vim.cmd
local opt = vim.opt

--
-- Primary settings
--

cmd [[
    filetype indent plugin on
    syntax enable
]]

-- Useful cursor options
opt.colorcolumn = '80'
opt.cursorline = true
opt.number = true
opt.relativenumber = true

-- Make :vsp open split at right and :sp at bottom
opt.splitright = true
opt.splitbelow = true

-- Set tab = 4 spaces
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4

-- Enable Vim's indentation
opt.autoindent = true
opt.smartindent = true

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

-- Backup settings
opt.backup = true
opt.backupdir = createIfNeeded('$HOME/.nvim/files/backup//')
opt.backupext = '-vimbackup'
opt.backupskip = ''

-- Swap settings
opt.directory = createIfNeeded('$HOME/.nvim/files/swap//')
opt.updatecount = 100

-- Undo history settings
opt.undofile = true
opt.undodir = createIfNeeded('$HOME/.nvim/files/undo//')

-- Viminfo
opt.viminfo = [['100,n]] .. createIfNeeded('$HOME/.nvim/files/info//')
