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
set winheight=10
set winminheight=10
set winheight=999

noremap <Left> <nop>
noremap <Right> <nop>
noremap <Up> <nop>
noremap <Down> <nop>

" Solarized scheme settings ===================================

colorscheme solarized
let hour = strftime("%H")
if 6 <= hour && hour < 20
  set background=light
else
  set background=dark
endif
" set t_Co=16
call togglebg#map("")

" Functions ===================================
noremap <silent> <Leader>w :call ToggleWrap()<CR>
function! ToggleWrap()
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

"map ,rs :wa<CR>:!clear;rspec --color %<CR>
map <Leader>rt :w<CR>:call RunCurrentSpecFile()<CR>
map <Leader>rs :w<CR>:call RunNearestSpec()<CR>
map <Leader>rl :w<CR>:call RunLastSpec()<CR>
map <Leader>ra :w<CR>:call RunAllSpecs()<CR>

function! RunCurrentCucumberSpec()
  normal :!zeus cucumber %
endfunction
" map <Leader>rc :w<CR>:call RunCurrentCucumberSpec()<CR>
map <Leader>rc :w<CR>:!zeus cucumber -r features %<CR>

noremap n nzz
noremap N Nzz

nnoremap <C-X> <C-a>

let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_load_gemfile = 1

"turn on regex syntax for searches
noremap / /\v

function! EditYaroVimrc()
  normal :tabe /home/yaro/.yadr/vim/yaro.vim
endfunction
command! Vy call EditYaroVimrc() 

function! ReloadYaroVimrc()
  normal :so /home/yaro/.yadr/vim/yaro.vim
endfunction
command! Vr call ReloadYaroVimrc()

function! InsertTabWrapper()
  let col = col(".") - 1
  if !col || getline(".")[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-n>"
  endif
endfunction

" inoremap <Tab> <C-r>=InsertTabWrapper()<cr>
" imap <S-Tab> <C-p>

imap <C-j> <Plug>snipMateNextOrTrigger
nnoremap <C-n> :NERDTreeFind<CR>

nmap <Leader>gs :Gstatus<CR><C-w>20+
let g:syntastic_enable_highlighting = 1
let NERDTreeQuitOnOpen=1

set mouse+=a
if &term =~ '^screen'
  " tmux knows the extended mouse mode
  set ttymouse=xterm2
endif

" set wildignore+=*/tmp/*,*/yaro/*
" let g:ctrlp_custom_ignore = '\v^tmp\/$'
"
let g:syntastic_check_on_open=1
autocmd FileType javascript,css nmap <silent> ,; :call cosco#commaOrSemiColon()<CR>
autocmd FileType javascript,css inoremap <silent> ,; <ESC>:call cosco#commaOrSemiColon()<CR>a
imap <C-c> ,;<CR><Esc>O

autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
let &completefunc = 'youcompleteme#Complete'
let g:ragtag_global_maps = 1
