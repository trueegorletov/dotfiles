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

    -- A Neovim start screen for annoying you when you open it
    use 'mhinz/vim-startify'
    -- A statusline with numerous options and written in lua
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    }
    -- Same, but for the buffers/tabs bar
    use { 'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons', }



    --
    -- UX PLUGINS
    --

    -- A file explorer
    use { 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons', }
    -- A cool project manager
    use "ahmedkhalf/project.nvim"
    -- A powerful searching plugin
    use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim', }
    -- A nice file tag structure overview
    use 'majutsushi/tagbar'

    -- Chad-movement plugin
    use 'easymotion/vim-easymotion'
    -- And another one, which gives some missing features
    use 'justinmk/vim-sneak'

    -- A convenient way to resize splits
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



    --
    -- LSP AND AUTOCOMPLETE THINGS
    --

    -- Configuration options for native Neovim's LSP
    use 'neovim/nvim-lspconfig'
    --  A fancy GUI-based autoinstaller for LSP servers
    use 'williamboman/nvim-lsp-installer'

    -- Powerful LSP-powered completion engine written in Lua
    use 'hrsh7th/nvim-cmp'
    -- A nvim-cmp source for native Neovim's LSP
    use 'hrsh7th/cmp-nvim-lsp'
    -- A nvim-cmp source for displaying signatures help
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    -- A nvim-cmp source for buffers
    use 'hrsh7th/cmp-buffer'
    -- A nvim-cmp source for filesystem paths
    use 'hrsh7th/cmp-path'
    -- A nvim-cmp source for command line
    use 'hrsh7th/cmp-cmdline'
    -- A nvim-cmp source with LuaSnip integration
    use 'saadparwaiz1/cmp_luasnip'

    -- A powerful snippet engine written in lua
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



    --
    -- OTHER
    --

    -- Autoformatting for numerous languages
    use 'vim-autoformat/vim-autoformat'

    -- Utils and API plugins
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'

    -- My favourite editor and lualine theme
    use 'tomasiser/vim-code-dark'
    use 'doums/darcula'
end)

return M
