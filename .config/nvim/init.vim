lang en_US.UTF-8
"return" 2>&- || "exit"

" leader setting
let mapleader = "\<Space>"

" enable to see backquote
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" Enable true color
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

""""""""""""""""""""""""""""""
" dein.vim
""""""""""""""""""""""""""""""
if &compatible
  set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#load_toml('~/.config/nvim/dein.toml',      {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})

  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

""""""""""""""""""""""""""""""
" 各種オプションの設定
""""""""""""""""""""""""""""""
" 自動保存
set autowriteall
autocmd CursorHold *  wall
autocmd CursorHoldI *  wall
" ビーブ音を消す
set belloff=all
" キーコードシーケンスの終了待機時間の短縮
set ttimeoutlen=10
" スワップファイルは使わない
set noswapfile
" undoファイルは作成しない
set noundofile
" カーソルが何行目の何列目に置かれているかを表示する
set ruler
" コマンドラインに使われる画面上の行数
set cmdheight=2
" エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
set laststatus=2
" ステータス行に表示させる情報の指定
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" ステータス行に現在のgitブランチを表示する
set statusline+=%{fugitive#statusline()}
" ウインドウのタイトルバーにファイルのパス情報等を表示する
set title
" コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
set wildmenu
" 入力中のコマンドを表示する
set showcmd
" バックアップディレクトリの指定(でもバックアップは使ってない)
set backupdir=$HOME/.vim/backup
" バッファで開いているファイルのディレクトリでエクスクローラを開始する(でもエクスプローラって使ってない)
set browsedir=buffer
" 小文字のみで検索したときに大文字小文字を無視する
set smartcase
" 大文字で検索したときに大文字小文字を無視しない
set ignorecase
" 最後尾まで検索を終えたら次の検索で先頭に移る
set wrapscan
" 置換え時にインタラクティブに変更を反映する
set inccommand=split
" 検索結果をハイライト表示する
set hlsearch
" 暗い背景色に合わせた配色にする
set background=dark
" タブ入力を複数の空白入力に置き換える
set expandtab
" 検索ワードの最初の文字を入力した時点で検索を開始する
set incsearch
" 保存されていないファイルがあるときでも別のファイルを開けるようにする
set hidden
" 不可視文字を表示する
set list
" 任意の文字をを可視化する
set listchars=tab:>-,trail:·,extends:>,precedes:<,nbsp:%
" 行番号を表示する
set number
" 行番号を相対表示しない
set norelativenumber
" 対応する括弧やブレースを表示する
set showmatch
" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" タブ文字の表示幅
set tabstop=2
" Vimが挿入するインデントの幅
set shiftwidth=2
" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" 構文毎に文字色を変化させる
syntax on
" 行番号の色
highlight LineNr ctermfg=darkyellow
" 勝手に改行するのを防ぐ
" set textwidth=0
set formatoptions=q
" textwidthでフォーマットさせたくない
set formatoptions=q
" クラッシュ防止（http://superuser.com/questions/810622/vim-crashes-freezes-on-specific-files-mac-osx-mavericks）
set synmaxcol=200
" clipboard にコピー
set clipboard+=unnamed
"ファイル読み込み時の文字コードの設定
set encoding=utf-8
"Vim script内でマルチバイト文字を使う際の設定
scriptencoding uft-8
" 保存時の文字コード
set fileencoding=utf-8
" 読み込み時の文字コードの自動判別. 左側が優先される
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
" 改行コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac
" 外部でファイルに変更がされた場合は読みなおす
set autoread
" 正規表現の高速化
set regexpengine=0
" 警告を表示する
if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif
"スクロール時に一番下までカーソルが移動しない
set scrolloff=5
"backspaceの機能設定(字下げ、行末、挿入の開始点を超えて削除)
set backspace=2
" Markdownに画像をペーストする
nnoremap <Leader>p <C-c>:r! image_paste_for_vim_markdown <CR>

" leader mapping
nnoremap <Leader>w :w<CR>
nnoremap <Leader>e :e<CR>
" insert mode to normal mode
inoremap <silent> jj <ESC>:<C-u>w<CR>
" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow

" Rubyファイルの場合はctags、その他はLSPによるジャンプを使用する
" set tags=./tags;
" autocmd filetype ruby nnoremap <C-]> g<C-]>

let g:python_host_prog = "/Users/reona5/.pyenv/versions/py2neovim/bin/python"
let g:python3_host_prog = "/Users/reona5/.pyenv/versions/py3neovim/bin/python"

""""""""""""""""""""""""""""""
" Space highlight
""""""""""""""""""""""""""""""
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme * call ZenkakuSpace()
    autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
  augroup END
  call ZenkakuSpace()
endif
""""""""""""""""""""""""""""""
" emacs keybind              "
""""""""""""""""""""""""""""""
" insert mode
imap <C-p> <Up>
imap <C-n> <Down>
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-a> <C-o>:call <SID>home()<CR>
imap <C-e> <End>
imap <C-d> <Del>
imap <C-h> <BS>
imap <C-k> <C-r>=<SID>kill()<CR>

function! s:home()
  let start_column = col('.')
  normal! ^
  if col('.') == start_column
    normal! 0
  endif
  return ''
endfunction

function! s:kill()
  let [text_before, text_after] = s:split_line()
  if len(text_after) == 0
    normal! J
  else
    call setline(line('.'), text_before)
  endif
  return ''
endfunction

function! s:split_line()
  let line_text = getline(line('.'))
  let text_after  = line_text[col('.')-1 :]
  let text_before = (col('.') > 1) ? line_text[: col('.')-2] : ''
  return [text_before, text_after]
endfunction

""""""""""""""""""""""""""""""
" 最後のカーソル位置を復元する
""""""""""""""""""""""""""""""
if has("autocmd")
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
endif
""""""""""""""""""""""""""""""
" jq
""""""""""""""""""""""""""""""
command! -nargs=? Jq call s:Jq(<f-args>)
function! s:Jq(...)
  if 0 == a:0
    let l:arg = "."
  else
    let l:arg = a:1
  endif
  execute "%! jq \"" . l:arg . "\""
endfunction
""""""""""""""""""""""""""""""

filetype on
