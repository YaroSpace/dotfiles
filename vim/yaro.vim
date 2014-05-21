" Yaro's custom Vim settings

" Basic settings ===================================
syntax enable
filetype indent on

set smartindent
set wrap
set number
set linebreak
set showbreak=..
set gdefault
set showmatch
set relativenumber
" set cursorline
" set cc=80

set winwidth=84
set winheight=5
set winminheight=5
set winheight=999

noremap <Left> <nop>
noremap <Right> <nop>
noremap <Up> <nop>
noremap <Down> <nop>

" Solarized scheme settings ===================================

colorscheme solarized
let hour = strftime("%H")
if 6 <= hour && hour < 18
  set background=light
else
  set background=dark
endif
" set t_Co=16
call togglebg#map("")

" Functions ===================================
noremap <silent> <Leader>w :call ToggleWrap()<CR>
function ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    setlocal nowrap list
    set virtualedit=all
    silent! nunmap <buffer> k
    silent! nunmap <buffer> j
    silent! nunmap <buffer> <Home>
    silent! nunmap <buffer> <End>
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <Home>
    silent! iunmap <buffer> <End>
  else
    echo "Wrap ON"
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
    noremap  <buffer> <silent> k gk
    noremap  <buffer> <silent> j gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <End>  g<End>
    inoremap <buffer> <silent> <Up>   <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <End>  <C-o>g<End>
  endif
endfunction

nmap <C-N> :NERDTreeToggle<CR>
map ,rs :wa<CR>:!clear;rspec --color %<CR>
