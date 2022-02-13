call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'cohama/lexima.vim'
Plug 'vim-test/vim-test'
Plug 'preservim/vimux'

if has("nvim")
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/nvim-lsp-installer'
  Plug 'tami5/lspsaga.nvim', { 'branch': 'nvim6.0' }
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'onsails/lspkind-nvim'
  Plug 'hoob3rt/lualine.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'glepnir/dashboard-nvim'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'terrortylor/nvim-comment'
  Plug 'romgrk/barbar.nvim'
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'rebelot/kanagawa.nvim'
  " Plug 'shaunsingh/nord.nvim'
end

call plug#end()
