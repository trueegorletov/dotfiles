--
--
-- Here is the place for all variable settings, which are not in lua/opts.lua
--
--

-- Global Vim settings
local g = vim.g
g.t_co = 256
g.background = 'dark'

-- Update the packpath
local packer_path = vim.fn.stdpath('data') .. '/site'
vim.o.packpath = vim.o.packpath .. ',' .. packer_path

-- Vim-xkbswitch plugin lib path settings
if vim.fn.has('unix') then
    if vim.fn.empty(vim.fn.glob('/usr/local/bin/libg3kbswitch.so')) then
        g.XkbSwitchLib = '/usr/local/lib/libg3kbswitch.so'
    else
        print(
        'Not found xkbswitch in default path /usr/local/bin/xkbswitch. '
        .. 'Please install there it in order to remove this message.'
        )
    end
else if vim.fn.has('macunix') then
    if vim.fn.empty(vim.fn.glob('/usr/local/bin/xkbswitch')) then
        g.XkbSwitchLib = '/usr/local/bin/xkbswitch'
    else
        print(
        'Not found xkbswitch in default path '
        .. '/usr/local/lib/libg3kbswitch.so. '
        .. 'Please install there it in order to remove this message.'
        )
    end
end
end
