autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
        \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
        \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
        \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
        \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
        \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
        \ denite#do_map('toggle_select').'j'
  nmap ; :Denite buffer -split=floating -winrow=1<CR>
  nmap <leader>t :Denite file/rec -split=floating -winrow=1<CR>
  nnoremap <leader>g :<C-u>Denite grep:. -no-empty -mode=normal<CR>
  nnoremap <leader>j :<C-u>DeniteCursorWord grep:. -mode=normal<CR>
endfunction

nnoremap , <Nop>
nnoremap ,j <C-w>j
nnoremap ,k <C-w>k
nnoremap ,l <C-w>l
nnoremap ,h <C-w>h
nnoremap ,J <C-w>J
nnoremap ,K <C-w>K
nnoremap ,L <C-w>L
nnoremap ,H <C-w>H
nnoremap ,n gt
nnoremap ,p gT
nnoremap ,= <C-w>=
nnoremap ,w <C-w>w
nnoremap ,o <C-w>_<C-w>|
nnoremap ,O <C-w>=
nnoremap ,N :<C-u>bn<CR>
nnoremap ,P :<C-u>bp<CR>
nnoremap ,t :<C-u>tabnew<CR>
nnoremap ,s :<C-u>sp<CR>
nnoremap ,v :<C-u>vs<CR>
nnoremap <Leader>q :<C-u>q<CR>
nnoremap ,Q :<C-u>bd<CR>
