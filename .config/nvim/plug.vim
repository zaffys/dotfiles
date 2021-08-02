call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'cohama/lexima.vim'
Plug 'machakann/vim-sandwich'
Plug 'Yggdroot/indentLine'
Plug 'ervandew/supertab'
Plug 'vim-test/vim-test'
Plug 'tpope/vim-dispatch'

if has("nvim")
  Plug 'shaunsingh/nord.nvim'
  Plug 'hoob3rt/lualine.nvim'
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'terrortylor/nvim-comment'
  Plug 'romgrk/barbar.nvim'
  Plug 'iamcco/markdown-preview.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
end

call plug#end()
