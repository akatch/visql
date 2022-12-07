" :Less
" Turn vim into a pager with a header row
" Adapted from http://unix.stackexchange.com/a/27840/143088

fun! Less()
  set nocompatible
  set nowrap
  set scrollopt=hor
  set scrollbind

  " Hide statusline in lower window
  set laststatus=0

  " Explain mapped chars in status line.
  set statusline=\ \ \ Q\ to\ quit\.\ Arrows\ or\ mousewheel\ to\ scroll\.\ \(Vim\ commands\ work\,\ too\.\)

  " Delete/copy header lines
  silent execute '1,2d'

  " Split screen with new buffer (opens at top)
  execute 'new'

  " Switch to upper split
  wincmd k

  " Paste the header over the blank line
  execute 'norm! Vp'

  " Header highlighting
  syn match Pipe "|"
  hi def Pipe ctermfg=blue
  syn match Any /[^|]\+/
  hi def Any ctermfg=yellow

  " Switch back to lower split for scrolling
  wincmd j

  " Set lower split height to maximum
  execute "norm!  \<c-W>_"

  " Syntax highlighting
  " Some credit to Jason Munro
  " https://unencumberedbyfacts.com/2016/01/04/psql-vim-happy-face/
  syn match NumPos / \+\zs+\?\d\+\(,\?\d\{3}\)*\.\?\d*\ze /
  syn match NumNeg / \+\zs-\d\+\(,\?\d\{3}\)*\.\?\d*\ze /
  syn match NumZero /[+-]\?0\+\.\?0*\ze /
  hi def NumPos ctermfg=cyan
  hi def NumNeg ctermfg=red
  hi def NumZero ctermfg=gray
  syn match DateVal /\d\{4}-\d\{2}-\d\{2} \d\{2}:\d\{2}:\d\{2}/
  hi def DateVal ctermfg=magenta
  syn match TrueVal /\ctrue/
  syn match FalseVal /\cfalse/
  hi def TrueVal ctermfg=green
  hi def FalseVal ctermfg=red
  syn match NullVal /\cnull\?/
  hi def NullVal ctermbg=gray ctermfg=black
  syn match Pipe "|"
  hi def Pipe ctermfg=blue
  syn match LineNumber /^ *\d\+/
  hi def LineNumber ctermfg=yellow

  " Arrows do scrolling instead of moving
  nmap <silent> <Up> 3<c-Y>
  nmap <silent> <Down> 3<c-E>
  nmap <silent> <Left> zH
  nmap <silent> <Right> zL
  nmap <Space> <PageDown>

  " Faster quit (I tend to forget about the upper panel)
  nmap <silent> q :qa!<c-M>
  nmap <silent> Q :qa!<c-M>

  " Ignore external updates to the buffer
  autocmd! FileChangedShell */fd/*
  autocmd! FileChangedRO */fd/*

endfun
command!  -nargs=0 Less call Less()
