"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File: ~/.vimrc (Vim configuration file)
" Maintainer: Olivier Ligot <oligot at gmail.com>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Get out of VI's compatible mode..
set nocompatible

"Sets how many lines of history VIM har to remember
set history=400

"Enable filetype plugin
filetype plugin on
filetype indent on

"Set to auto read when a file is changed from the outside
set autoread

"Keep a .viminfo file.
set viminfo='1000,f1,<500  

"Set mapleader
let mapleader = ","
let g:mapleader = ","
let maplocalleader = ","
let g:maplocalleader = ","

"Fast saving
nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>

"Fast reloading of the .vimrc
map <leader>s :source ~/.vimrc<cr>
"Fast editing of .vimrc
map <leader>e :e! ~/.vimrc<cr>
"When .vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

"When editing a file, always jump to the last known cursor position.
"Don't do it when the position is invalid or when inside an event handler
"(happens when dropping a file on gvim).
autocmd BufReadPost *
	 \ if line("'\"") > 0 && line("'\"") <= line("$") |
	 \   exe "normal! g`\"" |
	 \ endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable syntax hl
syntax enable

if has("gui_running")
	set guioptions-=T
  colorscheme koehler
endif

"Highlight current
set cursorline

"Omni menu colors
hi Pmenu guibg=#333333
hi PmenuSel guibg=#555555 guifg=#ffffff


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM userinterface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set 7 lines to the curors - when moving vertical..
set so=7

"Turn on WiLd menu
set wildmenu

"Wildmode
set wildmode=list:longest

"Always show current position
set ruler

"The commandbar is 1 high
set cmdheight=1

"Show line number
set number

"Do not redraw, when running macros.. lazyredraw
set lz

"Change buffer - without saving
set hid

"Set backspace
set backspace=eol,start,indent

"Bbackspace and cursor keys wrap to
set whichwrap+=<,>,h,l

"Ignore case when searching
set ignorecase
set incsearch

"Set magic on
set magic

"No sound on errors.
set noerrorbells
set novisualbell
set t_vb=

"show matching bracets
set showmatch

"How many tenths of a second to blink
set mat=2

"Nice statusbar
set laststatus=2
set statusline=
set statusline+=%-3.3n\                      " buffer number
set statusline+=%F\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}, " filetype
set statusline+=%{&encoding},                " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
"set statusline+=0x%-8B\                      " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=8
set shiftwidth=4
set expandtab
set cino=>5n-3f0^-2{2
set modeline

au FileType html,php,vim,javascript,css,xml setl shiftwidth=2
au FileType html,php,vim,javascript,css,xml setl tabstop=2

augroup filetype
	au BufRead *.m        set ft=mercury
augroup END

autocmd BufNewFile,BufRead *.json set ft=javascript

set smarttab
set lbr
set tw=500

   """"""""""""""""""""""""""""""
   " Indent
   """"""""""""""""""""""""""""""
   "Auto indent
   set ai

   "Smart indet
   "set si

   "C-style indeting
   set cindent

   "Wrap lines
   set wrap


"Set grep program to ack-grep
set grepprg=ack-grep

"When doing tab completion, give the following files lower priority. You may
"wish to set 'wildignore' to completely ignore files, and 'wildmenu' to enable
"enhanced tab completion. These can be done in the user vimrc file.
set suffixes+=.info,.aux,.log,.dvi,.bbl,.out,.o,.lo

"When displaying line numbers, don't use an annoyingly wide number column. This
"doesn't enable line numbers -- :set number will do that. The value given is a
"minimum width to use for the number column, not a fixed size.
if v:version >= 700
	set numberwidth=3
endif
"}}}

"{{{ Syntax highlighting settings
"Switch syntax highlighting on, when the terminal has colors
"Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
	syntax on
	set hlsearch
endif
"}}}


set autochdir

"Tlist
let Tlist_Show_One_File=1
let Tlist_Use_Right_Window=1
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Sort_Type="name"
"Toggle the taglist window 
nnoremap <silent> <F9> :TlistToggle<CR>
"Update time
set updatetime=1000

"Ctags
nnoremap <silent> <F3> :bd<CR>
nnoremap <silent> <F11> :!ctags -R --languages=c++ --c++-kinds=+p --fields=+iaS --extra=+q .<CR>


"comments
set comments=sl:/*,mb:*,elx:*/

"Minibufexpl
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 

"Buffers
nnoremap <silent> <leader>d :bdelete<CR>
nnoremap <silent> <leader>k :bprevious<CR>
nnoremap <silent> <leader>l :bnext<CR>
nnoremap <silent> <leader>, :BufExplorer<CR>

"Eiffel syntax highlighting 
let eiffel_ise=1
let eiffel_strict=1

cabbrev lvim
      \ lvim /\<lt><C-R><C-W>\>/gj
      \ *<C-R>=(expand("%:e")=="" ? "" : ".".expand("%:e"))<CR>
      \ <Bar> lw
      \ <C-Left><C-Left><C-Left>

"Ranger
fun! RangerChooser()
  silent !ranger --choosefile=/tmp/chosenfile `[ -z '%' ] && echo -n . || dirname %`
  if filereadable('/tmp/chosenfile')
    exec 'edit ' . system('cat /tmp/chosenfile')
    call system('rm /tmp/chosenfile')
  endif
  redraw!
endfun

map <leader>r :call RangerChooser()<CR>

"CtrlP
let g:ctrlp_show_hidden = 1
