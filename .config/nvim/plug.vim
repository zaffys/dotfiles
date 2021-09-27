call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'cohama/lexima.vim'
Plug 'Yggdroot/indentLine'
Plug 'vim-test/vim-test'
Plug 'preservim/vimux'

if has("nvim")
  Plug 'shaunsingh/nord.nvim'
  Plug 'hoob3rt/lualine.nvim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'terrortylor/nvim-comment'
  Plug 'romgrk/barbar.nvim'
  Plug 'iamcco/markdown-preview.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'f-person/git-blame.nvim'
end

call plug#end()
