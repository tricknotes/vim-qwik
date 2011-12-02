autocmd BufNewFile,BufRead *.qwik
      \ if &ft =~# '^\%(conf\|modula2\)$' |
      \   set ft=qwik |
      \ else |
      \   setf qwik |
      \ endif
