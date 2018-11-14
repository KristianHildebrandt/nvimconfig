"map ESC to
:imap jj <Esc>

" fast saving and quitting
nmap <leader>w :w<cr>
nmap <leader>wq :wq<cr>
nmap <leader>q :q<cr>

" paste multiple times
xnoremap p pgvy

" switch color schemes
nmap <leader>f :NextColorScheme<cr>
nmap <leader>d :PrevColorScheme<cr>
