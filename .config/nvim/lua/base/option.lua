vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.scrolloff = 5
vim.o.whichwrap = "b,s,h,l,[,],<,>"
vim.o.wrap = false
vim.o.signcolumn = "yes"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.autoread = true
vim.o.autowriteall = true
vim.o.autoindent = true
vim.o.cursorline = true
vim.o.number = true

vim.cmd([[
	" settings for golang
	au FileType go setlocal sw=4 ts=4 sts=4 noet

	" Full-width Space highlight
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
]])

