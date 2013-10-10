call pathogen#infect() 

function! NeatFoldText() "{{{2
  let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
  let foldchar = matchstr(&fillchar, 'fold:\zs.')
  let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 8)
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
" }}}2

function! DFoldText()
	let line = getline(v:foldstart)
	return line
endfunction

set foldtext=DFoldText()


set tabstop=2
set shiftwidth=2
set expandtab
set showcmd
"set foldmethod=syntax

nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ev :tabedit $MYVIMRC<cr>
nnoremap <leader>bd :set background=dark<cr>
nnoremap <leader>bl :set background=light<cr>
noremap <Leader>fs :set foldmethod=syntax<CR>
noremap <Leader>fm :set foldmethod=manual<CR>
noremap <Leader>fi :set foldmethod=indent<CR>
noremap <Leader>fk :set foldmethod=marker<CR>
noremap <Leader>fd :set foldmethod=diff<CR>
noremap <Leader>fc :set foldmethod?<CR>

vnoremap <Space> za

noremap <C-j> :tabprevious<CR>
noremap <C-k> :tabnext<CR>
noremap <C-l> :tabedit  
noremap <C-h> :tabclose<CR>
imap <C-j> <ESC>:tabprevious<CR>i
imap <C-k> <ESC>:tabnext<CR>i
imap <C-l> <ESC>:tabedit 
nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T
nmap <Space> i_<Esc>r
filetype plugin on

syntax enable
set background=dark
colorscheme solarized
set path+=/usr/local/include/


"TAB SHIT
" Return indent (all whitespace at start of a line), converted from
" " tabs to spaces if what = 1, or from spaces to tabs otherwise.
" " When converting to tabs, result has no redundant spaces.
function! Indenting(indent, what, cols)
  let spccol = repeat(' ', a:cols)
  let result = substitute(a:indent, spccol, '\t', 'g')
  let result = substitute(result, ' \+\ze\t', '', 'g')
  if a:what == 1
    let result = substitute(result, '\t', spccol, 'g')
  endif
  return result
endfunction
" Convert whitespace used for indenting (before first non-whitespace).
" " what = 0 (convert spaces to tabs), or 1 (convert tabs to spaces).
" " cols = string with number of columns per tab, or empty to use 'tabstop'.
" " The cursor position is restored, but the cursor will be in a different
" " column when the number of characters in the indent of the line is changed.
function! IndentConvert(line1, line2, what, cols)
  let savepos = getpos('.')
  let cols = empty(a:cols) ? &tabstop : a:cols
  execute a:line1 . ',' . a:line2 . 's/^\s\+/\=Indenting(submatch(0), a:what, cols)/e'
  call histdel('search', -1)
  call setpos('.', savepos)
endfunction
command! -nargs=? -range=% Space2Tab call IndentConvert(<line1>,<line2>,0,<q-args>)
command! -nargs=? -range=% Tab2Space call IndentConvert(<line1>,<line2>,1,<q-args>)
command! -nargs=? -range=% RetabIndent call IndentConvert(<line1>,<line2>,&et,<q-args>)


" Some Linux distributions set filetype in /etc/vimrc.
" Clear filetype flags before changing runtimepath to force Vim to reload them.
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on


