let &titlestring = "vim(" . expand("%:t") . ")"
let &titleold="bash"
if  &term == "screen"
  set t_ts=k
  set t_fs=\
endif
if &term == "screen" || &term == "xterm"
  set title
endif
function! NewFile()
    silent! 0r $HOME/.vim/template/template.%:e
    %s/<+FILENAME+>/\=expand("%:t")/ge
    %s/<+AUTHOR+>/seblovett/ge
    %s/<+HOSTNAME+>/\=hostname()/ge
    %s/<+DATECREATED+>/\=strftime("%c")/ge
    call UpdateTime()
endfunction

" this looks for "Last Edited:" and removes the rest of the line, replaces it with the current system datetime
"is called when writing file
function! UpdateTime()
    let l:winview = winsaveview()
    %s/Last Edited:.*/Last Edited: <+CURDATE+> by seblovett on <+HOSTNAME+>/ge
    %s/<+CURDATE+>/\=strftime("%c")/ge
    %s/<+HOSTNAME+>/\=hostname()/ge
    call winrestview(l:winview)
endfunction

" @% contains the file name
if @% != ".vimrc"
	autocmd BufNewFile * call NewFile()
	autocmd BufWritePre * call UpdateTime()
	autocmd BufNewFile,BufRead *.tex set spell spelllang=en_gb
endif
