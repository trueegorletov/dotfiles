--
--
-- Setup all plugins that don't need complex configuration
--
--


local g = vim.g
local keymap = require('trueegorletov.keymap.complex')


--
-- ONE-LINE SETUPS
--
require('lualine').setup()
require('Comment').setup()
require('project_nvim').setup()
require('neogen').setup()
require('which-key').setup{}



--
-- SIMPLE SETUPS
--

-- Load friendly-snippets into LuaSnip
require("luasnip.loaders.from_vscode").lazy_load()

-- Disable EasyMotion default bindings
g.EasyMotion_do_mapping = 0

-- Treesitter settings
require('nvim-treesitter.configs').setup {
    -- Ensure these syntax parsers to be installed
    ensure_installed = { "c", "lua", "rust" },

    -- Automatically install missing parsers when entering buffer
    auto_install = true,
}




--
-- VIM-XKBSWITCH
--
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



--
-- LENS
--

-- Animation works badly with Neovide, so disable it
g['lens#animate'] = 0

-- Disable Lens for NvimTree
g['lens#disabled_filetypes'] = { 'NvimTree', 'qf' }

-- More resizing!
g['lens#width_resize_min'] = 15
g['lens#height_resize_min'] = 15
g['lens#width_resize_max'] = 100
g['lens#height_resize_max'] = 75



--
-- TELESCOPE
--
local telescope = require('telescope')

telescope.setup {
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--ignore-file',
            '.gitignore'
        },
    }
}

telescope.load_extension('projects')



--
-- NVIMTREE
--

local nvim_tree = require('nvim-tree')

if not nvim_tree.setup_called then
    nvim_tree.setup {
        open_on_setup = true,
        open_on_setup_file = true,
        open_on_tab = true,
        disable_netrw = true,
        create_in_closed_folder = true,
        sync_root_with_cwd = true,
        reload_on_bufenter = true,
        diagnostics = {
            enable = true,
            show_on_dirs = true,
        },
        hijack_cursor = true,
        hijack_unnamed_buffer_when_opening = false,
        update_cwd = true,
        update_focused_file = {
            enable = true,
            update_cwd = false,
        },
        view = {
            adaptive_size = true,
            side = "left",
            width = 25,
            hide_root_folder = true,
            mappings = {
                custom_only = true,
                list = keymap.nvim_tree
            }
        },
        git = {
            enable = false,
            ignore = true,
        },
        filesystem_watchers = {
            enable = true,
        },
        actions = {
            open_file = {
                resize_window = true,
            },
        } ,
        renderer = {
            highlight_git = false,
            highlight_opened_files = "none",
            indent_markers = {
                enable = false,
            },
            icons = {
                show = {
                    file = true,
                    folder = true,
                    folder_arrow = true,
                    git = false,
                },
                glyphs = {
                    default = "",
                    symlink = "",
                    folder = {
                        default = "",
                        empty = "",
                        empty_open = "",
                        open = "",
                        symlink = "",
                        symlink_open = "",
                        arrow_open = "",
                        arrow_closed = "",
                    },
                    git = {
                        unstaged = "✗",
                        staged = "✓",
                        unmerged = "",
                        renamed = "➜",
                        untracked = "★",
                        deleted = "",
                        ignored = "◌",
                    },
                },
            },
        },
    }
end

--
-- BUFFERLINE
--
require('bufferline').setup {
    options = {
        -- I'll be honest: I don't understand what is the difference between
        -- buffers and tabs and it really confuses me, so let mode be 'tabs'
        -- until I'll come up with opinion that use the 'buffers' mode is a
        -- really good idea
        mode = 'tabs',
        enforce_regular_tabs = true,

        -- Close icons at least don't work (lol) and imo it's redundant
        close_icon = '',
        buffer_close_icon = '',


        -- Provide an offset for NvimTree
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                text_align = "left"
            }
        },

        -- LSP diagnostics status in the tab title
        diagnostics = 'nvim_lsp',
        diagnostics_update_in_insert = false,
    }
}
