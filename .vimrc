" pathogen plugin installer
call pathogen#infect()
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set vb
set t_Co=256
set background=dark
colorscheme molokai
"colorscheme solarized.orig
set cursorline
hi Normal ctermbg=none
hi NonText ctermbg=none
hi Visual ctermbg=darkblue ctermfg=black
hi CursorLine cterm=none ctermbg=2 cterm=none ctermfg=black cterm=none
hi Cursor cterm=bold ctermfg=2* ctermbg=2*
