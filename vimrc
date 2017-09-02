" VIM 8.0 vimrc file
" a lot of this has been copied from other vimfiles
" i don't remember where
" a lot of them claimed to be the coolest vimrc ever
" if you want to go ahead and look for them by searching snippets from this
" file, go ahead.
" whether or not they actually are the coolest vim configs ever is up to you.

" configure vundle
set nocompatible
filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'acarapetis/vim-colors-github'
Plugin 'altercation/vim-colors-solarized'
Plugin 'honza/vim-snippets'
Plugin 'jiangmiao/auto-pairs'
Plugin 'jpo/vim-railscasts-theme'
Plugin 'keith/swift.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'mebus/jellybeans.vim'
Plugin 'pprovost/vim-ps1'
Plugin 'romainl/apprentice'
Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sjl/badwolf'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vundlevim/vundle.vim'
call vundle#end()

behave xterm
filetype plugin indent on
syntax on
set autoread lazyredraw
set incsearch ignorecase hlsearch
set noswapfile
set encoding=utf-8
set fileformats=unix,dos,mac fileformat=unix
set number " show line numbers
set ruler " Always show current position
set magic " For regex turn magic on
set scrolloff=999 " keep cursor centered on screen
set showmatch matchtime=2
set t_Co=256
let g:solarized_termcolors=256
set background=light
colorscheme badwolf
set guifont=Consolas:h11,DejaVu\ Sans\ Mono\ 11
set guioptions+=ae
set guioptions-=t
set splitright
set viminfo+=n~/.viminfo " for windows (i really hate _viminfo)
if has('gui_running') | set columns=89 | endif

set colorcolumn=80 textwidth=80
set linebreak autoindent smartindent
set expandtab smarttab nojoinspaces
set shiftwidth=4 tabstop=4 " 1 tab is 4 spaces
set softtabstop=4 " number of spaces in tab when editing
set list listchars=tab:>·,trail:·,nbsp:. " for indentation convenience

set wildmenu wildmode=list:longest,full
set wildignore=*.a,*.o,*.pyc,*.pyo,*.git " don't search compiled files

set pastetoggle=<F3> " F3 enters paste mode (solves indenting)

set showcmd " show command in bottom bar
set showmode " show if in insert, visual or replace mode
set cursorline " highlight current line

set ttyfast mouse=a " enable mouse in terminal
set backspace=indent,eol,start

set laststatus=2 " show statusline

" auto save on change of file
"autocmd TextChanged,TextChangedI <buffer> silent write

" make sure that commit messages wrap at 72 characters
autocmd Filetype gitcommit setlocal spell textwidth=72

"set foldenable " enable folding
"set foldlevelstart=10 " open most folds by default
"set foldmethod=indent " fold based on indent level

""" keymaps start here

" don't dedent comments
inoremap # X<BS>#

" scroll through split windows
nmap <C-h> :wincmd h<CR>
nmap <C-j> :wincmd j<CR>
nmap <C-k> :wincmd k<CR>
nmap <C-l> :wincmd l<CR>
" copy/paste from and to global buffer
inoremap <C-v> <C-r>+
vnoremap <C-c> "+y

" make scrolling through wrapped lines easier
nmap j gj
nmap k gk
vmap j gj
vmap k gk

" make Ctrl-S save
nnoremap <silent> <C-s> :update<CR>
inoremap <silent> <C-s> <Esc>:update<CR>a

autocmd Filetype html setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype php  setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype sh   setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType text setlocal tabstop=2 softtabstop=2 shiftwidth=2
autocmd Filetype xml  setlocal tabstop=2 softtabstop=2 shiftwidth=2
if has('gui_running')
    autocmd Filetype ruby colorscheme railscasts
else
    autocmd Filetype ruby colorscheme apprentice
endif

" delete trailing white space on save, useful for python and coffeescript
function! StripTrailingSpace()
    execute "normal mz"
    %substitute/\s\+$//ge
    execute "normal `z"
endfunction
function! StripLeadingSpace()
    execute "normal mz"
    %substitute/^\s\+//ge
    execute "normal `z"
endfunction
function! SrtToVtt() " i like screwing with captions
    call append(0, ["WEBVTT", ""])
    global/^\d\+$/d
    %substitute/\(\d\d:\d\d:\d\d\),\(\d\d\d\)/\1.\2/g
endfunction
autocmd BufWrite *.py     :call StripTrailingSpace()
autocmd BufWrite *.coffee :call StripTrailingSpace()


"""" plugin configurations start here

" NERDtree config
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$', '\.bak$', '\.pyo$',
                   \'\.o$', '\.a$', '\.so$', '__pycache__', '\.dll$', '\.lib$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
map <silent> <F2> :NERDTreeToggle<CR>

map <silent> <F8> :TagbarToggle<CR>

" Syntastic configuration
"let g:syntastic_python_python_exec = '/usr/bin/python3'
"let g:syntastic_python_checkers = ['flake8']
"let g:syntastic_python_checker_args='--ignore=E501 --py3k'
"let g:syntastic_python_flake8_args='--ignore=E501'
"let g:syntastic_python_flake8_post_args='--ignore=E501'

" make airline have that nice streamline
" needs to have required powerline fonts installed
" works just as well without it
"let g:airline_powerline_fonts=1
