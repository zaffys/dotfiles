let g:coc_global_extensions = [
      \ 'coc-diagnostic'
      \, 'coc-eslint'
      \, 'coc-explorer'
      \, 'coc-go'
      \, 'coc-json'
      \, 'coc-markdownlint'
      \, 'coc-prettier'
      \, 'coc-solargraph'
      \, 'coc-spell-checker'
      \, 'coc-tsserver'
      \, 'coc-vetur'
      \, 'coc-yaml'
      \]

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
xmap ff  <Plug>(coc-format-selected)
nmap ff  <Plug>(coc-format-selected)
nmap <silent> L :<C-u>CocList<cr>
nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <silent> <C-]> <Plug>(coc-definition)
nmap <silent> <C-[> <Plug>(coc-type-definition)
nmap <silent> <C-u> <Plug>(coc-implementation)
nmap <silent> <C-t> <Plug>(coc-references)
nmap <silent> ,r <Plug>(coc-rename)
nmap <silent> ,f <Plug>(coc-format)
nmap <silent> <C-e> :CocCommand explorer<CR>
autocmd CursorHold * silent call CocActionAsync('highlight')
