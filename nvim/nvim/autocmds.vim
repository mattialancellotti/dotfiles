augroup filetype
   au!
   autocmd FileType sh,racket setl shiftwidth=2 softtabstop=2 expandtab
   autocmd FileType c,lua     setl shiftwidth=3 softtabstop=3 expandtab
   autocmd BufEnter *.h       setl shiftwidth=3 softtabstop=3 expandtab
   autocmd FileType make      setl tabstop=8 noexpandtab
augroup END
