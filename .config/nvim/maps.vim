" leader setting
let mapleader = "\<Space>"
" write
nnoremap <Leader>w :w<CR>
" read
nnoremap <Leader>e :e<CR>
" Change from insert mode to normal mode
inoremap <silent> jj <ESC>:<C-u>w<CR>
" trail whitespace
autocmd BufWritePre * :%s/\s\+$//e
" Enable to use tab key for auto-completions
inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<Up>" : "\<S-TAB>"
" Go to definition for Ruby by ctags
autocmd BufEnter *.rb nnoremap <buffer> g] g<C-]>
autocmd BufEnter *.rb inoremap <buffer> g] <ESC>g<C-]>

""""""""""""""""""""""""""""""
" Manage window              "
""""""""""""""""""""""""""""""
nnoremap , <Nop>
nnoremap ,j <C-w>j
nnoremap ,k <C-w>k
nnoremap ,l <C-w>l
nnoremap ,h <C-w>h
nnoremap ,= <C-w>=
nnoremap ,s :<C-u>sp<CR>
nnoremap ,v :<C-u>vs<CR>

""""""""""""""""""""""""""""""
" emacs keybind              "
""""""""""""""""""""""""""""""
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
