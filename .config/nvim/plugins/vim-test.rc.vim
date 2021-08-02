function! DockerTransformer(cmd) abort
  let container_name = system("docker-compose ps | grep 3000 | awk '{print $1}'")
  if matchstr(container_name, "_app_") == "_app_"
    return 'docker-compose exec app ' . a:cmd
  elseif matchstr(container_name, "_web_") == "_web_"
    return 'docker-compose exec web ' . a:cmd
  else
    return a:cmd
  endif
endfunction

let g:test#custom_transformations = {'docker': function('DockerTransformer')}
let g:test#transformation = 'docker'
let g:test#strategy = 'dispatch'

nnoremap <Leader>tn :TestNearest<cr>
nnoremap <Leader>tf :TestFile<cr>
