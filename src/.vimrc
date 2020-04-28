"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File: ~/.vimrc (Vim configuration file)
" Maintainer: Olivier Ligot <oligot at gmail.com>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Get out of VI's compatible mode..
set nocompatible

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

set t_Co=256

"Highlight current
set cursorline

"Omni menu colors
hi Pmenu guibg=#333333
hi PmenuSel guibg=#555555 guifg=#ffffff

"Color column
hi ColorColumn ctermbg=lightgrey guibg=lightgrey


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM userinterface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set 7 lines to the curors - when moving vertical..
set so=7

"Wildmode
set wildmode=list:longest

"The commandbar is 1 high
set cmdheight=1

"Show line number
set number
set relativenumber

"Do not redraw, when running macros.. lazyredraw
set lazyredraw

"Change buffer - without saving
set hid

"Bbackspace and cursor keys wrap to
set whichwrap+=<,>,h,l

"Ignore case when searching
set ignorecase

"Set magic on
set magic

"No sound on errors.
set noerrorbells
set novisualbell
set t_vb=

"show matching bracets
set showmatch

"Catch trailing whitespace
nmap <silent> <leader>c :set nolist!<CR>

"How many tenths of a second to blink
set mat=2

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
set colorcolumn=81
set textwidth=80
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set cino=>5n-3f0^-2{2
set modeline

augroup filetype
	au BufRead *.m        set ft=mercury
augroup END

"autocmd BufNewFile,BufRead *.json set ft=javascript

set lbr
set tw=500

   """"""""""""""""""""""""""""""
   " Indent
   """"""""""""""""""""""""""""""

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
set undodir^=~/.vim/undo//

set directory^=~/.vim/swp//
set backupdir^=~/.vim/backup//

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

nnoremap <C-p> :Files<CR>
"Buffers
nnoremap <silent> <leader>d :bdelete<CR>
nnoremap <Leader>, :Buffers<CR>
nnoremap <Leader>v :History<CR>
" nnoremap <silent> <leader>, :CtrlPBuffer<CR>
" nnoremap <silent> <leader>v :CtrlPMRUFiles<CR>
nnoremap <leader><space> <C-^>

"Move selected block up/down in Visual block mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"vv to generate new vertical split
nnoremap <silent> <leader>q <C-w>v

"Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'haya14busa/incsearch.vim'
Plug 'wincent/terminus'
Plug 'edkolev/tmuxline.vim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'suan/vim-instant-markdown'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'isRuslan/vim-es6'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'tpope/vim-surround'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-function'
Plug 'thinca/vim-textobj-function-javascript'
Plug 'jceb/vim-textobj-uri'
Plug 'mhinz/vim-grepper'
Plug 'dense-analysis/ale'
Plug 'rhysd/committia.vim'
Plug 'terryma/vim-expand-region'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'gorkunov/smartpairs.vim'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'sheerun/vim-polyglot'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'Raimondi/delimitMate'
Plug 'ryanoasis/vim-devicons'
Plug 'andymass/vim-matchup'
Plug 'rbong/vim-flog'
Plug 'xojs/vim-xo'
Plug 'rhysd/git-messenger.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'lervag/vimtex'
Plug 'natebosch/vim-lsc'
Plug 'francoiscabrol/ranger.vim'
" Plug 'mcchrish/nnn.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mechatroner/rainbow_csv'
Plug 'psf/black', { 'branch': 'stable', 'for': 'python' }
Plug 'junegunn/goyo.vim'
call plug#end()

colorscheme nord

" Italic comments
" https://rsapkf.netlify.com/blog/enabling-italics-vim-tmux
highlight Comment cterm=italic

cabbrev lvim
      \ lvim /\<lt><C-R><C-W>\>/gj
      \ *<C-R>=(expand("%:e")=="" ? "" : ".".expand("%:e"))<CR>
      \ <Bar> lw
      \ <C-Left><C-Left><C-Left>

"Ranger
let g:ranger_map_keys = 0
map <leader>r :Ranger<CR>

"toggle gundo
nnoremap <leader>u :UndotreeToggle<CR>

"Consistent downwards/upwards
nnoremap <expr> n 'Nn'[v:searchforward]
nnoremap <expr> N 'nN'[v:searchforward]

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

"Asynchronous Lint Engine
let g:ale_linters = {'javascript': ['eslint'], 'typescript': ['eslint']}
let g:ale_fixers = {'javascript': ['eslint'], 'typescript': ['eslint']}
let g:ale_sign_column_always = 1
nmap <silent> <leader>l <Plug>(ale_previous_wrap)
nmap <silent> <leader>k <Plug>(ale_next_wrap)

nmap <leader>jf <Plug>(ale_fix)

"Tern
nmap <leader>t :TernDef<cr>

"Instant Markdown
let g:instant_markdown_autostart = 0

"javascript-libraries-syntax
let g:used_javascript_libs = 'underscore,vue'

"Grepper
nnoremap <leader>g :Grepper -tool rg -grepprg rg --no-heading --vimgrep -i `git rev-parse --show-toplevel` -e<cr>
nnoremap <leader>* :Grepper -tool rg -cword -noprompt<cr>
nmap gs  <plug>(GrepperOperator)
xmap gs  <plug>(GrepperOperator)

"Vue
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript
autocmd BufRead,BufNewFile *.vue syntax sync fromstart
let g:vue_pre_processors = ['scss', 'typescript']

"Format
autocmd FileType javascript,typescript,vue map <buffer> <leader>f :PrettierAsync<cr>
autocmd FileType python map <buffer> <leader>f :Black<cr>
autocmd FileType go map <buffer> <leader>f :GoImports<cr>

"Markdown
let g:vim_markdown_conceal = 0

"Disable LaTeX-Box (comes with polyglot)
let g:polyglot_disabled = ['latex']

"LSC
let g:lsc_server_commands = {
 \  'javascript': {
 \    'command': 'typescript-language-server --stdio',
 \    'log_level': -1,
 \    'suppress_stderr': v:true,
 \  }
 \}
let g:lsc_auto_map = {
 \  'GoToDefinition': 'gd',
 \  'FindReferences': 'gr',
 \  'Rename': 'gR',
 \  'ShowHover': 'K',
 \  'Completion': 'omnifunc',
 \}
let g:lsc_enable_autocomplete  = v:true
let g:lsc_enable_diagnostics   = v:false
let g:lsc_reference_highlights = v:false
let g:lsc_trace_level          = 'off'

set completeopt=menu,menuone,noinsert,noselect
set complete+=kspell
autocmd FileType context setlocal spell spelllang=en,fr
autocmd FileType gitcommit setlocal spell

"vim-go
" let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_auto_type_info = 1
let g:go_metalinter_enabled = [
    \ 'deadcode', 
    \ 'errcheck', 
    \ 'gosimple', 
    \ 'govet', 
    \ 'ineffassign', 
    \ 'staticcheck', 
    \'structcheck', 
    \'typecheck', 
    \'unused', 
    \'varcheck',
\]

"Treat .sql files as PostgreSQL
let g:sql_type_default = 'pgsql'

"NERDTree
map <C-n> :NERDTreeToggle<CR>

"Vim Tmux Runner
let g:VtrUseVtrMaps = 1

"Airline
let g:airline#extensions#csv#enabled = 1
let g:airline#extensions#csv#column_display = 'Name'

"Goyo
let g:goyo_width = 120
