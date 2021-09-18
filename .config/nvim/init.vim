"return" 2>&- || "exit"

runtime ./plug.vim
runtime ./config.vim
runtime ./maps.vim
colorscheme nord

if exists('g:vscode')
    " VSCode extension
else
    " ordinary neovim
endif

" Read config files
call map(sort(split(globpath(&runtimepath, './plugins/**'))), {->[execute('exec "so" v:val')]})
