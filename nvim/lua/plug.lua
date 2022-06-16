--
-- Plugins configuration file
--
-- I use packer.nvim, which is written in Lua, to manage plugins for my Neovim,
-- so all stuff here uses and depend on it
--

require('generic')

-- Auto-installation script for unix systems
if not isModuleAvailable('packer') then
    local msg = 'Unable to find packer.nvim installation... '

    if vim.fn.has('unix') or vim.fn.has('macunix') then
        print(msg .. 'Unix/macOS detected, downloading it from Git')

        vim.cmd(
            'silent !git clone --depth 1 ' 
            .. 'https://github.com/wbthomason/packer.nvim '
            .. vim.fn.stdpath('config') .. '/site/pack/packer/start/packer.nvim'
        )
    else
        print(msg .. 'Can\'t auto-install, please do it manually')
        os.exit(1)
    end  
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Packer itself
    use 'wbthomason/packer.nvim'

    --
    -- Look and appearance stuff
    --
    use { 
        'nvim-lualine/lualine.nvim', 
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    }
    use { 'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons', }

    
    --
    -- Useful UX plugins
    --
    
    -- A file explorer
    use { 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons', }
    -- A nice file tag structure overview
    use 'majutsushi/tagbar'
    -- A powerful searching plugin
    use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim', }
    -- A convenient way to resize splits
    use 'simeji/winresizer'

    --
    -- Autocomplete and LSP things
    --
    
    -- Treesitter integration plugin
    use 'nvim-treesitter/nvim-treesitter'
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'saadparwaiz1/cmp_luasnip'
    use 'hrsh7th/cmp-path'
    use 'L3MON4D3/LuaSnip'

    use 'idanarye/breeze.vim'
    use 'alvan/vim-closetag'
    use 'ap/vim-css-color'

    use 'Chiel92/vim-autoformat'
    use 'tpope/vim-unimpaired'
    use 'nvim-lua/popup.nvim'
    use 'tpope/vim-surround'
    use 'google/vim-searchindex'
    use 'tpope/vim-repeat'
    use 'mhinz/vim-startify'
    use 'numToStr/Comment.nvim'
    use 'mattn/emmet-vim'
    use 'cohama/lexima.vim'
    use 'dense-analysis/ale'

    -- My prefered editor and lualine theme
    use 'tomasiser/vim-code-dark'
end)

-- Setup all the plugins are needed to
require('lualine').setup()
require('bufferline').setup()
require('nvim-tree').setup()
require('setuo').setup()
require('Comment').setup() 
