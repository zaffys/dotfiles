" enable to see backquote
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_json_conceal = 0

" Enable true color
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

set autowriteall
autocmd CursorHold *  wall
autocmd CursorHoldI *  wall
set ttimeoutlen=10
set belloff=all
set shell=zsh
set noswapfile
set noundofile
set cmdheight=2
set title
set wildmenu
set showcmd
set smartcase
set ignorecase
set wrapscan
set inccommand=split
set hlsearch
set background=dark
set expandtab
set incsearch
set hidden
set list
set laststatus=2
set cursorline
set listchars=tab:>-,trail:·,extends:>,precedes:<,nbsp:%
set number
set norelativenumber
set showmatch
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set smarttab
set whichwrap=b,s,h,l,<,>,[,]
syntax enable
highlight LineNr ctermfg=darkyellow
set formatoptions=q
set formatoptions=q
set synmaxcol=200
set clipboard+=unnamed
set encoding=utf-8
scriptencoding=uft-8
set fileencoding=utf-8
set fileformats=unix,dos,mac
set autoread
set regexpengine=0
set scrolloff=5
set backspace=2

""""""""""""""""""""""""""""""
" Full-width Space highlight
""""""""""""""""""""""""""""""
function! Space()
  highlight Space cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
  augroup Space
    autocmd!
    autocmd ColorScheme * call Space()
    autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('Space', '　')
  augroup END
  call Space()
endif

filetype on
