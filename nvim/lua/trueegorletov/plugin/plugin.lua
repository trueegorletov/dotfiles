--
--
-- Plugins configuration file
--
-- I use packer.nvim, which is written in Lua, to manage plugins for my Neovim,
-- so all stuff here uses and depend on it
--
--

local utils = require('trueegorletov.utils')

local M = {
    -- This field is used to autoinstall plugins on first Nvim start
    first_start = false,
}

-- Auto-installation script for unix systems
if not utils.is_module_available('packer') then
    local msg = 'Unable to find packer.nvim installation... '

    if vim.fn.has('unix') or vim.fn.has('macunix') then
        print(msg .. 'Unix/macOS detected, downloading it from Git.')

        vim.cmd(
        '!git clone --depth 1 '
        .. 'https://github.com/wbthomason/packer.nvim '
        .. vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
        )
    else
        print(msg .. 'Can\'t auto-install, please do it manually.')
    end
    M.first_start = true
    print('Please restart Neovim when installation is finished.')
end

vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
    -- Packer itself
    use 'wbthomason/packer.nvim'



    --
    -- UI AND APPEARANCE STUFF
    --

    -- Start screen for annoying you when you open Neovim
    use 'mhinz/vim-startify'
    -- Statusline with numerous options and written in lua
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    }
    -- Same, but for the buffers/tabs bar
    use { 'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons', }
    -- Notification manager
    use 'rcarriga/nvim-notify'

    -- Blank lines indented
    use 'lukas-reineke/indent-blankline.nvim'

    --
    -- UX PLUGINS
    --

    -- File explorer written in lua
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons',
        },
    }
    -- Cool project manager
    use "ahmedkhalf/project.nvim"
    -- Powerful searching plugin
    use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim', }
    -- Undo tree visualizer
    use 'mbbill/undotree'
    -- Floating terminal window
    use 'voldikss/vim-floaterm'

    -- Nice file tag structure overview
    use 'majutsushi/tagbar'

    -- Chad-movement plugin
    use 'easymotion/vim-easymotion'
    -- And another one, which gives some missing features
    use 'justinmk/vim-sneak'

    -- Convenient way to resize splits
    use 'simeji/winresizer'
    -- Killer-feature plugin for multiple layouts users
    use 'lyokha/vim-xkbswitch'

    -- Multiple useful scripts and mappings for them
    use 'tpope/vim-unimpaired'
    -- Same, but all for braces and tags
    use 'tpope/vim-surround'
    -- Some other features for parentheses
    use 'cohama/lexima.vim'
    -- Dot repeating support for unimpaired.vim and surround.vim
    use 'tpope/vim-repeat'
    -- Google won't advise bad: displays occurrences count and index of
    -- highlighted one
    use 'google/vim-searchindex'
    -- Comment everything by gcc & gbc
    use 'numToStr/Comment.nvim'

    -- Really nice window autoresizer
    use 'camspiers/animate.vim'
    use 'camspiers/lens.vim'

    -- Keymap help
    use 'folke/which-key.nvim'



    --
    -- LSP AND AUTOCOMPLETE THINGS
    --

    -- Configuration options for native Neovim's LSP
    use 'neovim/nvim-lspconfig'
    --  A fancy GUI-based autoinstaller for LSP servers
    use 'williamboman/nvim-lsp-installer'

    -- Powerful LSP-powered completion engine written in Lua
    use 'hrsh7th/nvim-cmp'
    -- Nvim-cmp source for native Neovim's LSP
    use 'hrsh7th/cmp-nvim-lsp'
    -- Mvim-cmp source for displaying signatures help
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    -- Nvim-cmp source for buffers
    use 'hrsh7th/cmp-buffer'
    -- Nvim-cmp source for filesystem paths
    use 'hrsh7th/cmp-path'
    -- Nvim-cmp source for command line
    use 'hrsh7th/cmp-cmdline'
    -- Nvim-cmp source with LuaSnip integration
    use 'saadparwaiz1/cmp_luasnip'

    -- Powerful snippet engine written in lua
    use 'L3MON4D3/LuaSnip'
    -- Snippets for LuaSnip
    use "rafamadriz/friendly-snippets"

    -- Treesitter parser integration plugin
    use 'nvim-treesitter/nvim-treesitter'
    -- Treesitter-powered annotations generator
    use 'danymat/neogen'



    --
    -- LANGUAGES PLUGINS
    --

    -- Rust support enhancements
    use 'rust-lang/rust.vim'
    -- Crates.io integration
    use 'Saecki/crates.nvim'
    -- A lot of useful things for Rust
    use 'simrat39/rust-tools.nvim'



    --
    -- OTHER
    --

    -- Autoformatting for numerous languages
    use 'vim-autoformat/vim-autoformat'

    -- Utils and API plugins
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'
    use 'ryanoasis/vim-devicons'
    use 'kyazdani42/nvim-web-devicons'
    use 'adelarsq/vim-emoji-icon-theme'
    use 'stevearc/dressing.nvim'

    -- My favourite themes
    use 'joshdick/onedark.vim'
end)

return M
