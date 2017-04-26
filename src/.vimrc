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
set history=1000

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

"Save read-only files
cmap w!! w !sudo tee % >/dev/null

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

set t_Co=256

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
set relativenumber

"Do not redraw, when running macros.. lazyredraw
set lazyredraw

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

"Enhanced switch using %
runtime macros/matchit.vim

"Catch trailing whitespace
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>c :set nolist!<CR>

"How many tenths of a second to blink
set mat=2

"Nice statusbar
set laststatus=2

"Don't show mode on the last line
set noshowmode

"General conceal settings
set conceallevel=1
set concealcursor=nc

" vim-javascript conceal settings.
let g:javascript_conceal_function = "λ"
let g:javascript_conceal_this = "@"
let g:javascript_conceal_return = "<"
let g:javascript_conceal_prototype = "#"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=8
set shiftwidth=4
set expandtab
set cino=>5n-3f0^-2{2
set modeline

au FileType html,php,vim,javascript,scss,css,xml,vue setl shiftwidth=2
au FileType html,php,vim,javascript,scss,css,xml,vue setl tabstop=2

augroup filetype
	au BufRead *.m        set ft=mercury
augroup END

"autocmd BufNewFile,BufRead *.json set ft=javascript

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

"Copy and paste from clipboard
if has('unnamedplus')
  set clipboard=unnamedplus
endif

set backupcopy=yes

"Maintain undo history between sessions
set undofile
set undodir=~/.vim/undodir

" Window movement shortcuts
" move to the window in the direction shown, or create a new window
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

map <silent> <C-h> :call WinMove('h')<cr>
map <silent> <C-j> :call WinMove('j')<cr>
map <silent> <C-k> :call WinMove('k')<cr>
map <silent> <C-l> :call WinMove('l')<cr>

" Make `jj` and `jk` throw you into normal mode
inoremap jj <esc>
inoremap jk <esc>

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
nnoremap <silent> <leader>, :CtrlPBuffer<CR>
nnoremap <silent> <leader>v :CtrlPMRUFiles<CR>
nnoremap <leader><space> <C-^>

"Move selected block up/down in Visual block mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"Plug
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'haya14busa/incsearch.vim'
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'wincent/terminus'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'edkolev/tmuxline.vim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'suan/vim-instant-markdown'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'isRuslan/vim-es6'
Plug 'posva/vim-vue'
Plug 'othree/html5.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'tpope/vim-surround'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-function'
Plug 'thinca/vim-textobj-function-javascript'
Plug 'mhinz/vim-grepper'
Plug 'w0rp/ale'
Plug 'rhysd/committia.vim'
Plug 'terryma/vim-expand-region'
call plug#end()

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

"toggle gundo
nnoremap <leader>u :UndotreeToggle<CR>

"Airline
let g:airline_powerline_fonts = 1

"Incsearch
let g:incsearch#auto_nohlsearch = 1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

"Asynchronous Lint Engine
let g:ale_linters = {'javascript': ['eslint']}
let g:ale_sign_column_always = 1
nmap <silent> <leader>l <Plug>(ale_previous_wrap)
nmap <silent> <leader>k <Plug>(ale_next_wrap)

function! FixJS()
    "Save current cursor position"
    let l:winview = winsaveview()
    "run eslint fix on current buffer"
    ! $(npm bin)/eslint --fix %
    "Restore cursor position"
    call winrestview(l:winview)
endfunction
command! FixJS :call FixJS()
nmap <leader>jf :FixJS<cr>

"Tern
nmap <leader>f :TernDef<cr>

"Instant Markdown
let g:instant_markdown_autostart = 0

"javascript-libraries-syntax
let g:used_javascript_libs = 'underscore,vue'

"Grepper
nnoremap <leader>g :Grepper -tool rg -grepprg rg --no-heading --vimgrep -i `git rev-parse --show-toplevel` -e<cr>
nnoremap <leader>* :Grepper -tool rg -cword -noprompt<cr>
nmap gs  <plug>(GrepperOperator)
xmap gs  <plug>(GrepperOperator)
