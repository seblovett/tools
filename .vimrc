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
    %s/FILENAME/\=expand("%:t")/g
endfunction

autocmd BufNewFile * call NewFile()
autocmd BufNewFile,BufRead *.tex set spell spelllang=en_gb
